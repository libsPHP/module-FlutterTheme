// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Seller _$SellerFromJson(Map<String, dynamic> json) {
  return _Seller.fromJson(json);
}

/// @nodoc
mixin _$Seller {
  @JsonKey(name: 'seller_id')
  int get sellerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_license')
  String? get businessLicense => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_id')
  String? get taxId => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  String? get countryId => throw _privateConstructorUsedError;
  String? get subdomain => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_status')
  int get approvalStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_rate')
  double get commissionRate => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_count')
  int get reviewCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_count')
  int get productCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sales')
  double get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_url')
  String? get storeUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_hours')
  String? get businessHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String? get verificationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured')
  bool get featured => throw _privateConstructorUsedError;
  @JsonKey(name: 'premium')
  bool get premium => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  SellerLocation? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'statistics')
  SellerStatistics? get statistics => throw _privateConstructorUsedError;

  /// Serializes this Seller to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerCopyWith<Seller> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerCopyWith<$Res> {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) then) =
      _$SellerCopyWithImpl<$Res, Seller>;
  @useResult
  $Res call(
      {@JsonKey(name: 'seller_id') int sellerId,
      @JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'business_license') String? businessLicense,
      @JsonKey(name: 'tax_id') String? taxId,
      String? phone,
      String? address,
      String? city,
      String? region,
      String? postcode,
      @JsonKey(name: 'country_id') String? countryId,
      String? subdomain,
      int status,
      @JsonKey(name: 'approval_status') int approvalStatus,
      @JsonKey(name: 'commission_rate') double commissionRate,
      double rating,
      @JsonKey(name: 'review_count') int reviewCount,
      @JsonKey(name: 'product_count') int productCount,
      @JsonKey(name: 'total_sales') double totalSales,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'store_url') String? storeUrl,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'cover_image') String? coverImage,
      String? description,
      @JsonKey(name: 'business_hours') String? businessHours,
      @JsonKey(name: 'social_links') Map<String, String>? socialLinks,
      @JsonKey(name: 'verification_status') String? verificationStatus,
      @JsonKey(name: 'featured') bool featured,
      @JsonKey(name: 'premium') bool premium,
      @JsonKey(name: 'location') SellerLocation? location,
      @JsonKey(name: 'statistics') SellerStatistics? statistics});

  $SellerLocationCopyWith<$Res>? get location;
  $SellerStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class _$SellerCopyWithImpl<$Res, $Val extends Seller>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? customerId = null,
    Object? companyName = null,
    Object? businessLicense = freezed,
    Object? taxId = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? subdomain = freezed,
    Object? status = null,
    Object? approvalStatus = null,
    Object? commissionRate = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? productCount = null,
    Object? totalSales = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? storeUrl = freezed,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
    Object? description = freezed,
    Object? businessHours = freezed,
    Object? socialLinks = freezed,
    Object? verificationStatus = freezed,
    Object? featured = null,
    Object? premium = null,
    Object? location = freezed,
    Object? statistics = freezed,
  }) {
    return _then(_value.copyWith(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLicense: freezed == businessLicense
          ? _value.businessLicense
          : businessLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subdomain: freezed == subdomain
          ? _value.subdomain
          : subdomain // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      approvalStatus: null == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as int,
      commissionRate: null == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      productCount: null == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      storeUrl: freezed == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      businessHours: freezed == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String?,
      socialLinks: freezed == socialLinks
          ? _value.socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SellerLocation?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as SellerStatistics?,
    ) as $Val);
  }

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SellerLocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $SellerLocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SellerStatisticsCopyWith<$Res>? get statistics {
    if (_value.statistics == null) {
      return null;
    }

    return $SellerStatisticsCopyWith<$Res>(_value.statistics!, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SellerImplCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$$SellerImplCopyWith(
          _$SellerImpl value, $Res Function(_$SellerImpl) then) =
      __$$SellerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'seller_id') int sellerId,
      @JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'business_license') String? businessLicense,
      @JsonKey(name: 'tax_id') String? taxId,
      String? phone,
      String? address,
      String? city,
      String? region,
      String? postcode,
      @JsonKey(name: 'country_id') String? countryId,
      String? subdomain,
      int status,
      @JsonKey(name: 'approval_status') int approvalStatus,
      @JsonKey(name: 'commission_rate') double commissionRate,
      double rating,
      @JsonKey(name: 'review_count') int reviewCount,
      @JsonKey(name: 'product_count') int productCount,
      @JsonKey(name: 'total_sales') double totalSales,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'store_url') String? storeUrl,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'cover_image') String? coverImage,
      String? description,
      @JsonKey(name: 'business_hours') String? businessHours,
      @JsonKey(name: 'social_links') Map<String, String>? socialLinks,
      @JsonKey(name: 'verification_status') String? verificationStatus,
      @JsonKey(name: 'featured') bool featured,
      @JsonKey(name: 'premium') bool premium,
      @JsonKey(name: 'location') SellerLocation? location,
      @JsonKey(name: 'statistics') SellerStatistics? statistics});

  @override
  $SellerLocationCopyWith<$Res>? get location;
  @override
  $SellerStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class __$$SellerImplCopyWithImpl<$Res>
    extends _$SellerCopyWithImpl<$Res, _$SellerImpl>
    implements _$$SellerImplCopyWith<$Res> {
  __$$SellerImplCopyWithImpl(
      _$SellerImpl _value, $Res Function(_$SellerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? customerId = null,
    Object? companyName = null,
    Object? businessLicense = freezed,
    Object? taxId = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? subdomain = freezed,
    Object? status = null,
    Object? approvalStatus = null,
    Object? commissionRate = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? productCount = null,
    Object? totalSales = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? storeUrl = freezed,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
    Object? description = freezed,
    Object? businessHours = freezed,
    Object? socialLinks = freezed,
    Object? verificationStatus = freezed,
    Object? featured = null,
    Object? premium = null,
    Object? location = freezed,
    Object? statistics = freezed,
  }) {
    return _then(_$SellerImpl(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLicense: freezed == businessLicense
          ? _value.businessLicense
          : businessLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subdomain: freezed == subdomain
          ? _value.subdomain
          : subdomain // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      approvalStatus: null == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as int,
      commissionRate: null == commissionRate
          ? _value.commissionRate
          : commissionRate // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      productCount: null == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      storeUrl: freezed == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      businessHours: freezed == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String?,
      socialLinks: freezed == socialLinks
          ? _value._socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: null == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SellerLocation?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as SellerStatistics?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerImpl implements _Seller {
  const _$SellerImpl(
      {@JsonKey(name: 'seller_id') required this.sellerId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'company_name') required this.companyName,
      @JsonKey(name: 'business_license') this.businessLicense,
      @JsonKey(name: 'tax_id') this.taxId,
      this.phone,
      this.address,
      this.city,
      this.region,
      this.postcode,
      @JsonKey(name: 'country_id') this.countryId,
      this.subdomain,
      required this.status,
      @JsonKey(name: 'approval_status') required this.approvalStatus,
      @JsonKey(name: 'commission_rate') required this.commissionRate,
      required this.rating,
      @JsonKey(name: 'review_count') required this.reviewCount,
      @JsonKey(name: 'product_count') required this.productCount,
      @JsonKey(name: 'total_sales') required this.totalSales,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'store_url') this.storeUrl,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'cover_image') this.coverImage,
      this.description,
      @JsonKey(name: 'business_hours') this.businessHours,
      @JsonKey(name: 'social_links') final Map<String, String>? socialLinks,
      @JsonKey(name: 'verification_status') this.verificationStatus,
      @JsonKey(name: 'featured') this.featured = false,
      @JsonKey(name: 'premium') this.premium = false,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'statistics') this.statistics})
      : _socialLinks = socialLinks;

  factory _$SellerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerImplFromJson(json);

  @override
  @JsonKey(name: 'seller_id')
  final int sellerId;
  @override
  @JsonKey(name: 'customer_id')
  final int customerId;
  @override
  @JsonKey(name: 'company_name')
  final String companyName;
  @override
  @JsonKey(name: 'business_license')
  final String? businessLicense;
  @override
  @JsonKey(name: 'tax_id')
  final String? taxId;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? postcode;
  @override
  @JsonKey(name: 'country_id')
  final String? countryId;
  @override
  final String? subdomain;
  @override
  final int status;
  @override
  @JsonKey(name: 'approval_status')
  final int approvalStatus;
  @override
  @JsonKey(name: 'commission_rate')
  final double commissionRate;
  @override
  final double rating;
  @override
  @JsonKey(name: 'review_count')
  final int reviewCount;
  @override
  @JsonKey(name: 'product_count')
  final int productCount;
  @override
  @JsonKey(name: 'total_sales')
  final double totalSales;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'store_url')
  final String? storeUrl;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @override
  final String? description;
  @override
  @JsonKey(name: 'business_hours')
  final String? businessHours;
  final Map<String, String>? _socialLinks;
  @override
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks {
    final value = _socialLinks;
    if (value == null) return null;
    if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'verification_status')
  final String? verificationStatus;
  @override
  @JsonKey(name: 'featured')
  final bool featured;
  @override
  @JsonKey(name: 'premium')
  final bool premium;
  @override
  @JsonKey(name: 'location')
  final SellerLocation? location;
  @override
  @JsonKey(name: 'statistics')
  final SellerStatistics? statistics;

  @override
  String toString() {
    return 'Seller(sellerId: $sellerId, customerId: $customerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, status: $status, approvalStatus: $approvalStatus, commissionRate: $commissionRate, rating: $rating, reviewCount: $reviewCount, productCount: $productCount, totalSales: $totalSales, createdAt: $createdAt, updatedAt: $updatedAt, storeUrl: $storeUrl, profileImage: $profileImage, coverImage: $coverImage, description: $description, businessHours: $businessHours, socialLinks: $socialLinks, verificationStatus: $verificationStatus, featured: $featured, premium: $premium, location: $location, statistics: $statistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.businessLicense, businessLicense) ||
                other.businessLicense == businessLicense) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.subdomain, subdomain) ||
                other.subdomain == subdomain) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus) &&
            (identical(other.commissionRate, commissionRate) ||
                other.commissionRate == commissionRate) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.productCount, productCount) ||
                other.productCount == productCount) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.storeUrl, storeUrl) ||
                other.storeUrl == storeUrl) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.businessHours, businessHours) ||
                other.businessHours == businessHours) &&
            const DeepCollectionEquality()
                .equals(other._socialLinks, _socialLinks) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.premium, premium) || other.premium == premium) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        sellerId,
        customerId,
        companyName,
        businessLicense,
        taxId,
        phone,
        address,
        city,
        region,
        postcode,
        countryId,
        subdomain,
        status,
        approvalStatus,
        commissionRate,
        rating,
        reviewCount,
        productCount,
        totalSales,
        createdAt,
        updatedAt,
        storeUrl,
        profileImage,
        coverImage,
        description,
        businessHours,
        const DeepCollectionEquality().hash(_socialLinks),
        verificationStatus,
        featured,
        premium,
        location,
        statistics
      ]);

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerImplCopyWith<_$SellerImpl> get copyWith =>
      __$$SellerImplCopyWithImpl<_$SellerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerImplToJson(
      this,
    );
  }
}

