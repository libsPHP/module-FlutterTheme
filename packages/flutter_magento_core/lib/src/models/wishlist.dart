import 'product.dart';

/// Represents a customer's wishlist.
class Wishlist {
  /// Wishlist ID.
  final String id;

  /// Items in the wishlist.
  final List<WishlistItem> items;

  /// Number of items.
  final int itemsCount;

  /// Last updated date.
  final DateTime? updatedAt;

  const Wishlist({
    required this.id,
    required this.items,
    required this.itemsCount,
    this.updatedAt,
  });

  /// Whether wishlist is empty.
  bool get isEmpty => items.isEmpty;
}

/// An item in the wishlist.
class WishlistItem {
  /// Wishlist item ID.
  final String id;

  /// Product in this item.
  final ProductSummary product;

  /// Quantity.
  final int quantity;

  /// Date added to wishlist.
  final DateTime addedAt;

  /// Customer description/note.
  final String? description;

  const WishlistItem({
    required this.id,
    required this.product,
    this.quantity = 1,
    required this.addedAt,
    this.description,
  });
}
