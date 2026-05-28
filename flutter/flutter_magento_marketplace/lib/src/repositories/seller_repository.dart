import '../models/seller.dart';
import '../models/seller_filter.dart';
import '../models/seller_review.dart';
import '../models/seller_sort.dart';
import '../models/seller_statistics.dart';

/// Repository interface for seller operations.
abstract interface class SellerRepository {
  /// Gets sellers with optional filters and sorting.
  ///
  /// Returns a paginated [SellerPage] of matching sellers.
  Future<SellerPage> getSellers({
    required int page,
    required int pageSize,
    SellerFilter? filter,
    SellerSort? sort,
  });

  /// Gets a seller by ID.
  ///
  /// Throws [MagentoNotFoundException] if seller doesn't exist.
  Future<Seller> getSellerById(String sellerId);

  /// Gets a seller by URL key.
  ///
  /// Throws [MagentoNotFoundException] if seller doesn't exist.
  Future<Seller> getSellerByUrlKey(String urlKey);

  /// Gets featured sellers.
  Future<List<Seller>> getFeaturedSellers({int limit = 10});

  /// Gets seller statistics.
  Future<SellerStatistics> getSellerStatistics(String sellerId);

  /// Gets seller reviews.
  Future<SellerReviewPage> getSellerReviews({
    required String sellerId,
    required int page,
    required int pageSize,
  });

  /// Submits a review for a seller.
  Future<void> submitSellerReview({
    required String sellerId,
    required int rating,
    required String review,
    String? title,
  });
}