abstract class _Seller implements Seller {
  const factory _Seller(
      {@JsonKey(name: 'seller_id') required final int sellerId,
      @JsonKey(name: 'customer_id') required final int customerId,
      @JsonKey(name: 'company_name') required final String companyName,
      @JsonKey(name: 'business_license') final String? businessLicense,
      @JsonKey(name: 'tax_id') final String? taxId,
      final String? phone,
      final String? address,
      final String? city,
      final String? region,
      final String? postcode,
      @JsonKey(name: 'country_id') final String? countryId,
      final String? subdomain,
      required final int status,
      @JsonKey(name: 'approval_status') required final int approvalStatus,
      @JsonKey(name: 'commission_rate') required final double commissionRate,
      required final double rating,
      @JsonKey(name: 'review_count') required final int reviewCount,
      @JsonKey(name: 'product_count') required final int productCount,
      @JsonKey(name: 'total_sales') required final double totalSales,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'store_url') final String? storeUrl,
      @JsonKey(name: 'profile_image') final String? profileImage,
      @JsonKey(name: 'cover_image') final String? coverImage,
      final String? description,
      @JsonKey(name: 'business_hours') final String? businessHours,
      @JsonKey(name: 'social_links') final Map<String, String>? socialLinks,
      @JsonKey(name: 'verification_status') final String? verificationStatus,
      @JsonKey(name: 'featured') final bool featured,
      @JsonKey(name: 'premium') final bool premium,
      @JsonKey(name: 'location') final SellerLocation? location,
      @JsonKey(name: 'statistics')
      final SellerStatistics? statistics}) = _$SellerImpl;

  factory _Seller.fromJson(Map<String, dynamic> json) = _$SellerImpl.fromJson;

  @override
  @JsonKey(name: 'seller_id')
  int get sellerId;
  @override
  @JsonKey(name: 'customer_id')
  int get customerId;
  @override
  @JsonKey(name: 'company_name')
  String get companyName;
  @override
  @JsonKey(name: 'business_license')
  String? get businessLicense;
  @override
  @JsonKey(name: 'tax_id')
  String? get taxId;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get region;
  @override
  String? get postcode;
  @override
  @JsonKey(name: 'country_id')
  String? get countryId;
  @override
  String? get subdomain;
  @override
  int get status;
  @override
  @JsonKey(name: 'approval_status')
  int get approvalStatus;
  @override
  @JsonKey(name: 'commission_rate')
  double get commissionRate;
  @override
  double get rating;
  @override
  @JsonKey(name: 'review_count')
  int get reviewCount;
  @override
  @JsonKey(name: 'product_count')
  int get productCount;
  @override
  @JsonKey(name: 'total_sales')
  double get totalSales;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'store_url')
  String? get storeUrl;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;
  @override
  String? get description;
  @override
  @JsonKey(name: 'business_hours')
  String? get businessHours;
  @override
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks;
  @override
  @JsonKey(name: 'verification_status')
  String? get verificationStatus;
  @override
  @JsonKey(name: 'featured')
  bool get featured;
  @override
  @JsonKey(name: 'premium')
  bool get premium;
  @override
  @JsonKey(name: 'location')
  SellerLocation? get location;
  @override
  @JsonKey(name: 'statistics')
  SellerStatistics? get statistics;

  /// Create a copy of Seller
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerImplCopyWith<_$SellerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SellerLocation _$SellerLocationFromJson(Map<String, dynamic> json) {
  return _SellerLocation.fromJson(json);
}

