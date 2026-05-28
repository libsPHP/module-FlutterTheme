import '../models/wishlist.dart';
import '../models/cart.dart';

/// Repository interface for wishlist operations.
abstract interface class WishlistRepository {
  /// Gets the current customer's wishlist.
  ///
  /// Throws [MagentoAuthException] if not authenticated.
  Future<Wishlist> getWishlist();

  /// Adds a product to the wishlist.
  ///
  /// Returns the updated [Wishlist].
  Future<Wishlist> addItem(String sku);

  /// Removes an item from the wishlist.
  ///
  /// Returns the updated [Wishlist].
  Future<Wishlist> removeItem(String itemId);

  /// Moves a wishlist item to the cart.
  ///
  /// Returns the updated [Cart] after adding the item.
  /// The item remains in the wishlist.
  Future<Cart> moveToCart(String itemId);

  /// Moves all wishlist items to the cart.
  ///
  /// Returns the updated [Cart].
  /// Items that cannot be added (out of stock, etc.) are skipped.
  Future<Cart> moveAllToCart();

  /// Updates the quantity for a wishlist item.
  ///
  /// Returns the updated [Wishlist].
  Future<Wishlist> updateItemQuantity({
    required String itemId,
    required int quantity,
  });
}
