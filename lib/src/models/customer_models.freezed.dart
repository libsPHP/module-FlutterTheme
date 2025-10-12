// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Customer {

 int get id; String get email; String? get firstName; String? get lastName; String? get middleName; String? get prefix; String? get suffix; int? get groupId; int? get defaultBilling; int? get defaultShipping; String? get taxvat; DateTime? get createdAt; DateTime? get updatedAt; int? get websiteId; bool? get isSubscribed; int? get gender; List<CustomerAddress>? get addresses; Map<String, dynamic>? get customAttributes; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.websiteId, websiteId) || other.websiteId == websiteId)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,email,firstName,lastName,middleName,prefix,suffix,groupId,defaultBilling,defaultShipping,taxvat,createdAt,updatedAt,websiteId,isSubscribed,gender,const DeepCollectionEquality().hash(addresses),const DeepCollectionEquality().hash(customAttributes),const DeepCollectionEquality().hash(extensionAttributes)]);

@override
String toString() {
  return 'Customer(id: $id, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, groupId: $groupId, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, taxvat: $taxvat, createdAt: $createdAt, updatedAt: $updatedAt, websiteId: $websiteId, isSubscribed: $isSubscribed, gender: $gender, addresses: $addresses, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 int id, String email, String? firstName, String? lastName, String? middleName, String? prefix, String? suffix, int? groupId, int? defaultBilling, int? defaultShipping, String? taxvat, DateTime? createdAt, DateTime? updatedAt, int? websiteId, bool? isSubscribed, int? gender, List<CustomerAddress>? addresses, Map<String, dynamic>? customAttributes, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerCopyWithImpl<$Res>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._self, this._then);

  final Customer _self;
  final $Res Function(Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? groupId = freezed,Object? defaultBilling = freezed,Object? defaultShipping = freezed,Object? taxvat = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? websiteId = freezed,Object? isSubscribed = freezed,Object? gender = freezed,Object? addresses = freezed,Object? customAttributes = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as int?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as int?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,websiteId: freezed == websiteId ? _self.websiteId : websiteId // ignore: cast_nullable_to_non_nullable
as int?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<CustomerAddress>?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Customer].
extension CustomerPatterns on Customer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Customer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Customer value)  $default,){
final _that = this;
switch (_that) {
case _Customer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Customer value)?  $default,){
final _that = this;
switch (_that) {
case _Customer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  int? groupId,  int? defaultBilling,  int? defaultShipping,  String? taxvat,  DateTime? createdAt,  DateTime? updatedAt,  int? websiteId,  bool? isSubscribed,  int? gender,  List<CustomerAddress>? addresses,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.groupId,_that.defaultBilling,_that.defaultShipping,_that.taxvat,_that.createdAt,_that.updatedAt,_that.websiteId,_that.isSubscribed,_that.gender,_that.addresses,_that.customAttributes,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  int? groupId,  int? defaultBilling,  int? defaultShipping,  String? taxvat,  DateTime? createdAt,  DateTime? updatedAt,  int? websiteId,  bool? isSubscribed,  int? gender,  List<CustomerAddress>? addresses,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.groupId,_that.defaultBilling,_that.defaultShipping,_that.taxvat,_that.createdAt,_that.updatedAt,_that.websiteId,_that.isSubscribed,_that.gender,_that.addresses,_that.customAttributes,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  int? groupId,  int? defaultBilling,  int? defaultShipping,  String? taxvat,  DateTime? createdAt,  DateTime? updatedAt,  int? websiteId,  bool? isSubscribed,  int? gender,  List<CustomerAddress>? addresses,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.groupId,_that.defaultBilling,_that.defaultShipping,_that.taxvat,_that.createdAt,_that.updatedAt,_that.websiteId,_that.isSubscribed,_that.gender,_that.addresses,_that.customAttributes,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer extends Customer {
  const _Customer({required this.id, required this.email, this.firstName, this.lastName, this.middleName, this.prefix, this.suffix, this.groupId, this.defaultBilling, this.defaultShipping, this.taxvat, this.createdAt, this.updatedAt, this.websiteId, this.isSubscribed, this.gender, final  List<CustomerAddress>? addresses, final  Map<String, dynamic>? customAttributes, final  Map<String, dynamic>? extensionAttributes}): _addresses = addresses,_customAttributes = customAttributes,_extensionAttributes = extensionAttributes,super._();
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  int id;
@override final  String email;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? middleName;
@override final  String? prefix;
@override final  String? suffix;
@override final  int? groupId;
@override final  int? defaultBilling;
@override final  int? defaultShipping;
@override final  String? taxvat;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  int? websiteId;
@override final  bool? isSubscribed;
@override final  int? gender;
 final  List<CustomerAddress>? _addresses;
@override List<CustomerAddress>? get addresses {
  final value = _addresses;
  if (value == null) return null;
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _customAttributes;
@override Map<String, dynamic>? get customAttributes {
  final value = _customAttributes;
  if (value == null) return null;
  if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCopyWith<_Customer> get copyWith => __$CustomerCopyWithImpl<_Customer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.websiteId, websiteId) || other.websiteId == websiteId)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,email,firstName,lastName,middleName,prefix,suffix,groupId,defaultBilling,defaultShipping,taxvat,createdAt,updatedAt,websiteId,isSubscribed,gender,const DeepCollectionEquality().hash(_addresses),const DeepCollectionEquality().hash(_customAttributes),const DeepCollectionEquality().hash(_extensionAttributes)]);

@override
String toString() {
  return 'Customer(id: $id, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, groupId: $groupId, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, taxvat: $taxvat, createdAt: $createdAt, updatedAt: $updatedAt, websiteId: $websiteId, isSubscribed: $isSubscribed, gender: $gender, addresses: $addresses, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String? firstName, String? lastName, String? middleName, String? prefix, String? suffix, int? groupId, int? defaultBilling, int? defaultShipping, String? taxvat, DateTime? createdAt, DateTime? updatedAt, int? websiteId, bool? isSubscribed, int? gender, List<CustomerAddress>? addresses, Map<String, dynamic>? customAttributes, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerCopyWithImpl<$Res>
    implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(this._self, this._then);

  final _Customer _self;
  final $Res Function(_Customer) _then;

/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? groupId = freezed,Object? defaultBilling = freezed,Object? defaultShipping = freezed,Object? taxvat = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? websiteId = freezed,Object? isSubscribed = freezed,Object? gender = freezed,Object? addresses = freezed,Object? customAttributes = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as int?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as int?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,websiteId: freezed == websiteId ? _self.websiteId : websiteId // ignore: cast_nullable_to_non_nullable
as int?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,addresses: freezed == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<CustomerAddress>?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$Address {

 int? get id; String? get customerId; String? get firstName; String? get lastName; String? get company; List<String>? get street; String? get city; String? get region; String? get regionId; String? get postcode; String? get countryId; String? get telephone; String? get fax; bool? get defaultShipping; bool? get defaultBilling;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.company, company) || other.company == company)&&const DeepCollectionEquality().equals(other.street, street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,firstName,lastName,company,const DeepCollectionEquality().hash(street),city,region,regionId,postcode,countryId,telephone,fax,defaultShipping,defaultBilling);

@override
String toString() {
  return 'Address(id: $id, customerId: $customerId, firstName: $firstName, lastName: $lastName, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, defaultShipping: $defaultShipping, defaultBilling: $defaultBilling)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 int? id, String? customerId, String? firstName, String? lastName, String? company, List<String>? street, String? city, String? region, String? regionId, String? postcode, String? countryId, String? telephone, String? fax, bool? defaultShipping, bool? defaultBilling
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? customerId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? company = freezed,Object? street = freezed,Object? city = freezed,Object? region = freezed,Object? regionId = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? telephone = freezed,Object? fax = freezed,Object? defaultShipping = freezed,Object? defaultBilling = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as List<String>?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as bool?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? customerId,  String? firstName,  String? lastName,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? defaultShipping,  bool? defaultBilling)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.customerId,_that.firstName,_that.lastName,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.defaultShipping,_that.defaultBilling);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? customerId,  String? firstName,  String? lastName,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? defaultShipping,  bool? defaultBilling)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.id,_that.customerId,_that.firstName,_that.lastName,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.defaultShipping,_that.defaultBilling);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? customerId,  String? firstName,  String? lastName,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? defaultShipping,  bool? defaultBilling)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.customerId,_that.firstName,_that.lastName,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.defaultShipping,_that.defaultBilling);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({this.id, this.customerId, this.firstName, this.lastName, this.company, final  List<String>? street, this.city, this.region, this.regionId, this.postcode, this.countryId, this.telephone, this.fax, this.defaultShipping, this.defaultBilling}): _street = street;
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  int? id;
@override final  String? customerId;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? company;
 final  List<String>? _street;
@override List<String>? get street {
  final value = _street;
  if (value == null) return null;
  if (_street is EqualUnmodifiableListView) return _street;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? city;
@override final  String? region;
@override final  String? regionId;
@override final  String? postcode;
@override final  String? countryId;
@override final  String? telephone;
@override final  String? fax;
@override final  bool? defaultShipping;
@override final  bool? defaultBilling;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.company, company) || other.company == company)&&const DeepCollectionEquality().equals(other._street, _street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,firstName,lastName,company,const DeepCollectionEquality().hash(_street),city,region,regionId,postcode,countryId,telephone,fax,defaultShipping,defaultBilling);