/// @nodoc
mixin _$SellerLocation {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;

  /// Serializes this SellerLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerLocationCopyWith<SellerLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerLocationCopyWith<$Res> {
  factory $SellerLocationCopyWith(
          SellerLocation value, $Res Function(SellerLocation) then) =
      _$SellerLocationCopyWithImpl<$Res, SellerLocation>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String? address,
      String? city,
      String? region,
      String? country,
      @JsonKey(name: 'postal_code') String? postalCode});
}

/// @nodoc
class _$SellerLocationCopyWithImpl<$Res, $Val extends SellerLocation>
    implements $SellerLocationCopyWith<$Res> {
  _$SellerLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerLocationImplCopyWith<$Res>
    implements $SellerLocationCopyWith<$Res> {
  factory _$$SellerLocationImplCopyWith(_$SellerLocationImpl value,
          $Res Function(_$SellerLocationImpl) then) =
      __$$SellerLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      String? address,
      String? city,
      String? region,
      String? country,
      @JsonKey(name: 'postal_code') String? postalCode});
}

/// @nodoc
class __$$SellerLocationImplCopyWithImpl<$Res>
    extends _$SellerLocationCopyWithImpl<$Res, _$SellerLocationImpl>
    implements _$$SellerLocationImplCopyWith<$Res> {
  __$$SellerLocationImplCopyWithImpl(
      _$SellerLocationImpl _value, $Res Function(_$SellerLocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellerLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_$SellerLocationImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerLocationImpl implements _SellerLocation {
  const _$SellerLocationImpl(
      {required this.latitude,
      required this.longitude,
      this.address,
      this.city,
      this.region,
      this.country,
      @JsonKey(name: 'postal_code') this.postalCode});

  factory _$SellerLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerLocationImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? country;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;

  @override
  String toString() {
    return 'SellerLocation(latitude: $latitude, longitude: $longitude, address: $address, city: $city, region: $region, country: $country, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, address,
      city, region, country, postalCode);

  /// Create a copy of SellerLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerLocationImplCopyWith<_$SellerLocationImpl> get copyWith =>
      __$$SellerLocationImplCopyWithImpl<_$SellerLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerLocationImplToJson(
      this,
    );
  }
}

abstract class _SellerLocation implements SellerLocation {
  const factory _SellerLocation(
          {required final double latitude,
          required final double longitude,
          final String? address,
          final String? city,
          final String? region,
          final String? country,
          @JsonKey(name: 'postal_code') final String? postalCode}) =
      _$SellerLocationImpl;

  factory _SellerLocation.fromJson(Map<String, dynamic> json) =
      _$SellerLocationImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get region;
  @override
  String? get country;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;

  /// Create a copy of SellerLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerLocationImplCopyWith<_$SellerLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SellerStatistics _$SellerStatisticsFromJson(Map<String, dynamic> json) {
  return _SellerStatistics.fromJson(json);
}

/// @nodoc
mixin _$SellerStatistics {
  @JsonKey(name: 'total_products')
  int get totalProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_products')
  int get approvedProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_products')
  int get pendingProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_products')
  int get newProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'used_products')
  int get usedProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'refurbished_products')
  int get refurbishedProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'for_parts_products')
  int get forPartsProducts => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_rating')
  double get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_reviews')
  int get totalReviews => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sales')
  double get totalSales => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_sales')
  double get monthlySales => throw _privateConstructorUsedError;
  @JsonKey(name: 'yearly_sales')
  double get yearlySales => throw _privateConstructorUsedError;
  @JsonKey(name: 'response_time')
  String? get responseTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_rate')
  double get completionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_rate')
  double get returnRate => throw _privateConstructorUsedError;

  /// Serializes this SellerStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerStatisticsCopyWith<SellerStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerStatisticsCopyWith<$Res> {
  factory $SellerStatisticsCopyWith(
          SellerStatistics value, $Res Function(SellerStatistics) then) =
      _$SellerStatisticsCopyWithImpl<$Res, SellerStatistics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_products') int totalProducts,
      @JsonKey(name: 'approved_products') int approvedProducts,
      @JsonKey(name: 'pending_products') int pendingProducts,
      @JsonKey(name: 'new_products') int newProducts,
      @JsonKey(name: 'used_products') int usedProducts,
      @JsonKey(name: 'refurbished_products') int refurbishedProducts,
      @JsonKey(name: 'for_parts_products') int forPartsProducts,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'total_reviews') int totalReviews,
      @JsonKey(name: 'total_sales') double totalSales,
      @JsonKey(name: 'monthly_sales') double monthlySales,
      @JsonKey(name: 'yearly_sales') double yearlySales,
      @JsonKey(name: 'response_time') String? responseTime,
      @JsonKey(name: 'completion_rate') double completionRate,
      @JsonKey(name: 'return_rate') double returnRate});
}

