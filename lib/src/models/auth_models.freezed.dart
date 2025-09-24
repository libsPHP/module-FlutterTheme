// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponse {

 String get accessToken; String get refreshToken; String get tokenType; int get expiresIn; Customer get customer;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,tokenType,expiresIn,customer);

@override
String toString() {
  return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn, customer: $customer)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
 String accessToken, String refreshToken, String tokenType, int expiresIn, Customer customer
});


$CustomerCopyWith<$Res> get customer;

}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? tokenType = null,Object? expiresIn = null,Object? customer = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as Customer,
  ));
}
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerCopyWith<$Res> get customer {
  
  return $CustomerCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponse].
extension AuthResponsePatterns on AuthResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  String tokenType,  int expiresIn,  Customer customer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.tokenType,_that.expiresIn,_that.customer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String refreshToken,  String tokenType,  int expiresIn,  Customer customer)  $default,) {final _that = this;
switch (_that) {
case _AuthResponse():
return $default(_that.accessToken,_that.refreshToken,_that.tokenType,_that.expiresIn,_that.customer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String refreshToken,  String tokenType,  int expiresIn,  Customer customer)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.tokenType,_that.expiresIn,_that.customer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponse implements AuthResponse {
  const _AuthResponse({required this.accessToken, required this.refreshToken, required this.tokenType, required this.expiresIn, required this.customer});
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override final  String accessToken;
@override final  String refreshToken;
@override final  String tokenType;
@override final  int expiresIn;
@override final  Customer customer;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.customer, customer) || other.customer == customer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,tokenType,expiresIn,customer);

@override
String toString() {
  return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn, customer: $customer)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String refreshToken, String tokenType, int expiresIn, Customer customer
});


