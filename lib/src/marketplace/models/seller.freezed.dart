// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Seller {

@JsonKey(name: 'seller_id') int get sellerId;@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'company_name') String get companyName;@JsonKey(name: 'business_license') String? get businessLicense;@JsonKey(name: 'tax_id') String? get taxId; String? get phone; String? get address; String? get city; String? get region; String? get postcode;@JsonKey(name: 'country_id') String? get countryId; String? get subdomain; int get status;@JsonKey(name: 'approval_status') int get approvalStatus;@JsonKey(name: 'commission_rate') double get commissionRate; double get rating;@JsonKey(name: 'review_count') int get reviewCount;@JsonKey(name: 'product_count') int get productCount;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'store_url') String? get storeUrl;@JsonKey(name: 'profile_image') String? get profileImage;@JsonKey(name: 'cover_image') String? get coverImage; String? get description;@JsonKey(name: 'business_hours') String? get businessHours;@JsonKey(name: 'social_links') Map<String, String>? get socialLinks;@JsonKey(name: 'verification_status') String? get verificationStatus;@JsonKey(name: 'featured') bool get featured;@JsonKey(name: 'premium') bool get premium;@JsonKey(name: 'location') SellerLocation? get location;@JsonKey(name: 'statistics') SellerStatistics? get statistics;
/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerCopyWith<Seller> get copyWith => _$SellerCopyWithImpl<Seller>(this as Seller, _$identity);

  /// Serializes this Seller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seller&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.taxId, taxId) || other.taxId == taxId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.subdomain, subdomain) || other.subdomain == subdomain)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&const DeepCollectionEquality().equals(other.socialLinks, socialLinks)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.location, location) || other.location == location)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,sellerId,customerId,companyName,businessLicense,taxId,phone,address,city,region,postcode,countryId,subdomain,status,approvalStatus,commissionRate,rating,reviewCount,productCount,totalSales,createdAt,updatedAt,storeUrl,profileImage,coverImage,description,businessHours,const DeepCollectionEquality().hash(socialLinks),verificationStatus,featured,premium,location,statistics]);

@override
String toString() {
  return 'Seller(sellerId: $sellerId, customerId: $customerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, status: $status, approvalStatus: $approvalStatus, commissionRate: $commissionRate, rating: $rating, reviewCount: $reviewCount, productCount: $productCount, totalSales: $totalSales, createdAt: $createdAt, updatedAt: $updatedAt, storeUrl: $storeUrl, profileImage: $profileImage, coverImage: $coverImage, description: $description, businessHours: $businessHours, socialLinks: $socialLinks, verificationStatus: $verificationStatus, featured: $featured, premium: $premium, location: $location, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class $SellerCopyWith<$Res>  {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) _then) = _$SellerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'seller_id') int sellerId,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'business_license') String? businessLicense,@JsonKey(name: 'tax_id') String? taxId, String? phone, String? address, String? city, String? region, String? postcode,@JsonKey(name: 'country_id') String? countryId, String? subdomain, int status,@JsonKey(name: 'approval_status') int approvalStatus,@JsonKey(name: 'commission_rate') double commissionRate, double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'product_count') int productCount,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'store_url') String? storeUrl,@JsonKey(name: 'profile_image') String? profileImage,@JsonKey(name: 'cover_image') String? coverImage, String? description,@JsonKey(name: 'business_hours') String? businessHours,@JsonKey(name: 'social_links') Map<String, String>? socialLinks,@JsonKey(name: 'verification_status') String? verificationStatus,@JsonKey(name: 'featured') bool featured,@JsonKey(name: 'premium') bool premium,@JsonKey(name: 'location') SellerLocation? location,@JsonKey(name: 'statistics') SellerStatistics? statistics
});


$SellerLocationCopyWith<$Res>? get location;$SellerStatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class _$SellerCopyWithImpl<$Res>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._self, this._then);

  final Seller _self;
  final $Res Function(Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,Object? customerId = null,Object? companyName = null,Object? businessLicense = freezed,Object? taxId = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? subdomain = freezed,Object? status = null,Object? approvalStatus = null,Object? commissionRate = null,Object? rating = null,Object? reviewCount = null,Object? productCount = null,Object? totalSales = null,Object? createdAt = null,Object? updatedAt = null,Object? storeUrl = freezed,Object? profileImage = freezed,Object? coverImage = freezed,Object? description = freezed,Object? businessHours = freezed,Object? socialLinks = freezed,Object? verificationStatus = freezed,Object? featured = null,Object? premium = null,Object? location = freezed,Object? statistics = freezed,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,subdomain: freezed == subdomain ? _self.subdomain : subdomain // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as int,commissionRate: null == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self.socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SellerLocation?,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as SellerStatistics?,
  ));
}
/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $SellerLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerStatisticsCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $SellerStatisticsCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [Seller].
extension SellerPatterns on Seller {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seller value)  $default,){
final _that = this;
switch (_that) {
case _Seller():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seller value)?  $default,){
final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'seller_id')  int sellerId, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  int status, @JsonKey(name: 'approval_status')  int approvalStatus, @JsonKey(name: 'commission_rate')  double commissionRate,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'product_count')  int productCount, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'store_url')  String? storeUrl, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'cover_image')  String? coverImage,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks, @JsonKey(name: 'verification_status')  String? verificationStatus, @JsonKey(name: 'featured')  bool featured, @JsonKey(name: 'premium')  bool premium, @JsonKey(name: 'location')  SellerLocation? location, @JsonKey(name: 'statistics')  SellerStatistics? statistics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.sellerId,_that.customerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.status,_that.approvalStatus,_that.commissionRate,_that.rating,_that.reviewCount,_that.productCount,_that.totalSales,_that.createdAt,_that.updatedAt,_that.storeUrl,_that.profileImage,_that.coverImage,_that.description,_that.businessHours,_that.socialLinks,_that.verificationStatus,_that.featured,_that.premium,_that.location,_that.statistics);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'seller_id')  int sellerId, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  int status, @JsonKey(name: 'approval_status')  int approvalStatus, @JsonKey(name: 'commission_rate')  double commissionRate,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'product_count')  int productCount, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'store_url')  String? storeUrl, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'cover_image')  String? coverImage,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks, @JsonKey(name: 'verification_status')  String? verificationStatus, @JsonKey(name: 'featured')  bool featured, @JsonKey(name: 'premium')  bool premium, @JsonKey(name: 'location')  SellerLocation? location, @JsonKey(name: 'statistics')  SellerStatistics? statistics)  $default,) {final _that = this;
switch (_that) {
case _Seller():
return $default(_that.sellerId,_that.customerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.status,_that.approvalStatus,_that.commissionRate,_that.rating,_that.reviewCount,_that.productCount,_that.totalSales,_that.createdAt,_that.updatedAt,_that.storeUrl,_that.profileImage,_that.coverImage,_that.description,_that.businessHours,_that.socialLinks,_that.verificationStatus,_that.featured,_that.premium,_that.location,_that.statistics);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'seller_id')  int sellerId, @JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  int status, @JsonKey(name: 'approval_status')  int approvalStatus, @JsonKey(name: 'commission_rate')  double commissionRate,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'product_count')  int productCount, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'store_url')  String? storeUrl, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'cover_image')  String? coverImage,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks, @JsonKey(name: 'verification_status')  String? verificationStatus, @JsonKey(name: 'featured')  bool featured, @JsonKey(name: 'premium')  bool premium, @JsonKey(name: 'location')  SellerLocation? location, @JsonKey(name: 'statistics')  SellerStatistics? statistics)?  $default,) {final _that = this;
switch (_that) {
case _Seller() when $default != null:
return $default(_that.sellerId,_that.customerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.status,_that.approvalStatus,_that.commissionRate,_that.rating,_that.reviewCount,_that.productCount,_that.totalSales,_that.createdAt,_that.updatedAt,_that.storeUrl,_that.profileImage,_that.coverImage,_that.description,_that.businessHours,_that.socialLinks,_that.verificationStatus,_that.featured,_that.premium,_that.location,_that.statistics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seller implements Seller {
  const _Seller({@JsonKey(name: 'seller_id') required this.sellerId, @JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'company_name') required this.companyName, @JsonKey(name: 'business_license') this.businessLicense, @JsonKey(name: 'tax_id') this.taxId, this.phone, this.address, this.city, this.region, this.postcode, @JsonKey(name: 'country_id') this.countryId, this.subdomain, required this.status, @JsonKey(name: 'approval_status') required this.approvalStatus, @JsonKey(name: 'commission_rate') required this.commissionRate, required this.rating, @JsonKey(name: 'review_count') required this.reviewCount, @JsonKey(name: 'product_count') required this.productCount, @JsonKey(name: 'total_sales') required this.totalSales, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'store_url') this.storeUrl, @JsonKey(name: 'profile_image') this.profileImage, @JsonKey(name: 'cover_image') this.coverImage, this.description, @JsonKey(name: 'business_hours') this.businessHours, @JsonKey(name: 'social_links') final  Map<String, String>? socialLinks, @JsonKey(name: 'verification_status') this.verificationStatus, @JsonKey(name: 'featured') this.featured = false, @JsonKey(name: 'premium') this.premium = false, @JsonKey(name: 'location') this.location, @JsonKey(name: 'statistics') this.statistics}): _socialLinks = socialLinks;
  factory _Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

@override@JsonKey(name: 'seller_id') final  int sellerId;
@override@JsonKey(name: 'customer_id') final  int customerId;
@override@JsonKey(name: 'company_name') final  String companyName;
@override@JsonKey(name: 'business_license') final  String? businessLicense;
@override@JsonKey(name: 'tax_id') final  String? taxId;
@override final  String? phone;
@override final  String? address;
@override final  String? city;
@override final  String? region;
@override final  String? postcode;
@override@JsonKey(name: 'country_id') final  String? countryId;
@override final  String? subdomain;
@override final  int status;
@override@JsonKey(name: 'approval_status') final  int approvalStatus;
@override@JsonKey(name: 'commission_rate') final  double commissionRate;
@override final  double rating;
@override@JsonKey(name: 'review_count') final  int reviewCount;
@override@JsonKey(name: 'product_count') final  int productCount;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'store_url') final  String? storeUrl;
@override@JsonKey(name: 'profile_image') final  String? profileImage;
@override@JsonKey(name: 'cover_image') final  String? coverImage;
@override final  String? description;
@override@JsonKey(name: 'business_hours') final  String? businessHours;
 final  Map<String, String>? _socialLinks;
@override@JsonKey(name: 'social_links') Map<String, String>? get socialLinks {
  final value = _socialLinks;
  if (value == null) return null;
  if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'verification_status') final  String? verificationStatus;
@override@JsonKey(name: 'featured') final  bool featured;
@override@JsonKey(name: 'premium') final  bool premium;
@override@JsonKey(name: 'location') final  SellerLocation? location;
@override@JsonKey(name: 'statistics') final  SellerStatistics? statistics;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerCopyWith<_Seller> get copyWith => __$SellerCopyWithImpl<_Seller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seller&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.taxId, taxId) || other.taxId == taxId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.subdomain, subdomain) || other.subdomain == subdomain)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.commissionRate, commissionRate) || other.commissionRate == commissionRate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.productCount, productCount) || other.productCount == productCount)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&const DeepCollectionEquality().equals(other._socialLinks, _socialLinks)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.location, location) || other.location == location)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,sellerId,customerId,companyName,businessLicense,taxId,phone,address,city,region,postcode,countryId,subdomain,status,approvalStatus,commissionRate,rating,reviewCount,productCount,totalSales,createdAt,updatedAt,storeUrl,profileImage,coverImage,description,businessHours,const DeepCollectionEquality().hash(_socialLinks),verificationStatus,featured,premium,location,statistics]);