/// @nodoc
class _$SellerStatisticsCopyWithImpl<$Res, $Val extends SellerStatistics>
    implements $SellerStatisticsCopyWith<$Res> {
  _$SellerStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? approvedProducts = null,
    Object? pendingProducts = null,
    Object? newProducts = null,
    Object? usedProducts = null,
    Object? refurbishedProducts = null,
    Object? forPartsProducts = null,
    Object? averageRating = null,
    Object? totalReviews = null,
    Object? totalSales = null,
    Object? monthlySales = null,
    Object? yearlySales = null,
    Object? responseTime = freezed,
    Object? completionRate = null,
    Object? returnRate = null,
  }) {
    return _then(_value.copyWith(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      approvedProducts: null == approvedProducts
          ? _value.approvedProducts
          : approvedProducts // ignore: cast_nullable_to_non_nullable
              as int,
      pendingProducts: null == pendingProducts
          ? _value.pendingProducts
          : pendingProducts // ignore: cast_nullable_to_non_nullable
              as int,
      newProducts: null == newProducts
          ? _value.newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as int,
      usedProducts: null == usedProducts
          ? _value.usedProducts
          : usedProducts // ignore: cast_nullable_to_non_nullable
              as int,
      refurbishedProducts: null == refurbishedProducts
          ? _value.refurbishedProducts
          : refurbishedProducts // ignore: cast_nullable_to_non_nullable
              as int,
      forPartsProducts: null == forPartsProducts
          ? _value.forPartsProducts
          : forPartsProducts // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      monthlySales: null == monthlySales
          ? _value.monthlySales
          : monthlySales // ignore: cast_nullable_to_non_nullable
              as double,
      yearlySales: null == yearlySales
          ? _value.yearlySales
          : yearlySales // ignore: cast_nullable_to_non_nullable
              as double,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      returnRate: null == returnRate
          ? _value.returnRate
          : returnRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerStatisticsImplCopyWith<$Res>
    implements $SellerStatisticsCopyWith<$Res> {
  factory _$$SellerStatisticsImplCopyWith(_$SellerStatisticsImpl value,
          $Res Function(_$SellerStatisticsImpl) then) =
      __$$SellerStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_products') int totalProducts,
      @JsonKey(name: 'approved_products') int approvedProducts,
      @JsonKey(name: 'pending_products') int pendingProducts,
      @JsonKey(name: 'new_products') int newProducts,
      @JsonKey(name: 'used_products') int usedProducts,
      @JsonKey(name: 'refurbished_products') int refurbishedProducts,
      @JsonKey(name: 'for_parts_products') int forPartsProducts,
      @JsonKey(name: 'average_rating') double averageRating,
      @JsonKey(name: 'total_reviews') int totalReviews,
      @JsonKey(name: 'total_sales') double totalSales,
      @JsonKey(name: 'monthly_sales') double monthlySales,
      @JsonKey(name: 'yearly_sales') double yearlySales,
      @JsonKey(name: 'response_time') String? responseTime,
      @JsonKey(name: 'completion_rate') double completionRate,
      @JsonKey(name: 'return_rate') double returnRate});
}

/// @nodoc
class __$$SellerStatisticsImplCopyWithImpl<$Res>
    extends _$SellerStatisticsCopyWithImpl<$Res, _$SellerStatisticsImpl>
    implements _$$SellerStatisticsImplCopyWith<$Res> {
  __$$SellerStatisticsImplCopyWithImpl(_$SellerStatisticsImpl _value,
      $Res Function(_$SellerStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProducts = null,
    Object? approvedProducts = null,
    Object? pendingProducts = null,
    Object? newProducts = null,
    Object? usedProducts = null,
    Object? refurbishedProducts = null,
    Object? forPartsProducts = null,
    Object? averageRating = null,
    Object? totalReviews = null,
    Object? totalSales = null,
    Object? monthlySales = null,
    Object? yearlySales = null,
    Object? responseTime = freezed,
    Object? completionRate = null,
    Object? returnRate = null,
  }) {
    return _then(_$SellerStatisticsImpl(
      totalProducts: null == totalProducts
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      approvedProducts: null == approvedProducts
          ? _value.approvedProducts
          : approvedProducts // ignore: cast_nullable_to_non_nullable
              as int,
      pendingProducts: null == pendingProducts
          ? _value.pendingProducts
          : pendingProducts // ignore: cast_nullable_to_non_nullable
              as int,
      newProducts: null == newProducts
          ? _value.newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as int,
      usedProducts: null == usedProducts
          ? _value.usedProducts
          : usedProducts // ignore: cast_nullable_to_non_nullable
              as int,
      refurbishedProducts: null == refurbishedProducts
          ? _value.refurbishedProducts
          : refurbishedProducts // ignore: cast_nullable_to_non_nullable
              as int,
      forPartsProducts: null == forPartsProducts
          ? _value.forPartsProducts
          : forPartsProducts // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalReviews: null == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: null == totalSales
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as double,
      monthlySales: null == monthlySales
          ? _value.monthlySales
          : monthlySales // ignore: cast_nullable_to_non_nullable
              as double,
      yearlySales: null == yearlySales
          ? _value.yearlySales
          : yearlySales // ignore: cast_nullable_to_non_nullable
              as double,
      responseTime: freezed == responseTime
          ? _value.responseTime
          : responseTime // ignore: cast_nullable_to_non_nullable
              as String?,
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      returnRate: null == returnRate
          ? _value.returnRate
          : returnRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerStatisticsImpl implements _SellerStatistics {
  const _$SellerStatisticsImpl(
      {@JsonKey(name: 'total_products') required this.totalProducts,
      @JsonKey(name: 'approved_products') required this.approvedProducts,
      @JsonKey(name: 'pending_products') required this.pendingProducts,
      @JsonKey(name: 'new_products') required this.newProducts,
      @JsonKey(name: 'used_products') required this.usedProducts,
      @JsonKey(name: 'refurbished_products') required this.refurbishedProducts,
      @JsonKey(name: 'for_parts_products') required this.forPartsProducts,
      @JsonKey(name: 'average_rating') required this.averageRating,
      @JsonKey(name: 'total_reviews') required this.totalReviews,
      @JsonKey(name: 'total_sales') required this.totalSales,
      @JsonKey(name: 'monthly_sales') required this.monthlySales,
      @JsonKey(name: 'yearly_sales') required this.yearlySales,
      @JsonKey(name: 'response_time') this.responseTime,
      @JsonKey(name: 'completion_rate') required this.completionRate,
      @JsonKey(name: 'return_rate') required this.returnRate});

  factory _$SellerStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerStatisticsImplFromJson(json);

  @override
  @JsonKey(name: 'total_products')
  final int totalProducts;
  @override
  @JsonKey(name: 'approved_products')
  final int approvedProducts;
  @override
  @JsonKey(name: 'pending_products')
  final int pendingProducts;
  @override
  @JsonKey(name: 'new_products')
  final int newProducts;
  @override
  @JsonKey(name: 'used_products')
  final int usedProducts;
  @override
  @JsonKey(name: 'refurbished_products')
  final int refurbishedProducts;
  @override
  @JsonKey(name: 'for_parts_products')
  final int forPartsProducts;
  @override
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @override
  @JsonKey(name: 'total_reviews')
  final int totalReviews;
  @override
  @JsonKey(name: 'total_sales')
  final double totalSales;
  @override
  @JsonKey(name: 'monthly_sales')
  final double monthlySales;
  @override
  @JsonKey(name: 'yearly_sales')
  final double yearlySales;
  @override
  @JsonKey(name: 'response_time')
  final String? responseTime;
  @override
  @JsonKey(name: 'completion_rate')
  final double completionRate;
  @override
  @JsonKey(name: 'return_rate')
  final double returnRate;

  @override
  String toString() {
    return 'SellerStatistics(totalProducts: $totalProducts, approvedProducts: $approvedProducts, pendingProducts: $pendingProducts, newProducts: $newProducts, usedProducts: $usedProducts, refurbishedProducts: $refurbishedProducts, forPartsProducts: $forPartsProducts, averageRating: $averageRating, totalReviews: $totalReviews, totalSales: $totalSales, monthlySales: $monthlySales, yearlySales: $yearlySales, responseTime: $responseTime, completionRate: $completionRate, returnRate: $returnRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerStatisticsImpl &&
            (identical(other.totalProducts, totalProducts) ||
                other.totalProducts == totalProducts) &&
            (identical(other.approvedProducts, approvedProducts) ||
                other.approvedProducts == approvedProducts) &&
            (identical(other.pendingProducts, pendingProducts) ||
                other.pendingProducts == pendingProducts) &&
            (identical(other.newProducts, newProducts) ||
                other.newProducts == newProducts) &&
            (identical(other.usedProducts, usedProducts) ||
                other.usedProducts == usedProducts) &&
            (identical(other.refurbishedProducts, refurbishedProducts) ||
                other.refurbishedProducts == refurbishedProducts) &&
            (identical(other.forPartsProducts, forPartsProducts) ||
                other.forPartsProducts == forPartsProducts) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            (identical(other.totalSales, totalSales) ||
                other.totalSales == totalSales) &&
            (identical(other.monthlySales, monthlySales) ||
                other.monthlySales == monthlySales) &&
            (identical(other.yearlySales, yearlySales) ||
                other.yearlySales == yearlySales) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.returnRate, returnRate) ||
                other.returnRate == returnRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalProducts,
      approvedProducts,
      pendingProducts,
      newProducts,
      usedProducts,
      refurbishedProducts,
      forPartsProducts,
      averageRating,
      totalReviews,
      totalSales,
      monthlySales,
      yearlySales,
      responseTime,
      completionRate,
      returnRate);

  /// Create a copy of SellerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerStatisticsImplCopyWith<_$SellerStatisticsImpl> get copyWith =>
      __$$SellerStatisticsImplCopyWithImpl<_$SellerStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerStatisticsImplToJson(
      this,
    );
  }
}

abstract class _SellerStatistics implements SellerStatistics {
  const factory _SellerStatistics(
      {@JsonKey(name: 'total_products') required final int totalProducts,
      @JsonKey(name: 'approved_products') required final int approvedProducts,
      @JsonKey(name: 'pending_products') required final int pendingProducts,
      @JsonKey(name: 'new_products') required final int newProducts,
      @JsonKey(name: 'used_products') required final int usedProducts,
      @JsonKey(name: 'refurbished_products')
      required final int refurbishedProducts,
      @JsonKey(name: 'for_parts_products') required final int forPartsProducts,
      @JsonKey(name: 'average_rating') required final double averageRating,
      @JsonKey(name: 'total_reviews') required final int totalReviews,
      @JsonKey(name: 'total_sales') required final double totalSales,
      @JsonKey(name: 'monthly_sales') required final double monthlySales,
      @JsonKey(name: 'yearly_sales') required final double yearlySales,
      @JsonKey(name: 'response_time') final String? responseTime,
      @JsonKey(name: 'completion_rate') required final double completionRate,
      @JsonKey(name: 'return_rate')
      required final double returnRate}) = _$SellerStatisticsImpl;

  factory _SellerStatistics.fromJson(Map<String, dynamic> json) =
      _$SellerStatisticsImpl.fromJson;

  @override
  @JsonKey(name: 'total_products')
  int get totalProducts;
  @override
  @JsonKey(name: 'approved_products')
  int get approvedProducts;
  @override
  @JsonKey(name: 'pending_products')
  int get pendingProducts;
  @override
  @JsonKey(name: 'new_products')
  int get newProducts;
  @override
  @JsonKey(name: 'used_products')
  int get usedProducts;
  @override
  @JsonKey(name: 'refurbished_products')
  int get refurbishedProducts;
  @override
  @JsonKey(name: 'for_parts_products')
  int get forPartsProducts;
  @override
  @JsonKey(name: 'average_rating')
  double get averageRating;
  @override
  @JsonKey(name: 'total_reviews')
  int get totalReviews;
  @override
  @JsonKey(name: 'total_sales')
  double get totalSales;
  @override
  @JsonKey(name: 'monthly_sales')
  double get monthlySales;
  @override
  @JsonKey(name: 'yearly_sales')
  double get yearlySales;
  @override
  @JsonKey(name: 'response_time')
  String? get responseTime;
  @override
  @JsonKey(name: 'completion_rate')
  double get completionRate;
  @override
  @JsonKey(name: 'return_rate')
  double get returnRate;

  /// Create a copy of SellerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerStatisticsImplCopyWith<_$SellerStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SellerRegistrationRequest _$SellerRegistrationRequestFromJson(
    Map<String, dynamic> json) {
  return _SellerRegistrationRequest.fromJson(json);
}

/// @nodoc
mixin _$SellerRegistrationRequest {
  @JsonKey(name: 'customer_id')
  int get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_license')
  String? get businessLicense => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_id')
  String? get taxId => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  String? get countryId => throw _privateConstructorUsedError;
  String? get subdomain => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_hours')
  String? get businessHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks => throw _privateConstructorUsedError;

  /// Serializes this SellerRegistrationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerRegistrationRequestCopyWith<SellerRegistrationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerRegistrationRequestCopyWith<$Res> {
  factory $SellerRegistrationRequestCopyWith(SellerRegistrationRequest value,
          $Res Function(SellerRegistrationRequest) then) =
      _$SellerRegistrationRequestCopyWithImpl<$Res, SellerRegistrationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'company_name') String companyName,
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
      @JsonKey(name: 'social_links') Map<String, String>? socialLinks});
}

