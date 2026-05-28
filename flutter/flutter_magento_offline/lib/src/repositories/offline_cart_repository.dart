import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../cache/magento_cache.dart';
import '../config/cache_config.dart';
import '../queue/operation_queue.dart';
import '../queue/operations.dart';

/// Offline-capable decorator for [CartRepository].
///
/// Queues operations when offline and provides optimistic updates.
class OfflineCartRepository implements CartRepository {
  /// The inner repository to delegate to when online.
  final CartRepository inner;

  /// The cache for storing cart state.
  final MagentoCache cache;

  /// The operation queue for pending operations.
  final OperationQueue queue;

  /// Cache configuration.
  final CartCacheConfig config;

  final Connectivity _connectivity;

  static const _cartKey = 'cart:current';

  OfflineCartRepository({
    required this.inner,
    required this.cache,
    required this.queue,
    this.config = const CartCacheConfig(),
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();

  @override
  Future<Cart> getCurrentCart() async {
    if (await _isOnline()) {
      final cart = await inner.getCurrentCart();
      await _cacheCart(cart);
      return cart;
    }

    final cached = await _getCachedCart();
    if (cached != null) {
      return cached;
    }

    throw MagentoNetworkException('Offline and no cached cart');
  }

  @override
  Future<Cart> createGuestCart() async {
    if (!await _isOnline()) {
      throw MagentoNetworkException('Cannot create cart while offline');
    }

    final cart = await inner.createGuestCart();
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<Cart> addSimpleProduct({
    required String sku,
    required int quantity,
  }) async {
    if (!await _isOnline()) {
      await queue.enqueue(CartOperation.addSimple(
        sku: sku,
        quantity: quantity,
      ));

      final cached = await _getCachedCart();
      if (cached != null) {
        // Return optimistic update
        return _withOptimisticAdd(cached, sku, quantity);
      }
      throw MagentoNetworkException('Offline and no cached cart');
    }

    final cart = await inner.addSimpleProduct(sku: sku, quantity: quantity);
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<Cart> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
  }) async {
    if (!await _isOnline()) {
      await queue.enqueue(CartOperation.addConfigurable(
        parentSku: parentSku,
        variantSku: variantSku,
        quantity: quantity,
        selectedOptions: selectedOptions,
      ));

      final cached = await _getCachedCart();
      if (cached != null) {
        return _withOptimisticAdd(cached, variantSku, quantity);
      }
      throw MagentoNetworkException('Offline and no cached cart');
    }

    final cart = await inner.addConfigurableProduct(
      parentSku: parentSku,
      variantSku: variantSku,
      quantity: quantity,
      selectedOptions: selectedOptions,
    );
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<Cart> updateItemQuantity({
    required String itemId,
    required int quantity,
  }) async {
    if (!await _isOnline()) {
      await queue.enqueue(CartOperation.updateQuantity(
        itemId: itemId,
        quantity: quantity,
      ));

      final cached = await _getCachedCart();
      if (cached != null) {
        return _withUpdatedQuantity(cached, itemId, quantity);
      }
      throw MagentoNetworkException('Offline and no cached cart');
    }

    final cart =
        await inner.updateItemQuantity(itemId: itemId, quantity: quantity);
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<Cart> removeItem(String itemId) async {
    if (!await _isOnline()) {
      await queue.enqueue(CartOperation.removeItem(itemId: itemId));

      final cached = await _getCachedCart();
      if (cached != null) {
        return _withRemovedItem(cached, itemId);
      }
      throw MagentoNetworkException('Offline and no cached cart');
    }

    final cart = await inner.removeItem(itemId);
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<Cart> applyCoupon(String couponCode) async {
    if (!await _isOnline()) {
      await queue.enqueue(CartOperation.applyCoupon(code: couponCode));

      final cached = await _getCachedCart();
      if (cached != null) {
        // Return cart with optimistic coupon
        return Cart(
          id: cached.id,
          items: cached.items,
          totals: cached.totals,
          appliedCoupon: couponCode,
          discounts: cached.discounts,
          isGuest: cached.isGuest,
          currency: cached.currency,
        );
      }
      throw MagentoNetworkException('Offline and no cached cart');
    }

    final cart = await inner.applyCoupon(couponCode);
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<Cart> removeCoupon() async {
    if (!await _isOnline()) {
      await queue.enqueue(CartOperation.removeCoupon());

      final cached = await _getCachedCart();
      if (cached != null) {
        return Cart(
          id: cached.id,
          items: cached.items,
          totals: cached.totals,
          appliedCoupon: null,
          discounts: const [],
          isGuest: cached.isGuest,
          currency: cached.currency,
        );
      }
      throw MagentoNetworkException('Offline and no cached cart');
    }

    final cart = await inner.removeCoupon();
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<Cart> mergeGuestCartToCustomerCart() async {
    if (!await _isOnline()) {
      throw MagentoNetworkException('Cannot merge carts while offline');
    }

    final cart = await inner.mergeGuestCartToCustomerCart();
    await _cacheCart(cart);
    return cart;
  }

  @override
  Future<void> clearCart() async {
    if (!await _isOnline()) {
      throw MagentoNetworkException('Cannot clear cart while offline');
    }

    await inner.clearCart();
    await cache.delete(_cartKey);
  }

  /// Gets the number of pending operations.
  Future<int> get pendingOperationCount => queue.pendingCount;

  /// Whether there are pending operations to sync.
  Future<bool> get hasPendingOperations => queue.hasPending;

  /// Invalidates the cached cart.
  Future<void> invalidateCache() async {
    await cache.delete(_cartKey);
  }

  Future<bool> _isOnline() async {
    final results = await _connectivity.checkConnectivity();
    return results.isNotEmpty && !results.contains(ConnectivityResult.none);
  }

  Future<Cart?> _getCachedCart() async {
    try {
      return await cache.get<Cart>(_cartKey, _decodeCart);
    } catch (_) {
      return null;
    }
  }

  Future<void> _cacheCart(Cart cart) async {
    await cache.set(
      _cartKey,
      cart,
      ttl: config.cartTtl,
      encoder: _encodeCart,
    );
  }

  // Optimistic update helpers
  Cart _withOptimisticAdd(Cart cart, String sku, int quantity) {
    final existingIndex = cart.items.indexWhere((item) => item.sku == sku);

    List<CartItem> newItems;
    if (existingIndex >= 0) {
      // Update existing item quantity
      newItems = cart.items.map((item) {
        if (item.sku == sku) {
          return CartItem(
            id: item.id,
            sku: item.sku,
            name: item.name,
            quantity: item.quantity + quantity,
            price: item.price,
            rowTotal: Money(
              value: item.price.value * (item.quantity + quantity),
              currency: item.price.currency,
            ),
            imageUrl: item.imageUrl,
            urlKey: item.urlKey,
            selectedOptions: item.selectedOptions,
            inStock: item.inStock,
            maxQuantity: item.maxQuantity,
          );
        }
        return item;
      }).toList();
    } else {
      // Add placeholder item - will be replaced on sync
      newItems = [
        ...cart.items,
        CartItem(
          id: 'pending_${DateTime.now().millisecondsSinceEpoch}',
          sku: sku,
          name: 'Adding...',
          quantity: quantity,
          price: const Money(value: 0, currency: 'USD'),
          rowTotal: const Money(value: 0, currency: 'USD'),
          inStock: true,
        ),
      ];
    }

    return Cart(
      id: cart.id,
      items: newItems,
      totals: cart.totals,
      appliedCoupon: cart.appliedCoupon,
      discounts: cart.discounts,
      isGuest: cart.isGuest,
      currency: cart.currency,
    );
  }

  Cart _withUpdatedQuantity(Cart cart, String itemId, int quantity) {
    final newItems = cart.items.map((item) {
      if (item.id == itemId) {
        return CartItem(
          id: item.id,
          sku: item.sku,
          name: item.name,
          quantity: quantity,
          price: item.price,
          rowTotal: Money(
            value: item.price.value * quantity,
            currency: item.price.currency,
          ),
          imageUrl: item.imageUrl,
          urlKey: item.urlKey,
          selectedOptions: item.selectedOptions,
          inStock: item.inStock,
          maxQuantity: item.maxQuantity,
        );
      }
      return item;
    }).toList();

    return Cart(
      id: cart.id,
      items: newItems,
      totals: cart.totals,
      appliedCoupon: cart.appliedCoupon,
      discounts: cart.discounts,
      isGuest: cart.isGuest,
      currency: cart.currency,
    );
  }

  Cart _withRemovedItem(Cart cart, String itemId) {
    final newItems = cart.items.where((item) => item.id != itemId).toList();

    return Cart(
      id: cart.id,
      items: newItems,
      totals: cart.totals,
      appliedCoupon: cart.appliedCoupon,
      discounts: cart.discounts,
      isGuest: cart.isGuest,
      currency: cart.currency,
    );
  }

  // Cart serialization
  Map<String, dynamic> _encodeCart(Cart cart) {
    return {
      'id': cart.id,
      'items': cart.items.map(_encodeCartItem).toList(),
      'totals': _encodeTotals(cart.totals),
      'appliedCoupon': cart.appliedCoupon,
      'discounts': cart.discounts.map(_encodeDiscount).toList(),
      'isGuest': cart.isGuest,
      'currency': cart.currency,
    };
  }

  Cart _decodeCart(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as String,
      items: (json['items'] as List)
          .map((e) => _decodeCartItem(e as Map<String, dynamic>))
          .toList(),
      totals: _decodeTotals(json['totals'] as Map<String, dynamic>),
      appliedCoupon: json['appliedCoupon'] as String?,
      discounts: (json['discounts'] as List?)
              ?.map((e) => _decodeDiscount(e as Map<String, dynamic>))
              .toList() ??
          [],
      isGuest: json['isGuest'] as bool,
      currency: json['currency'] as String,
    );
  }

  Map<String, dynamic> _encodeCartItem(CartItem item) {
    return {
      'id': item.id,
      'sku': item.sku,
      'name': item.name,
      'quantity': item.quantity,
      'price': item.price.toJson(),
      'rowTotal': item.rowTotal.toJson(),
      'imageUrl': item.imageUrl,
      'urlKey': item.urlKey,
      'selectedOptions': item.selectedOptions?.map(_encodeSelectedOption).toList(),
      'inStock': item.inStock,
      'maxQuantity': item.maxQuantity,
    };
  }

  CartItem _decodeCartItem(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      sku: json['sku'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      price: Money.fromJson(json['price'] as Map<String, dynamic>),
      rowTotal: Money.fromJson(json['rowTotal'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
      urlKey: json['urlKey'] as String?,
      selectedOptions: (json['selectedOptions'] as List?)
          ?.map((e) => _decodeSelectedOption(e as Map<String, dynamic>))
          .toList(),
      inStock: json['inStock'] as bool? ?? true,
      maxQuantity: json['maxQuantity'] as int?,
    );
  }

  Map<String, dynamic> _encodeSelectedOption(SelectedOption option) {
    return {
      'label': option.label,
      'value': option.value,
    };
  }

  SelectedOption _decodeSelectedOption(Map<String, dynamic> json) {
    return SelectedOption(
      label: json['label'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> _encodeTotals(CartTotals totals) {
    return {
      'subtotal': totals.subtotal.toJson(),
      'discount': totals.discount.toJson(),
      'shipping': totals.shipping?.toJson(),
      'tax': totals.tax.toJson(),
      'grandTotal': totals.grandTotal.toJson(),
    };
  }

  CartTotals _decodeTotals(Map<String, dynamic> json) {
    return CartTotals(
      subtotal: Money.fromJson(json['subtotal'] as Map<String, dynamic>),
      discount: Money.fromJson(json['discount'] as Map<String, dynamic>),
      shipping: json['shipping'] != null
          ? Money.fromJson(json['shipping'] as Map<String, dynamic>)
          : null,
      tax: Money.fromJson(json['tax'] as Map<String, dynamic>),
      grandTotal: Money.fromJson(json['grandTotal'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> _encodeDiscount(CartDiscount discount) {
    return {
      'code': discount.code,
      'label': discount.label,
      'amount': discount.amount.toJson(),
    };
  }

  CartDiscount _decodeDiscount(Map<String, dynamic> json) {
    return CartDiscount(
      code: json['code'] as String?,
      label: json['label'] as String,
      amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
    );
  }
}