@override
String toString() {
  return 'Address(id: $id, customerId: $customerId, firstName: $firstName, lastName: $lastName, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, defaultShipping: $defaultShipping, defaultBilling: $defaultBilling)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? customerId, String? firstName, String? lastName, String? company, List<String>? street, String? city, String? region, String? regionId, String? postcode, String? countryId, String? telephone, String? fax, bool? defaultShipping, bool? defaultBilling
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? customerId = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? company = freezed,Object? street = freezed,Object? city = freezed,Object? region = freezed,Object? regionId = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? telephone = freezed,Object? fax = freezed,Object? defaultShipping = freezed,Object? defaultBilling = freezed,}) {
  return _then(_Address(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self._street : street // ignore: cast_nullable_to_non_nullable
as List<String>?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as bool?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CustomerAddress {

 int get id; String? get customerId; String? get customerAddressId; String? get email; String? get firstName; String? get lastName; String? get middleName; String? get prefix; String? get suffix; String? get company; List<String>? get street; String? get city; String? get region; String? get regionId; String? get regionCode; String? get postcode; String? get countryId; String? get telephone; String? get fax; bool? get isDefaultShipping; bool? get isDefaultBilling; Map<String, dynamic>? get customAttributes; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerAddressCopyWith<CustomerAddress> get copyWith => _$CustomerAddressCopyWithImpl<CustomerAddress>(this as CustomerAddress, _$identity);

  /// Serializes this CustomerAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerAddressId, customerAddressId) || other.customerAddressId == customerAddressId)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&const DeepCollectionEquality().equals(other.street, street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.isDefaultShipping, isDefaultShipping) || other.isDefaultShipping == isDefaultShipping)&&(identical(other.isDefaultBilling, isDefaultBilling) || other.isDefaultBilling == isDefaultBilling)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,customerAddressId,email,firstName,lastName,middleName,prefix,suffix,company,const DeepCollectionEquality().hash(street),city,region,regionId,regionCode,postcode,countryId,telephone,fax,isDefaultShipping,isDefaultBilling,const DeepCollectionEquality().hash(customAttributes),const DeepCollectionEquality().hash(extensionAttributes)]);

@override
String toString() {
  return 'CustomerAddress(id: $id, customerId: $customerId, customerAddressId: $customerAddressId, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, regionCode: $regionCode, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, isDefaultShipping: $isDefaultShipping, isDefaultBilling: $isDefaultBilling, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerAddressCopyWith<$Res>  {
  factory $CustomerAddressCopyWith(CustomerAddress value, $Res Function(CustomerAddress) _then) = _$CustomerAddressCopyWithImpl;
@useResult
$Res call({
 int id, String? customerId, String? customerAddressId, String? email, String? firstName, String? lastName, String? middleName, String? prefix, String? suffix, String? company, List<String>? street, String? city, String? region, String? regionId, String? regionCode, String? postcode, String? countryId, String? telephone, String? fax, bool? isDefaultShipping, bool? isDefaultBilling, Map<String, dynamic>? customAttributes, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerAddressCopyWithImpl<$Res>
    implements $CustomerAddressCopyWith<$Res> {
  _$CustomerAddressCopyWithImpl(this._self, this._then);

  final CustomerAddress _self;
  final $Res Function(CustomerAddress) _then;

/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = freezed,Object? customerAddressId = freezed,Object? email = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = freezed,Object? city = freezed,Object? region = freezed,Object? regionId = freezed,Object? regionCode = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? telephone = freezed,Object? fax = freezed,Object? isDefaultShipping = freezed,Object? isDefaultBilling = freezed,Object? customAttributes = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,customerAddressId: freezed == customerAddressId ? _self.customerAddressId : customerAddressId // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as List<String>?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,regionCode: freezed == regionCode ? _self.regionCode : regionCode // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,isDefaultShipping: freezed == isDefaultShipping ? _self.isDefaultShipping : isDefaultShipping // ignore: cast_nullable_to_non_nullable
as bool?,isDefaultBilling: freezed == isDefaultBilling ? _self.isDefaultBilling : isDefaultBilling // ignore: cast_nullable_to_non_nullable
as bool?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerAddress].
extension CustomerAddressPatterns on CustomerAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerAddress value)  $default,){
final _that = this;
switch (_that) {
case _CustomerAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerAddress value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? customerId,  String? customerAddressId,  String? email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? regionCode,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? isDefaultShipping,  bool? isDefaultBilling,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerAddress() when $default != null:
return $default(_that.id,_that.customerId,_that.customerAddressId,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.regionCode,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.isDefaultShipping,_that.isDefaultBilling,_that.customAttributes,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? customerId,  String? customerAddressId,  String? email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? regionCode,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? isDefaultShipping,  bool? isDefaultBilling,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerAddress():
return $default(_that.id,_that.customerId,_that.customerAddressId,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.regionCode,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.isDefaultShipping,_that.isDefaultBilling,_that.customAttributes,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? customerId,  String? customerAddressId,  String? email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? regionCode,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? isDefaultShipping,  bool? isDefaultBilling,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerAddress() when $default != null:
return $default(_that.id,_that.customerId,_that.customerAddressId,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.regionCode,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.isDefaultShipping,_that.isDefaultBilling,_that.customAttributes,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerAddress implements CustomerAddress {
  const _CustomerAddress({required this.id, this.customerId, this.customerAddressId, this.email, this.firstName, this.lastName, this.middleName, this.prefix, this.suffix, this.company, final  List<String>? street, this.city, this.region, this.regionId, this.regionCode, this.postcode, this.countryId, this.telephone, this.fax, this.isDefaultShipping, this.isDefaultBilling, final  Map<String, dynamic>? customAttributes, final  Map<String, dynamic>? extensionAttributes}): _street = street,_customAttributes = customAttributes,_extensionAttributes = extensionAttributes;
  factory _CustomerAddress.fromJson(Map<String, dynamic> json) => _$CustomerAddressFromJson(json);

@override final  int id;
@override final  String? customerId;
@override final  String? customerAddressId;
@override final  String? email;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? middleName;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? company;
 final  List<String>? _street;
@override List<String>? get street {
  final value = _street;
  if (value == null) return null;
  if (_street is EqualUnmodifiableListView) return _street;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? city;
@override final  String? region;
@override final  String? regionId;
@override final  String? regionCode;
@override final  String? postcode;
@override final  String? countryId;
@override final  String? telephone;
@override final  String? fax;
@override final  bool? isDefaultShipping;
@override final  bool? isDefaultBilling;
 final  Map<String, dynamic>? _customAttributes;
@override Map<String, dynamic>? get customAttributes {
  final value = _customAttributes;
  if (value == null) return null;
  if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerAddressCopyWith<_CustomerAddress> get copyWith => __$CustomerAddressCopyWithImpl<_CustomerAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerAddressId, customerAddressId) || other.customerAddressId == customerAddressId)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&const DeepCollectionEquality().equals(other._street, _street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.isDefaultShipping, isDefaultShipping) || other.isDefaultShipping == isDefaultShipping)&&(identical(other.isDefaultBilling, isDefaultBilling) || other.isDefaultBilling == isDefaultBilling)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,customerAddressId,email,firstName,lastName,middleName,prefix,suffix,company,const DeepCollectionEquality().hash(_street),city,region,regionId,regionCode,postcode,countryId,telephone,fax,isDefaultShipping,isDefaultBilling,const DeepCollectionEquality().hash(_customAttributes),const DeepCollectionEquality().hash(_extensionAttributes)]);

@override
String toString() {
  return 'CustomerAddress(id: $id, customerId: $customerId, customerAddressId: $customerAddressId, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, regionCode: $regionCode, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, isDefaultShipping: $isDefaultShipping, isDefaultBilling: $isDefaultBilling, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerAddressCopyWith<$Res> implements $CustomerAddressCopyWith<$Res> {
  factory _$CustomerAddressCopyWith(_CustomerAddress value, $Res Function(_CustomerAddress) _then) = __$CustomerAddressCopyWithImpl;
@override @useResult
$Res call({
 int id, String? customerId, String? customerAddressId, String? email, String? firstName, String? lastName, String? middleName, String? prefix, String? suffix, String? company, List<String>? street, String? city, String? region, String? regionId, String? regionCode, String? postcode, String? countryId, String? telephone, String? fax, bool? isDefaultShipping, bool? isDefaultBilling, Map<String, dynamic>? customAttributes, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerAddressCopyWithImpl<$Res>
    implements _$CustomerAddressCopyWith<$Res> {
  __$CustomerAddressCopyWithImpl(this._self, this._then);

  final _CustomerAddress _self;
  final $Res Function(_CustomerAddress) _then;

/// Create a copy of CustomerAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = freezed,Object? customerAddressId = freezed,Object? email = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = freezed,Object? city = freezed,Object? region = freezed,Object? regionId = freezed,Object? regionCode = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? telephone = freezed,Object? fax = freezed,Object? isDefaultShipping = freezed,Object? isDefaultBilling = freezed,Object? customAttributes = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerAddress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,customerAddressId: freezed == customerAddressId ? _self.customerAddressId : customerAddressId // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self._street : street // ignore: cast_nullable_to_non_nullable
as List<String>?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,regionCode: freezed == regionCode ? _self.regionCode : regionCode // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,isDefaultShipping: freezed == isDefaultShipping ? _self.isDefaultShipping : isDefaultShipping // ignore: cast_nullable_to_non_nullable
as bool?,isDefaultBilling: freezed == isDefaultBilling ? _self.isDefaultBilling : isDefaultBilling // ignore: cast_nullable_to_non_nullable
as bool?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerGroup {

 int get id; String get code; String get taxClassName; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerGroupCopyWith<CustomerGroup> get copyWith => _$CustomerGroupCopyWithImpl<CustomerGroup>(this as CustomerGroup, _$identity);

  /// Serializes this CustomerGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.taxClassName, taxClassName) || other.taxClassName == taxClassName)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,taxClassName,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerGroup(id: $id, code: $code, taxClassName: $taxClassName, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerGroupCopyWith<$Res>  {
  factory $CustomerGroupCopyWith(CustomerGroup value, $Res Function(CustomerGroup) _then) = _$CustomerGroupCopyWithImpl;
@useResult
$Res call({
 int id, String code, String taxClassName, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerGroupCopyWithImpl<$Res>
    implements $CustomerGroupCopyWith<$Res> {
  _$CustomerGroupCopyWithImpl(this._self, this._then);

  final CustomerGroup _self;
  final $Res Function(CustomerGroup) _then;

/// Create a copy of CustomerGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? taxClassName = null,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,taxClassName: null == taxClassName ? _self.taxClassName : taxClassName // ignore: cast_nullable_to_non_nullable
as String,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerGroup].
extension CustomerGroupPatterns on CustomerGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerGroup value)  $default,){
final _that = this;
switch (_that) {
case _CustomerGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerGroup value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String taxClassName,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerGroup() when $default != null:
return $default(_that.id,_that.code,_that.taxClassName,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String taxClassName,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerGroup():
return $default(_that.id,_that.code,_that.taxClassName,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String taxClassName,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerGroup() when $default != null:
return $default(_that.id,_that.code,_that.taxClassName,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerGroup implements CustomerGroup {
  const _CustomerGroup({required this.id, required this.code, required this.taxClassName, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CustomerGroup.fromJson(Map<String, dynamic> json) => _$CustomerGroupFromJson(json);

@override final  int id;
@override final  String code;
@override final  String taxClassName;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerGroupCopyWith<_CustomerGroup> get copyWith => __$CustomerGroupCopyWithImpl<_CustomerGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.taxClassName, taxClassName) || other.taxClassName == taxClassName)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,taxClassName,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerGroup(id: $id, code: $code, taxClassName: $taxClassName, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerGroupCopyWith<$Res> implements $CustomerGroupCopyWith<$Res> {
  factory _$CustomerGroupCopyWith(_CustomerGroup value, $Res Function(_CustomerGroup) _then) = __$CustomerGroupCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String taxClassName, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerGroupCopyWithImpl<$Res>
    implements _$CustomerGroupCopyWith<$Res> {
  __$CustomerGroupCopyWithImpl(this._self, this._then);

  final _CustomerGroup _self;
  final $Res Function(_CustomerGroup) _then;

/// Create a copy of CustomerGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? taxClassName = null,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,taxClassName: null == taxClassName ? _self.taxClassName : taxClassName // ignore: cast_nullable_to_non_nullable
as String,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerAttribute {

 String get attributeCode; String get frontendInput; String get frontendLabel; bool get isRequired; bool get isUserDefined; bool get isVisible; bool get isSystem; int get sortOrder; String? get defaultValue; List<CustomerAttributeOption>? get options; Map<String, dynamic>? get validationRules; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerAttributeCopyWith<CustomerAttribute> get copyWith => _$CustomerAttributeCopyWithImpl<CustomerAttribute>(this as CustomerAttribute, _$identity);

  /// Serializes this CustomerAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerAttribute&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.frontendInput, frontendInput) || other.frontendInput == frontendInput)&&(identical(other.frontendLabel, frontendLabel) || other.frontendLabel == frontendLabel)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isUserDefined, isUserDefined) || other.isUserDefined == isUserDefined)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.validationRules, validationRules)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,frontendInput,frontendLabel,isRequired,isUserDefined,isVisible,isSystem,sortOrder,defaultValue,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(validationRules),const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerAttribute(attributeCode: $attributeCode, frontendInput: $frontendInput, frontendLabel: $frontendLabel, isRequired: $isRequired, isUserDefined: $isUserDefined, isVisible: $isVisible, isSystem: $isSystem, sortOrder: $sortOrder, defaultValue: $defaultValue, options: $options, validationRules: $validationRules, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerAttributeCopyWith<$Res>  {
  factory $CustomerAttributeCopyWith(CustomerAttribute value, $Res Function(CustomerAttribute) _then) = _$CustomerAttributeCopyWithImpl;
@useResult
$Res call({
 String attributeCode, String frontendInput, String frontendLabel, bool isRequired, bool isUserDefined, bool isVisible, bool isSystem, int sortOrder, String? defaultValue, List<CustomerAttributeOption>? options, Map<String, dynamic>? validationRules, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerAttributeCopyWithImpl<$Res>
    implements $CustomerAttributeCopyWith<$Res> {
  _$CustomerAttributeCopyWithImpl(this._self, this._then);

  final CustomerAttribute _self;
  final $Res Function(CustomerAttribute) _then;

/// Create a copy of CustomerAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributeCode = null,Object? frontendInput = null,Object? frontendLabel = null,Object? isRequired = null,Object? isUserDefined = null,Object? isVisible = null,Object? isSystem = null,Object? sortOrder = null,Object? defaultValue = freezed,Object? options = freezed,Object? validationRules = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,frontendInput: null == frontendInput ? _self.frontendInput : frontendInput // ignore: cast_nullable_to_non_nullable
as String,frontendLabel: null == frontendLabel ? _self.frontendLabel : frontendLabel // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isUserDefined: null == isUserDefined ? _self.isUserDefined : isUserDefined // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<CustomerAttributeOption>?,validationRules: freezed == validationRules ? _self.validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerAttribute].
extension CustomerAttributePatterns on CustomerAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerAttribute value)  $default,){
final _that = this;
switch (_that) {
case _CustomerAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String attributeCode,  String frontendInput,  String frontendLabel,  bool isRequired,  bool isUserDefined,  bool isVisible,  bool isSystem,  int sortOrder,  String? defaultValue,  List<CustomerAttributeOption>? options,  Map<String, dynamic>? validationRules,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerAttribute() when $default != null:
return $default(_that.attributeCode,_that.frontendInput,_that.frontendLabel,_that.isRequired,_that.isUserDefined,_that.isVisible,_that.isSystem,_that.sortOrder,_that.defaultValue,_that.options,_that.validationRules,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String attributeCode,  String frontendInput,  String frontendLabel,  bool isRequired,  bool isUserDefined,  bool isVisible,  bool isSystem,  int sortOrder,  String? defaultValue,  List<CustomerAttributeOption>? options,  Map<String, dynamic>? validationRules,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerAttribute():
return $default(_that.attributeCode,_that.frontendInput,_that.frontendLabel,_that.isRequired,_that.isUserDefined,_that.isVisible,_that.isSystem,_that.sortOrder,_that.defaultValue,_that.options,_that.validationRules,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String attributeCode,  String frontendInput,  String frontendLabel,  bool isRequired,  bool isUserDefined,  bool isVisible,  bool isSystem,  int sortOrder,  String? defaultValue,  List<CustomerAttributeOption>? options,  Map<String, dynamic>? validationRules,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerAttribute() when $default != null:
return $default(_that.attributeCode,_that.frontendInput,_that.frontendLabel,_that.isRequired,_that.isUserDefined,_that.isVisible,_that.isSystem,_that.sortOrder,_that.defaultValue,_that.options,_that.validationRules,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerAttribute implements CustomerAttribute {
  const _CustomerAttribute({required this.attributeCode, required this.frontendInput, required this.frontendLabel, required this.isRequired, required this.isUserDefined, required this.isVisible, required this.isSystem, required this.sortOrder, this.defaultValue, final  List<CustomerAttributeOption>? options, final  Map<String, dynamic>? validationRules, final  Map<String, dynamic>? extensionAttributes}): _options = options,_validationRules = validationRules,_extensionAttributes = extensionAttributes;
  factory _CustomerAttribute.fromJson(Map<String, dynamic> json) => _$CustomerAttributeFromJson(json);

@override final  String attributeCode;
@override final  String frontendInput;
@override final  String frontendLabel;
@override final  bool isRequired;
@override final  bool isUserDefined;
@override final  bool isVisible;
@override final  bool isSystem;
@override final  int sortOrder;
@override final  String? defaultValue;
 final  List<CustomerAttributeOption>? _options;
@override List<CustomerAttributeOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _validationRules;
@override Map<String, dynamic>? get validationRules {
  final value = _validationRules;
  if (value == null) return null;
  if (_validationRules is EqualUnmodifiableMapView) return _validationRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerAttributeCopyWith<_CustomerAttribute> get copyWith => __$CustomerAttributeCopyWithImpl<_CustomerAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerAttribute&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.frontendInput, frontendInput) || other.frontendInput == frontendInput)&&(identical(other.frontendLabel, frontendLabel) || other.frontendLabel == frontendLabel)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isUserDefined, isUserDefined) || other.isUserDefined == isUserDefined)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._validationRules, _validationRules)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,frontendInput,frontendLabel,isRequired,isUserDefined,isVisible,isSystem,sortOrder,defaultValue,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_validationRules),const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerAttribute(attributeCode: $attributeCode, frontendInput: $frontendInput, frontendLabel: $frontendLabel, isRequired: $isRequired, isUserDefined: $isUserDefined, isVisible: $isVisible, isSystem: $isSystem, sortOrder: $sortOrder, defaultValue: $defaultValue, options: $options, validationRules: $validationRules, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerAttributeCopyWith<$Res> implements $CustomerAttributeCopyWith<$Res> {
  factory _$CustomerAttributeCopyWith(_CustomerAttribute value, $Res Function(_CustomerAttribute) _then) = __$CustomerAttributeCopyWithImpl;
@override @useResult
$Res call({
 String attributeCode, String frontendInput, String frontendLabel, bool isRequired, bool isUserDefined, bool isVisible, bool isSystem, int sortOrder, String? defaultValue, List<CustomerAttributeOption>? options, Map<String, dynamic>? validationRules, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerAttributeCopyWithImpl<$Res>
    implements _$CustomerAttributeCopyWith<$Res> {
  __$CustomerAttributeCopyWithImpl(this._self, this._then);

  final _CustomerAttribute _self;
  final $Res Function(_CustomerAttribute) _then;

/// Create a copy of CustomerAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributeCode = null,Object? frontendInput = null,Object? frontendLabel = null,Object? isRequired = null,Object? isUserDefined = null,Object? isVisible = null,Object? isSystem = null,Object? sortOrder = null,Object? defaultValue = freezed,Object? options = freezed,Object? validationRules = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerAttribute(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,frontendInput: null == frontendInput ? _self.frontendInput : frontendInput // ignore: cast_nullable_to_non_nullable
as String,frontendLabel: null == frontendLabel ? _self.frontendLabel : frontendLabel // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,isUserDefined: null == isUserDefined ? _self.isUserDefined : isUserDefined // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<CustomerAttributeOption>?,validationRules: freezed == validationRules ? _self._validationRules : validationRules // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerAttributeOption {

 String get value; String get label; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerAttributeOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerAttributeOptionCopyWith<CustomerAttributeOption> get copyWith => _$CustomerAttributeOptionCopyWithImpl<CustomerAttributeOption>(this as CustomerAttributeOption, _$identity);

  /// Serializes this CustomerAttributeOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerAttributeOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerAttributeOption(value: $value, label: $label, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerAttributeOptionCopyWith<$Res>  {
  factory $CustomerAttributeOptionCopyWith(CustomerAttributeOption value, $Res Function(CustomerAttributeOption) _then) = _$CustomerAttributeOptionCopyWithImpl;
@useResult
$Res call({
 String value, String label, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerAttributeOptionCopyWithImpl<$Res>
    implements $CustomerAttributeOptionCopyWith<$Res> {
  _$CustomerAttributeOptionCopyWithImpl(this._self, this._then);

  final CustomerAttributeOption _self;
  final $Res Function(CustomerAttributeOption) _then;

/// Create a copy of CustomerAttributeOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerAttributeOption].
extension CustomerAttributeOptionPatterns on CustomerAttributeOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerAttributeOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerAttributeOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerAttributeOption value)  $default,){
final _that = this;
switch (_that) {
case _CustomerAttributeOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerAttributeOption value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerAttributeOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerAttributeOption() when $default != null:
return $default(_that.value,_that.label,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerAttributeOption():
return $default(_that.value,_that.label,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerAttributeOption() when $default != null:
return $default(_that.value,_that.label,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerAttributeOption implements CustomerAttributeOption {
  const _CustomerAttributeOption({required this.value, required this.label, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CustomerAttributeOption.fromJson(Map<String, dynamic> json) => _$CustomerAttributeOptionFromJson(json);

@override final  String value;
@override final  String label;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerAttributeOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerAttributeOptionCopyWith<_CustomerAttributeOption> get copyWith => __$CustomerAttributeOptionCopyWithImpl<_CustomerAttributeOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerAttributeOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerAttributeOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerAttributeOption(value: $value, label: $label, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerAttributeOptionCopyWith<$Res> implements $CustomerAttributeOptionCopyWith<$Res> {
  factory _$CustomerAttributeOptionCopyWith(_CustomerAttributeOption value, $Res Function(_CustomerAttributeOption) _then) = __$CustomerAttributeOptionCopyWithImpl;
@override @useResult
$Res call({
 String value, String label, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerAttributeOptionCopyWithImpl<$Res>
    implements _$CustomerAttributeOptionCopyWith<$Res> {
  __$CustomerAttributeOptionCopyWithImpl(this._self, this._then);

  final _CustomerAttributeOption _self;
  final $Res Function(_CustomerAttributeOption) _then;

/// Create a copy of CustomerAttributeOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerAttributeOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerPreferences {

 String? get language; String? get currency; String? get timezone; bool? get newsletterSubscription; Map<String, dynamic>? get additionalPreferences; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerPreferencesCopyWith<CustomerPreferences> get copyWith => _$CustomerPreferencesCopyWithImpl<CustomerPreferences>(this as CustomerPreferences, _$identity);

  /// Serializes this CustomerPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerPreferences&&(identical(other.language, language) || other.language == language)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.newsletterSubscription, newsletterSubscription) || other.newsletterSubscription == newsletterSubscription)&&const DeepCollectionEquality().equals(other.additionalPreferences, additionalPreferences)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,currency,timezone,newsletterSubscription,const DeepCollectionEquality().hash(additionalPreferences),const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerPreferences(language: $language, currency: $currency, timezone: $timezone, newsletterSubscription: $newsletterSubscription, additionalPreferences: $additionalPreferences, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerPreferencesCopyWith<$Res>  {
  factory $CustomerPreferencesCopyWith(CustomerPreferences value, $Res Function(CustomerPreferences) _then) = _$CustomerPreferencesCopyWithImpl;
@useResult
$Res call({
 String? language, String? currency, String? timezone, bool? newsletterSubscription, Map<String, dynamic>? additionalPreferences, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerPreferencesCopyWithImpl<$Res>
    implements $CustomerPreferencesCopyWith<$Res> {
  _$CustomerPreferencesCopyWithImpl(this._self, this._then);

  final CustomerPreferences _self;
  final $Res Function(CustomerPreferences) _then;

/// Create a copy of CustomerPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = freezed,Object? currency = freezed,Object? timezone = freezed,Object? newsletterSubscription = freezed,Object? additionalPreferences = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,newsletterSubscription: freezed == newsletterSubscription ? _self.newsletterSubscription : newsletterSubscription // ignore: cast_nullable_to_non_nullable
as bool?,additionalPreferences: freezed == additionalPreferences ? _self.additionalPreferences : additionalPreferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerPreferences].
extension CustomerPreferencesPatterns on CustomerPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerPreferences value)  $default,){
final _that = this;
switch (_that) {
case _CustomerPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? language,  String? currency,  String? timezone,  bool? newsletterSubscription,  Map<String, dynamic>? additionalPreferences,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerPreferences() when $default != null:
return $default(_that.language,_that.currency,_that.timezone,_that.newsletterSubscription,_that.additionalPreferences,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? language,  String? currency,  String? timezone,  bool? newsletterSubscription,  Map<String, dynamic>? additionalPreferences,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerPreferences():
return $default(_that.language,_that.currency,_that.timezone,_that.newsletterSubscription,_that.additionalPreferences,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? language,  String? currency,  String? timezone,  bool? newsletterSubscription,  Map<String, dynamic>? additionalPreferences,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerPreferences() when $default != null:
return $default(_that.language,_that.currency,_that.timezone,_that.newsletterSubscription,_that.additionalPreferences,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerPreferences implements CustomerPreferences {
  const _CustomerPreferences({this.language, this.currency, this.timezone, this.newsletterSubscription, final  Map<String, dynamic>? additionalPreferences, final  Map<String, dynamic>? extensionAttributes}): _additionalPreferences = additionalPreferences,_extensionAttributes = extensionAttributes;
  factory _CustomerPreferences.fromJson(Map<String, dynamic> json) => _$CustomerPreferencesFromJson(json);

@override final  String? language;
@override final  String? currency;
@override final  String? timezone;
@override final  bool? newsletterSubscription;
 final  Map<String, dynamic>? _additionalPreferences;
@override Map<String, dynamic>? get additionalPreferences {
  final value = _additionalPreferences;
  if (value == null) return null;
  if (_additionalPreferences is EqualUnmodifiableMapView) return _additionalPreferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerPreferencesCopyWith<_CustomerPreferences> get copyWith => __$CustomerPreferencesCopyWithImpl<_CustomerPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerPreferences&&(identical(other.language, language) || other.language == language)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.newsletterSubscription, newsletterSubscription) || other.newsletterSubscription == newsletterSubscription)&&const DeepCollectionEquality().equals(other._additionalPreferences, _additionalPreferences)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,currency,timezone,newsletterSubscription,const DeepCollectionEquality().hash(_additionalPreferences),const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerPreferences(language: $language, currency: $currency, timezone: $timezone, newsletterSubscription: $newsletterSubscription, additionalPreferences: $additionalPreferences, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerPreferencesCopyWith<$Res> implements $CustomerPreferencesCopyWith<$Res> {
  factory _$CustomerPreferencesCopyWith(_CustomerPreferences value, $Res Function(_CustomerPreferences) _then) = __$CustomerPreferencesCopyWithImpl;
@override @useResult
$Res call({
 String? language, String? currency, String? timezone, bool? newsletterSubscription, Map<String, dynamic>? additionalPreferences, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerPreferencesCopyWithImpl<$Res>
    implements _$CustomerPreferencesCopyWith<$Res> {
  __$CustomerPreferencesCopyWithImpl(this._self, this._then);

  final _CustomerPreferences _self;
  final $Res Function(_CustomerPreferences) _then;

/// Create a copy of CustomerPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = freezed,Object? currency = freezed,Object? timezone = freezed,Object? newsletterSubscription = freezed,Object? additionalPreferences = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerPreferences(
language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,timezone: freezed == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String?,newsletterSubscription: freezed == newsletterSubscription ? _self.newsletterSubscription : newsletterSubscription // ignore: cast_nullable_to_non_nullable
as bool?,additionalPreferences: freezed == additionalPreferences ? _self._additionalPreferences : additionalPreferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerActivity {

 String get id; String get type; String get description; DateTime get timestamp; Map<String, dynamic>? get metadata; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerActivityCopyWith<CustomerActivity> get copyWith => _$CustomerActivityCopyWithImpl<CustomerActivity>(this as CustomerActivity, _$identity);

  /// Serializes this CustomerActivity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerActivity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,description,timestamp,const DeepCollectionEquality().hash(metadata),const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerActivity(id: $id, type: $type, description: $description, timestamp: $timestamp, metadata: $metadata, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerActivityCopyWith<$Res>  {
  factory $CustomerActivityCopyWith(CustomerActivity value, $Res Function(CustomerActivity) _then) = _$CustomerActivityCopyWithImpl;
@useResult
$Res call({
 String id, String type, String description, DateTime timestamp, Map<String, dynamic>? metadata, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerActivityCopyWithImpl<$Res>
    implements $CustomerActivityCopyWith<$Res> {
  _$CustomerActivityCopyWithImpl(this._self, this._then);

  final CustomerActivity _self;
  final $Res Function(CustomerActivity) _then;

/// Create a copy of CustomerActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? description = null,Object? timestamp = null,Object? metadata = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerActivity].
extension CustomerActivityPatterns on CustomerActivity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerActivity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerActivity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerActivity value)  $default,){
final _that = this;
switch (_that) {
case _CustomerActivity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerActivity value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerActivity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String description,  DateTime timestamp,  Map<String, dynamic>? metadata,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerActivity() when $default != null:
return $default(_that.id,_that.type,_that.description,_that.timestamp,_that.metadata,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String description,  DateTime timestamp,  Map<String, dynamic>? metadata,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerActivity():
return $default(_that.id,_that.type,_that.description,_that.timestamp,_that.metadata,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String description,  DateTime timestamp,  Map<String, dynamic>? metadata,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerActivity() when $default != null:
return $default(_that.id,_that.type,_that.description,_that.timestamp,_that.metadata,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerActivity implements CustomerActivity {
  const _CustomerActivity({required this.id, required this.type, required this.description, required this.timestamp, final  Map<String, dynamic>? metadata, final  Map<String, dynamic>? extensionAttributes}): _metadata = metadata,_extensionAttributes = extensionAttributes;
  factory _CustomerActivity.fromJson(Map<String, dynamic> json) => _$CustomerActivityFromJson(json);

@override final  String id;
@override final  String type;
@override final  String description;
@override final  DateTime timestamp;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerActivity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerActivityCopyWith<_CustomerActivity> get copyWith => __$CustomerActivityCopyWithImpl<_CustomerActivity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerActivityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerActivity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,description,timestamp,const DeepCollectionEquality().hash(_metadata),const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerActivity(id: $id, type: $type, description: $description, timestamp: $timestamp, metadata: $metadata, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerActivityCopyWith<$Res> implements $CustomerActivityCopyWith<$Res> {
  factory _$CustomerActivityCopyWith(_CustomerActivity value, $Res Function(_CustomerActivity) _then) = __$CustomerActivityCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String description, DateTime timestamp, Map<String, dynamic>? metadata, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerActivityCopyWithImpl<$Res>
    implements _$CustomerActivityCopyWith<$Res> {
  __$CustomerActivityCopyWithImpl(this._self, this._then);

  final _CustomerActivity _self;
  final $Res Function(_CustomerActivity) _then;

/// Create a copy of CustomerActivity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? description = null,Object? timestamp = null,Object? metadata = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerActivity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerStatistics {

 int get totalOrders; double get totalSpent; int get totalProductsPurchased; DateTime get firstOrderDate; DateTime? get lastOrderDate; double get averageOrderValue; int get wishlistItems; int get cartItems; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerStatisticsCopyWith<CustomerStatistics> get copyWith => _$CustomerStatisticsCopyWithImpl<CustomerStatistics>(this as CustomerStatistics, _$identity);

  /// Serializes this CustomerStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerStatistics&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&(identical(other.totalProductsPurchased, totalProductsPurchased) || other.totalProductsPurchased == totalProductsPurchased)&&(identical(other.firstOrderDate, firstOrderDate) || other.firstOrderDate == firstOrderDate)&&(identical(other.lastOrderDate, lastOrderDate) || other.lastOrderDate == lastOrderDate)&&(identical(other.averageOrderValue, averageOrderValue) || other.averageOrderValue == averageOrderValue)&&(identical(other.wishlistItems, wishlistItems) || other.wishlistItems == wishlistItems)&&(identical(other.cartItems, cartItems) || other.cartItems == cartItems)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalOrders,totalSpent,totalProductsPurchased,firstOrderDate,lastOrderDate,averageOrderValue,wishlistItems,cartItems,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerStatistics(totalOrders: $totalOrders, totalSpent: $totalSpent, totalProductsPurchased: $totalProductsPurchased, firstOrderDate: $firstOrderDate, lastOrderDate: $lastOrderDate, averageOrderValue: $averageOrderValue, wishlistItems: $wishlistItems, cartItems: $cartItems, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerStatisticsCopyWith<$Res>  {
  factory $CustomerStatisticsCopyWith(CustomerStatistics value, $Res Function(CustomerStatistics) _then) = _$CustomerStatisticsCopyWithImpl;
@useResult
$Res call({
 int totalOrders, double totalSpent, int totalProductsPurchased, DateTime firstOrderDate, DateTime? lastOrderDate, double averageOrderValue, int wishlistItems, int cartItems, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerStatisticsCopyWithImpl<$Res>
    implements $CustomerStatisticsCopyWith<$Res> {
  _$CustomerStatisticsCopyWithImpl(this._self, this._then);

  final CustomerStatistics _self;
  final $Res Function(CustomerStatistics) _then;

/// Create a copy of CustomerStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalOrders = null,Object? totalSpent = null,Object? totalProductsPurchased = null,Object? firstOrderDate = null,Object? lastOrderDate = freezed,Object? averageOrderValue = null,Object? wishlistItems = null,Object? cartItems = null,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,totalProductsPurchased: null == totalProductsPurchased ? _self.totalProductsPurchased : totalProductsPurchased // ignore: cast_nullable_to_non_nullable
as int,firstOrderDate: null == firstOrderDate ? _self.firstOrderDate : firstOrderDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastOrderDate: freezed == lastOrderDate ? _self.lastOrderDate : lastOrderDate // ignore: cast_nullable_to_non_nullable
as DateTime?,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as double,wishlistItems: null == wishlistItems ? _self.wishlistItems : wishlistItems // ignore: cast_nullable_to_non_nullable
as int,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as int,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerStatistics].
extension CustomerStatisticsPatterns on CustomerStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerStatistics value)  $default,){
final _that = this;
switch (_that) {
case _CustomerStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalOrders,  double totalSpent,  int totalProductsPurchased,  DateTime firstOrderDate,  DateTime? lastOrderDate,  double averageOrderValue,  int wishlistItems,  int cartItems,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerStatistics() when $default != null:
return $default(_that.totalOrders,_that.totalSpent,_that.totalProductsPurchased,_that.firstOrderDate,_that.lastOrderDate,_that.averageOrderValue,_that.wishlistItems,_that.cartItems,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalOrders,  double totalSpent,  int totalProductsPurchased,  DateTime firstOrderDate,  DateTime? lastOrderDate,  double averageOrderValue,  int wishlistItems,  int cartItems,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerStatistics():
return $default(_that.totalOrders,_that.totalSpent,_that.totalProductsPurchased,_that.firstOrderDate,_that.lastOrderDate,_that.averageOrderValue,_that.wishlistItems,_that.cartItems,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalOrders,  double totalSpent,  int totalProductsPurchased,  DateTime firstOrderDate,  DateTime? lastOrderDate,  double averageOrderValue,  int wishlistItems,  int cartItems,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerStatistics() when $default != null:
return $default(_that.totalOrders,_that.totalSpent,_that.totalProductsPurchased,_that.firstOrderDate,_that.lastOrderDate,_that.averageOrderValue,_that.wishlistItems,_that.cartItems,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerStatistics implements CustomerStatistics {
  const _CustomerStatistics({required this.totalOrders, required this.totalSpent, required this.totalProductsPurchased, required this.firstOrderDate, this.lastOrderDate, required this.averageOrderValue, required this.wishlistItems, required this.cartItems, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CustomerStatistics.fromJson(Map<String, dynamic> json) => _$CustomerStatisticsFromJson(json);

@override final  int totalOrders;
@override final  double totalSpent;
@override final  int totalProductsPurchased;
@override final  DateTime firstOrderDate;
@override final  DateTime? lastOrderDate;
@override final  double averageOrderValue;
@override final  int wishlistItems;
@override final  int cartItems;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerStatisticsCopyWith<_CustomerStatistics> get copyWith => __$CustomerStatisticsCopyWithImpl<_CustomerStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerStatistics&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&(identical(other.totalProductsPurchased, totalProductsPurchased) || other.totalProductsPurchased == totalProductsPurchased)&&(identical(other.firstOrderDate, firstOrderDate) || other.firstOrderDate == firstOrderDate)&&(identical(other.lastOrderDate, lastOrderDate) || other.lastOrderDate == lastOrderDate)&&(identical(other.averageOrderValue, averageOrderValue) || other.averageOrderValue == averageOrderValue)&&(identical(other.wishlistItems, wishlistItems) || other.wishlistItems == wishlistItems)&&(identical(other.cartItems, cartItems) || other.cartItems == cartItems)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalOrders,totalSpent,totalProductsPurchased,firstOrderDate,lastOrderDate,averageOrderValue,wishlistItems,cartItems,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerStatistics(totalOrders: $totalOrders, totalSpent: $totalSpent, totalProductsPurchased: $totalProductsPurchased, firstOrderDate: $firstOrderDate, lastOrderDate: $lastOrderDate, averageOrderValue: $averageOrderValue, wishlistItems: $wishlistItems, cartItems: $cartItems, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerStatisticsCopyWith<$Res> implements $CustomerStatisticsCopyWith<$Res> {
  factory _$CustomerStatisticsCopyWith(_CustomerStatistics value, $Res Function(_CustomerStatistics) _then) = __$CustomerStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalOrders, double totalSpent, int totalProductsPurchased, DateTime firstOrderDate, DateTime? lastOrderDate, double averageOrderValue, int wishlistItems, int cartItems, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerStatisticsCopyWithImpl<$Res>
    implements _$CustomerStatisticsCopyWith<$Res> {
  __$CustomerStatisticsCopyWithImpl(this._self, this._then);

  final _CustomerStatistics _self;
  final $Res Function(_CustomerStatistics) _then;

/// Create a copy of CustomerStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalOrders = null,Object? totalSpent = null,Object? totalProductsPurchased = null,Object? firstOrderDate = null,Object? lastOrderDate = freezed,Object? averageOrderValue = null,Object? wishlistItems = null,Object? cartItems = null,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerStatistics(
totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,totalProductsPurchased: null == totalProductsPurchased ? _self.totalProductsPurchased : totalProductsPurchased // ignore: cast_nullable_to_non_nullable
as int,firstOrderDate: null == firstOrderDate ? _self.firstOrderDate : firstOrderDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastOrderDate: freezed == lastOrderDate ? _self.lastOrderDate : lastOrderDate // ignore: cast_nullable_to_non_nullable
as DateTime?,averageOrderValue: null == averageOrderValue ? _self.averageOrderValue : averageOrderValue // ignore: cast_nullable_to_non_nullable
as double,wishlistItems: null == wishlistItems ? _self.wishlistItems : wishlistItems // ignore: cast_nullable_to_non_nullable
as int,cartItems: null == cartItems ? _self.cartItems : cartItems // ignore: cast_nullable_to_non_nullable
as int,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerNotificationPreferences {

 bool get emailNotifications; bool get smsNotifications; bool get pushNotifications; bool get orderUpdates; bool get promotionalOffers; bool get productRecommendations; bool get priceAlerts; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerNotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerNotificationPreferencesCopyWith<CustomerNotificationPreferences> get copyWith => _$CustomerNotificationPreferencesCopyWithImpl<CustomerNotificationPreferences>(this as CustomerNotificationPreferences, _$identity);

  /// Serializes this CustomerNotificationPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerNotificationPreferences&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.smsNotifications, smsNotifications) || other.smsNotifications == smsNotifications)&&(identical(other.pushNotifications, pushNotifications) || other.pushNotifications == pushNotifications)&&(identical(other.orderUpdates, orderUpdates) || other.orderUpdates == orderUpdates)&&(identical(other.promotionalOffers, promotionalOffers) || other.promotionalOffers == promotionalOffers)&&(identical(other.productRecommendations, productRecommendations) || other.productRecommendations == productRecommendations)&&(identical(other.priceAlerts, priceAlerts) || other.priceAlerts == priceAlerts)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emailNotifications,smsNotifications,pushNotifications,orderUpdates,promotionalOffers,productRecommendations,priceAlerts,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerNotificationPreferences(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderUpdates: $orderUpdates, promotionalOffers: $promotionalOffers, productRecommendations: $productRecommendations, priceAlerts: $priceAlerts, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerNotificationPreferencesCopyWith<$Res>  {
  factory $CustomerNotificationPreferencesCopyWith(CustomerNotificationPreferences value, $Res Function(CustomerNotificationPreferences) _then) = _$CustomerNotificationPreferencesCopyWithImpl;
@useResult
$Res call({
 bool emailNotifications, bool smsNotifications, bool pushNotifications, bool orderUpdates, bool promotionalOffers, bool productRecommendations, bool priceAlerts, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerNotificationPreferencesCopyWithImpl<$Res>
    implements $CustomerNotificationPreferencesCopyWith<$Res> {
  _$CustomerNotificationPreferencesCopyWithImpl(this._self, this._then);

  final CustomerNotificationPreferences _self;
  final $Res Function(CustomerNotificationPreferences) _then;

/// Create a copy of CustomerNotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailNotifications = null,Object? smsNotifications = null,Object? pushNotifications = null,Object? orderUpdates = null,Object? promotionalOffers = null,Object? productRecommendations = null,Object? priceAlerts = null,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
emailNotifications: null == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool,smsNotifications: null == smsNotifications ? _self.smsNotifications : smsNotifications // ignore: cast_nullable_to_non_nullable
as bool,pushNotifications: null == pushNotifications ? _self.pushNotifications : pushNotifications // ignore: cast_nullable_to_non_nullable
as bool,orderUpdates: null == orderUpdates ? _self.orderUpdates : orderUpdates // ignore: cast_nullable_to_non_nullable
as bool,promotionalOffers: null == promotionalOffers ? _self.promotionalOffers : promotionalOffers // ignore: cast_nullable_to_non_nullable
as bool,productRecommendations: null == productRecommendations ? _self.productRecommendations : productRecommendations // ignore: cast_nullable_to_non_nullable
as bool,priceAlerts: null == priceAlerts ? _self.priceAlerts : priceAlerts // ignore: cast_nullable_to_non_nullable
as bool,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerNotificationPreferences].
extension CustomerNotificationPreferencesPatterns on CustomerNotificationPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerNotificationPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerNotificationPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerNotificationPreferences value)  $default,){
final _that = this;
switch (_that) {
case _CustomerNotificationPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerNotificationPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerNotificationPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool emailNotifications,  bool smsNotifications,  bool pushNotifications,  bool orderUpdates,  bool promotionalOffers,  bool productRecommendations,  bool priceAlerts,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerNotificationPreferences() when $default != null:
return $default(_that.emailNotifications,_that.smsNotifications,_that.pushNotifications,_that.orderUpdates,_that.promotionalOffers,_that.productRecommendations,_that.priceAlerts,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool emailNotifications,  bool smsNotifications,  bool pushNotifications,  bool orderUpdates,  bool promotionalOffers,  bool productRecommendations,  bool priceAlerts,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerNotificationPreferences():
return $default(_that.emailNotifications,_that.smsNotifications,_that.pushNotifications,_that.orderUpdates,_that.promotionalOffers,_that.productRecommendations,_that.priceAlerts,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool emailNotifications,  bool smsNotifications,  bool pushNotifications,  bool orderUpdates,  bool promotionalOffers,  bool productRecommendations,  bool priceAlerts,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerNotificationPreferences() when $default != null:
return $default(_that.emailNotifications,_that.smsNotifications,_that.pushNotifications,_that.orderUpdates,_that.promotionalOffers,_that.productRecommendations,_that.priceAlerts,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerNotificationPreferences implements CustomerNotificationPreferences {
  const _CustomerNotificationPreferences({required this.emailNotifications, required this.smsNotifications, required this.pushNotifications, required this.orderUpdates, required this.promotionalOffers, required this.productRecommendations, required this.priceAlerts, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CustomerNotificationPreferences.fromJson(Map<String, dynamic> json) => _$CustomerNotificationPreferencesFromJson(json);

@override final  bool emailNotifications;
@override final  bool smsNotifications;
@override final  bool pushNotifications;
@override final  bool orderUpdates;
@override final  bool promotionalOffers;
@override final  bool productRecommendations;
@override final  bool priceAlerts;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerNotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerNotificationPreferencesCopyWith<_CustomerNotificationPreferences> get copyWith => __$CustomerNotificationPreferencesCopyWithImpl<_CustomerNotificationPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerNotificationPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerNotificationPreferences&&(identical(other.emailNotifications, emailNotifications) || other.emailNotifications == emailNotifications)&&(identical(other.smsNotifications, smsNotifications) || other.smsNotifications == smsNotifications)&&(identical(other.pushNotifications, pushNotifications) || other.pushNotifications == pushNotifications)&&(identical(other.orderUpdates, orderUpdates) || other.orderUpdates == orderUpdates)&&(identical(other.promotionalOffers, promotionalOffers) || other.promotionalOffers == promotionalOffers)&&(identical(other.productRecommendations, productRecommendations) || other.productRecommendations == productRecommendations)&&(identical(other.priceAlerts, priceAlerts) || other.priceAlerts == priceAlerts)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emailNotifications,smsNotifications,pushNotifications,orderUpdates,promotionalOffers,productRecommendations,priceAlerts,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerNotificationPreferences(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderUpdates: $orderUpdates, promotionalOffers: $promotionalOffers, productRecommendations: $productRecommendations, priceAlerts: $priceAlerts, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerNotificationPreferencesCopyWith<$Res> implements $CustomerNotificationPreferencesCopyWith<$Res> {
  factory _$CustomerNotificationPreferencesCopyWith(_CustomerNotificationPreferences value, $Res Function(_CustomerNotificationPreferences) _then) = __$CustomerNotificationPreferencesCopyWithImpl;
@override @useResult
$Res call({
 bool emailNotifications, bool smsNotifications, bool pushNotifications, bool orderUpdates, bool promotionalOffers, bool productRecommendations, bool priceAlerts, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerNotificationPreferencesCopyWithImpl<$Res>
    implements _$CustomerNotificationPreferencesCopyWith<$Res> {
  __$CustomerNotificationPreferencesCopyWithImpl(this._self, this._then);

  final _CustomerNotificationPreferences _self;
  final $Res Function(_CustomerNotificationPreferences) _then;

/// Create a copy of CustomerNotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailNotifications = null,Object? smsNotifications = null,Object? pushNotifications = null,Object? orderUpdates = null,Object? promotionalOffers = null,Object? productRecommendations = null,Object? priceAlerts = null,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerNotificationPreferences(
emailNotifications: null == emailNotifications ? _self.emailNotifications : emailNotifications // ignore: cast_nullable_to_non_nullable
as bool,smsNotifications: null == smsNotifications ? _self.smsNotifications : smsNotifications // ignore: cast_nullable_to_non_nullable
as bool,pushNotifications: null == pushNotifications ? _self.pushNotifications : pushNotifications // ignore: cast_nullable_to_non_nullable
as bool,orderUpdates: null == orderUpdates ? _self.orderUpdates : orderUpdates // ignore: cast_nullable_to_non_nullable
as bool,promotionalOffers: null == promotionalOffers ? _self.promotionalOffers : promotionalOffers // ignore: cast_nullable_to_non_nullable
as bool,productRecommendations: null == productRecommendations ? _self.productRecommendations : productRecommendations // ignore: cast_nullable_to_non_nullable
as bool,priceAlerts: null == priceAlerts ? _self.priceAlerts : priceAlerts // ignore: cast_nullable_to_non_nullable
as bool,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerLoyaltyPoints {

 int get currentPoints; int get totalEarned; int get totalRedeemed; int get pointsToExpire; DateTime? get expirationDate; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerLoyaltyPoints
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerLoyaltyPointsCopyWith<CustomerLoyaltyPoints> get copyWith => _$CustomerLoyaltyPointsCopyWithImpl<CustomerLoyaltyPoints>(this as CustomerLoyaltyPoints, _$identity);

  /// Serializes this CustomerLoyaltyPoints to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerLoyaltyPoints&&(identical(other.currentPoints, currentPoints) || other.currentPoints == currentPoints)&&(identical(other.totalEarned, totalEarned) || other.totalEarned == totalEarned)&&(identical(other.totalRedeemed, totalRedeemed) || other.totalRedeemed == totalRedeemed)&&(identical(other.pointsToExpire, pointsToExpire) || other.pointsToExpire == pointsToExpire)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPoints,totalEarned,totalRedeemed,pointsToExpire,expirationDate,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerLoyaltyPoints(currentPoints: $currentPoints, totalEarned: $totalEarned, totalRedeemed: $totalRedeemed, pointsToExpire: $pointsToExpire, expirationDate: $expirationDate, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerLoyaltyPointsCopyWith<$Res>  {
  factory $CustomerLoyaltyPointsCopyWith(CustomerLoyaltyPoints value, $Res Function(CustomerLoyaltyPoints) _then) = _$CustomerLoyaltyPointsCopyWithImpl;
@useResult
$Res call({
 int currentPoints, int totalEarned, int totalRedeemed, int pointsToExpire, DateTime? expirationDate, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerLoyaltyPointsCopyWithImpl<$Res>
    implements $CustomerLoyaltyPointsCopyWith<$Res> {
  _$CustomerLoyaltyPointsCopyWithImpl(this._self, this._then);

  final CustomerLoyaltyPoints _self;
  final $Res Function(CustomerLoyaltyPoints) _then;

/// Create a copy of CustomerLoyaltyPoints
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPoints = null,Object? totalEarned = null,Object? totalRedeemed = null,Object? pointsToExpire = null,Object? expirationDate = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
currentPoints: null == currentPoints ? _self.currentPoints : currentPoints // ignore: cast_nullable_to_non_nullable
as int,totalEarned: null == totalEarned ? _self.totalEarned : totalEarned // ignore: cast_nullable_to_non_nullable
as int,totalRedeemed: null == totalRedeemed ? _self.totalRedeemed : totalRedeemed // ignore: cast_nullable_to_non_nullable
as int,pointsToExpire: null == pointsToExpire ? _self.pointsToExpire : pointsToExpire // ignore: cast_nullable_to_non_nullable
as int,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerLoyaltyPoints].
extension CustomerLoyaltyPointsPatterns on CustomerLoyaltyPoints {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerLoyaltyPoints value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerLoyaltyPoints() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerLoyaltyPoints value)  $default,){
final _that = this;
switch (_that) {
case _CustomerLoyaltyPoints():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerLoyaltyPoints value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerLoyaltyPoints() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentPoints,  int totalEarned,  int totalRedeemed,  int pointsToExpire,  DateTime? expirationDate,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerLoyaltyPoints() when $default != null:
return $default(_that.currentPoints,_that.totalEarned,_that.totalRedeemed,_that.pointsToExpire,_that.expirationDate,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentPoints,  int totalEarned,  int totalRedeemed,  int pointsToExpire,  DateTime? expirationDate,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerLoyaltyPoints():
return $default(_that.currentPoints,_that.totalEarned,_that.totalRedeemed,_that.pointsToExpire,_that.expirationDate,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentPoints,  int totalEarned,  int totalRedeemed,  int pointsToExpire,  DateTime? expirationDate,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerLoyaltyPoints() when $default != null:
return $default(_that.currentPoints,_that.totalEarned,_that.totalRedeemed,_that.pointsToExpire,_that.expirationDate,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerLoyaltyPoints implements CustomerLoyaltyPoints {
  const _CustomerLoyaltyPoints({required this.currentPoints, required this.totalEarned, required this.totalRedeemed, required this.pointsToExpire, this.expirationDate, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CustomerLoyaltyPoints.fromJson(Map<String, dynamic> json) => _$CustomerLoyaltyPointsFromJson(json);

@override final  int currentPoints;
@override final  int totalEarned;
@override final  int totalRedeemed;
@override final  int pointsToExpire;
@override final  DateTime? expirationDate;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerLoyaltyPoints
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerLoyaltyPointsCopyWith<_CustomerLoyaltyPoints> get copyWith => __$CustomerLoyaltyPointsCopyWithImpl<_CustomerLoyaltyPoints>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerLoyaltyPointsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerLoyaltyPoints&&(identical(other.currentPoints, currentPoints) || other.currentPoints == currentPoints)&&(identical(other.totalEarned, totalEarned) || other.totalEarned == totalEarned)&&(identical(other.totalRedeemed, totalRedeemed) || other.totalRedeemed == totalRedeemed)&&(identical(other.pointsToExpire, pointsToExpire) || other.pointsToExpire == pointsToExpire)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPoints,totalEarned,totalRedeemed,pointsToExpire,expirationDate,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerLoyaltyPoints(currentPoints: $currentPoints, totalEarned: $totalEarned, totalRedeemed: $totalRedeemed, pointsToExpire: $pointsToExpire, expirationDate: $expirationDate, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerLoyaltyPointsCopyWith<$Res> implements $CustomerLoyaltyPointsCopyWith<$Res> {
  factory _$CustomerLoyaltyPointsCopyWith(_CustomerLoyaltyPoints value, $Res Function(_CustomerLoyaltyPoints) _then) = __$CustomerLoyaltyPointsCopyWithImpl;
@override @useResult
$Res call({
 int currentPoints, int totalEarned, int totalRedeemed, int pointsToExpire, DateTime? expirationDate, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerLoyaltyPointsCopyWithImpl<$Res>
    implements _$CustomerLoyaltyPointsCopyWith<$Res> {
  __$CustomerLoyaltyPointsCopyWithImpl(this._self, this._then);

  final _CustomerLoyaltyPoints _self;
  final $Res Function(_CustomerLoyaltyPoints) _then;

/// Create a copy of CustomerLoyaltyPoints
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPoints = null,Object? totalEarned = null,Object? totalRedeemed = null,Object? pointsToExpire = null,Object? expirationDate = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerLoyaltyPoints(
currentPoints: null == currentPoints ? _self.currentPoints : currentPoints // ignore: cast_nullable_to_non_nullable
as int,totalEarned: null == totalEarned ? _self.totalEarned : totalEarned // ignore: cast_nullable_to_non_nullable
as int,totalRedeemed: null == totalRedeemed ? _self.totalRedeemed : totalRedeemed // ignore: cast_nullable_to_non_nullable
as int,pointsToExpire: null == pointsToExpire ? _self.pointsToExpire : pointsToExpire // ignore: cast_nullable_to_non_nullable
as int,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerSubscription {

 String get id; String get status; String get type; DateTime get startDate; DateTime? get endDate; double get amount; String get currency; String? get frequency; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSubscriptionCopyWith<CustomerSubscription> get copyWith => _$CustomerSubscriptionCopyWithImpl<CustomerSubscription>(this as CustomerSubscription, _$identity);

  /// Serializes this CustomerSubscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,type,startDate,endDate,amount,currency,frequency,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerSubscription(id: $id, status: $status, type: $type, startDate: $startDate, endDate: $endDate, amount: $amount, currency: $currency, frequency: $frequency, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerSubscriptionCopyWith<$Res>  {
  factory $CustomerSubscriptionCopyWith(CustomerSubscription value, $Res Function(CustomerSubscription) _then) = _$CustomerSubscriptionCopyWithImpl;
@useResult
$Res call({
 String id, String status, String type, DateTime startDate, DateTime? endDate, double amount, String currency, String? frequency, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerSubscriptionCopyWithImpl<$Res>
    implements $CustomerSubscriptionCopyWith<$Res> {
  _$CustomerSubscriptionCopyWithImpl(this._self, this._then);

  final CustomerSubscription _self;
  final $Res Function(CustomerSubscription) _then;

/// Create a copy of CustomerSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? type = null,Object? startDate = null,Object? endDate = freezed,Object? amount = null,Object? currency = null,Object? frequency = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerSubscription].
extension CustomerSubscriptionPatterns on CustomerSubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSubscription value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSubscription value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  String type,  DateTime startDate,  DateTime? endDate,  double amount,  String currency,  String? frequency,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSubscription() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.startDate,_that.endDate,_that.amount,_that.currency,_that.frequency,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  String type,  DateTime startDate,  DateTime? endDate,  double amount,  String currency,  String? frequency,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerSubscription():
return $default(_that.id,_that.status,_that.type,_that.startDate,_that.endDate,_that.amount,_that.currency,_that.frequency,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  String type,  DateTime startDate,  DateTime? endDate,  double amount,  String currency,  String? frequency,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSubscription() when $default != null:
return $default(_that.id,_that.status,_that.type,_that.startDate,_that.endDate,_that.amount,_that.currency,_that.frequency,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerSubscription implements CustomerSubscription {
  const _CustomerSubscription({required this.id, required this.status, required this.type, required this.startDate, this.endDate, required this.amount, required this.currency, this.frequency, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CustomerSubscription.fromJson(Map<String, dynamic> json) => _$CustomerSubscriptionFromJson(json);

@override final  String id;
@override final  String status;
@override final  String type;
@override final  DateTime startDate;
@override final  DateTime? endDate;
@override final  double amount;
@override final  String currency;
@override final  String? frequency;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSubscriptionCopyWith<_CustomerSubscription> get copyWith => __$CustomerSubscriptionCopyWithImpl<_CustomerSubscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerSubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSubscription&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,type,startDate,endDate,amount,currency,frequency,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerSubscription(id: $id, status: $status, type: $type, startDate: $startDate, endDate: $endDate, amount: $amount, currency: $currency, frequency: $frequency, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerSubscriptionCopyWith<$Res> implements $CustomerSubscriptionCopyWith<$Res> {
  factory _$CustomerSubscriptionCopyWith(_CustomerSubscription value, $Res Function(_CustomerSubscription) _then) = __$CustomerSubscriptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, String type, DateTime startDate, DateTime? endDate, double amount, String currency, String? frequency, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerSubscriptionCopyWithImpl<$Res>
    implements _$CustomerSubscriptionCopyWith<$Res> {
  __$CustomerSubscriptionCopyWithImpl(this._self, this._then);

  final _CustomerSubscription _self;
  final $Res Function(_CustomerSubscription) _then;

/// Create a copy of CustomerSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? type = null,Object? startDate = null,Object? endDate = freezed,Object? amount = null,Object? currency = null,Object? frequency = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerSubscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CustomerReview {

 String get id; String get productId; String get productName; String get title; String get detail; int get rating; DateTime get createdAt; DateTime? get updatedAt; String? get status; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CustomerReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerReviewCopyWith<CustomerReview> get copyWith => _$CustomerReviewCopyWithImpl<CustomerReview>(this as CustomerReview, _$identity);

  /// Serializes this CustomerReview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerReview&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,title,detail,rating,createdAt,updatedAt,status,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CustomerReview(id: $id, productId: $productId, productName: $productName, title: $title, detail: $detail, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CustomerReviewCopyWith<$Res>  {
  factory $CustomerReviewCopyWith(CustomerReview value, $Res Function(CustomerReview) _then) = _$CustomerReviewCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String productName, String title, String detail, int rating, DateTime createdAt, DateTime? updatedAt, String? status, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CustomerReviewCopyWithImpl<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  _$CustomerReviewCopyWithImpl(this._self, this._then);

  final CustomerReview _self;
  final $Res Function(CustomerReview) _then;

/// Create a copy of CustomerReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? title = null,Object? detail = null,Object? rating = null,Object? createdAt = null,Object? updatedAt = freezed,Object? status = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerReview].
extension CustomerReviewPatterns on CustomerReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerReview value)  $default,){
final _that = this;
switch (_that) {
case _CustomerReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerReview value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  String productName,  String title,  String detail,  int rating,  DateTime createdAt,  DateTime? updatedAt,  String? status,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerReview() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.title,_that.detail,_that.rating,_that.createdAt,_that.updatedAt,_that.status,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  String productName,  String title,  String detail,  int rating,  DateTime createdAt,  DateTime? updatedAt,  String? status,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CustomerReview():
return $default(_that.id,_that.productId,_that.productName,_that.title,_that.detail,_that.rating,_that.createdAt,_that.updatedAt,_that.status,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  String productName,  String title,  String detail,  int rating,  DateTime createdAt,  DateTime? updatedAt,  String? status,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CustomerReview() when $default != null:
return $default(_that.id,_that.productId,_that.productName,_that.title,_that.detail,_that.rating,_that.createdAt,_that.updatedAt,_that.status,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerReview implements CustomerReview {
  const _CustomerReview({required this.id, required this.productId, required this.productName, required this.title, required this.detail, required this.rating, required this.createdAt, this.updatedAt, this.status, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CustomerReview.fromJson(Map<String, dynamic> json) => _$CustomerReviewFromJson(json);

@override final  String id;
@override final  String productId;
@override final  String productName;
@override final  String title;
@override final  String detail;
@override final  int rating;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  String? status;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CustomerReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerReviewCopyWith<_CustomerReview> get copyWith => __$CustomerReviewCopyWithImpl<_CustomerReview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerReview&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,productName,title,detail,rating,createdAt,updatedAt,status,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CustomerReview(id: $id, productId: $productId, productName: $productName, title: $title, detail: $detail, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CustomerReviewCopyWith<$Res> implements $CustomerReviewCopyWith<$Res> {
  factory _$CustomerReviewCopyWith(_CustomerReview value, $Res Function(_CustomerReview) _then) = __$CustomerReviewCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String productName, String title, String detail, int rating, DateTime createdAt, DateTime? updatedAt, String? status, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CustomerReviewCopyWithImpl<$Res>
    implements _$CustomerReviewCopyWith<$Res> {
  __$CustomerReviewCopyWithImpl(this._self, this._then);

  final _CustomerReview _self;
  final $Res Function(_CustomerReview) _then;

/// Create a copy of CustomerReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? productName = null,Object? title = null,Object? detail = null,Object? rating = null,Object? createdAt = null,Object? updatedAt = freezed,Object? status = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CustomerReview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