/// @nodoc
class _$SellerRegistrationRequestCopyWithImpl<$Res,
        $Val extends SellerRegistrationRequest>
    implements $SellerRegistrationRequestCopyWith<$Res> {
  _$SellerRegistrationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? companyName = null,
    Object? businessLicense = freezed,
    Object? taxId = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? subdomain = freezed,
    Object? description = freezed,
    Object? businessHours = freezed,
    Object? socialLinks = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLicense: freezed == businessLicense
          ? _value.businessLicense
          : businessLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subdomain: freezed == subdomain
          ? _value.subdomain
          : subdomain // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      businessHours: freezed == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String?,
      socialLinks: freezed == socialLinks
          ? _value.socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerRegistrationRequestImplCopyWith<$Res>
    implements $SellerRegistrationRequestCopyWith<$Res> {
  factory _$$SellerRegistrationRequestImplCopyWith(
          _$SellerRegistrationRequestImpl value,
          $Res Function(_$SellerRegistrationRequestImpl) then) =
      __$$SellerRegistrationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customer_id') int customerId,
      @JsonKey(name: 'company_name') String companyName,
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
      @JsonKey(name: 'social_links') Map<String, String>? socialLinks});
}

/// @nodoc
class __$$SellerRegistrationRequestImplCopyWithImpl<$Res>
    extends _$SellerRegistrationRequestCopyWithImpl<$Res,
        _$SellerRegistrationRequestImpl>
    implements _$$SellerRegistrationRequestImplCopyWith<$Res> {
  __$$SellerRegistrationRequestImplCopyWithImpl(
      _$SellerRegistrationRequestImpl _value,
      $Res Function(_$SellerRegistrationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellerRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? companyName = null,
    Object? businessLicense = freezed,
    Object? taxId = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? subdomain = freezed,
    Object? description = freezed,
    Object? businessHours = freezed,
    Object? socialLinks = freezed,
  }) {
    return _then(_$SellerRegistrationRequestImpl(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      businessLicense: freezed == businessLicense
          ? _value.businessLicense
          : businessLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subdomain: freezed == subdomain
          ? _value.subdomain
          : subdomain // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      businessHours: freezed == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String?,
      socialLinks: freezed == socialLinks
          ? _value._socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerRegistrationRequestImpl implements _SellerRegistrationRequest {
  const _$SellerRegistrationRequestImpl(
      {@JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'company_name') required this.companyName,
      @JsonKey(name: 'business_license') this.businessLicense,
      @JsonKey(name: 'tax_id') this.taxId,
      this.phone,
      this.address,
      this.city,
      this.region,
      this.postcode,
      @JsonKey(name: 'country_id') this.countryId,
      this.subdomain,
      this.description,
      @JsonKey(name: 'business_hours') this.businessHours,
      @JsonKey(name: 'social_links') final Map<String, String>? socialLinks})
      : _socialLinks = socialLinks;

  factory _$SellerRegistrationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerRegistrationRequestImplFromJson(json);

  @override
  @JsonKey(name: 'customer_id')
  final int customerId;
  @override
  @JsonKey(name: 'company_name')
  final String companyName;
  @override
  @JsonKey(name: 'business_license')
  final String? businessLicense;
  @override
  @JsonKey(name: 'tax_id')
  final String? taxId;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? postcode;
  @override
  @JsonKey(name: 'country_id')
  final String? countryId;
  @override
  final String? subdomain;
  @override
  final String? description;
  @override
  @JsonKey(name: 'business_hours')
  final String? businessHours;
  final Map<String, String>? _socialLinks;
  @override
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks {
    final value = _socialLinks;
    if (value == null) return null;
    if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SellerRegistrationRequest(customerId: $customerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, description: $description, businessHours: $businessHours, socialLinks: $socialLinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerRegistrationRequestImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.businessLicense, businessLicense) ||
                other.businessLicense == businessLicense) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.subdomain, subdomain) ||
                other.subdomain == subdomain) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.businessHours, businessHours) ||
                other.businessHours == businessHours) &&
            const DeepCollectionEquality()
                .equals(other._socialLinks, _socialLinks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      companyName,
      businessLicense,
      taxId,
      phone,
      address,
      city,
      region,
      postcode,
      countryId,
      subdomain,
      description,
      businessHours,
      const DeepCollectionEquality().hash(_socialLinks));

  /// Create a copy of SellerRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerRegistrationRequestImplCopyWith<_$SellerRegistrationRequestImpl>
      get copyWith => __$$SellerRegistrationRequestImplCopyWithImpl<
          _$SellerRegistrationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerRegistrationRequestImplToJson(
      this,
    );
  }
}