@override
String toString() {
  return 'Seller(sellerId: $sellerId, customerId: $customerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, status: $status, approvalStatus: $approvalStatus, commissionRate: $commissionRate, rating: $rating, reviewCount: $reviewCount, productCount: $productCount, totalSales: $totalSales, createdAt: $createdAt, updatedAt: $updatedAt, storeUrl: $storeUrl, profileImage: $profileImage, coverImage: $coverImage, description: $description, businessHours: $businessHours, socialLinks: $socialLinks, verificationStatus: $verificationStatus, featured: $featured, premium: $premium, location: $location, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class _$SellerCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$SellerCopyWith(_Seller value, $Res Function(_Seller) _then) = __$SellerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'seller_id') int sellerId,@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'business_license') String? businessLicense,@JsonKey(name: 'tax_id') String? taxId, String? phone, String? address, String? city, String? region, String? postcode,@JsonKey(name: 'country_id') String? countryId, String? subdomain, int status,@JsonKey(name: 'approval_status') int approvalStatus,@JsonKey(name: 'commission_rate') double commissionRate, double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'product_count') int productCount,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'store_url') String? storeUrl,@JsonKey(name: 'profile_image') String? profileImage,@JsonKey(name: 'cover_image') String? coverImage, String? description,@JsonKey(name: 'business_hours') String? businessHours,@JsonKey(name: 'social_links') Map<String, String>? socialLinks,@JsonKey(name: 'verification_status') String? verificationStatus,@JsonKey(name: 'featured') bool featured,@JsonKey(name: 'premium') bool premium,@JsonKey(name: 'location') SellerLocation? location,@JsonKey(name: 'statistics') SellerStatistics? statistics
});


@override $SellerLocationCopyWith<$Res>? get location;@override $SellerStatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class __$SellerCopyWithImpl<$Res>
    implements _$SellerCopyWith<$Res> {
  __$SellerCopyWithImpl(this._self, this._then);

  final _Seller _self;
  final $Res Function(_Seller) _then;

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,Object? customerId = null,Object? companyName = null,Object? businessLicense = freezed,Object? taxId = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? subdomain = freezed,Object? status = null,Object? approvalStatus = null,Object? commissionRate = null,Object? rating = null,Object? reviewCount = null,Object? productCount = null,Object? totalSales = null,Object? createdAt = null,Object? updatedAt = null,Object? storeUrl = freezed,Object? profileImage = freezed,Object? coverImage = freezed,Object? description = freezed,Object? businessHours = freezed,Object? socialLinks = freezed,Object? verificationStatus = freezed,Object? featured = null,Object? premium = null,Object? location = freezed,Object? statistics = freezed,}) {
  return _then(_Seller(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,subdomain: freezed == subdomain ? _self.subdomain : subdomain // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as int,commissionRate: null == commissionRate ? _self.commissionRate : commissionRate // ignore: cast_nullable_to_non_nullable
as double,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,productCount: null == productCount ? _self.productCount : productCount // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,storeUrl: freezed == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self._socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as SellerLocation?,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as SellerStatistics?,
  ));
}

/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $SellerLocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of Seller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SellerStatisticsCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $SellerStatisticsCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// @nodoc
mixin _$SellerLocation {

 double get latitude; double get longitude; String? get address; String? get city; String? get region; String? get country;@JsonKey(name: 'postal_code') String? get postalCode;
/// Create a copy of SellerLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerLocationCopyWith<SellerLocation> get copyWith => _$SellerLocationCopyWithImpl<SellerLocation>(this as SellerLocation, _$identity);

  /// Serializes this SellerLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerLocation&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.country, country) || other.country == country)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address,city,region,country,postalCode);

@override
String toString() {
  return 'SellerLocation(latitude: $latitude, longitude: $longitude, address: $address, city: $city, region: $region, country: $country, postalCode: $postalCode)';
}


}

