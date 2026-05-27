/// A review for a seller.
class SellerReview {
  /// Review ID.
  final String id;

  /// Customer ID who wrote the review.
  final String customerId;

  /// Customer display name.
  final String customerName;

  /// Rating (1-5).
  final int rating;

  /// Review title.
  final String? title;

  /// Review text.
  final String review;

  /// When the review was created.
  final DateTime createdAt;

  /// Order ID associated with this review.
  final String? orderId;

  /// Whether review is verified purchase.
  final bool isVerifiedPurchase;

  const SellerReview({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.rating,
    this.title,
    required this.review,
    required this.createdAt,
    this.orderId,
    this.isVerifiedPurchase = false,
  });
}

/// Paginated seller reviews.
class SellerReviewPage {
  /// Reviews in this page.
  final List<SellerReview> items;

  /// Total number of reviews.
  final int totalCount;

  /// Current page number (1-indexed).
  final int page;

  /// Number of items per page.
  final int pageSize;

  const SellerReviewPage({
    required this.items,
    required this.totalCount,
    required this.page,
    required this.pageSize,
  });

  /// Total number of pages.
  int get totalPages => (totalCount / pageSize).ceil();

  /// Whether there are more pages.
  bool get hasNextPage => page < totalPages;
}