abstract class _SellerRegistrationRequest implements SellerRegistrationRequest {
  const factory _SellerRegistrationRequest(
          {@JsonKey(name: 'customer_id') required final int customerId,
          @JsonKey(name: 'company_name') required final String companyName,
          @JsonKey(name: 'business_license') final String? businessLicense,
          @JsonKey(name: 'tax_id') final String? taxId,
          final String? phone,
          final String? address,
          final String? city,
          final String? region,
          final String? postcode,
          @JsonKey(name: 'country_id') final String? countryId,
          final String? subdomain,
          final String? description,
          @JsonKey(name: 'business_hours') final String? businessHours,
          @JsonKey(name: 'social_links')
          final Map<String, String>? socialLinks}) =
      _$SellerRegistrationRequestImpl;

  factory _SellerRegistrationRequest.fromJson(Map<String, dynamic> json) =
      _$SellerRegistrationRequestImpl.fromJson;

  @override
  @JsonKey(name: 'customer_id')
  int get customerId;
  @override
  @JsonKey(name: 'company_name')
  String get companyName;
  @override
  @JsonKey(name: 'business_license')
  String? get businessLicense;
  @override
  @JsonKey(name: 'tax_id')
  String? get taxId;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get region;
  @override
  String? get postcode;
  @override
  @JsonKey(name: 'country_id')
  String? get countryId;
  @override
  String? get subdomain;
  @override
  String? get description;
  @override
  @JsonKey(name: 'business_hours')
  String? get businessHours;
  @override
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks;

  /// Create a copy of SellerRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerRegistrationRequestImplCopyWith<_$SellerRegistrationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SellerUpdateRequest _$SellerUpdateRequestFromJson(Map<String, dynamic> json) {
  return _SellerUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$SellerUpdateRequest {
  @JsonKey(name: 'seller_id')
  int get sellerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_license')
  String? get businessLicense => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_id')
  String? get taxId => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_id')
  String? get countryId => throw _privateConstructorUsedError;
  String? get subdomain => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'business_hours')
  String? get businessHours => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_image')
  String? get coverImage => throw _privateConstructorUsedError;

  /// Serializes this SellerUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerUpdateRequestCopyWith<SellerUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerUpdateRequestCopyWith<$Res> {
  factory $SellerUpdateRequestCopyWith(
          SellerUpdateRequest value, $Res Function(SellerUpdateRequest) then) =
      _$SellerUpdateRequestCopyWithImpl<$Res, SellerUpdateRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'seller_id') int sellerId,
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
      @JsonKey(name: 'cover_image') String? coverImage});
}

/// @nodoc
class _$SellerUpdateRequestCopyWithImpl<$Res, $Val extends SellerUpdateRequest>
    implements $SellerUpdateRequestCopyWith<$Res> {
  _$SellerUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? companyName = freezed,
    Object? businessLicense = freezed,
    Object? taxId = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? subdomain = freezed,
    Object? description = freezed,
    Object? businessHours = freezed,
    Object? socialLinks = freezed,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
  }) {
    return _then(_value.copyWith(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLicense: freezed == businessLicense
          ? _value.businessLicense
          : businessLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subdomain: freezed == subdomain
          ? _value.subdomain
          : subdomain // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      businessHours: freezed == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String?,
      socialLinks: freezed == socialLinks
          ? _value.socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerUpdateRequestImplCopyWith<$Res>
    implements $SellerUpdateRequestCopyWith<$Res> {
  factory _$$SellerUpdateRequestImplCopyWith(_$SellerUpdateRequestImpl value,
          $Res Function(_$SellerUpdateRequestImpl) then) =
      __$$SellerUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'seller_id') int sellerId,
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
      @JsonKey(name: 'cover_image') String? coverImage});
}

