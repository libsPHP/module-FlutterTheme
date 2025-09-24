// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Customer {

 int get id; String get email; String get firstname; String get lastname; String? get middlename; String? get prefix; String? get suffix; String? get gender; String? get dateOfBirth; String? get taxvat; bool? get isSubscribed; String? get groupId; String? get defaultBilling; String? get defaultShipping; DateTime? get createdAt; DateTime? get updatedAt; Map<String, dynamic>? get customAttributes; List<Address>? get addresses;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes)&&const DeepCollectionEquality().equals(other.addresses, addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstname,lastname,middlename,prefix,suffix,gender,dateOfBirth,taxvat,isSubscribed,groupId,defaultBilling,defaultShipping,createdAt,updatedAt,const DeepCollectionEquality().hash(customAttributes),const DeepCollectionEquality().hash(addresses));

@override
String toString() {
  return 'Customer(id: $id, email: $email, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, gender: $gender, dateOfBirth: $dateOfBirth, taxvat: $taxvat, isSubscribed: $isSubscribed, groupId: $groupId, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, customAttributes: $customAttributes, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 int id, String email, String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? gender, String? dateOfBirth, String? taxvat, bool? isSubscribed, String? groupId, String? defaultBilling, String? defaultShipping, DateTime? createdAt, DateTime? updatedAt, Map<String, dynamic>? customAttributes, List<Address>? addresses
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? gender = freezed,Object? dateOfBirth = freezed,Object? taxvat = freezed,Object? isSubscribed = freezed,Object? groupId = freezed,Object? defaultBilling = freezed,Object? defaultShipping = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customAttributes = freezed,Object? addresses = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as String?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? gender,  String? dateOfBirth,  String? taxvat,  bool? isSubscribed,  String? groupId,  String? defaultBilling,  String? defaultShipping,  DateTime? createdAt,  DateTime? updatedAt,  Map<String, dynamic>? customAttributes,  List<Address>? addresses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.email,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.gender,_that.dateOfBirth,_that.taxvat,_that.isSubscribed,_that.groupId,_that.defaultBilling,_that.defaultShipping,_that.createdAt,_that.updatedAt,_that.customAttributes,_that.addresses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? gender,  String? dateOfBirth,  String? taxvat,  bool? isSubscribed,  String? groupId,  String? defaultBilling,  String? defaultShipping,  DateTime? createdAt,  DateTime? updatedAt,  Map<String, dynamic>? customAttributes,  List<Address>? addresses)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.email,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.gender,_that.dateOfBirth,_that.taxvat,_that.isSubscribed,_that.groupId,_that.defaultBilling,_that.defaultShipping,_that.createdAt,_that.updatedAt,_that.customAttributes,_that.addresses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? gender,  String? dateOfBirth,  String? taxvat,  bool? isSubscribed,  String? groupId,  String? defaultBilling,  String? defaultShipping,  DateTime? createdAt,  DateTime? updatedAt,  Map<String, dynamic>? customAttributes,  List<Address>? addresses)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.email,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.gender,_that.dateOfBirth,_that.taxvat,_that.isSubscribed,_that.groupId,_that.defaultBilling,_that.defaultShipping,_that.createdAt,_that.updatedAt,_that.customAttributes,_that.addresses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer implements Customer {
  const _Customer({required this.id, required this.email, required this.firstname, required this.lastname, this.middlename, this.prefix, this.suffix, this.gender, this.dateOfBirth, this.taxvat, this.isSubscribed, this.groupId, this.defaultBilling, this.defaultShipping, this.createdAt, this.updatedAt, final  Map<String, dynamic>? customAttributes, final  List<Address>? addresses}): _customAttributes = customAttributes,_addresses = addresses;
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  int id;
@override final  String email;
@override final  String firstname;
@override final  String lastname;
@override final  String? middlename;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? gender;
@override final  String? dateOfBirth;
@override final  String? taxvat;
@override final  bool? isSubscribed;
@override final  String? groupId;
@override final  String? defaultBilling;
@override final  String? defaultShipping;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
 final  Map<String, dynamic>? _customAttributes;
@override Map<String, dynamic>? get customAttributes {
  final value = _customAttributes;
  if (value == null) return null;
  if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<Address>? _addresses;
@override List<Address>? get addresses {
  final value = _addresses;
  if (value == null) return null;
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes)&&const DeepCollectionEquality().equals(other._addresses, _addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstname,lastname,middlename,prefix,suffix,gender,dateOfBirth,taxvat,isSubscribed,groupId,defaultBilling,defaultShipping,createdAt,updatedAt,const DeepCollectionEquality().hash(_customAttributes),const DeepCollectionEquality().hash(_addresses));

@override
String toString() {
  return 'Customer(id: $id, email: $email, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, gender: $gender, dateOfBirth: $dateOfBirth, taxvat: $taxvat, isSubscribed: $isSubscribed, groupId: $groupId, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, customAttributes: $customAttributes, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? gender, String? dateOfBirth, String? taxvat, bool? isSubscribed, String? groupId, String? defaultBilling, String? defaultShipping, DateTime? createdAt, DateTime? updatedAt, Map<String, dynamic>? customAttributes, List<Address>? addresses
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? gender = freezed,Object? dateOfBirth = freezed,Object? taxvat = freezed,Object? isSubscribed = freezed,Object? groupId = freezed,Object? defaultBilling = freezed,Object? defaultShipping = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customAttributes = freezed,Object? addresses = freezed,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as String?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,addresses: freezed == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>?,
  ));
}


}


