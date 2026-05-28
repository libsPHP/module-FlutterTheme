import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/core_providers.dart';

/// Cart controller provider.
final cartControllerProvider =
    AsyncNotifierProvider<CartController, Cart>(CartController.new);

/// Controller for cart operations.
class CartController extends AsyncNotifier<Cart> {
  late CartRepository _cartRepo;

  @override
  Future<Cart> build() async {
    _cartRepo = ref.watch(cartRepositoryProvider);
    return _cartRepo.getCurrentCart();
  }

  /// Adds a simple product to the cart.
  Future<void> addSimpleProduct(String sku, int quantity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.addSimpleProduct(sku: sku, quantity: quantity);
    });
  }

  /// Adds a configurable product to the cart.
  Future<void> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.addConfigurableProduct(
        parentSku: parentSku,
        variantSku: variantSku,
        quantity: quantity,
        selectedOptions: selectedOptions,
      );
    });
  }

  /// Updates the quantity of an item in the cart.
  Future<void> updateQuantity(String itemId, int quantity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.updateItemQuantity(itemId: itemId, quantity: quantity);
    });
  }

  /// Removes an item from the cart.
  Future<void> removeItem(String itemId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.removeItem(itemId);
    });
  }

  /// Applies a coupon code to the cart.
  Future<void> applyCoupon(String code) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.applyCoupon(code);
    });
  }

  /// Removes the applied coupon from the cart.
  Future<void> removeCoupon() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.removeCoupon();
    });
  }

  /// Merges guest cart to customer cart after login.
  Future<void> mergeGuestCart() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.mergeGuestCartToCustomerCart();
    });
  }

  /// Refreshes the cart from the server.
  Future<void> refresh() async {
    ref.invalidateSelf();
  }

  /// Clears all items from the cart.
  Future<void> clearCart() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _cartRepo.clearCart();
      return _cartRepo.getCurrentCart();
    });
  }
}

/// Cart item count provider for badges.
final cartItemCountProvider = Provider<int>((ref) {
  final cartAsync = ref.watch(cartControllerProvider);
  return cartAsync.valueOrNull?.itemCount ?? 0;
});

/// Cart total provider.
final cartTotalProvider = Provider<Money?>((ref) {
  final cartAsync = ref.watch(cartControllerProvider);
  return cartAsync.valueOrNull?.totals.grandTotal;
});