/// @nodoc
class __$$SellerUpdateRequestImplCopyWithImpl<$Res>
    extends _$SellerUpdateRequestCopyWithImpl<$Res, _$SellerUpdateRequestImpl>
    implements _$$SellerUpdateRequestImplCopyWith<$Res> {
  __$$SellerUpdateRequestImplCopyWithImpl(_$SellerUpdateRequestImpl _value,
      $Res Function(_$SellerUpdateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = null,
    Object? companyName = freezed,
    Object? businessLicense = freezed,
    Object? taxId = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? subdomain = freezed,
    Object? description = freezed,
    Object? businessHours = freezed,
    Object? socialLinks = freezed,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
  }) {
    return _then(_$SellerUpdateRequestImpl(
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessLicense: freezed == businessLicense
          ? _value.businessLicense
          : businessLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      taxId: freezed == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: freezed == countryId
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subdomain: freezed == subdomain
          ? _value.subdomain
          : subdomain // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      businessHours: freezed == businessHours
          ? _value.businessHours
          : businessHours // ignore: cast_nullable_to_non_nullable
              as String?,
      socialLinks: freezed == socialLinks
          ? _value._socialLinks
          : socialLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerUpdateRequestImpl implements _SellerUpdateRequest {
  const _$SellerUpdateRequestImpl(
      {@JsonKey(name: 'seller_id') required this.sellerId,
      @JsonKey(name: 'company_name') this.companyName,
      @JsonKey(name: 'business_license') this.businessLicense,
      @JsonKey(name: 'tax_id') this.taxId,
      this.phone,
      this.address,
      this.city,
      this.region,
      this.postcode,
      @JsonKey(name: 'country_id') this.countryId,
      this.subdomain,
      this.description,
      @JsonKey(name: 'business_hours') this.businessHours,
      @JsonKey(name: 'social_links') final Map<String, String>? socialLinks,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'cover_image') this.coverImage})
      : _socialLinks = socialLinks;

  factory _$SellerUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerUpdateRequestImplFromJson(json);

  @override
  @JsonKey(name: 'seller_id')
  final int sellerId;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  @JsonKey(name: 'business_license')
  final String? businessLicense;
  @override
  @JsonKey(name: 'tax_id')
  final String? taxId;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? postcode;
  @override
  @JsonKey(name: 'country_id')
  final String? countryId;
  @override
  final String? subdomain;
  @override
  final String? description;
  @override
  @JsonKey(name: 'business_hours')
  final String? businessHours;
  final Map<String, String>? _socialLinks;
  @override
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks {
    final value = _socialLinks;
    if (value == null) return null;
    if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'cover_image')
  final String? coverImage;

  @override
  String toString() {
    return 'SellerUpdateRequest(sellerId: $sellerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, description: $description, businessHours: $businessHours, socialLinks: $socialLinks, profileImage: $profileImage, coverImage: $coverImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerUpdateRequestImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.businessLicense, businessLicense) ||
                other.businessLicense == businessLicense) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.subdomain, subdomain) ||
                other.subdomain == subdomain) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.businessHours, businessHours) ||
                other.businessHours == businessHours) &&
            const DeepCollectionEquality()
                .equals(other._socialLinks, _socialLinks) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sellerId,
      companyName,
      businessLicense,
      taxId,
      phone,
      address,
      city,
      region,
      postcode,
      countryId,
      subdomain,
      description,
      businessHours,
      const DeepCollectionEquality().hash(_socialLinks),
      profileImage,
      coverImage);

  /// Create a copy of SellerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerUpdateRequestImplCopyWith<_$SellerUpdateRequestImpl> get copyWith =>
      __$$SellerUpdateRequestImplCopyWithImpl<_$SellerUpdateRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _SellerUpdateRequest implements SellerUpdateRequest {
  const factory _SellerUpdateRequest(
          {@JsonKey(name: 'seller_id') required final int sellerId,
          @JsonKey(name: 'company_name') final String? companyName,
          @JsonKey(name: 'business_license') final String? businessLicense,
          @JsonKey(name: 'tax_id') final String? taxId,
          final String? phone,
          final String? address,
          final String? city,
          final String? region,
          final String? postcode,
          @JsonKey(name: 'country_id') final String? countryId,
          final String? subdomain,
          final String? description,
          @JsonKey(name: 'business_hours') final String? businessHours,
          @JsonKey(name: 'social_links') final Map<String, String>? socialLinks,
          @JsonKey(name: 'profile_image') final String? profileImage,
          @JsonKey(name: 'cover_image') final String? coverImage}) =
      _$SellerUpdateRequestImpl;

  factory _SellerUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$SellerUpdateRequestImpl.fromJson;

  @override
  @JsonKey(name: 'seller_id')
  int get sellerId;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  @JsonKey(name: 'business_license')
  String? get businessLicense;
  @override
  @JsonKey(name: 'tax_id')
  String? get taxId;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get region;
  @override
  String? get postcode;
  @override
  @JsonKey(name: 'country_id')
  String? get countryId;
  @override
  String? get subdomain;
  @override
  String? get description;
  @override
  @JsonKey(name: 'business_hours')
  String? get businessHours;
  @override
  @JsonKey(name: 'social_links')
  Map<String, String>? get socialLinks;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @JsonKey(name: 'cover_image')
  String? get coverImage;

  /// Create a copy of SellerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerUpdateRequestImplCopyWith<_$SellerUpdateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SellerSearchFilters _$SellerSearchFiltersFromJson(Map<String, dynamic> json) {
  return _SellerSearchFilters.fromJson(json);
}

/// @nodoc
mixin _$SellerSearchFilters {
  String? get search => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'approval_status')
  int? get approvalStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_min')
  double? get ratingMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_max')
  double? get ratingMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_from')
  DateTime? get createdFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_to')
  DateTime? get createdTo => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured')
  bool? get featured => throw _privateConstructorUsedError;
  @JsonKey(name: 'premium')
  bool? get premium => throw _privateConstructorUsedError;
  @JsonKey(name: 'verification_status')
  String? get verificationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_by')
  SellerSortBy? get sortBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_direction')
  SortDirection? get sortDirection => throw _privateConstructorUsedError;

  /// Serializes this SellerSearchFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SellerSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerSearchFiltersCopyWith<SellerSearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerSearchFiltersCopyWith<$Res> {
  factory $SellerSearchFiltersCopyWith(
          SellerSearchFilters value, $Res Function(SellerSearchFilters) then) =
      _$SellerSearchFiltersCopyWithImpl<$Res, SellerSearchFilters>;
  @useResult
  $Res call(
      {String? search,
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
      @JsonKey(name: 'sort_direction') SortDirection? sortDirection});
}

