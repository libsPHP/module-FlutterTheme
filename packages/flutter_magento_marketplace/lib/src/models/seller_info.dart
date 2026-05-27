/// Lightweight seller info for product display.
///
/// This is extracted from product custom attributes
/// to show seller information on product listings.
class SellerInfo {
  /// Seller ID.
  final String sellerId;

  /// Seller name.
  final String sellerName;

  /// Seller URL key.
  final String? sellerUrl;

  /// Seller rating.
  final double? rating;

  /// Number of products.
  final int? productCount;

  /// Seller logo URL.
  final String? logoUrl;

  const SellerInfo({
    required this.sellerId,
    required this.sellerName,
    this.sellerUrl,
    this.rating,
    this.productCount,
    this.logoUrl,
  });

  /// Creates an empty seller info (no seller).
  factory SellerInfo.none() => const SellerInfo(
        sellerId: '',
        sellerName: '',
      );

  /// Whether this product has a seller.
  bool get hasSeller => sellerId.isNotEmpty;
}