@override $CustomerCopyWith<$Res> get customer;

}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? tokenType = null,Object? expiresIn = null,Object? customer = null,}) {
  return _then(_AuthResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as Customer,
  ));
}

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerCopyWith<$Res> get customer {
  
  return $CustomerCopyWith<$Res>(_self.customer, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// @nodoc
mixin _$Customer {

 int get id; String get email; String get firstname; String get lastname; String? get middlename; int? get groupId; String? get dob; String? get taxvat; String? get gender; bool? get isSubscribed; String? get prefix; String? get suffix; String? get defaultBilling; String? get defaultShipping; DateTime? get createdAt; DateTime? get updatedAt; List<Address>? get addresses;
/// Create a copy of Customer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCopyWith<Customer> get copyWith => _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.addresses, addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstname,lastname,middlename,groupId,dob,taxvat,gender,isSubscribed,prefix,suffix,defaultBilling,defaultShipping,createdAt,updatedAt,const DeepCollectionEquality().hash(addresses));

@override
String toString() {
  return 'Customer(id: $id, email: $email, firstname: $firstname, lastname: $lastname, middlename: $middlename, groupId: $groupId, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, prefix: $prefix, suffix: $suffix, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res>  {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) = _$CustomerCopyWithImpl;
@useResult
$Res call({
 int id, String email, String firstname, String lastname, String? middlename, int? groupId, String? dob, String? taxvat, String? gender, bool? isSubscribed, String? prefix, String? suffix, String? defaultBilling, String? defaultShipping, DateTime? createdAt, DateTime? updatedAt, List<Address>? addresses
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? groupId = freezed,Object? dob = freezed,Object? taxvat = freezed,Object? gender = freezed,Object? isSubscribed = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? defaultBilling = freezed,Object? defaultShipping = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? addresses = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as String?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email,  String firstname,  String lastname,  String? middlename,  int? groupId,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  String? prefix,  String? suffix,  String? defaultBilling,  String? defaultShipping,  DateTime? createdAt,  DateTime? updatedAt,  List<Address>? addresses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.email,_that.firstname,_that.lastname,_that.middlename,_that.groupId,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.prefix,_that.suffix,_that.defaultBilling,_that.defaultShipping,_that.createdAt,_that.updatedAt,_that.addresses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email,  String firstname,  String lastname,  String? middlename,  int? groupId,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  String? prefix,  String? suffix,  String? defaultBilling,  String? defaultShipping,  DateTime? createdAt,  DateTime? updatedAt,  List<Address>? addresses)  $default,) {final _that = this;
switch (_that) {
case _Customer():
return $default(_that.id,_that.email,_that.firstname,_that.lastname,_that.middlename,_that.groupId,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.prefix,_that.suffix,_that.defaultBilling,_that.defaultShipping,_that.createdAt,_that.updatedAt,_that.addresses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email,  String firstname,  String lastname,  String? middlename,  int? groupId,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  String? prefix,  String? suffix,  String? defaultBilling,  String? defaultShipping,  DateTime? createdAt,  DateTime? updatedAt,  List<Address>? addresses)?  $default,) {final _that = this;
switch (_that) {
case _Customer() when $default != null:
return $default(_that.id,_that.email,_that.firstname,_that.lastname,_that.middlename,_that.groupId,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.prefix,_that.suffix,_that.defaultBilling,_that.defaultShipping,_that.createdAt,_that.updatedAt,_that.addresses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Customer extends Customer {
  const _Customer({required this.id, required this.email, required this.firstname, required this.lastname, this.middlename, this.groupId, this.dob, this.taxvat, this.gender, this.isSubscribed, this.prefix, this.suffix, this.defaultBilling, this.defaultShipping, this.createdAt, this.updatedAt, final  List<Address>? addresses}): _addresses = addresses,super._();
  factory _Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

@override final  int id;
@override final  String email;
@override final  String firstname;
@override final  String lastname;
@override final  String? middlename;
@override final  int? groupId;
@override final  String? dob;
@override final  String? taxvat;
@override final  String? gender;
@override final  bool? isSubscribed;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? defaultBilling;
@override final  String? defaultShipping;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Customer&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._addresses, _addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstname,lastname,middlename,groupId,dob,taxvat,gender,isSubscribed,prefix,suffix,defaultBilling,defaultShipping,createdAt,updatedAt,const DeepCollectionEquality().hash(_addresses));

@override
String toString() {
  return 'Customer(id: $id, email: $email, firstname: $firstname, lastname: $lastname, middlename: $middlename, groupId: $groupId, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, prefix: $prefix, suffix: $suffix, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res> implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) = __$CustomerCopyWithImpl;
@override @useResult
$Res call({
 int id, String email, String firstname, String lastname, String? middlename, int? groupId, String? dob, String? taxvat, String? gender, bool? isSubscribed, String? prefix, String? suffix, String? defaultBilling, String? defaultShipping, DateTime? createdAt, DateTime? updatedAt, List<Address>? addresses
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? groupId = freezed,Object? dob = freezed,Object? taxvat = freezed,Object? gender = freezed,Object? isSubscribed = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? defaultBilling = freezed,Object? defaultShipping = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? addresses = freezed,}) {
  return _then(_Customer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as String?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,addresses: freezed == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>?,
  ));
}


}


/// @nodoc
mixin _$Address {

 int? get id; String? get customerId; String? get region; String? get regionId; String? get regionCode; String? get countryId; List<String>? get street; String? get company; String? get telephone; String? get fax; String? get postcode; String? get city; String? get firstname; String? get lastname; String? get middlename; String? get prefix; String? get suffix; String? get vatId; bool? get defaultShipping; bool? get defaultBilling;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&const DeepCollectionEquality().equals(other.street, street)&&(identical(other.company, company) || other.company == company)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.city, city) || other.city == city)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.vatId, vatId) || other.vatId == vatId)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,region,regionId,regionCode,countryId,const DeepCollectionEquality().hash(street),company,telephone,fax,postcode,city,firstname,lastname,middlename,prefix,suffix,vatId,defaultShipping,defaultBilling]);

@override
String toString() {
  return 'Address(id: $id, customerId: $customerId, region: $region, regionId: $regionId, regionCode: $regionCode, countryId: $countryId, street: $street, company: $company, telephone: $telephone, fax: $fax, postcode: $postcode, city: $city, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, vatId: $vatId, defaultShipping: $defaultShipping, defaultBilling: $defaultBilling)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 int? id, String? customerId, String? region, String? regionId, String? regionCode, String? countryId, List<String>? street, String? company, String? telephone, String? fax, String? postcode, String? city, String? firstname, String? lastname, String? middlename, String? prefix, String? suffix, String? vatId, bool? defaultShipping, bool? defaultBilling
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? customerId = freezed,Object? region = freezed,Object? regionId = freezed,Object? regionCode = freezed,Object? countryId = freezed,Object? street = freezed,Object? company = freezed,Object? telephone = freezed,Object? fax = freezed,Object? postcode = freezed,Object? city = freezed,Object? firstname = freezed,Object? lastname = freezed,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? vatId = freezed,Object? defaultShipping = freezed,Object? defaultBilling = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,regionCode: freezed == regionCode ? _self.regionCode : regionCode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as List<String>?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,vatId: freezed == vatId ? _self.vatId : vatId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? customerId,  String? region,  String? regionId,  String? regionCode,  String? countryId,  List<String>? street,  String? company,  String? telephone,  String? fax,  String? postcode,  String? city,  String? firstname,  String? lastname,  String? middlename,  String? prefix,  String? suffix,  String? vatId,  bool? defaultShipping,  bool? defaultBilling)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.customerId,_that.region,_that.regionId,_that.regionCode,_that.countryId,_that.street,_that.company,_that.telephone,_that.fax,_that.postcode,_that.city,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.vatId,_that.defaultShipping,_that.defaultBilling);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? customerId,  String? region,  String? regionId,  String? regionCode,  String? countryId,  List<String>? street,  String? company,  String? telephone,  String? fax,  String? postcode,  String? city,  String? firstname,  String? lastname,  String? middlename,  String? prefix,  String? suffix,  String? vatId,  bool? defaultShipping,  bool? defaultBilling)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.id,_that.customerId,_that.region,_that.regionId,_that.regionCode,_that.countryId,_that.street,_that.company,_that.telephone,_that.fax,_that.postcode,_that.city,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.vatId,_that.defaultShipping,_that.defaultBilling);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? customerId,  String? region,  String? regionId,  String? regionCode,  String? countryId,  List<String>? street,  String? company,  String? telephone,  String? fax,  String? postcode,  String? city,  String? firstname,  String? lastname,  String? middlename,  String? prefix,  String? suffix,  String? vatId,  bool? defaultShipping,  bool? defaultBilling)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.customerId,_that.region,_that.regionId,_that.regionCode,_that.countryId,_that.street,_that.company,_that.telephone,_that.fax,_that.postcode,_that.city,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.vatId,_that.defaultShipping,_that.defaultBilling);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({this.id, this.customerId, this.region, this.regionId, this.regionCode, this.countryId, final  List<String>? street, this.company, this.telephone, this.fax, this.postcode, this.city, this.firstname, this.lastname, this.middlename, this.prefix, this.suffix, this.vatId, this.defaultShipping, this.defaultBilling}): _street = street;
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override final  int? id;
@override final  String? customerId;
@override final  String? region;
@override final  String? regionId;
@override final  String? regionCode;
@override final  String? countryId;
 final  List<String>? _street;
