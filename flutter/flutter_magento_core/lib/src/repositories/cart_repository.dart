import '../models/cart.dart';

/// Repository interface for shopping cart operations.
abstract interface class CartRepository {
  /// Gets the current cart for the customer or guest.
  ///
  /// Creates a new cart if none exists.
  Future<Cart> getCurrentCart();

  /// Creates a new guest cart.
  ///
  /// Returns a [Cart] with a new guest cart ID.
  Future<Cart> createGuestCart();

  /// Adds a simple product to the cart.
  ///
  /// Returns the updated [Cart].
  /// Throws [MagentoCartException] if product is out of stock.
  Future<Cart> addSimpleProduct({
    required String sku,
    required int quantity,
  });

  /// Adds a configurable product to the cart.
  ///
  /// The [variantSku] is the specific variant's SKU.
  /// [selectedOptions] maps option attribute IDs to value IDs.
  /// Returns the updated [Cart].
  Future<Cart> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
  });

  /// Updates the quantity of an item in the cart.
  ///
  /// Returns the updated [Cart].
  /// Throws [MagentoCartException] if item not found.
  Future<Cart> updateItemQuantity({
    required String itemId,
    required int quantity,
  });

  /// Removes an item from the cart.
  ///
  /// Returns the updated [Cart].
  Future<Cart> removeItem(String itemId);

  /// Applies a coupon code to the cart.
  ///
  /// Returns the updated [Cart] with discounts applied.
  /// Throws [MagentoValidationException] if coupon is invalid.
  Future<Cart> applyCoupon(String couponCode);

  /// Removes the applied coupon from the cart.
  ///
  /// Returns the updated [Cart].
  Future<Cart> removeCoupon();

  /// Merges a guest cart into the customer's cart after login.
  ///
  /// Returns the merged [Cart].
  Future<Cart> mergeGuestCartToCustomerCart();

  /// Clears all items from the cart.
  Future<void> clearCart();
}