/// @nodoc
mixin _$Address {

 int get id; String get firstname; String get lastname; String? get middlename; String? get prefix; String? get suffix; String? get company; String get street; String get city; String get region; String get postcode; String get countryId; String? get telephone; String? get fax; String? get vatId; bool? get isDefaultBilling; bool? get isDefaultShipping; Map<String, dynamic>? get customAttributes;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, id) || other.id == id)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.vatId, vatId) || other.vatId == vatId)&&(identical(other.isDefaultBilling, isDefaultBilling) || other.isDefaultBilling == isDefaultBilling)&&(identical(other.isDefaultShipping, isDefaultShipping) || other.isDefaultShipping == isDefaultShipping)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstname,lastname,middlename,prefix,suffix,company,street,city,region,postcode,countryId,telephone,fax,vatId,isDefaultBilling,isDefaultShipping,const DeepCollectionEquality().hash(customAttributes));

@override
String toString() {
  return 'Address(id: $id, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, vatId: $vatId, isDefaultBilling: $isDefaultBilling, isDefaultShipping: $isDefaultShipping, customAttributes: $customAttributes)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 int id, String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? company, String street, String city, String region, String postcode, String countryId, String? telephone, String? fax, String? vatId, bool? isDefaultBilling, bool? isDefaultShipping, Map<String, dynamic>? customAttributes
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = null,Object? city = null,Object? region = null,Object? postcode = null,Object? countryId = null,Object? telephone = freezed,Object? fax = freezed,Object? vatId = freezed,Object? isDefaultBilling = freezed,Object? isDefaultShipping = freezed,Object? customAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,postcode: null == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,vatId: freezed == vatId ? _self.vatId : vatId // ignore: cast_nullable_to_non_nullable
as String?,isDefaultBilling: freezed == isDefaultBilling ? _self.isDefaultBilling : isDefaultBilling // ignore: cast_nullable_to_non_nullable
as bool?,isDefaultShipping: freezed == isDefaultShipping ? _self.isDefaultShipping : isDefaultShipping // ignore: cast_nullable_to_non_nullable
as bool?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? company,  String street,  String city,  String region,  String postcode,  String countryId,  String? telephone,  String? fax,  String? vatId,  bool? isDefaultBilling,  bool? isDefaultShipping,  Map<String, dynamic>? customAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.vatId,_that.isDefaultBilling,_that.isDefaultShipping,_that.customAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? company,  String street,  String city,  String region,  String postcode,  String countryId,  String? telephone,  String? fax,  String? vatId,  bool? isDefaultBilling,  bool? isDefaultShipping,  Map<String, dynamic>? customAttributes)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.id,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.vatId,_that.isDefaultBilling,_that.isDefaultShipping,_that.customAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? company,  String street,  String city,  String region,  String postcode,  String countryId,  String? telephone,  String? fax,  String? vatId,  bool? isDefaultBilling,  bool? isDefaultShipping,  Map<String, dynamic>? customAttributes)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.vatId,_that.isDefaultBilling,_that.isDefaultShipping,_that.customAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({required this.id, required this.firstname, required this.lastname, this.middlename, this.prefix, this.suffix, this.company, required this.street, required this.city, required this.region, required this.postcode, required this.countryId, this.telephone, this.fax, this.vatId, this.isDefaultBilling, this.isDefaultShipping, final  Map<String, dynamic>? customAttributes}): _customAttributes = customAttributes;
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  int id;
@override final  String firstname;
@override final  String lastname;
@override final  String? middlename;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? company;
@override final  String street;
@override final  String city;
@override final  String region;
@override final  String postcode;
@override final  String countryId;
@override final  String? telephone;
@override final  String? fax;
@override final  String? vatId;
@override final  bool? isDefaultBilling;
@override final  bool? isDefaultShipping;
 final  Map<String, dynamic>? _customAttributes;
@override Map<String, dynamic>? get customAttributes {
  final value = _customAttributes;
  if (value == null) return null;
  if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.vatId, vatId) || other.vatId == vatId)&&(identical(other.isDefaultBilling, isDefaultBilling) || other.isDefaultBilling == isDefaultBilling)&&(identical(other.isDefaultShipping, isDefaultShipping) || other.isDefaultShipping == isDefaultShipping)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstname,lastname,middlename,prefix,suffix,company,street,city,region,postcode,countryId,telephone,fax,vatId,isDefaultBilling,isDefaultShipping,const DeepCollectionEquality().hash(_customAttributes));

@override
String toString() {
  return 'Address(id: $id, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, vatId: $vatId, isDefaultBilling: $isDefaultBilling, isDefaultShipping: $isDefaultShipping, customAttributes: $customAttributes)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? company, String street, String city, String region, String postcode, String countryId, String? telephone, String? fax, String? vatId, bool? isDefaultBilling, bool? isDefaultShipping, Map<String, dynamic>? customAttributes
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = null,Object? city = null,Object? region = null,Object? postcode = null,Object? countryId = null,Object? telephone = freezed,Object? fax = freezed,Object? vatId = freezed,Object? isDefaultBilling = freezed,Object? isDefaultShipping = freezed,Object? customAttributes = freezed,}) {
  return _then(_Address(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,postcode: null == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,vatId: freezed == vatId ? _self.vatId : vatId // ignore: cast_nullable_to_non_nullable
as String?,isDefaultBilling: freezed == isDefaultBilling ? _self.isDefaultBilling : isDefaultBilling // ignore: cast_nullable_to_non_nullable
as bool?,isDefaultShipping: freezed == isDefaultShipping ? _self.isDefaultShipping : isDefaultShipping // ignore: cast_nullable_to_non_nullable
as bool?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