@override List<String>? get street {
  final value = _street;
  if (value == null) return null;
  if (_street is EqualUnmodifiableListView) return _street;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? company;
@override final  String? telephone;
@override final  String? fax;
@override final  String? postcode;
@override final  String? city;
@override final  String? firstname;
@override final  String? lastname;
@override final  String? middlename;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? vatId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&const DeepCollectionEquality().equals(other._street, _street)&&(identical(other.company, company) || other.company == company)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.city, city) || other.city == city)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.vatId, vatId) || other.vatId == vatId)&&(identical(other.defaultShipping, defaultShipping) || other.defaultShipping == defaultShipping)&&(identical(other.defaultBilling, defaultBilling) || other.defaultBilling == defaultBilling));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,region,regionId,regionCode,countryId,const DeepCollectionEquality().hash(_street),company,telephone,fax,postcode,city,firstname,lastname,middlename,prefix,suffix,vatId,defaultShipping,defaultBilling]);

@override
String toString() {
  return 'Address(id: $id, customerId: $customerId, region: $region, regionId: $regionId, regionCode: $regionCode, countryId: $countryId, street: $street, company: $company, telephone: $telephone, fax: $fax, postcode: $postcode, city: $city, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, vatId: $vatId, defaultShipping: $defaultShipping, defaultBilling: $defaultBilling)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? customerId, String? region, String? regionId, String? regionCode, String? countryId, List<String>? street, String? company, String? telephone, String? fax, String? postcode, String? city, String? firstname, String? lastname, String? middlename, String? prefix, String? suffix, String? vatId, bool? defaultShipping, bool? defaultBilling
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? customerId = freezed,Object? region = freezed,Object? regionId = freezed,Object? regionCode = freezed,Object? countryId = freezed,Object? street = freezed,Object? company = freezed,Object? telephone = freezed,Object? fax = freezed,Object? postcode = freezed,Object? city = freezed,Object? firstname = freezed,Object? lastname = freezed,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? vatId = freezed,Object? defaultShipping = freezed,Object? defaultBilling = freezed,}) {
  return _then(_Address(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,regionId: freezed == regionId ? _self.regionId : regionId // ignore: cast_nullable_to_non_nullable
as String?,regionCode: freezed == regionCode ? _self.regionCode : regionCode // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,street: freezed == street ? _self._street : street // ignore: cast_nullable_to_non_nullable
as List<String>?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,fax: freezed == fax ? _self.fax : fax // ignore: cast_nullable_to_non_nullable
as String?,postcode: freezed == postcode ? _self.postcode : postcode // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,vatId: freezed == vatId ? _self.vatId : vatId // ignore: cast_nullable_to_non_nullable
as String?,defaultShipping: freezed == defaultShipping ? _self.defaultShipping : defaultShipping // ignore: cast_nullable_to_non_nullable
as bool?,defaultBilling: freezed == defaultBilling ? _self.defaultBilling : defaultBilling // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CustomerCreateRequest {

 String get email; String get password; String get firstname; String get lastname; String? get middlename; String? get prefix; String? get suffix; String? get dob; String? get taxvat; String? get gender; bool? get isSubscribed; List<Address>? get addresses;
/// Create a copy of CustomerCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerCreateRequestCopyWith<CustomerCreateRequest> get copyWith => _$CustomerCreateRequestCopyWithImpl<CustomerCreateRequest>(this as CustomerCreateRequest, _$identity);

  /// Serializes this CustomerCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerCreateRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&const DeepCollectionEquality().equals(other.addresses, addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,firstname,lastname,middlename,prefix,suffix,dob,taxvat,gender,isSubscribed,const DeepCollectionEquality().hash(addresses));

@override
String toString() {
  return 'CustomerCreateRequest(email: $email, password: $password, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class $CustomerCreateRequestCopyWith<$Res>  {
  factory $CustomerCreateRequestCopyWith(CustomerCreateRequest value, $Res Function(CustomerCreateRequest) _then) = _$CustomerCreateRequestCopyWithImpl;
@useResult
$Res call({
 String email, String password, String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? dob, String? taxvat, String? gender, bool? isSubscribed, List<Address>? addresses
});




}
/// @nodoc
class _$CustomerCreateRequestCopyWithImpl<$Res>
    implements $CustomerCreateRequestCopyWith<$Res> {
  _$CustomerCreateRequestCopyWithImpl(this._self, this._then);

  final CustomerCreateRequest _self;
  final $Res Function(CustomerCreateRequest) _then;

/// Create a copy of CustomerCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? dob = freezed,Object? taxvat = freezed,Object? gender = freezed,Object? isSubscribed = freezed,Object? addresses = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerCreateRequest].
extension CustomerCreateRequestPatterns on CustomerCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _CustomerCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  List<Address>? addresses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerCreateRequest() when $default != null:
return $default(_that.email,_that.password,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.addresses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  List<Address>? addresses)  $default,) {final _that = this;
switch (_that) {
case _CustomerCreateRequest():
return $default(_that.email,_that.password,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.addresses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  List<Address>? addresses)?  $default,) {final _that = this;
switch (_that) {
case _CustomerCreateRequest() when $default != null:
return $default(_that.email,_that.password,_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.addresses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerCreateRequest implements CustomerCreateRequest {
  const _CustomerCreateRequest({required this.email, required this.password, required this.firstname, required this.lastname, this.middlename, this.prefix, this.suffix, this.dob, this.taxvat, this.gender, this.isSubscribed, final  List<Address>? addresses}): _addresses = addresses;
  factory _CustomerCreateRequest.fromJson(Map<String, dynamic> json) => _$CustomerCreateRequestFromJson(json);

@override final  String email;
@override final  String password;
@override final  String firstname;
@override final  String lastname;
@override final  String? middlename;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? dob;
@override final  String? taxvat;
@override final  String? gender;
@override final  bool? isSubscribed;
 final  List<Address>? _addresses;
@override List<Address>? get addresses {
  final value = _addresses;
  if (value == null) return null;
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CustomerCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerCreateRequestCopyWith<_CustomerCreateRequest> get copyWith => __$CustomerCreateRequestCopyWithImpl<_CustomerCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerCreateRequest&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&const DeepCollectionEquality().equals(other._addresses, _addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,firstname,lastname,middlename,prefix,suffix,dob,taxvat,gender,isSubscribed,const DeepCollectionEquality().hash(_addresses));

@override
String toString() {
  return 'CustomerCreateRequest(email: $email, password: $password, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class _$CustomerCreateRequestCopyWith<$Res> implements $CustomerCreateRequestCopyWith<$Res> {
  factory _$CustomerCreateRequestCopyWith(_CustomerCreateRequest value, $Res Function(_CustomerCreateRequest) _then) = __$CustomerCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? dob, String? taxvat, String? gender, bool? isSubscribed, List<Address>? addresses
});




}
/// @nodoc
class __$CustomerCreateRequestCopyWithImpl<$Res>
    implements _$CustomerCreateRequestCopyWith<$Res> {
  __$CustomerCreateRequestCopyWithImpl(this._self, this._then);

  final _CustomerCreateRequest _self;
  final $Res Function(_CustomerCreateRequest) _then;

/// Create a copy of CustomerCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? dob = freezed,Object? taxvat = freezed,Object? gender = freezed,Object? isSubscribed = freezed,Object? addresses = freezed,}) {
  return _then(_CustomerCreateRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String,lastname: null == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,addresses: freezed == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>?,
  ));
}


}


/// @nodoc
mixin _$CustomerUpdateRequest {

 String? get firstname; String? get lastname; String? get middlename; String? get prefix; String? get suffix; String? get dob; String? get taxvat; String? get gender; bool? get isSubscribed; List<Address>? get addresses;
/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerUpdateRequestCopyWith<CustomerUpdateRequest> get copyWith => _$CustomerUpdateRequestCopyWithImpl<CustomerUpdateRequest>(this as CustomerUpdateRequest, _$identity);

  /// Serializes this CustomerUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerUpdateRequest&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&const DeepCollectionEquality().equals(other.addresses, addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstname,lastname,middlename,prefix,suffix,dob,taxvat,gender,isSubscribed,const DeepCollectionEquality().hash(addresses));

@override
String toString() {
  return 'CustomerUpdateRequest(firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class $CustomerUpdateRequestCopyWith<$Res>  {
  factory $CustomerUpdateRequestCopyWith(CustomerUpdateRequest value, $Res Function(CustomerUpdateRequest) _then) = _$CustomerUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String? firstname, String? lastname, String? middlename, String? prefix, String? suffix, String? dob, String? taxvat, String? gender, bool? isSubscribed, List<Address>? addresses
});




}
/// @nodoc
class _$CustomerUpdateRequestCopyWithImpl<$Res>
    implements $CustomerUpdateRequestCopyWith<$Res> {
  _$CustomerUpdateRequestCopyWithImpl(this._self, this._then);

  final CustomerUpdateRequest _self;
  final $Res Function(CustomerUpdateRequest) _then;

/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstname = freezed,Object? lastname = freezed,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? dob = freezed,Object? taxvat = freezed,Object? gender = freezed,Object? isSubscribed = freezed,Object? addresses = freezed,}) {
  return _then(_self.copyWith(
firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,addresses: freezed == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerUpdateRequest].
extension CustomerUpdateRequestPatterns on CustomerUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _CustomerUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? firstname,  String? lastname,  String? middlename,  String? prefix,  String? suffix,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  List<Address>? addresses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
return $default(_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.addresses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? firstname,  String? lastname,  String? middlename,  String? prefix,  String? suffix,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  List<Address>? addresses)  $default,) {final _that = this;
switch (_that) {
case _CustomerUpdateRequest():
return $default(_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.addresses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? firstname,  String? lastname,  String? middlename,  String? prefix,  String? suffix,  String? dob,  String? taxvat,  String? gender,  bool? isSubscribed,  List<Address>? addresses)?  $default,) {final _that = this;
switch (_that) {
case _CustomerUpdateRequest() when $default != null:
return $default(_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.dob,_that.taxvat,_that.gender,_that.isSubscribed,_that.addresses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerUpdateRequest implements CustomerUpdateRequest {
  const _CustomerUpdateRequest({this.firstname, this.lastname, this.middlename, this.prefix, this.suffix, this.dob, this.taxvat, this.gender, this.isSubscribed, final  List<Address>? addresses}): _addresses = addresses;
  factory _CustomerUpdateRequest.fromJson(Map<String, dynamic> json) => _$CustomerUpdateRequestFromJson(json);

@override final  String? firstname;
@override final  String? lastname;
@override final  String? middlename;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? dob;
@override final  String? taxvat;
@override final  String? gender;
@override final  bool? isSubscribed;
 final  List<Address>? _addresses;
@override List<Address>? get addresses {
  final value = _addresses;
  if (value == null) return null;
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerUpdateRequestCopyWith<_CustomerUpdateRequest> get copyWith => __$CustomerUpdateRequestCopyWithImpl<_CustomerUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerUpdateRequest&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.dob, dob) || other.dob == dob)&&(identical(other.taxvat, taxvat) || other.taxvat == taxvat)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&const DeepCollectionEquality().equals(other._addresses, _addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstname,lastname,middlename,prefix,suffix,dob,taxvat,gender,isSubscribed,const DeepCollectionEquality().hash(_addresses));

@override
String toString() {
  return 'CustomerUpdateRequest(firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class _$CustomerUpdateRequestCopyWith<$Res> implements $CustomerUpdateRequestCopyWith<$Res> {
  factory _$CustomerUpdateRequestCopyWith(_CustomerUpdateRequest value, $Res Function(_CustomerUpdateRequest) _then) = __$CustomerUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String? firstname, String? lastname, String? middlename, String? prefix, String? suffix, String? dob, String? taxvat, String? gender, bool? isSubscribed, List<Address>? addresses
});




}
/// @nodoc
class __$CustomerUpdateRequestCopyWithImpl<$Res>
    implements _$CustomerUpdateRequestCopyWith<$Res> {
  __$CustomerUpdateRequestCopyWithImpl(this._self, this._then);

  final _CustomerUpdateRequest _self;
  final $Res Function(_CustomerUpdateRequest) _then;

/// Create a copy of CustomerUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstname = freezed,Object? lastname = freezed,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? dob = freezed,Object? taxvat = freezed,Object? gender = freezed,Object? isSubscribed = freezed,Object? addresses = freezed,}) {
  return _then(_CustomerUpdateRequest(
firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,middlename: freezed == middlename ? _self.middlename : middlename // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as String?,taxvat: freezed == taxvat ? _self.taxvat : taxvat // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,addresses: freezed == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>?,
  ));
}


}


/// @nodoc
mixin _$PasswordChangeRequest {

 String get currentPassword; String get newPassword;
/// Create a copy of PasswordChangeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordChangeRequestCopyWith<PasswordChangeRequest> get copyWith => _$PasswordChangeRequestCopyWithImpl<PasswordChangeRequest>(this as PasswordChangeRequest, _$identity);

  /// Serializes this PasswordChangeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordChangeRequest&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPassword,newPassword);

@override
String toString() {
  return 'PasswordChangeRequest(currentPassword: $currentPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $PasswordChangeRequestCopyWith<$Res>  {
  factory $PasswordChangeRequestCopyWith(PasswordChangeRequest value, $Res Function(PasswordChangeRequest) _then) = _$PasswordChangeRequestCopyWithImpl;
@useResult
$Res call({
 String currentPassword, String newPassword
});




}
/// @nodoc
class _$PasswordChangeRequestCopyWithImpl<$Res>
    implements $PasswordChangeRequestCopyWith<$Res> {
  _$PasswordChangeRequestCopyWithImpl(this._self, this._then);

  final PasswordChangeRequest _self;
  final $Res Function(PasswordChangeRequest) _then;

/// Create a copy of PasswordChangeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPassword = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordChangeRequest].
extension PasswordChangeRequestPatterns on PasswordChangeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordChangeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordChangeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordChangeRequest value)  $default,){
final _that = this;
switch (_that) {
case _PasswordChangeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordChangeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordChangeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currentPassword,  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordChangeRequest() when $default != null:
return $default(_that.currentPassword,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currentPassword,  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _PasswordChangeRequest():
return $default(_that.currentPassword,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currentPassword,  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _PasswordChangeRequest() when $default != null:
return $default(_that.currentPassword,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PasswordChangeRequest implements PasswordChangeRequest {
  const _PasswordChangeRequest({required this.currentPassword, required this.newPassword});
  factory _PasswordChangeRequest.fromJson(Map<String, dynamic> json) => _$PasswordChangeRequestFromJson(json);

@override final  String currentPassword;
@override final  String newPassword;

/// Create a copy of PasswordChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordChangeRequestCopyWith<_PasswordChangeRequest> get copyWith => __$PasswordChangeRequestCopyWithImpl<_PasswordChangeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordChangeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordChangeRequest&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPassword,newPassword);

@override
String toString() {
  return 'PasswordChangeRequest(currentPassword: $currentPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$PasswordChangeRequestCopyWith<$Res> implements $PasswordChangeRequestCopyWith<$Res> {
  factory _$PasswordChangeRequestCopyWith(_PasswordChangeRequest value, $Res Function(_PasswordChangeRequest) _then) = __$PasswordChangeRequestCopyWithImpl;
@override @useResult
$Res call({
 String currentPassword, String newPassword
});




}
/// @nodoc
class __$PasswordChangeRequestCopyWithImpl<$Res>
    implements _$PasswordChangeRequestCopyWith<$Res> {
  __$PasswordChangeRequestCopyWithImpl(this._self, this._then);

  final _PasswordChangeRequest _self;
  final $Res Function(_PasswordChangeRequest) _then;

/// Create a copy of PasswordChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPassword = null,Object? newPassword = null,}) {
  return _then(_PasswordChangeRequest(
currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PasswordResetRequest {

 String get email;
/// Create a copy of PasswordResetRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetRequestCopyWith<PasswordResetRequest> get copyWith => _$PasswordResetRequestCopyWithImpl<PasswordResetRequest>(this as PasswordResetRequest, _$identity);

  /// Serializes this PasswordResetRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResetRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'PasswordResetRequest(email: $email)';
}


}

/// @nodoc
abstract mixin class $PasswordResetRequestCopyWith<$Res>  {
  factory $PasswordResetRequestCopyWith(PasswordResetRequest value, $Res Function(PasswordResetRequest) _then) = _$PasswordResetRequestCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$PasswordResetRequestCopyWithImpl<$Res>
    implements $PasswordResetRequestCopyWith<$Res> {
  _$PasswordResetRequestCopyWithImpl(this._self, this._then);

  final PasswordResetRequest _self;
  final $Res Function(PasswordResetRequest) _then;

/// Create a copy of PasswordResetRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordResetRequest].
extension PasswordResetRequestPatterns on PasswordResetRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordResetRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordResetRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordResetRequest value)  $default,){
final _that = this;
switch (_that) {
case _PasswordResetRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordResetRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordResetRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordResetRequest() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _PasswordResetRequest():
return $default(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _PasswordResetRequest() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PasswordResetRequest implements PasswordResetRequest {
  const _PasswordResetRequest({required this.email});
  factory _PasswordResetRequest.fromJson(Map<String, dynamic> json) => _$PasswordResetRequestFromJson(json);

@override final  String email;

/// Create a copy of PasswordResetRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordResetRequestCopyWith<_PasswordResetRequest> get copyWith => __$PasswordResetRequestCopyWithImpl<_PasswordResetRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PasswordResetRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordResetRequest&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'PasswordResetRequest(email: $email)';
}


}

/// @nodoc
abstract mixin class _$PasswordResetRequestCopyWith<$Res> implements $PasswordResetRequestCopyWith<$Res> {
  factory _$PasswordResetRequestCopyWith(_PasswordResetRequest value, $Res Function(_PasswordResetRequest) _then) = __$PasswordResetRequestCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$PasswordResetRequestCopyWithImpl<$Res>
    implements _$PasswordResetRequestCopyWith<$Res> {
  __$PasswordResetRequestCopyWithImpl(this._self, this._then);

  final _PasswordResetRequest _self;
  final $Res Function(_PasswordResetRequest) _then;

/// Create a copy of PasswordResetRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_PasswordResetRequest(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SocialLoginRequest {

 String get provider; String get token; String? get email; String? get firstname; String? get lastname;
/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialLoginRequestCopyWith<SocialLoginRequest> get copyWith => _$SocialLoginRequestCopyWithImpl<SocialLoginRequest>(this as SocialLoginRequest, _$identity);

  /// Serializes this SocialLoginRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialLoginRequest&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.token, token) || other.token == token)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,token,email,firstname,lastname);

@override
String toString() {
  return 'SocialLoginRequest(provider: $provider, token: $token, email: $email, firstname: $firstname, lastname: $lastname)';
}


}

/// @nodoc
abstract mixin class $SocialLoginRequestCopyWith<$Res>  {
  factory $SocialLoginRequestCopyWith(SocialLoginRequest value, $Res Function(SocialLoginRequest) _then) = _$SocialLoginRequestCopyWithImpl;
@useResult
$Res call({
 String provider, String token, String? email, String? firstname, String? lastname
});




}
/// @nodoc
class _$SocialLoginRequestCopyWithImpl<$Res>
    implements $SocialLoginRequestCopyWith<$Res> {
  _$SocialLoginRequestCopyWithImpl(this._self, this._then);

  final SocialLoginRequest _self;
  final $Res Function(SocialLoginRequest) _then;

/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? token = null,Object? email = freezed,Object? firstname = freezed,Object? lastname = freezed,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialLoginRequest].
extension SocialLoginRequestPatterns on SocialLoginRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialLoginRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialLoginRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialLoginRequest value)  $default,){
final _that = this;
switch (_that) {
case _SocialLoginRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialLoginRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SocialLoginRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String provider,  String token,  String? email,  String? firstname,  String? lastname)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialLoginRequest() when $default != null:
return $default(_that.provider,_that.token,_that.email,_that.firstname,_that.lastname);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String provider,  String token,  String? email,  String? firstname,  String? lastname)  $default,) {final _that = this;
switch (_that) {
case _SocialLoginRequest():
return $default(_that.provider,_that.token,_that.email,_that.firstname,_that.lastname);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String provider,  String token,  String? email,  String? firstname,  String? lastname)?  $default,) {final _that = this;
switch (_that) {
case _SocialLoginRequest() when $default != null:
return $default(_that.provider,_that.token,_that.email,_that.firstname,_that.lastname);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialLoginRequest implements SocialLoginRequest {
  const _SocialLoginRequest({required this.provider, required this.token, this.email, this.firstname, this.lastname});
  factory _SocialLoginRequest.fromJson(Map<String, dynamic> json) => _$SocialLoginRequestFromJson(json);

@override final  String provider;
@override final  String token;
@override final  String? email;
@override final  String? firstname;
@override final  String? lastname;

/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialLoginRequestCopyWith<_SocialLoginRequest> get copyWith => __$SocialLoginRequestCopyWithImpl<_SocialLoginRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialLoginRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialLoginRequest&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.token, token) || other.token == token)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,provider,token,email,firstname,lastname);

@override
String toString() {
  return 'SocialLoginRequest(provider: $provider, token: $token, email: $email, firstname: $firstname, lastname: $lastname)';
}


}

/// @nodoc
abstract mixin class _$SocialLoginRequestCopyWith<$Res> implements $SocialLoginRequestCopyWith<$Res> {
  factory _$SocialLoginRequestCopyWith(_SocialLoginRequest value, $Res Function(_SocialLoginRequest) _then) = __$SocialLoginRequestCopyWithImpl;
@override @useResult
$Res call({
 String provider, String token, String? email, String? firstname, String? lastname
});




}
/// @nodoc
class __$SocialLoginRequestCopyWithImpl<$Res>
    implements _$SocialLoginRequestCopyWith<$Res> {
  __$SocialLoginRequestCopyWithImpl(this._self, this._then);

  final _SocialLoginRequest _self;
  final $Res Function(_SocialLoginRequest) _then;

/// Create a copy of SocialLoginRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? token = null,Object? email = freezed,Object? firstname = freezed,Object? lastname = freezed,}) {
  return _then(_SocialLoginRequest(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstname: freezed == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
as String?,lastname: freezed == lastname ? _self.lastname : lastname // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TokenRefreshRequest {

 String get refreshToken;
/// Create a copy of TokenRefreshRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenRefreshRequestCopyWith<TokenRefreshRequest> get copyWith => _$TokenRefreshRequestCopyWithImpl<TokenRefreshRequest>(this as TokenRefreshRequest, _$identity);

  /// Serializes this TokenRefreshRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenRefreshRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'TokenRefreshRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $TokenRefreshRequestCopyWith<$Res>  {
  factory $TokenRefreshRequestCopyWith(TokenRefreshRequest value, $Res Function(TokenRefreshRequest) _then) = _$TokenRefreshRequestCopyWithImpl;
@useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class _$TokenRefreshRequestCopyWithImpl<$Res>
    implements $TokenRefreshRequestCopyWith<$Res> {
  _$TokenRefreshRequestCopyWithImpl(this._self, this._then);

  final TokenRefreshRequest _self;
  final $Res Function(TokenRefreshRequest) _then;

/// Create a copy of TokenRefreshRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refreshToken = null,}) {
  return _then(_self.copyWith(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenRefreshRequest].
extension TokenRefreshRequestPatterns on TokenRefreshRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenRefreshRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenRefreshRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenRefreshRequest value)  $default,){
final _that = this;
switch (_that) {
case _TokenRefreshRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenRefreshRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TokenRefreshRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenRefreshRequest() when $default != null:
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _TokenRefreshRequest():
return $default(_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _TokenRefreshRequest() when $default != null:
return $default(_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenRefreshRequest implements TokenRefreshRequest {
  const _TokenRefreshRequest({required this.refreshToken});
  factory _TokenRefreshRequest.fromJson(Map<String, dynamic> json) => _$TokenRefreshRequestFromJson(json);

@override final  String refreshToken;

/// Create a copy of TokenRefreshRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenRefreshRequestCopyWith<_TokenRefreshRequest> get copyWith => __$TokenRefreshRequestCopyWithImpl<_TokenRefreshRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenRefreshRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenRefreshRequest&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refreshToken);

@override
String toString() {
  return 'TokenRefreshRequest(refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$TokenRefreshRequestCopyWith<$Res> implements $TokenRefreshRequestCopyWith<$Res> {
  factory _$TokenRefreshRequestCopyWith(_TokenRefreshRequest value, $Res Function(_TokenRefreshRequest) _then) = __$TokenRefreshRequestCopyWithImpl;
@override @useResult
$Res call({
 String refreshToken
});




}
/// @nodoc
class __$TokenRefreshRequestCopyWithImpl<$Res>
    implements _$TokenRefreshRequestCopyWith<$Res> {
  __$TokenRefreshRequestCopyWithImpl(this._self, this._then);

  final _TokenRefreshRequest _self;
  final $Res Function(_TokenRefreshRequest) _then;

/// Create a copy of TokenRefreshRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refreshToken = null,}) {
  return _then(_TokenRefreshRequest(
refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SessionInfo {

 String get sessionId; DateTime get createdAt; DateTime get expiresAt; bool get isValid; String? get customerId; String? get cartId;
/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionInfoCopyWith<SessionInfo> get copyWith => _$SessionInfoCopyWithImpl<SessionInfo>(this as SessionInfo, _$identity);

  /// Serializes this SessionInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionInfo&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.cartId, cartId) || other.cartId == cartId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,createdAt,expiresAt,isValid,customerId,cartId);

@override
String toString() {
  return 'SessionInfo(sessionId: $sessionId, createdAt: $createdAt, expiresAt: $expiresAt, isValid: $isValid, customerId: $customerId, cartId: $cartId)';
}


}

/// @nodoc
abstract mixin class $SessionInfoCopyWith<$Res>  {
  factory $SessionInfoCopyWith(SessionInfo value, $Res Function(SessionInfo) _then) = _$SessionInfoCopyWithImpl;
@useResult
$Res call({
 String sessionId, DateTime createdAt, DateTime expiresAt, bool isValid, String? customerId, String? cartId
});




}
/// @nodoc
class _$SessionInfoCopyWithImpl<$Res>
    implements $SessionInfoCopyWith<$Res> {
  _$SessionInfoCopyWithImpl(this._self, this._then);

  final SessionInfo _self;
  final $Res Function(SessionInfo) _then;

/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? createdAt = null,Object? expiresAt = null,Object? isValid = null,Object? customerId = freezed,Object? cartId = freezed,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,cartId: freezed == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionInfo].
extension SessionInfoPatterns on SessionInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionInfo value)  $default,){
final _that = this;
switch (_that) {
case _SessionInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sessionId,  DateTime createdAt,  DateTime expiresAt,  bool isValid,  String? customerId,  String? cartId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
return $default(_that.sessionId,_that.createdAt,_that.expiresAt,_that.isValid,_that.customerId,_that.cartId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sessionId,  DateTime createdAt,  DateTime expiresAt,  bool isValid,  String? customerId,  String? cartId)  $default,) {final _that = this;
switch (_that) {
case _SessionInfo():
return $default(_that.sessionId,_that.createdAt,_that.expiresAt,_that.isValid,_that.customerId,_that.cartId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sessionId,  DateTime createdAt,  DateTime expiresAt,  bool isValid,  String? customerId,  String? cartId)?  $default,) {final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
return $default(_that.sessionId,_that.createdAt,_that.expiresAt,_that.isValid,_that.customerId,_that.cartId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionInfo implements SessionInfo {
  const _SessionInfo({required this.sessionId, required this.createdAt, required this.expiresAt, required this.isValid, this.customerId, this.cartId});
  factory _SessionInfo.fromJson(Map<String, dynamic> json) => _$SessionInfoFromJson(json);

@override final  String sessionId;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;
@override final  bool isValid;
@override final  String? customerId;
@override final  String? cartId;

/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionInfoCopyWith<_SessionInfo> get copyWith => __$SessionInfoCopyWithImpl<_SessionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionInfo&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.cartId, cartId) || other.cartId == cartId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,createdAt,expiresAt,isValid,customerId,cartId);

@override
String toString() {
  return 'SessionInfo(sessionId: $sessionId, createdAt: $createdAt, expiresAt: $expiresAt, isValid: $isValid, customerId: $customerId, cartId: $cartId)';
}


}

/// @nodoc
abstract mixin class _$SessionInfoCopyWith<$Res> implements $SessionInfoCopyWith<$Res> {
  factory _$SessionInfoCopyWith(_SessionInfo value, $Res Function(_SessionInfo) _then) = __$SessionInfoCopyWithImpl;
@override @useResult
$Res call({
 String sessionId, DateTime createdAt, DateTime expiresAt, bool isValid, String? customerId, String? cartId
});




}
/// @nodoc
class __$SessionInfoCopyWithImpl<$Res>
    implements _$SessionInfoCopyWith<$Res> {
  __$SessionInfoCopyWithImpl(this._self, this._then);

  final _SessionInfo _self;
  final $Res Function(_SessionInfo) _then;

/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? createdAt = null,Object? expiresAt = null,Object? isValid = null,Object? customerId = freezed,Object? cartId = freezed,}) {
  return _then(_SessionInfo(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String?,cartId: freezed == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
