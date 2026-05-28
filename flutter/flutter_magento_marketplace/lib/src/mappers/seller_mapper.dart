import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../models/seller.dart';
import '../models/seller_location.dart';
import '../models/seller_review.dart';
import '../models/seller_statistics.dart';

/// Maps GraphQL responses to Seller models.
class SellerMapper {
  SellerMapper._();

  /// Maps a seller from GraphQL response.
  static Seller fromGraphQl(Map<String, dynamic> json) {
    return Seller(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      logoUrl: json['logo_url'] as String?,
      bannerUrl: json['banner_url'] as String?,
      urlKey: json['url_key'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['review_count'] as int? ?? 0,
      productCount: json['product_count'] as int? ?? 0,
      isVerified: json['is_verified'] as bool? ?? false,
      isVacationMode: json['vacation_mode'] as bool? ?? false,
      joinedAt: DateTime.parse(json['created_at'] as String),
      location: json['location'] != null
          ? locationFromGraphQl(json['location'] as Map<String, dynamic>)
          : null,
      socialLinks: _parseSocialLinks(json['social_links']),
      badges: (json['badges'] as List?)?.cast<String>(),
      statistics: json['statistics'] != null
          ? statisticsFromGraphQl(json['statistics'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Maps seller location from GraphQL.
  static SellerLocation locationFromGraphQl(Map<String, dynamic> json) {
    return SellerLocation(
      city: json['city'] as String?,
      region: json['region'] as String?,
      countryCode: json['country_code'] as String,
      address: json['address'] as String?,
      postalCode: json['postal_code'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );
  }

  /// Maps seller statistics from GraphQL.
  static SellerStatistics statisticsFromGraphQl(Map<String, dynamic> json) {
    return SellerStatistics(
      totalOrders: json['total_orders'] as int? ?? 0,
      completedOrders: json['completed_orders'] as int? ?? 0,
      fulfillmentRate: (json['fulfillment_rate'] as num?)?.toDouble() ?? 0.0,
      avgShippingTime: _parseDuration(json['avg_shipping_time']),
      totalSales: json['total_sales'] != null
          ? Money.fromJson(json['total_sales'] as Map<String, dynamic>)
          : const Money(value: 0, currency: 'USD'),
      commissionRate: (json['commission_rate'] as num?)?.toDouble() ?? 0.0,
      returnRate: (json['return_rate'] as num?)?.toDouble() ?? 0.0,
      responseTime: _parseDuration(json['response_time']),
    );
  }

  /// Maps seller review from GraphQL.
  static SellerReview reviewFromGraphQl(Map<String, dynamic> json) {
    return SellerReview(
      id: json['id'] as String,
      customerId: json['customer_id'] as String,
      customerName: json['customer_name'] as String,
      rating: json['rating'] as int,
      title: json['title'] as String?,
      review: json['review'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      orderId: json['order_id'] as String?,
      isVerifiedPurchase: json['is_verified_purchase'] as bool? ?? false,
    );
  }

  /// Maps seller page from GraphQL.
  static SellerPage pageFromGraphQl(Map<String, dynamic> json) {
    final sellersData = json['marketplace_sellers'] as Map<String, dynamic>;
    final items = (sellersData['items'] as List)
        .map((e) => fromGraphQl(e as Map<String, dynamic>))
        .toList();
    final pageInfo = sellersData['page_info'] as Map<String, dynamic>;

    return SellerPage(
      items: items,
      totalCount: sellersData['total_count'] as int,
      page: pageInfo['current_page'] as int,
      pageSize: pageInfo['page_size'] as int,
    );
  }

  /// Maps review page from GraphQL.
  static SellerReviewPage reviewPageFromGraphQl(Map<String, dynamic> json) {
    final reviewsData =
        json['marketplace_seller_reviews'] as Map<String, dynamic>;
    final items = (reviewsData['items'] as List)
        .map((e) => reviewFromGraphQl(e as Map<String, dynamic>))
        .toList();
    final pageInfo = reviewsData['page_info'] as Map<String, dynamic>;

    return SellerReviewPage(
      items: items,
      totalCount: reviewsData['total_count'] as int,
      page: pageInfo['current_page'] as int,
      pageSize: pageInfo['page_size'] as int,
    );
  }

  static Map<String, String>? _parseSocialLinks(dynamic value) {
    if (value == null) return null;
    if (value is Map) {
      return value.cast<String, String>();
    }
    // Handle JSON string
    return null;
  }

  static Duration _parseDuration(dynamic value) {
    if (value == null) return Duration.zero;
    if (value is int) return Duration(hours: value);
    if (value is String) {
      // Parse ISO 8601 duration or hours
      final hours = int.tryParse(value);
      if (hours != null) return Duration(hours: hours);
    }
    return Duration.zero;
  }
}