/// @nodoc
class _$SellerSearchFiltersCopyWithImpl<$Res, $Val extends SellerSearchFilters>
    implements $SellerSearchFiltersCopyWith<$Res> {
  _$SellerSearchFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? status = freezed,
    Object? approvalStatus = freezed,
    Object? ratingMin = freezed,
    Object? ratingMax = freezed,
    Object? createdFrom = freezed,
    Object? createdTo = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? country = freezed,
    Object? featured = freezed,
    Object? premium = freezed,
    Object? verificationStatus = freezed,
    Object? sortBy = freezed,
    Object? sortDirection = freezed,
  }) {
    return _then(_value.copyWith(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      approvalStatus: freezed == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingMin: freezed == ratingMin
          ? _value.ratingMin
          : ratingMin // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingMax: freezed == ratingMax
          ? _value.ratingMax
          : ratingMax // ignore: cast_nullable_to_non_nullable
              as double?,
      createdFrom: freezed == createdFrom
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdTo: freezed == createdTo
          ? _value.createdTo
          : createdTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      premium: freezed == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SellerSortBy?,
      sortDirection: freezed == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as SortDirection?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellerSearchFiltersImplCopyWith<$Res>
    implements $SellerSearchFiltersCopyWith<$Res> {
  factory _$$SellerSearchFiltersImplCopyWith(_$SellerSearchFiltersImpl value,
          $Res Function(_$SellerSearchFiltersImpl) then) =
      __$$SellerSearchFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? search,
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
      @JsonKey(name: 'sort_direction') SortDirection? sortDirection});
}

/// @nodoc
class __$$SellerSearchFiltersImplCopyWithImpl<$Res>
    extends _$SellerSearchFiltersCopyWithImpl<$Res, _$SellerSearchFiltersImpl>
    implements _$$SellerSearchFiltersImplCopyWith<$Res> {
  __$$SellerSearchFiltersImplCopyWithImpl(_$SellerSearchFiltersImpl _value,
      $Res Function(_$SellerSearchFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of SellerSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
    Object? status = freezed,
    Object? approvalStatus = freezed,
    Object? ratingMin = freezed,
    Object? ratingMax = freezed,
    Object? createdFrom = freezed,
    Object? createdTo = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? country = freezed,
    Object? featured = freezed,
    Object? premium = freezed,
    Object? verificationStatus = freezed,
    Object? sortBy = freezed,
    Object? sortDirection = freezed,
  }) {
    return _then(_$SellerSearchFiltersImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      approvalStatus: freezed == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingMin: freezed == ratingMin
          ? _value.ratingMin
          : ratingMin // ignore: cast_nullable_to_non_nullable
              as double?,
      ratingMax: freezed == ratingMax
          ? _value.ratingMax
          : ratingMax // ignore: cast_nullable_to_non_nullable
              as double?,
      createdFrom: freezed == createdFrom
          ? _value.createdFrom
          : createdFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdTo: freezed == createdTo
          ? _value.createdTo
          : createdTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      premium: freezed == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool?,
      verificationStatus: freezed == verificationStatus
          ? _value.verificationStatus
          : verificationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SellerSortBy?,
      sortDirection: freezed == sortDirection
          ? _value.sortDirection
          : sortDirection // ignore: cast_nullable_to_non_nullable
              as SortDirection?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellerSearchFiltersImpl implements _SellerSearchFilters {
  const _$SellerSearchFiltersImpl(
      {this.search,
      this.status,
      @JsonKey(name: 'approval_status') this.approvalStatus,
      @JsonKey(name: 'rating_min') this.ratingMin,
      @JsonKey(name: 'rating_max') this.ratingMax,
      @JsonKey(name: 'created_from') this.createdFrom,
      @JsonKey(name: 'created_to') this.createdTo,
      this.city,
      this.region,
      this.country,
      @JsonKey(name: 'featured') this.featured,
      @JsonKey(name: 'premium') this.premium,
      @JsonKey(name: 'verification_status') this.verificationStatus,
      @JsonKey(name: 'sort_by') this.sortBy,
      @JsonKey(name: 'sort_direction') this.sortDirection});

  factory _$SellerSearchFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellerSearchFiltersImplFromJson(json);

  @override
  final String? search;
  @override
  final int? status;
  @override
  @JsonKey(name: 'approval_status')
  final int? approvalStatus;
  @override
  @JsonKey(name: 'rating_min')
  final double? ratingMin;
  @override
  @JsonKey(name: 'rating_max')
  final double? ratingMax;
  @override
  @JsonKey(name: 'created_from')
  final DateTime? createdFrom;
  @override
  @JsonKey(name: 'created_to')
  final DateTime? createdTo;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? country;
  @override
  @JsonKey(name: 'featured')
  final bool? featured;
  @override
  @JsonKey(name: 'premium')
  final bool? premium;
  @override
  @JsonKey(name: 'verification_status')
  final String? verificationStatus;
  @override
  @JsonKey(name: 'sort_by')
  final SellerSortBy? sortBy;
  @override
  @JsonKey(name: 'sort_direction')
  final SortDirection? sortDirection;

  @override
  String toString() {
    return 'SellerSearchFilters(search: $search, status: $status, approvalStatus: $approvalStatus, ratingMin: $ratingMin, ratingMax: $ratingMax, createdFrom: $createdFrom, createdTo: $createdTo, city: $city, region: $region, country: $country, featured: $featured, premium: $premium, verificationStatus: $verificationStatus, sortBy: $sortBy, sortDirection: $sortDirection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerSearchFiltersImpl &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus) &&
            (identical(other.ratingMin, ratingMin) ||
                other.ratingMin == ratingMin) &&
            (identical(other.ratingMax, ratingMax) ||
                other.ratingMax == ratingMax) &&
            (identical(other.createdFrom, createdFrom) ||
                other.createdFrom == createdFrom) &&
            (identical(other.createdTo, createdTo) ||
                other.createdTo == createdTo) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.premium, premium) || other.premium == premium) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      search,
      status,
      approvalStatus,
      ratingMin,
      ratingMax,
      createdFrom,
      createdTo,
      city,
      region,
      country,
      featured,
      premium,
      verificationStatus,
      sortBy,
      sortDirection);

  /// Create a copy of SellerSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerSearchFiltersImplCopyWith<_$SellerSearchFiltersImpl> get copyWith =>
      __$$SellerSearchFiltersImplCopyWithImpl<_$SellerSearchFiltersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellerSearchFiltersImplToJson(
      this,
    );
  }
}

abstract class _SellerSearchFilters implements SellerSearchFilters {
  const factory _SellerSearchFilters(
      {final String? search,
      final int? status,
      @JsonKey(name: 'approval_status') final int? approvalStatus,
      @JsonKey(name: 'rating_min') final double? ratingMin,
      @JsonKey(name: 'rating_max') final double? ratingMax,
      @JsonKey(name: 'created_from') final DateTime? createdFrom,
      @JsonKey(name: 'created_to') final DateTime? createdTo,
      final String? city,
      final String? region,
      final String? country,
      @JsonKey(name: 'featured') final bool? featured,
      @JsonKey(name: 'premium') final bool? premium,
      @JsonKey(name: 'verification_status') final String? verificationStatus,
      @JsonKey(name: 'sort_by') final SellerSortBy? sortBy,
      @JsonKey(name: 'sort_direction')
      final SortDirection? sortDirection}) = _$SellerSearchFiltersImpl;

  factory _SellerSearchFilters.fromJson(Map<String, dynamic> json) =
      _$SellerSearchFiltersImpl.fromJson;

  @override
  String? get search;
  @override
  int? get status;
  @override
  @JsonKey(name: 'approval_status')
  int? get approvalStatus;
  @override
  @JsonKey(name: 'rating_min')
  double? get ratingMin;
  @override
  @JsonKey(name: 'rating_max')
  double? get ratingMax;
  @override
  @JsonKey(name: 'created_from')
  DateTime? get createdFrom;
  @override
  @JsonKey(name: 'created_to')
  DateTime? get createdTo;
  @override
  String? get city;
  @override
  String? get region;
  @override
  String? get country;
  @override
  @JsonKey(name: 'featured')
  bool? get featured;
  @override
  @JsonKey(name: 'premium')
  bool? get premium;
  @override
  @JsonKey(name: 'verification_status')
  String? get verificationStatus;
  @override
  @JsonKey(name: 'sort_by')
  SellerSortBy? get sortBy;
  @override
  @JsonKey(name: 'sort_direction')
  SortDirection? get sortDirection;

  /// Create a copy of SellerSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerSearchFiltersImplCopyWith<_$SellerSearchFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
