import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

/// Seller model for marketplace functionality
@freezed
class Seller with _$Seller {
  const factory Seller({
    @JsonKey(name: 'seller_id') required int sellerId,
    @JsonKey(name: 'customer_id') required int customerId,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'business_license') String? businessLicense,
    @JsonKey(name: 'tax_id') String? taxId,
    String? phone,
    String? address,
    String? city,
    String? region,
    String? postcode,
    @JsonKey(name: 'country_id') String? countryId,
    String? subdomain,
    required int status,
    @JsonKey(name: 'approval_status') required int approvalStatus,
    @JsonKey(name: 'commission_rate') required double commissionRate,
    required double rating,
    @JsonKey(name: 'review_count') required int reviewCount,
    @JsonKey(name: 'product_count') required int productCount,
    @JsonKey(name: 'total_sales') required double totalSales,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'store_url') String? storeUrl,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'cover_image') String? coverImage,
    String? description,
    @JsonKey(name: 'business_hours') String? businessHours,
    @JsonKey(name: 'social_links') Map<String, String>? socialLinks,
    @JsonKey(name: 'verification_status') String? verificationStatus,
    @JsonKey(name: 'featured') @Default(false) bool featured,
    @JsonKey(name: 'premium') @Default(false) bool premium,
    @JsonKey(name: 'location') SellerLocation? location,
    @JsonKey(name: 'statistics') SellerStatistics? statistics,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}

/// Seller location information
@freezed
class SellerLocation with _$SellerLocation {
  const factory SellerLocation({
    required double latitude,
    required double longitude,
    String? address,
    String? city,
    String? region,
    String? country,
    @JsonKey(name: 'postal_code') String? postalCode,
  }) = _SellerLocation;

  factory SellerLocation.fromJson(Map<String, dynamic> json) =>
      _$SellerLocationFromJson(json);
}

/// Seller statistics
@freezed
class SellerStatistics with _$SellerStatistics {
  const factory SellerStatistics({
    @JsonKey(name: 'total_products') required int totalProducts,
    @JsonKey(name: 'approved_products') required int approvedProducts,
    @JsonKey(name: 'pending_products') required int pendingProducts,
    @JsonKey(name: 'new_products') required int newProducts,
    @JsonKey(name: 'used_products') required int usedProducts,
    @JsonKey(name: 'refurbished_products') required int refurbishedProducts,
    @JsonKey(name: 'for_parts_products') required int forPartsProducts,
    @JsonKey(name: 'average_rating') required double averageRating,
    @JsonKey(name: 'total_reviews') required int totalReviews,
    @JsonKey(name: 'total_sales') required double totalSales,
    @JsonKey(name: 'monthly_sales') required double monthlySales,
    @JsonKey(name: 'yearly_sales') required double yearlySales,
    @JsonKey(name: 'response_time') String? responseTime,
    @JsonKey(name: 'completion_rate') required double completionRate,
    @JsonKey(name: 'return_rate') required double returnRate,
  }) = _SellerStatistics;

  factory SellerStatistics.fromJson(Map<String, dynamic> json) =>
      _$SellerStatisticsFromJson(json);
}

/// Seller registration request
@freezed
class SellerRegistrationRequest with _$SellerRegistrationRequest {
  const factory SellerRegistrationRequest({
    @JsonKey(name: 'customer_id') required int customerId,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'business_license') String? businessLicense,
    @JsonKey(name: 'tax_id') String? taxId,
    String? phone,
    String? address,
    String? city,
    String? region,
    String? postcode,
    @JsonKey(name: 'country_id') String? countryId,
    String? subdomain,
    String? description,
    @JsonKey(name: 'business_hours') String? businessHours,
    @JsonKey(name: 'social_links') Map<String, String>? socialLinks,
  }) = _SellerRegistrationRequest;

  factory SellerRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$SellerRegistrationRequestFromJson(json);
}

/// Seller update request
@freezed
class SellerUpdateRequest with _$SellerUpdateRequest {
  const factory SellerUpdateRequest({
    @JsonKey(name: 'seller_id') required int sellerId,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'business_license') String? businessLicense,
    @JsonKey(name: 'tax_id') String? taxId,
    String? phone,
    String? address,
    String? city,
    String? region,
    String? postcode,
    @JsonKey(name: 'country_id') String? countryId,
    String? subdomain,
    String? description,
    @JsonKey(name: 'business_hours') String? businessHours,
    @JsonKey(name: 'social_links') Map<String, String>? socialLinks,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'cover_image') String? coverImage,
  }) = _SellerUpdateRequest;

  factory SellerUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$SellerUpdateRequestFromJson(json);
}

/// Seller search filters
@freezed
class SellerSearchFilters with _$SellerSearchFilters {
  const factory SellerSearchFilters({
    String? search,
    int? status,
    @JsonKey(name: 'approval_status') int? approvalStatus,
    @JsonKey(name: 'rating_min') double? ratingMin,
    @JsonKey(name: 'rating_max') double? ratingMax,
    @JsonKey(name: 'created_from') DateTime? createdFrom,
    @JsonKey(name: 'created_to') DateTime? createdTo,
    String? city,
    String? region,
    String? country,
    @JsonKey(name: 'featured') bool? featured,
    @JsonKey(name: 'premium') bool? premium,
    @JsonKey(name: 'verification_status') String? verificationStatus,
    @JsonKey(name: 'sort_by') SellerSortBy? sortBy,
    @JsonKey(name: 'sort_direction') SortDirection? sortDirection,
  }) = _SellerSearchFilters;

  factory SellerSearchFilters.fromJson(Map<String, dynamic> json) =>
      _$SellerSearchFiltersFromJson(json);
}

/// Seller sort options
enum SellerSortBy {
  @JsonValue('seller_id')
  sellerId,
  @JsonValue('company_name')
  companyName,
  @JsonValue('rating')
  rating,
  @JsonValue('review_count')
  reviewCount,
  @JsonValue('product_count')
  productCount,
  @JsonValue('total_sales')
  totalSales,
  @JsonValue('created_at')
  createdAt,
}

/// Sort direction
enum SortDirection {
  @JsonValue('asc')
  ascending,
  @JsonValue('desc')
  descending,
}

/// Seller status constants
class SellerStatus {
  static const int pending = 0;
  static const int active = 1;
  static const int suspended = 2;
  static const int inactive = 3;
}

/// Seller approval status constants
class SellerApprovalStatus {
  static const int pending = 0;
  static const int approved = 1;
  static const int rejected = 2;
  static const int underReview = 3;
}

/// Seller verification status constants
class SellerVerificationStatus {
  static const String unverified = 'unverified';
  static const String pending = 'pending';
  static const String verified = 'verified';
  static const String rejected = 'rejected';
}
