import 'package:flutter_magento_core/flutter_magento_core.dart';

/// A product listing on Yuku marketplace.
class YukuListing {
  /// Yuku listing ID.
  final String id;

  /// Magento product SKU.
  final String sku;

  /// Listing title.
  final String title;

  /// Listing description.
  final String description;

  /// Price on Yuku.
  final Money price;

  /// ICP price (if applicable).
  final double? icpPrice;

  /// Category on Yuku.
  final String category;

  /// Listing status.
  final YukuListingStatus status;

  /// Image URLs.
  final List<String> images;

  /// When listing was created.
  final DateTime createdAt;

  /// When listing was last updated.
  final DateTime? updatedAt;

  /// Number of views.
  final int viewCount;

  /// Number of favorites.
  final int favoriteCount;

  /// Seller ID on Yuku.
  final String? yukuSellerId;

  const YukuListing({
    required this.id,
    required this.sku,
    required this.title,
    required this.description,
    required this.price,
    this.icpPrice,
    required this.category,
    required this.status,
    this.images = const [],
    required this.createdAt,
    this.updatedAt,
    this.viewCount = 0,
    this.favoriteCount = 0,
    this.yukuSellerId,
  });

  /// Whether listing is active and visible.
  bool get isActive => status == YukuListingStatus.active;

  /// Yuku listing URL.
  String get listingUrl => 'https://yuku.app/listing/$id';
}

/// Yuku listing status.
enum YukuListingStatus {
  /// Draft, not yet published.
  draft,

  /// Active and visible.
  active,

  /// Sold.
  sold,

  /// Inactive/paused.
  inactive,

  /// Deleted.
  deleted,
}

/// Result of syncing products to Yuku.
class YukuSyncResult {
  /// Number of products synced successfully.
  final int synced;

  /// Number of products that failed to sync.
  final int failed;

  /// Error messages for failed products.
  final Map<String, String> errors;

  /// Created listing IDs.
  final List<String> createdListings;

  /// Updated listing IDs.
  final List<String> updatedListings;

  const YukuSyncResult({
    required this.synced,
    required this.failed,
    this.errors = const {},
    this.createdListings = const [],
    this.updatedListings = const [],
  });

  /// Whether all products synced successfully.
  bool get allSucceeded => failed == 0;

  /// Total products processed.
  int get total => synced + failed;
}