/// @nodoc
abstract mixin class $SellerLocationCopyWith<$Res>  {
  factory $SellerLocationCopyWith(SellerLocation value, $Res Function(SellerLocation) _then) = _$SellerLocationCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, String? address, String? city, String? region, String? country,@JsonKey(name: 'postal_code') String? postalCode
});




}
/// @nodoc
class _$SellerLocationCopyWithImpl<$Res>
    implements $SellerLocationCopyWith<$Res> {
  _$SellerLocationCopyWithImpl(this._self, this._then);

  final SellerLocation _self;
  final $Res Function(SellerLocation) _then;

/// Create a copy of SellerLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? country = freezed,Object? postalCode = freezed,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerLocation].
extension SellerLocationPatterns on SellerLocation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerLocation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerLocation value)  $default,){
final _that = this;
switch (_that) {
case _SellerLocation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerLocation value)?  $default,){
final _that = this;
switch (_that) {
case _SellerLocation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String? address,  String? city,  String? region,  String? country, @JsonKey(name: 'postal_code')  String? postalCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerLocation() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address,_that.city,_that.region,_that.country,_that.postalCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String? address,  String? city,  String? region,  String? country, @JsonKey(name: 'postal_code')  String? postalCode)  $default,) {final _that = this;
switch (_that) {
case _SellerLocation():
return $default(_that.latitude,_that.longitude,_that.address,_that.city,_that.region,_that.country,_that.postalCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  String? address,  String? city,  String? region,  String? country, @JsonKey(name: 'postal_code')  String? postalCode)?  $default,) {final _that = this;
switch (_that) {
case _SellerLocation() when $default != null:
return $default(_that.latitude,_that.longitude,_that.address,_that.city,_that.region,_that.country,_that.postalCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerLocation implements SellerLocation {
  const _SellerLocation({required this.latitude, required this.longitude, this.address, this.city, this.region, this.country, @JsonKey(name: 'postal_code') this.postalCode});
  factory _SellerLocation.fromJson(Map<String, dynamic> json) => _$SellerLocationFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  String? address;
@override final  String? city;
@override final  String? region;
@override final  String? country;
@override@JsonKey(name: 'postal_code') final  String? postalCode;

/// Create a copy of SellerLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerLocationCopyWith<_SellerLocation> get copyWith => __$SellerLocationCopyWithImpl<_SellerLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerLocation&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.country, country) || other.country == country)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,address,city,region,country,postalCode);

@override
String toString() {
  return 'SellerLocation(latitude: $latitude, longitude: $longitude, address: $address, city: $city, region: $region, country: $country, postalCode: $postalCode)';
}


}

/// @nodoc
abstract mixin class _$SellerLocationCopyWith<$Res> implements $SellerLocationCopyWith<$Res> {
  factory _$SellerLocationCopyWith(_SellerLocation value, $Res Function(_SellerLocation) _then) = __$SellerLocationCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, String? address, String? city, String? region, String? country,@JsonKey(name: 'postal_code') String? postalCode
});




}
/// @nodoc
class __$SellerLocationCopyWithImpl<$Res>
    implements _$SellerLocationCopyWith<$Res> {
  __$SellerLocationCopyWithImpl(this._self, this._then);

  final _SellerLocation _self;
  final $Res Function(_SellerLocation) _then;

/// Create a copy of SellerLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? country = freezed,Object? postalCode = freezed,}) {
  return _then(_SellerLocation(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SellerStatistics {

@JsonKey(name: 'total_products') int get totalProducts;@JsonKey(name: 'approved_products') int get approvedProducts;@JsonKey(name: 'pending_products') int get pendingProducts;@JsonKey(name: 'new_products') int get newProducts;@JsonKey(name: 'used_products') int get usedProducts;@JsonKey(name: 'refurbished_products') int get refurbishedProducts;@JsonKey(name: 'for_parts_products') int get forPartsProducts;@JsonKey(name: 'average_rating') double get averageRating;@JsonKey(name: 'total_reviews') int get totalReviews;@JsonKey(name: 'total_sales') double get totalSales;@JsonKey(name: 'monthly_sales') double get monthlySales;@JsonKey(name: 'yearly_sales') double get yearlySales;@JsonKey(name: 'response_time') String? get responseTime;@JsonKey(name: 'completion_rate') double get completionRate;@JsonKey(name: 'return_rate') double get returnRate;
/// Create a copy of SellerStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerStatisticsCopyWith<SellerStatistics> get copyWith => _$SellerStatisticsCopyWithImpl<SellerStatistics>(this as SellerStatistics, _$identity);

  /// Serializes this SellerStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerStatistics&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.approvedProducts, approvedProducts) || other.approvedProducts == approvedProducts)&&(identical(other.pendingProducts, pendingProducts) || other.pendingProducts == pendingProducts)&&(identical(other.newProducts, newProducts) || other.newProducts == newProducts)&&(identical(other.usedProducts, usedProducts) || other.usedProducts == usedProducts)&&(identical(other.refurbishedProducts, refurbishedProducts) || other.refurbishedProducts == refurbishedProducts)&&(identical(other.forPartsProducts, forPartsProducts) || other.forPartsProducts == forPartsProducts)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.monthlySales, monthlySales) || other.monthlySales == monthlySales)&&(identical(other.yearlySales, yearlySales) || other.yearlySales == yearlySales)&&(identical(other.responseTime, responseTime) || other.responseTime == responseTime)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&(identical(other.returnRate, returnRate) || other.returnRate == returnRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProducts,approvedProducts,pendingProducts,newProducts,usedProducts,refurbishedProducts,forPartsProducts,averageRating,totalReviews,totalSales,monthlySales,yearlySales,responseTime,completionRate,returnRate);

@override
String toString() {
  return 'SellerStatistics(totalProducts: $totalProducts, approvedProducts: $approvedProducts, pendingProducts: $pendingProducts, newProducts: $newProducts, usedProducts: $usedProducts, refurbishedProducts: $refurbishedProducts, forPartsProducts: $forPartsProducts, averageRating: $averageRating, totalReviews: $totalReviews, totalSales: $totalSales, monthlySales: $monthlySales, yearlySales: $yearlySales, responseTime: $responseTime, completionRate: $completionRate, returnRate: $returnRate)';
}


}

/// @nodoc
abstract mixin class $SellerStatisticsCopyWith<$Res>  {
  factory $SellerStatisticsCopyWith(SellerStatistics value, $Res Function(SellerStatistics) _then) = _$SellerStatisticsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_products') int totalProducts,@JsonKey(name: 'approved_products') int approvedProducts,@JsonKey(name: 'pending_products') int pendingProducts,@JsonKey(name: 'new_products') int newProducts,@JsonKey(name: 'used_products') int usedProducts,@JsonKey(name: 'refurbished_products') int refurbishedProducts,@JsonKey(name: 'for_parts_products') int forPartsProducts,@JsonKey(name: 'average_rating') double averageRating,@JsonKey(name: 'total_reviews') int totalReviews,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'monthly_sales') double monthlySales,@JsonKey(name: 'yearly_sales') double yearlySales,@JsonKey(name: 'response_time') String? responseTime,@JsonKey(name: 'completion_rate') double completionRate,@JsonKey(name: 'return_rate') double returnRate
});




}
/// @nodoc
class _$SellerStatisticsCopyWithImpl<$Res>
    implements $SellerStatisticsCopyWith<$Res> {
  _$SellerStatisticsCopyWithImpl(this._self, this._then);

  final SellerStatistics _self;
  final $Res Function(SellerStatistics) _then;

/// Create a copy of SellerStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalProducts = null,Object? approvedProducts = null,Object? pendingProducts = null,Object? newProducts = null,Object? usedProducts = null,Object? refurbishedProducts = null,Object? forPartsProducts = null,Object? averageRating = null,Object? totalReviews = null,Object? totalSales = null,Object? monthlySales = null,Object? yearlySales = null,Object? responseTime = freezed,Object? completionRate = null,Object? returnRate = null,}) {
  return _then(_self.copyWith(
totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,approvedProducts: null == approvedProducts ? _self.approvedProducts : approvedProducts // ignore: cast_nullable_to_non_nullable
as int,pendingProducts: null == pendingProducts ? _self.pendingProducts : pendingProducts // ignore: cast_nullable_to_non_nullable
as int,newProducts: null == newProducts ? _self.newProducts : newProducts // ignore: cast_nullable_to_non_nullable
as int,usedProducts: null == usedProducts ? _self.usedProducts : usedProducts // ignore: cast_nullable_to_non_nullable
as int,refurbishedProducts: null == refurbishedProducts ? _self.refurbishedProducts : refurbishedProducts // ignore: cast_nullable_to_non_nullable
as int,forPartsProducts: null == forPartsProducts ? _self.forPartsProducts : forPartsProducts // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,monthlySales: null == monthlySales ? _self.monthlySales : monthlySales // ignore: cast_nullable_to_non_nullable
as double,yearlySales: null == yearlySales ? _self.yearlySales : yearlySales // ignore: cast_nullable_to_non_nullable
as double,responseTime: freezed == responseTime ? _self.responseTime : responseTime // ignore: cast_nullable_to_non_nullable
as String?,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,returnRate: null == returnRate ? _self.returnRate : returnRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerStatistics].
extension SellerStatisticsPatterns on SellerStatistics {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerStatistics() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerStatistics value)  $default,){
final _that = this;
switch (_that) {
case _SellerStatistics():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _SellerStatistics() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_products')  int totalProducts, @JsonKey(name: 'approved_products')  int approvedProducts, @JsonKey(name: 'pending_products')  int pendingProducts, @JsonKey(name: 'new_products')  int newProducts, @JsonKey(name: 'used_products')  int usedProducts, @JsonKey(name: 'refurbished_products')  int refurbishedProducts, @JsonKey(name: 'for_parts_products')  int forPartsProducts, @JsonKey(name: 'average_rating')  double averageRating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'monthly_sales')  double monthlySales, @JsonKey(name: 'yearly_sales')  double yearlySales, @JsonKey(name: 'response_time')  String? responseTime, @JsonKey(name: 'completion_rate')  double completionRate, @JsonKey(name: 'return_rate')  double returnRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerStatistics() when $default != null:
return $default(_that.totalProducts,_that.approvedProducts,_that.pendingProducts,_that.newProducts,_that.usedProducts,_that.refurbishedProducts,_that.forPartsProducts,_that.averageRating,_that.totalReviews,_that.totalSales,_that.monthlySales,_that.yearlySales,_that.responseTime,_that.completionRate,_that.returnRate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_products')  int totalProducts, @JsonKey(name: 'approved_products')  int approvedProducts, @JsonKey(name: 'pending_products')  int pendingProducts, @JsonKey(name: 'new_products')  int newProducts, @JsonKey(name: 'used_products')  int usedProducts, @JsonKey(name: 'refurbished_products')  int refurbishedProducts, @JsonKey(name: 'for_parts_products')  int forPartsProducts, @JsonKey(name: 'average_rating')  double averageRating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'monthly_sales')  double monthlySales, @JsonKey(name: 'yearly_sales')  double yearlySales, @JsonKey(name: 'response_time')  String? responseTime, @JsonKey(name: 'completion_rate')  double completionRate, @JsonKey(name: 'return_rate')  double returnRate)  $default,) {final _that = this;
switch (_that) {
case _SellerStatistics():
return $default(_that.totalProducts,_that.approvedProducts,_that.pendingProducts,_that.newProducts,_that.usedProducts,_that.refurbishedProducts,_that.forPartsProducts,_that.averageRating,_that.totalReviews,_that.totalSales,_that.monthlySales,_that.yearlySales,_that.responseTime,_that.completionRate,_that.returnRate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_products')  int totalProducts, @JsonKey(name: 'approved_products')  int approvedProducts, @JsonKey(name: 'pending_products')  int pendingProducts, @JsonKey(name: 'new_products')  int newProducts, @JsonKey(name: 'used_products')  int usedProducts, @JsonKey(name: 'refurbished_products')  int refurbishedProducts, @JsonKey(name: 'for_parts_products')  int forPartsProducts, @JsonKey(name: 'average_rating')  double averageRating, @JsonKey(name: 'total_reviews')  int totalReviews, @JsonKey(name: 'total_sales')  double totalSales, @JsonKey(name: 'monthly_sales')  double monthlySales, @JsonKey(name: 'yearly_sales')  double yearlySales, @JsonKey(name: 'response_time')  String? responseTime, @JsonKey(name: 'completion_rate')  double completionRate, @JsonKey(name: 'return_rate')  double returnRate)?  $default,) {final _that = this;
switch (_that) {
case _SellerStatistics() when $default != null:
return $default(_that.totalProducts,_that.approvedProducts,_that.pendingProducts,_that.newProducts,_that.usedProducts,_that.refurbishedProducts,_that.forPartsProducts,_that.averageRating,_that.totalReviews,_that.totalSales,_that.monthlySales,_that.yearlySales,_that.responseTime,_that.completionRate,_that.returnRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerStatistics implements SellerStatistics {
  const _SellerStatistics({@JsonKey(name: 'total_products') required this.totalProducts, @JsonKey(name: 'approved_products') required this.approvedProducts, @JsonKey(name: 'pending_products') required this.pendingProducts, @JsonKey(name: 'new_products') required this.newProducts, @JsonKey(name: 'used_products') required this.usedProducts, @JsonKey(name: 'refurbished_products') required this.refurbishedProducts, @JsonKey(name: 'for_parts_products') required this.forPartsProducts, @JsonKey(name: 'average_rating') required this.averageRating, @JsonKey(name: 'total_reviews') required this.totalReviews, @JsonKey(name: 'total_sales') required this.totalSales, @JsonKey(name: 'monthly_sales') required this.monthlySales, @JsonKey(name: 'yearly_sales') required this.yearlySales, @JsonKey(name: 'response_time') this.responseTime, @JsonKey(name: 'completion_rate') required this.completionRate, @JsonKey(name: 'return_rate') required this.returnRate});
  factory _SellerStatistics.fromJson(Map<String, dynamic> json) => _$SellerStatisticsFromJson(json);

@override@JsonKey(name: 'total_products') final  int totalProducts;
@override@JsonKey(name: 'approved_products') final  int approvedProducts;
@override@JsonKey(name: 'pending_products') final  int pendingProducts;
@override@JsonKey(name: 'new_products') final  int newProducts;
@override@JsonKey(name: 'used_products') final  int usedProducts;
@override@JsonKey(name: 'refurbished_products') final  int refurbishedProducts;
@override@JsonKey(name: 'for_parts_products') final  int forPartsProducts;
@override@JsonKey(name: 'average_rating') final  double averageRating;
@override@JsonKey(name: 'total_reviews') final  int totalReviews;
@override@JsonKey(name: 'total_sales') final  double totalSales;
@override@JsonKey(name: 'monthly_sales') final  double monthlySales;
@override@JsonKey(name: 'yearly_sales') final  double yearlySales;
@override@JsonKey(name: 'response_time') final  String? responseTime;
@override@JsonKey(name: 'completion_rate') final  double completionRate;
@override@JsonKey(name: 'return_rate') final  double returnRate;

/// Create a copy of SellerStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerStatisticsCopyWith<_SellerStatistics> get copyWith => __$SellerStatisticsCopyWithImpl<_SellerStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerStatistics&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.approvedProducts, approvedProducts) || other.approvedProducts == approvedProducts)&&(identical(other.pendingProducts, pendingProducts) || other.pendingProducts == pendingProducts)&&(identical(other.newProducts, newProducts) || other.newProducts == newProducts)&&(identical(other.usedProducts, usedProducts) || other.usedProducts == usedProducts)&&(identical(other.refurbishedProducts, refurbishedProducts) || other.refurbishedProducts == refurbishedProducts)&&(identical(other.forPartsProducts, forPartsProducts) || other.forPartsProducts == forPartsProducts)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.monthlySales, monthlySales) || other.monthlySales == monthlySales)&&(identical(other.yearlySales, yearlySales) || other.yearlySales == yearlySales)&&(identical(other.responseTime, responseTime) || other.responseTime == responseTime)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&(identical(other.returnRate, returnRate) || other.returnRate == returnRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalProducts,approvedProducts,pendingProducts,newProducts,usedProducts,refurbishedProducts,forPartsProducts,averageRating,totalReviews,totalSales,monthlySales,yearlySales,responseTime,completionRate,returnRate);

@override
String toString() {
  return 'SellerStatistics(totalProducts: $totalProducts, approvedProducts: $approvedProducts, pendingProducts: $pendingProducts, newProducts: $newProducts, usedProducts: $usedProducts, refurbishedProducts: $refurbishedProducts, forPartsProducts: $forPartsProducts, averageRating: $averageRating, totalReviews: $totalReviews, totalSales: $totalSales, monthlySales: $monthlySales, yearlySales: $yearlySales, responseTime: $responseTime, completionRate: $completionRate, returnRate: $returnRate)';
}


}

/// @nodoc
abstract mixin class _$SellerStatisticsCopyWith<$Res> implements $SellerStatisticsCopyWith<$Res> {
  factory _$SellerStatisticsCopyWith(_SellerStatistics value, $Res Function(_SellerStatistics) _then) = __$SellerStatisticsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_products') int totalProducts,@JsonKey(name: 'approved_products') int approvedProducts,@JsonKey(name: 'pending_products') int pendingProducts,@JsonKey(name: 'new_products') int newProducts,@JsonKey(name: 'used_products') int usedProducts,@JsonKey(name: 'refurbished_products') int refurbishedProducts,@JsonKey(name: 'for_parts_products') int forPartsProducts,@JsonKey(name: 'average_rating') double averageRating,@JsonKey(name: 'total_reviews') int totalReviews,@JsonKey(name: 'total_sales') double totalSales,@JsonKey(name: 'monthly_sales') double monthlySales,@JsonKey(name: 'yearly_sales') double yearlySales,@JsonKey(name: 'response_time') String? responseTime,@JsonKey(name: 'completion_rate') double completionRate,@JsonKey(name: 'return_rate') double returnRate
});




}
/// @nodoc
class __$SellerStatisticsCopyWithImpl<$Res>
    implements _$SellerStatisticsCopyWith<$Res> {
  __$SellerStatisticsCopyWithImpl(this._self, this._then);

  final _SellerStatistics _self;
  final $Res Function(_SellerStatistics) _then;

/// Create a copy of SellerStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalProducts = null,Object? approvedProducts = null,Object? pendingProducts = null,Object? newProducts = null,Object? usedProducts = null,Object? refurbishedProducts = null,Object? forPartsProducts = null,Object? averageRating = null,Object? totalReviews = null,Object? totalSales = null,Object? monthlySales = null,Object? yearlySales = null,Object? responseTime = freezed,Object? completionRate = null,Object? returnRate = null,}) {
  return _then(_SellerStatistics(
totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,approvedProducts: null == approvedProducts ? _self.approvedProducts : approvedProducts // ignore: cast_nullable_to_non_nullable
as int,pendingProducts: null == pendingProducts ? _self.pendingProducts : pendingProducts // ignore: cast_nullable_to_non_nullable
as int,newProducts: null == newProducts ? _self.newProducts : newProducts // ignore: cast_nullable_to_non_nullable
as int,usedProducts: null == usedProducts ? _self.usedProducts : usedProducts // ignore: cast_nullable_to_non_nullable
as int,refurbishedProducts: null == refurbishedProducts ? _self.refurbishedProducts : refurbishedProducts // ignore: cast_nullable_to_non_nullable
as int,forPartsProducts: null == forPartsProducts ? _self.forPartsProducts : forPartsProducts // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,monthlySales: null == monthlySales ? _self.monthlySales : monthlySales // ignore: cast_nullable_to_non_nullable
as double,yearlySales: null == yearlySales ? _self.yearlySales : yearlySales // ignore: cast_nullable_to_non_nullable
as double,responseTime: freezed == responseTime ? _self.responseTime : responseTime // ignore: cast_nullable_to_non_nullable
as String?,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,returnRate: null == returnRate ? _self.returnRate : returnRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$SellerRegistrationRequest {

@JsonKey(name: 'customer_id') int get customerId;@JsonKey(name: 'company_name') String get companyName;@JsonKey(name: 'business_license') String? get businessLicense;@JsonKey(name: 'tax_id') String? get taxId; String? get phone; String? get address; String? get city; String? get region; String? get postcode;@JsonKey(name: 'country_id') String? get countryId; String? get subdomain; String? get description;@JsonKey(name: 'business_hours') String? get businessHours;@JsonKey(name: 'social_links') Map<String, String>? get socialLinks;
/// Create a copy of SellerRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerRegistrationRequestCopyWith<SellerRegistrationRequest> get copyWith => _$SellerRegistrationRequestCopyWithImpl<SellerRegistrationRequest>(this as SellerRegistrationRequest, _$identity);

  /// Serializes this SellerRegistrationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerRegistrationRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.taxId, taxId) || other.taxId == taxId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.subdomain, subdomain) || other.subdomain == subdomain)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&const DeepCollectionEquality().equals(other.socialLinks, socialLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,companyName,businessLicense,taxId,phone,address,city,region,postcode,countryId,subdomain,description,businessHours,const DeepCollectionEquality().hash(socialLinks));

@override
String toString() {
  return 'SellerRegistrationRequest(customerId: $customerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, description: $description, businessHours: $businessHours, socialLinks: $socialLinks)';
}


}

/// @nodoc
abstract mixin class $SellerRegistrationRequestCopyWith<$Res>  {
  factory $SellerRegistrationRequestCopyWith(SellerRegistrationRequest value, $Res Function(SellerRegistrationRequest) _then) = _$SellerRegistrationRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'business_license') String? businessLicense,@JsonKey(name: 'tax_id') String? taxId, String? phone, String? address, String? city, String? region, String? postcode,@JsonKey(name: 'country_id') String? countryId, String? subdomain, String? description,@JsonKey(name: 'business_hours') String? businessHours,@JsonKey(name: 'social_links') Map<String, String>? socialLinks
});




}
/// @nodoc
class _$SellerRegistrationRequestCopyWithImpl<$Res>
    implements $SellerRegistrationRequestCopyWith<$Res> {
  _$SellerRegistrationRequestCopyWithImpl(this._self, this._then);

  final SellerRegistrationRequest _self;
  final $Res Function(SellerRegistrationRequest) _then;

/// Create a copy of SellerRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = null,Object? companyName = null,Object? businessLicense = freezed,Object? taxId = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? subdomain = freezed,Object? description = freezed,Object? businessHours = freezed,Object? socialLinks = freezed,}) {
  return _then(_self.copyWith(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,subdomain: freezed == subdomain ? _self.subdomain : subdomain // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self.socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerRegistrationRequest].
extension SellerRegistrationRequestPatterns on SellerRegistrationRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerRegistrationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerRegistrationRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerRegistrationRequest value)  $default,){
final _that = this;
switch (_that) {
case _SellerRegistrationRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerRegistrationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SellerRegistrationRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerRegistrationRequest() when $default != null:
return $default(_that.customerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.description,_that.businessHours,_that.socialLinks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks)  $default,) {final _that = this;
switch (_that) {
case _SellerRegistrationRequest():
return $default(_that.customerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.description,_that.businessHours,_that.socialLinks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'customer_id')  int customerId, @JsonKey(name: 'company_name')  String companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks)?  $default,) {final _that = this;
switch (_that) {
case _SellerRegistrationRequest() when $default != null:
return $default(_that.customerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.description,_that.businessHours,_that.socialLinks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerRegistrationRequest implements SellerRegistrationRequest {
  const _SellerRegistrationRequest({@JsonKey(name: 'customer_id') required this.customerId, @JsonKey(name: 'company_name') required this.companyName, @JsonKey(name: 'business_license') this.businessLicense, @JsonKey(name: 'tax_id') this.taxId, this.phone, this.address, this.city, this.region, this.postcode, @JsonKey(name: 'country_id') this.countryId, this.subdomain, this.description, @JsonKey(name: 'business_hours') this.businessHours, @JsonKey(name: 'social_links') final  Map<String, String>? socialLinks}): _socialLinks = socialLinks;
  factory _SellerRegistrationRequest.fromJson(Map<String, dynamic> json) => _$SellerRegistrationRequestFromJson(json);

@override@JsonKey(name: 'customer_id') final  int customerId;
@override@JsonKey(name: 'company_name') final  String companyName;
@override@JsonKey(name: 'business_license') final  String? businessLicense;
@override@JsonKey(name: 'tax_id') final  String? taxId;
@override final  String? phone;
@override final  String? address;
@override final  String? city;
@override final  String? region;
@override final  String? postcode;
@override@JsonKey(name: 'country_id') final  String? countryId;
@override final  String? subdomain;
@override final  String? description;
@override@JsonKey(name: 'business_hours') final  String? businessHours;
 final  Map<String, String>? _socialLinks;
@override@JsonKey(name: 'social_links') Map<String, String>? get socialLinks {
  final value = _socialLinks;
  if (value == null) return null;
  if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SellerRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerRegistrationRequestCopyWith<_SellerRegistrationRequest> get copyWith => __$SellerRegistrationRequestCopyWithImpl<_SellerRegistrationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerRegistrationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerRegistrationRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.taxId, taxId) || other.taxId == taxId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.subdomain, subdomain) || other.subdomain == subdomain)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&const DeepCollectionEquality().equals(other._socialLinks, _socialLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,companyName,businessLicense,taxId,phone,address,city,region,postcode,countryId,subdomain,description,businessHours,const DeepCollectionEquality().hash(_socialLinks));

@override
String toString() {
  return 'SellerRegistrationRequest(customerId: $customerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, description: $description, businessHours: $businessHours, socialLinks: $socialLinks)';
}


}

/// @nodoc
abstract mixin class _$SellerRegistrationRequestCopyWith<$Res> implements $SellerRegistrationRequestCopyWith<$Res> {
  factory _$SellerRegistrationRequestCopyWith(_SellerRegistrationRequest value, $Res Function(_SellerRegistrationRequest) _then) = __$SellerRegistrationRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'customer_id') int customerId,@JsonKey(name: 'company_name') String companyName,@JsonKey(name: 'business_license') String? businessLicense,@JsonKey(name: 'tax_id') String? taxId, String? phone, String? address, String? city, String? region, String? postcode,@JsonKey(name: 'country_id') String? countryId, String? subdomain, String? description,@JsonKey(name: 'business_hours') String? businessHours,@JsonKey(name: 'social_links') Map<String, String>? socialLinks
});




}
/// @nodoc
class __$SellerRegistrationRequestCopyWithImpl<$Res>
    implements _$SellerRegistrationRequestCopyWith<$Res> {
  __$SellerRegistrationRequestCopyWithImpl(this._self, this._then);

  final _SellerRegistrationRequest _self;
  final $Res Function(_SellerRegistrationRequest) _then;

/// Create a copy of SellerRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = null,Object? companyName = null,Object? businessLicense = freezed,Object? taxId = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? subdomain = freezed,Object? description = freezed,Object? businessHours = freezed,Object? socialLinks = freezed,}) {
  return _then(_SellerRegistrationRequest(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,subdomain: freezed == subdomain ? _self.subdomain : subdomain // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self._socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}


/// @nodoc
mixin _$SellerUpdateRequest {

@JsonKey(name: 'seller_id') int get sellerId;@JsonKey(name: 'company_name') String? get companyName;@JsonKey(name: 'business_license') String? get businessLicense;@JsonKey(name: 'tax_id') String? get taxId; String? get phone; String? get address; String? get city; String? get region; String? get postcode;@JsonKey(name: 'country_id') String? get countryId; String? get subdomain; String? get description;@JsonKey(name: 'business_hours') String? get businessHours;@JsonKey(name: 'social_links') Map<String, String>? get socialLinks;@JsonKey(name: 'profile_image') String? get profileImage;@JsonKey(name: 'cover_image') String? get coverImage;
/// Create a copy of SellerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerUpdateRequestCopyWith<SellerUpdateRequest> get copyWith => _$SellerUpdateRequestCopyWithImpl<SellerUpdateRequest>(this as SellerUpdateRequest, _$identity);

  /// Serializes this SellerUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerUpdateRequest&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.taxId, taxId) || other.taxId == taxId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.subdomain, subdomain) || other.subdomain == subdomain)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&const DeepCollectionEquality().equals(other.socialLinks, socialLinks)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sellerId,companyName,businessLicense,taxId,phone,address,city,region,postcode,countryId,subdomain,description,businessHours,const DeepCollectionEquality().hash(socialLinks),profileImage,coverImage);

@override
String toString() {
  return 'SellerUpdateRequest(sellerId: $sellerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, description: $description, businessHours: $businessHours, socialLinks: $socialLinks, profileImage: $profileImage, coverImage: $coverImage)';
}


}

/// @nodoc
abstract mixin class $SellerUpdateRequestCopyWith<$Res>  {
  factory $SellerUpdateRequestCopyWith(SellerUpdateRequest value, $Res Function(SellerUpdateRequest) _then) = _$SellerUpdateRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'seller_id') int sellerId,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'business_license') String? businessLicense,@JsonKey(name: 'tax_id') String? taxId, String? phone, String? address, String? city, String? region, String? postcode,@JsonKey(name: 'country_id') String? countryId, String? subdomain, String? description,@JsonKey(name: 'business_hours') String? businessHours,@JsonKey(name: 'social_links') Map<String, String>? socialLinks,@JsonKey(name: 'profile_image') String? profileImage,@JsonKey(name: 'cover_image') String? coverImage
});




}
/// @nodoc
class _$SellerUpdateRequestCopyWithImpl<$Res>
    implements $SellerUpdateRequestCopyWith<$Res> {
  _$SellerUpdateRequestCopyWithImpl(this._self, this._then);

  final SellerUpdateRequest _self;
  final $Res Function(SellerUpdateRequest) _then;

/// Create a copy of SellerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sellerId = null,Object? companyName = freezed,Object? businessLicense = freezed,Object? taxId = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? subdomain = freezed,Object? description = freezed,Object? businessHours = freezed,Object? socialLinks = freezed,Object? profileImage = freezed,Object? coverImage = freezed,}) {
  return _then(_self.copyWith(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,subdomain: freezed == subdomain ? _self.subdomain : subdomain // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self.socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerUpdateRequest].
extension SellerUpdateRequestPatterns on SellerUpdateRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerUpdateRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _SellerUpdateRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SellerUpdateRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'seller_id')  int sellerId, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'cover_image')  String? coverImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerUpdateRequest() when $default != null:
return $default(_that.sellerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.description,_that.businessHours,_that.socialLinks,_that.profileImage,_that.coverImage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'seller_id')  int sellerId, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'cover_image')  String? coverImage)  $default,) {final _that = this;
switch (_that) {
case _SellerUpdateRequest():
return $default(_that.sellerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.description,_that.businessHours,_that.socialLinks,_that.profileImage,_that.coverImage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'seller_id')  int sellerId, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'business_license')  String? businessLicense, @JsonKey(name: 'tax_id')  String? taxId,  String? phone,  String? address,  String? city,  String? region,  String? postcode, @JsonKey(name: 'country_id')  String? countryId,  String? subdomain,  String? description, @JsonKey(name: 'business_hours')  String? businessHours, @JsonKey(name: 'social_links')  Map<String, String>? socialLinks, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'cover_image')  String? coverImage)?  $default,) {final _that = this;
switch (_that) {
case _SellerUpdateRequest() when $default != null:
return $default(_that.sellerId,_that.companyName,_that.businessLicense,_that.taxId,_that.phone,_that.address,_that.city,_that.region,_that.postcode,_that.countryId,_that.subdomain,_that.description,_that.businessHours,_that.socialLinks,_that.profileImage,_that.coverImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerUpdateRequest implements SellerUpdateRequest {
  const _SellerUpdateRequest({@JsonKey(name: 'seller_id') required this.sellerId, @JsonKey(name: 'company_name') this.companyName, @JsonKey(name: 'business_license') this.businessLicense, @JsonKey(name: 'tax_id') this.taxId, this.phone, this.address, this.city, this.region, this.postcode, @JsonKey(name: 'country_id') this.countryId, this.subdomain, this.description, @JsonKey(name: 'business_hours') this.businessHours, @JsonKey(name: 'social_links') final  Map<String, String>? socialLinks, @JsonKey(name: 'profile_image') this.profileImage, @JsonKey(name: 'cover_image') this.coverImage}): _socialLinks = socialLinks;
  factory _SellerUpdateRequest.fromJson(Map<String, dynamic> json) => _$SellerUpdateRequestFromJson(json);

@override@JsonKey(name: 'seller_id') final  int sellerId;
@override@JsonKey(name: 'company_name') final  String? companyName;
@override@JsonKey(name: 'business_license') final  String? businessLicense;
@override@JsonKey(name: 'tax_id') final  String? taxId;
@override final  String? phone;
@override final  String? address;
@override final  String? city;
@override final  String? region;
@override final  String? postcode;
@override@JsonKey(name: 'country_id') final  String? countryId;
@override final  String? subdomain;
@override final  String? description;
@override@JsonKey(name: 'business_hours') final  String? businessHours;
 final  Map<String, String>? _socialLinks;
@override@JsonKey(name: 'social_links') Map<String, String>? get socialLinks {
  final value = _socialLinks;
  if (value == null) return null;
  if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'profile_image') final  String? profileImage;
@override@JsonKey(name: 'cover_image') final  String? coverImage;

/// Create a copy of SellerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerUpdateRequestCopyWith<_SellerUpdateRequest> get copyWith => __$SellerUpdateRequestCopyWithImpl<_SellerUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerUpdateRequest&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.taxId, taxId) || other.taxId == taxId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.subdomain, subdomain) || other.subdomain == subdomain)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessHours, businessHours) || other.businessHours == businessHours)&&const DeepCollectionEquality().equals(other._socialLinks, _socialLinks)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.coverImage, coverImage) || other.coverImage == coverImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sellerId,companyName,businessLicense,taxId,phone,address,city,region,postcode,countryId,subdomain,description,businessHours,const DeepCollectionEquality().hash(_socialLinks),profileImage,coverImage);

@override
String toString() {
  return 'SellerUpdateRequest(sellerId: $sellerId, companyName: $companyName, businessLicense: $businessLicense, taxId: $taxId, phone: $phone, address: $address, city: $city, region: $region, postcode: $postcode, countryId: $countryId, subdomain: $subdomain, description: $description, businessHours: $businessHours, socialLinks: $socialLinks, profileImage: $profileImage, coverImage: $coverImage)';
}


}

/// @nodoc
abstract mixin class _$SellerUpdateRequestCopyWith<$Res> implements $SellerUpdateRequestCopyWith<$Res> {
  factory _$SellerUpdateRequestCopyWith(_SellerUpdateRequest value, $Res Function(_SellerUpdateRequest) _then) = __$SellerUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'seller_id') int sellerId,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'business_license') String? businessLicense,@JsonKey(name: 'tax_id') String? taxId, String? phone, String? address, String? city, String? region, String? postcode,@JsonKey(name: 'country_id') String? countryId, String? subdomain, String? description,@JsonKey(name: 'business_hours') String? businessHours,@JsonKey(name: 'social_links') Map<String, String>? socialLinks,@JsonKey(name: 'profile_image') String? profileImage,@JsonKey(name: 'cover_image') String? coverImage
});




}
/// @nodoc
class __$SellerUpdateRequestCopyWithImpl<$Res>
    implements _$SellerUpdateRequestCopyWith<$Res> {
  __$SellerUpdateRequestCopyWithImpl(this._self, this._then);

  final _SellerUpdateRequest _self;
  final $Res Function(_SellerUpdateRequest) _then;

/// Create a copy of SellerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sellerId = null,Object? companyName = freezed,Object? businessLicense = freezed,Object? taxId = freezed,Object? phone = freezed,Object? address = freezed,Object? city = freezed,Object? region = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? subdomain = freezed,Object? description = freezed,Object? businessHours = freezed,Object? socialLinks = freezed,Object? profileImage = freezed,Object? coverImage = freezed,}) {
  return _then(_SellerUpdateRequest(
sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as int,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,taxId: freezed == taxId ? _self.taxId : taxId // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,subdomain: freezed == subdomain ? _self.subdomain : subdomain // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,businessHours: freezed == businessHours ? _self.businessHours : businessHours // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self._socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,coverImage: freezed == coverImage ? _self.coverImage : coverImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SellerSearchFilters {

 String? get search; int? get status;@JsonKey(name: 'approval_status') int? get approvalStatus;@JsonKey(name: 'rating_min') double? get ratingMin;@JsonKey(name: 'rating_max') double? get ratingMax;@JsonKey(name: 'created_from') DateTime? get createdFrom;@JsonKey(name: 'created_to') DateTime? get createdTo; String? get city; String? get region; String? get country;@JsonKey(name: 'featured') bool? get featured;@JsonKey(name: 'premium') bool? get premium;@JsonKey(name: 'verification_status') String? get verificationStatus;@JsonKey(name: 'sort_by') SellerSortBy? get sortBy;@JsonKey(name: 'sort_direction') SortDirection? get sortDirection;
/// Create a copy of SellerSearchFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerSearchFiltersCopyWith<SellerSearchFilters> get copyWith => _$SellerSearchFiltersCopyWithImpl<SellerSearchFilters>(this as SellerSearchFilters, _$identity);

  /// Serializes this SellerSearchFilters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerSearchFilters&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.ratingMin, ratingMin) || other.ratingMin == ratingMin)&&(identical(other.ratingMax, ratingMax) || other.ratingMax == ratingMax)&&(identical(other.createdFrom, createdFrom) || other.createdFrom == createdFrom)&&(identical(other.createdTo, createdTo) || other.createdTo == createdTo)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.country, country) || other.country == country)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,search,status,approvalStatus,ratingMin,ratingMax,createdFrom,createdTo,city,region,country,featured,premium,verificationStatus,sortBy,sortDirection);

@override
String toString() {
  return 'SellerSearchFilters(search: $search, status: $status, approvalStatus: $approvalStatus, ratingMin: $ratingMin, ratingMax: $ratingMax, createdFrom: $createdFrom, createdTo: $createdTo, city: $city, region: $region, country: $country, featured: $featured, premium: $premium, verificationStatus: $verificationStatus, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class $SellerSearchFiltersCopyWith<$Res>  {
  factory $SellerSearchFiltersCopyWith(SellerSearchFilters value, $Res Function(SellerSearchFilters) _then) = _$SellerSearchFiltersCopyWithImpl;
@useResult
$Res call({
 String? search, int? status,@JsonKey(name: 'approval_status') int? approvalStatus,@JsonKey(name: 'rating_min') double? ratingMin,@JsonKey(name: 'rating_max') double? ratingMax,@JsonKey(name: 'created_from') DateTime? createdFrom,@JsonKey(name: 'created_to') DateTime? createdTo, String? city, String? region, String? country,@JsonKey(name: 'featured') bool? featured,@JsonKey(name: 'premium') bool? premium,@JsonKey(name: 'verification_status') String? verificationStatus,@JsonKey(name: 'sort_by') SellerSortBy? sortBy,@JsonKey(name: 'sort_direction') SortDirection? sortDirection
});




}
/// @nodoc
class _$SellerSearchFiltersCopyWithImpl<$Res>
    implements $SellerSearchFiltersCopyWith<$Res> {
  _$SellerSearchFiltersCopyWithImpl(this._self, this._then);

  final SellerSearchFilters _self;
  final $Res Function(SellerSearchFilters) _then;

/// Create a copy of SellerSearchFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = freezed,Object? status = freezed,Object? approvalStatus = freezed,Object? ratingMin = freezed,Object? ratingMax = freezed,Object? createdFrom = freezed,Object? createdTo = freezed,Object? city = freezed,Object? region = freezed,Object? country = freezed,Object? featured = freezed,Object? premium = freezed,Object? verificationStatus = freezed,Object? sortBy = freezed,Object? sortDirection = freezed,}) {
  return _then(_self.copyWith(
search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as int?,ratingMin: freezed == ratingMin ? _self.ratingMin : ratingMin // ignore: cast_nullable_to_non_nullable
as double?,ratingMax: freezed == ratingMax ? _self.ratingMax : ratingMax // ignore: cast_nullable_to_non_nullable
as double?,createdFrom: freezed == createdFrom ? _self.createdFrom : createdFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,createdTo: freezed == createdTo ? _self.createdTo : createdTo // ignore: cast_nullable_to_non_nullable
as DateTime?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,featured: freezed == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool?,premium: freezed == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SellerSortBy?,sortDirection: freezed == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as SortDirection?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerSearchFilters].
extension SellerSearchFiltersPatterns on SellerSearchFilters {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerSearchFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerSearchFilters() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerSearchFilters value)  $default,){
final _that = this;
switch (_that) {
case _SellerSearchFilters():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerSearchFilters value)?  $default,){
final _that = this;
switch (_that) {
case _SellerSearchFilters() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? search,  int? status, @JsonKey(name: 'approval_status')  int? approvalStatus, @JsonKey(name: 'rating_min')  double? ratingMin, @JsonKey(name: 'rating_max')  double? ratingMax, @JsonKey(name: 'created_from')  DateTime? createdFrom, @JsonKey(name: 'created_to')  DateTime? createdTo,  String? city,  String? region,  String? country, @JsonKey(name: 'featured')  bool? featured, @JsonKey(name: 'premium')  bool? premium, @JsonKey(name: 'verification_status')  String? verificationStatus, @JsonKey(name: 'sort_by')  SellerSortBy? sortBy, @JsonKey(name: 'sort_direction')  SortDirection? sortDirection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerSearchFilters() when $default != null:
return $default(_that.search,_that.status,_that.approvalStatus,_that.ratingMin,_that.ratingMax,_that.createdFrom,_that.createdTo,_that.city,_that.region,_that.country,_that.featured,_that.premium,_that.verificationStatus,_that.sortBy,_that.sortDirection);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? search,  int? status, @JsonKey(name: 'approval_status')  int? approvalStatus, @JsonKey(name: 'rating_min')  double? ratingMin, @JsonKey(name: 'rating_max')  double? ratingMax, @JsonKey(name: 'created_from')  DateTime? createdFrom, @JsonKey(name: 'created_to')  DateTime? createdTo,  String? city,  String? region,  String? country, @JsonKey(name: 'featured')  bool? featured, @JsonKey(name: 'premium')  bool? premium, @JsonKey(name: 'verification_status')  String? verificationStatus, @JsonKey(name: 'sort_by')  SellerSortBy? sortBy, @JsonKey(name: 'sort_direction')  SortDirection? sortDirection)  $default,) {final _that = this;
switch (_that) {
case _SellerSearchFilters():
return $default(_that.search,_that.status,_that.approvalStatus,_that.ratingMin,_that.ratingMax,_that.createdFrom,_that.createdTo,_that.city,_that.region,_that.country,_that.featured,_that.premium,_that.verificationStatus,_that.sortBy,_that.sortDirection);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? search,  int? status, @JsonKey(name: 'approval_status')  int? approvalStatus, @JsonKey(name: 'rating_min')  double? ratingMin, @JsonKey(name: 'rating_max')  double? ratingMax, @JsonKey(name: 'created_from')  DateTime? createdFrom, @JsonKey(name: 'created_to')  DateTime? createdTo,  String? city,  String? region,  String? country, @JsonKey(name: 'featured')  bool? featured, @JsonKey(name: 'premium')  bool? premium, @JsonKey(name: 'verification_status')  String? verificationStatus, @JsonKey(name: 'sort_by')  SellerSortBy? sortBy, @JsonKey(name: 'sort_direction')  SortDirection? sortDirection)?  $default,) {final _that = this;
switch (_that) {
case _SellerSearchFilters() when $default != null:
return $default(_that.search,_that.status,_that.approvalStatus,_that.ratingMin,_that.ratingMax,_that.createdFrom,_that.createdTo,_that.city,_that.region,_that.country,_that.featured,_that.premium,_that.verificationStatus,_that.sortBy,_that.sortDirection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerSearchFilters implements SellerSearchFilters {
  const _SellerSearchFilters({this.search, this.status, @JsonKey(name: 'approval_status') this.approvalStatus, @JsonKey(name: 'rating_min') this.ratingMin, @JsonKey(name: 'rating_max') this.ratingMax, @JsonKey(name: 'created_from') this.createdFrom, @JsonKey(name: 'created_to') this.createdTo, this.city, this.region, this.country, @JsonKey(name: 'featured') this.featured, @JsonKey(name: 'premium') this.premium, @JsonKey(name: 'verification_status') this.verificationStatus, @JsonKey(name: 'sort_by') this.sortBy, @JsonKey(name: 'sort_direction') this.sortDirection});
  factory _SellerSearchFilters.fromJson(Map<String, dynamic> json) => _$SellerSearchFiltersFromJson(json);

@override final  String? search;
@override final  int? status;
@override@JsonKey(name: 'approval_status') final  int? approvalStatus;
@override@JsonKey(name: 'rating_min') final  double? ratingMin;
@override@JsonKey(name: 'rating_max') final  double? ratingMax;
@override@JsonKey(name: 'created_from') final  DateTime? createdFrom;
@override@JsonKey(name: 'created_to') final  DateTime? createdTo;
@override final  String? city;
@override final  String? region;
@override final  String? country;
@override@JsonKey(name: 'featured') final  bool? featured;
@override@JsonKey(name: 'premium') final  bool? premium;
@override@JsonKey(name: 'verification_status') final  String? verificationStatus;
@override@JsonKey(name: 'sort_by') final  SellerSortBy? sortBy;
@override@JsonKey(name: 'sort_direction') final  SortDirection? sortDirection;

/// Create a copy of SellerSearchFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerSearchFiltersCopyWith<_SellerSearchFilters> get copyWith => __$SellerSearchFiltersCopyWithImpl<_SellerSearchFilters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerSearchFiltersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerSearchFilters&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.ratingMin, ratingMin) || other.ratingMin == ratingMin)&&(identical(other.ratingMax, ratingMax) || other.ratingMax == ratingMax)&&(identical(other.createdFrom, createdFrom) || other.createdFrom == createdFrom)&&(identical(other.createdTo, createdTo) || other.createdTo == createdTo)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.country, country) || other.country == country)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.premium, premium) || other.premium == premium)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDirection, sortDirection) || other.sortDirection == sortDirection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,search,status,approvalStatus,ratingMin,ratingMax,createdFrom,createdTo,city,region,country,featured,premium,verificationStatus,sortBy,sortDirection);

@override
String toString() {
  return 'SellerSearchFilters(search: $search, status: $status, approvalStatus: $approvalStatus, ratingMin: $ratingMin, ratingMax: $ratingMax, createdFrom: $createdFrom, createdTo: $createdTo, city: $city, region: $region, country: $country, featured: $featured, premium: $premium, verificationStatus: $verificationStatus, sortBy: $sortBy, sortDirection: $sortDirection)';
}


}

/// @nodoc
abstract mixin class _$SellerSearchFiltersCopyWith<$Res> implements $SellerSearchFiltersCopyWith<$Res> {
  factory _$SellerSearchFiltersCopyWith(_SellerSearchFilters value, $Res Function(_SellerSearchFilters) _then) = __$SellerSearchFiltersCopyWithImpl;
@override @useResult
$Res call({
 String? search, int? status,@JsonKey(name: 'approval_status') int? approvalStatus,@JsonKey(name: 'rating_min') double? ratingMin,@JsonKey(name: 'rating_max') double? ratingMax,@JsonKey(name: 'created_from') DateTime? createdFrom,@JsonKey(name: 'created_to') DateTime? createdTo, String? city, String? region, String? country,@JsonKey(name: 'featured') bool? featured,@JsonKey(name: 'premium') bool? premium,@JsonKey(name: 'verification_status') String? verificationStatus,@JsonKey(name: 'sort_by') SellerSortBy? sortBy,@JsonKey(name: 'sort_direction') SortDirection? sortDirection
});




}
/// @nodoc
class __$SellerSearchFiltersCopyWithImpl<$Res>
    implements _$SellerSearchFiltersCopyWith<$Res> {
  __$SellerSearchFiltersCopyWithImpl(this._self, this._then);

  final _SellerSearchFilters _self;
  final $Res Function(_SellerSearchFilters) _then;

/// Create a copy of SellerSearchFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = freezed,Object? status = freezed,Object? approvalStatus = freezed,Object? ratingMin = freezed,Object? ratingMax = freezed,Object? createdFrom = freezed,Object? createdTo = freezed,Object? city = freezed,Object? region = freezed,Object? country = freezed,Object? featured = freezed,Object? premium = freezed,Object? verificationStatus = freezed,Object? sortBy = freezed,Object? sortDirection = freezed,}) {
  return _then(_SellerSearchFilters(
search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as int?,ratingMin: freezed == ratingMin ? _self.ratingMin : ratingMin // ignore: cast_nullable_to_non_nullable
as double?,ratingMax: freezed == ratingMax ? _self.ratingMax : ratingMax // ignore: cast_nullable_to_non_nullable
as double?,createdFrom: freezed == createdFrom ? _self.createdFrom : createdFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,createdTo: freezed == createdTo ? _self.createdTo : createdTo // ignore: cast_nullable_to_non_nullable
as DateTime?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,featured: freezed == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool?,premium: freezed == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as bool?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SellerSortBy?,sortDirection: freezed == sortDirection ? _self.sortDirection : sortDirection // ignore: cast_nullable_to_non_nullable
as SortDirection?,
  ));
}


}

// dart format on
