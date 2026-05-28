import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../mappers/cart_mapper.dart';
import '../queries/cart_queries.dart';

class MagentoCartRepository implements CartRepository {
  final MagentoTransport transport;
  final MagentoAuthStorage authStorage;
  final CartMapper _mapper;

  String? _cachedCartId;

  MagentoCartRepository({
    required this.transport,
    required this.authStorage,
  }) : _mapper = CartMapper();

  @override
  Future<Cart> getCurrentCart() async {
    final isAuthenticated = await authStorage.hasCustomerToken();

    if (isAuthenticated) {
      return _getCustomerCart();
    } else {
      return _getOrCreateGuestCart();
    }
  }

  Future<Cart> _getCustomerCart() async {
    final response = await transport.graphql(
      CartQueries.customerCart,
      decoder: (json) =>
          _mapper.mapCart(json['customerCart'] as Map<String, dynamic>, isGuest: false),
    );
    _cachedCartId = response.data.id;
    return response.data;
  }

  Future<Cart> _getOrCreateGuestCart() async {
    final existingCartId = await authStorage.getGuestCartId();

    if (existingCartId != null && existingCartId.isNotEmpty) {
      try {
        final response = await transport.graphql(
          CartQueries.getCart,
          variables: {'cartId': existingCartId},
          decoder: (json) =>
              _mapper.mapCart(json['cart'] as Map<String, dynamic>, isGuest: true),
        );
        _cachedCartId = existingCartId;
        return response.data;
      } catch (e) {
        await authStorage.clearGuestCartId();
      }
    }

    return createGuestCart();
  }

  @override
  Future<Cart> createGuestCart() async {
    final response = await transport.graphql(
      CartQueries.createEmptyCart,
      decoder: (json) => json['createEmptyCart'] as String,
    );

    final cartId = response.data;
    await authStorage.saveGuestCartId(cartId);
    _cachedCartId = cartId;

    return Cart(
      id: cartId,
      items: const [],
      totals: const CartTotals(
        subtotal: Money(value: 0, currency: 'USD'),
        discount: Money(value: 0, currency: 'USD'),
        tax: Money(value: 0, currency: 'USD'),
        grandTotal: Money(value: 0, currency: 'USD'),
      ),
      isGuest: true,
      currency: 'USD',
    );
  }

  Future<String> _getCartId() async {
    if (_cachedCartId != null) return _cachedCartId!;

    final isAuthenticated = await authStorage.hasCustomerToken();
    if (isAuthenticated) {
      final cart = await _getCustomerCart();
      return cart.id;
    } else {
      final existingCartId = await authStorage.getGuestCartId();
      if (existingCartId != null && existingCartId.isNotEmpty) {
        _cachedCartId = existingCartId;
        return existingCartId;
      }
      final cart = await createGuestCart();
      return cart.id;
    }
  }

  @override
  Future<Cart> addSimpleProduct({
    required String sku,
    required int quantity,
  }) async {
    final cartId = await _getCartId();
    final isGuest = !(await authStorage.hasCustomerToken());

    final response = await transport.graphql(
      CartQueries.addSimpleProductsToCart,
      variables: {
        'cartId': cartId,
        'cartItems': [
          {
            'data': {
              'sku': sku,
              'quantity': quantity,
            },
          },
        ],
      },
      decoder: (json) {
        final data = json['addSimpleProductsToCart'] as Map<String, dynamic>?;
        return _mapper.mapCart(data?['cart'] as Map<String, dynamic>, isGuest: isGuest);
      },
    );

    return response.data;
  }

  @override
  Future<Cart> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
  }) async {
    final cartId = await _getCartId();
    final isGuest = !(await authStorage.hasCustomerToken());

    final response = await transport.graphql(
      CartQueries.addConfigurableProductsToCart,
      variables: {
        'cartId': cartId,
        'cartItems': [
          {
            'parent_sku': parentSku,
            'data': {
              'sku': variantSku,
              'quantity': quantity,
            },
          },
        ],
      },
      decoder: (json) {
        final data =
            json['addConfigurableProductsToCart'] as Map<String, dynamic>?;
        return _mapper.mapCart(data?['cart'] as Map<String, dynamic>, isGuest: isGuest);
      },
    );

    return response.data;
  }

  @override
  Future<Cart> updateItemQuantity({
    required String itemId,
    required int quantity,
  }) async {
    final cartId = await _getCartId();
    final isGuest = !(await authStorage.hasCustomerToken());

    final response = await transport.graphql(
      CartQueries.updateCartItems,
      variables: {
        'cartId': cartId,
        'cartItems': [
          {
            'cart_item_uid': itemId,
            'quantity': quantity,
          },
        ],
      },
      decoder: (json) {
        final data = json['updateCartItems'] as Map<String, dynamic>?;
        return _mapper.mapCart(data?['cart'] as Map<String, dynamic>, isGuest: isGuest);
      },
    );

    return response.data;
  }

  @override
  Future<Cart> removeItem(String itemId) async {
    final cartId = await _getCartId();
    final isGuest = !(await authStorage.hasCustomerToken());

    final response = await transport.graphql(
      CartQueries.removeItemFromCart,
      variables: {
        'cartId': cartId,
        'itemUid': itemId,
      },
      decoder: (json) {
        final data = json['removeItemFromCart'] as Map<String, dynamic>?;
        return _mapper.mapCart(data?['cart'] as Map<String, dynamic>, isGuest: isGuest);
      },
    );

    return response.data;
  }

  @override
  Future<Cart> applyCoupon(String couponCode) async {
    final cartId = await _getCartId();
    final isGuest = !(await authStorage.hasCustomerToken());

    final response = await transport.graphql(
      CartQueries.applyCouponToCart,
      variables: {
        'cartId': cartId,
        'couponCode': couponCode,
      },
      decoder: (json) {
        final data = json['applyCouponToCart'] as Map<String, dynamic>?;
        return _mapper.mapCart(data?['cart'] as Map<String, dynamic>, isGuest: isGuest);
      },
    );

    return response.data;
  }

  @override
  Future<Cart> removeCoupon() async {
    final cartId = await _getCartId();
    final isGuest = !(await authStorage.hasCustomerToken());

    final response = await transport.graphql(
      CartQueries.removeCouponFromCart,
      variables: {
        'cartId': cartId,
      },
      decoder: (json) {
        final data = json['removeCouponFromCart'] as Map<String, dynamic>?;
        return _mapper.mapCart(data?['cart'] as Map<String, dynamic>, isGuest: isGuest);
      },
    );

    return response.data;
  }

  @override
  Future<Cart> mergeGuestCartToCustomerCart() async {
    final guestCartId = await authStorage.getGuestCartId();
    if (guestCartId == null || guestCartId.isEmpty) {
      return getCurrentCart();
    }

    final customerCart = await _getCustomerCart();

    final response = await transport.graphql(
      CartQueries.mergeCarts,
      variables: {
        'sourceCartId': guestCartId,
        'destinationCartId': customerCart.id,
      },
      decoder: (json) =>
          _mapper.mapCart(json['mergeCarts'] as Map<String, dynamic>, isGuest: false),
    );

    await authStorage.clearGuestCartId();
    _cachedCartId = response.data.id;

    return response.data;
  }

  @override
  Future<void> clearCart() async {
    final isAuthenticated = await authStorage.hasCustomerToken();

    if (!isAuthenticated) {
      await authStorage.clearGuestCartId();
      _cachedCartId = null;
      await createGuestCart();
    } else {
      final cart = await getCurrentCart();
      for (final item in cart.items) {
        await removeItem(item.id);
      }
    }
  }
}
