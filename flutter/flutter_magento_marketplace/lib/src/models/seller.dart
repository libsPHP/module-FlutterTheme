import 'package:flutter_magento_core/flutter_magento_core.dart';

import 'seller_location.dart';
import 'seller_statistics.dart';

/// Represents a marketplace seller.
class Seller extends MagentoEntity {
  /// Seller ID.
  final String id;

  /// Seller/shop name.
  final String name;

  /// Seller description.
  final String? description;

  /// Logo URL.
  final String? logoUrl;

  /// Banner URL.
  final String? bannerUrl;

  /// URL key for routing.
  final String urlKey;

  /// Average rating (0-5).
  final double rating;

  /// Number of reviews.
  final int reviewCount;

  /// Number of products.
  final int productCount;

  /// Whether seller is verified.
  final bool isVerified;

  /// Whether seller is in vacation mode.
  final bool isVacationMode;

  /// When seller joined.
  final DateTime joinedAt;

  /// Seller location.
  final SellerLocation? location;

  /// Social media links.
  final Map<String, String>? socialLinks;

  /// Seller badges.
  final List<String>? badges;

  /// Seller statistics (when loaded).
  final SellerStatistics? statistics;

  const Seller({
    required this.id,
    required this.name,
    this.description,
    this.logoUrl,
    this.bannerUrl,
    required this.urlKey,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.productCount = 0,
    this.isVerified = false,
    this.isVacationMode = false,
    required this.joinedAt,
    this.location,
    this.socialLinks,
    this.badges,
    this.statistics,
    super.customAttributes,
  });

  /// Whether seller has a high rating (4+).
  bool get hasHighRating => rating >= 4.0;

  /// Whether seller is active (not on vacation).
  bool get isActive => !isVacationMode;
}

/// Paginated seller results.
class SellerPage {
  /// Sellers in this page.
  final List<Seller> items;

  /// Total number of sellers matching the query.
  final int totalCount;

  /// Current page number (1-indexed).
  final int page;

  /// Number of items per page.
  final int pageSize;

  const SellerPage({
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
