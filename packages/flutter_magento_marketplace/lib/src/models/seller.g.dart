// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellerImpl _$$SellerImplFromJson(Map<String, dynamic> json) => _$SellerImpl(
      sellerId: (json['seller_id'] as num).toInt(),
      customerId: (json['customer_id'] as num).toInt(),
      companyName: json['company_name'] as String,
      businessLicense: json['business_license'] as String?,
      taxId: json['tax_id'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      postcode: json['postcode'] as String?,
      countryId: json['country_id'] as String?,
      subdomain: json['subdomain'] as String?,
      status: (json['status'] as num).toInt(),
      approvalStatus: (json['approval_status'] as num).toInt(),
      commissionRate: (json['commission_rate'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['review_count'] as num).toInt(),
      productCount: (json['product_count'] as num).toInt(),
      totalSales: (json['total_sales'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      storeUrl: json['store_url'] as String?,
      profileImage: json['profile_image'] as String?,
      coverImage: json['cover_image'] as String?,
      description: json['description'] as String?,
      businessHours: json['business_hours'] as String?,
      socialLinks: (json['social_links'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      verificationStatus: json['verification_status'] as String?,
      featured: json['featured'] as bool? ?? false,
      premium: json['premium'] as bool? ?? false,
      location: json['location'] == null
          ? null
          : SellerLocation.fromJson(json['location'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : SellerStatistics.fromJson(
              json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SellerImplToJson(_$SellerImpl instance) =>
    <String, dynamic>{
      'seller_id': instance.sellerId,
      'customer_id': instance.customerId,
      'company_name': instance.companyName,
      'business_license': instance.businessLicense,
      'tax_id': instance.taxId,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'region': instance.region,
      'postcode': instance.postcode,
      'country_id': instance.countryId,
      'subdomain': instance.subdomain,
      'status': instance.status,
      'approval_status': instance.approvalStatus,
      'commission_rate': instance.commissionRate,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'product_count': instance.productCount,
      'total_sales': instance.totalSales,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'store_url': instance.storeUrl,
      'profile_image': instance.profileImage,
      'cover_image': instance.coverImage,
      'description': instance.description,
      'business_hours': instance.businessHours,
      'social_links': instance.socialLinks,
      'verification_status': instance.verificationStatus,
      'featured': instance.featured,
      'premium': instance.premium,
      'location': instance.location,
      'statistics': instance.statistics,
    };

_$SellerLocationImpl _$$SellerLocationImplFromJson(Map<String, dynamic> json) =>
    _$SellerLocationImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      postalCode: json['postal_code'] as String?,
    );

Map<String, dynamic> _$$SellerLocationImplToJson(
        _$SellerLocationImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'address': instance.address,
      'city': instance.city,
      'region': instance.region,
      'country': instance.country,
      'postal_code': instance.postalCode,
    };

_$SellerStatisticsImpl _$$SellerStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerStatisticsImpl(
      totalProducts: (json['total_products'] as num).toInt(),
      approvedProducts: (json['approved_products'] as num).toInt(),
      pendingProducts: (json['pending_products'] as num).toInt(),
      newProducts: (json['new_products'] as num).toInt(),
      usedProducts: (json['used_products'] as num).toInt(),
      refurbishedProducts: (json['refurbished_products'] as num).toInt(),
      forPartsProducts: (json['for_parts_products'] as num).toInt(),
      averageRating: (json['average_rating'] as num).toDouble(),
      totalReviews: (json['total_reviews'] as num).toInt(),
      totalSales: (json['total_sales'] as num).toDouble(),
      monthlySales: (json['monthly_sales'] as num).toDouble(),
      yearlySales: (json['yearly_sales'] as num).toDouble(),
      responseTime: json['response_time'] as String?,
      completionRate: (json['completion_rate'] as num).toDouble(),
      returnRate: (json['return_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$SellerStatisticsImplToJson(
        _$SellerStatisticsImpl instance) =>
    <String, dynamic>{
      'total_products': instance.totalProducts,
      'approved_products': instance.approvedProducts,
      'pending_products': instance.pendingProducts,
      'new_products': instance.newProducts,
      'used_products': instance.usedProducts,
      'refurbished_products': instance.refurbishedProducts,
      'for_parts_products': instance.forPartsProducts,
      'average_rating': instance.averageRating,
      'total_reviews': instance.totalReviews,
      'total_sales': instance.totalSales,
      'monthly_sales': instance.monthlySales,
      'yearly_sales': instance.yearlySales,
      'response_time': instance.responseTime,
      'completion_rate': instance.completionRate,
      'return_rate': instance.returnRate,
    };

_$SellerRegistrationRequestImpl _$$SellerRegistrationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerRegistrationRequestImpl(
      customerId: (json['customer_id'] as num).toInt(),
      companyName: json['company_name'] as String,
      businessLicense: json['business_license'] as String?,
      taxId: json['tax_id'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      postcode: json['postcode'] as String?,
      countryId: json['country_id'] as String?,
      subdomain: json['subdomain'] as String?,
      description: json['description'] as String?,
      businessHours: json['business_hours'] as String?,
      socialLinks: (json['social_links'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$SellerRegistrationRequestImplToJson(
        _$SellerRegistrationRequestImpl instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'company_name': instance.companyName,
      'business_license': instance.businessLicense,
      'tax_id': instance.taxId,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'region': instance.region,
      'postcode': instance.postcode,
      'country_id': instance.countryId,
      'subdomain': instance.subdomain,
      'description': instance.description,
      'business_hours': instance.businessHours,
      'social_links': instance.socialLinks,
    };

_$SellerUpdateRequestImpl _$$SellerUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerUpdateRequestImpl(
      sellerId: (json['seller_id'] as num).toInt(),
      companyName: json['company_name'] as String?,
      businessLicense: json['business_license'] as String?,
      taxId: json['tax_id'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      postcode: json['postcode'] as String?,
      countryId: json['country_id'] as String?,
      subdomain: json['subdomain'] as String?,
      description: json['description'] as String?,
      businessHours: json['business_hours'] as String?,
      socialLinks: (json['social_links'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      profileImage: json['profile_image'] as String?,
      coverImage: json['cover_image'] as String?,
    );

Map<String, dynamic> _$$SellerUpdateRequestImplToJson(
        _$SellerUpdateRequestImpl instance) =>
    <String, dynamic>{
      'seller_id': instance.sellerId,
      'company_name': instance.companyName,
      'business_license': instance.businessLicense,
      'tax_id': instance.taxId,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'region': instance.region,
      'postcode': instance.postcode,
      'country_id': instance.countryId,
      'subdomain': instance.subdomain,
      'description': instance.description,
      'business_hours': instance.businessHours,
      'social_links': instance.socialLinks,
      'profile_image': instance.profileImage,
      'cover_image': instance.coverImage,
    };

_$SellerSearchFiltersImpl _$$SellerSearchFiltersImplFromJson(
        Map<String, dynamic> json) =>
    _$SellerSearchFiltersImpl(
      search: json['search'] as String?,
      status: (json['status'] as num?)?.toInt(),
      approvalStatus: (json['approval_status'] as num?)?.toInt(),
      ratingMin: (json['rating_min'] as num?)?.toDouble(),
      ratingMax: (json['rating_max'] as num?)?.toDouble(),
      createdFrom: json['created_from'] == null
          ? null
          : DateTime.parse(json['created_from'] as String),
      createdTo: json['created_to'] == null
          ? null
          : DateTime.parse(json['created_to'] as String),
      city: json['city'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      featured: json['featured'] as bool?,
      premium: json['premium'] as bool?,
      verificationStatus: json['verification_status'] as String?,
      sortBy: $enumDecodeNullable(_$SellerSortByEnumMap, json['sort_by']),
      sortDirection:
          $enumDecodeNullable(_$SortDirectionEnumMap, json['sort_direction']),
    );

Map<String, dynamic> _$$SellerSearchFiltersImplToJson(
        _$SellerSearchFiltersImpl instance) =>
    <String, dynamic>{
      'search': instance.search,
      'status': instance.status,
      'approval_status': instance.approvalStatus,
      'rating_min': instance.ratingMin,
      'rating_max': instance.ratingMax,
      'created_from': instance.createdFrom?.toIso8601String(),
      'created_to': instance.createdTo?.toIso8601String(),
      'city': instance.city,
      'region': instance.region,
      'country': instance.country,
      'featured': instance.featured,
      'premium': instance.premium,
      'verification_status': instance.verificationStatus,
      'sort_by': _$SellerSortByEnumMap[instance.sortBy],
      'sort_direction': _$SortDirectionEnumMap[instance.sortDirection],
    };

const _$SellerSortByEnumMap = {
  SellerSortBy.sellerId: 'seller_id',
  SellerSortBy.companyName: 'company_name',
  SellerSortBy.rating: 'rating',
  SellerSortBy.reviewCount: 'review_count',
  SellerSortBy.productCount: 'product_count',
  SellerSortBy.totalSales: 'total_sales',
  SellerSortBy.createdAt: 'created_at',
};

const _$SortDirectionEnumMap = {
  SortDirection.ascending: 'asc',
  SortDirection.descending: 'desc',
};
