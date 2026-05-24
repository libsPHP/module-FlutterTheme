// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutSession {

 String get id; String get cartId; String? get email; Map<String, dynamic>? get shippingAddress; Map<String, dynamic>? get billingAddress; String? get shippingMethod; String? get paymentMethod; Map<String, dynamic>? get additionalData; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutSessionCopyWith<CheckoutSession> get copyWith => _$CheckoutSessionCopyWithImpl<CheckoutSession>(this as CheckoutSession, _$identity);

  /// Serializes this CheckoutSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSession&&(identical(other.id, id) || other.id == id)&&(identical(other.cartId, cartId) || other.cartId == cartId)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.shippingAddress, shippingAddress)&&const DeepCollectionEquality().equals(other.billingAddress, billingAddress)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&const DeepCollectionEquality().equals(other.additionalData, additionalData)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cartId,email,const DeepCollectionEquality().hash(shippingAddress),const DeepCollectionEquality().hash(billingAddress),shippingMethod,paymentMethod,const DeepCollectionEquality().hash(additionalData),createdAt,updatedAt);

@override
String toString() {
  return 'CheckoutSession(id: $id, cartId: $cartId, email: $email, shippingAddress: $shippingAddress, billingAddress: $billingAddress, shippingMethod: $shippingMethod, paymentMethod: $paymentMethod, additionalData: $additionalData, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CheckoutSessionCopyWith<$Res>  {
  factory $CheckoutSessionCopyWith(CheckoutSession value, $Res Function(CheckoutSession) _then) = _$CheckoutSessionCopyWithImpl;
@useResult
$Res call({
 String id, String cartId, String? email, Map<String, dynamic>? shippingAddress, Map<String, dynamic>? billingAddress, String? shippingMethod, String? paymentMethod, Map<String, dynamic>? additionalData, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CheckoutSessionCopyWithImpl<$Res>
    implements $CheckoutSessionCopyWith<$Res> {
  _$CheckoutSessionCopyWithImpl(this._self, this._then);

  final CheckoutSession _self;
  final $Res Function(CheckoutSession) _then;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cartId = null,Object? email = freezed,Object? shippingAddress = freezed,Object? billingAddress = freezed,Object? shippingMethod = freezed,Object? paymentMethod = freezed,Object? additionalData = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,billingAddress: freezed == billingAddress ? _self.billingAddress : billingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,shippingMethod: freezed == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,additionalData: freezed == additionalData ? _self.additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutSession].
extension CheckoutSessionPatterns on CheckoutSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutSession value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutSession value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String cartId,  String? email,  Map<String, dynamic>? shippingAddress,  Map<String, dynamic>? billingAddress,  String? shippingMethod,  String? paymentMethod,  Map<String, dynamic>? additionalData,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
return $default(_that.id,_that.cartId,_that.email,_that.shippingAddress,_that.billingAddress,_that.shippingMethod,_that.paymentMethod,_that.additionalData,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String cartId,  String? email,  Map<String, dynamic>? shippingAddress,  Map<String, dynamic>? billingAddress,  String? shippingMethod,  String? paymentMethod,  Map<String, dynamic>? additionalData,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CheckoutSession():
return $default(_that.id,_that.cartId,_that.email,_that.shippingAddress,_that.billingAddress,_that.shippingMethod,_that.paymentMethod,_that.additionalData,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String cartId,  String? email,  Map<String, dynamic>? shippingAddress,  Map<String, dynamic>? billingAddress,  String? shippingMethod,  String? paymentMethod,  Map<String, dynamic>? additionalData,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
return $default(_that.id,_that.cartId,_that.email,_that.shippingAddress,_that.billingAddress,_that.shippingMethod,_that.paymentMethod,_that.additionalData,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutSession implements CheckoutSession {
  const _CheckoutSession({required this.id, required this.cartId, this.email, final  Map<String, dynamic>? shippingAddress, final  Map<String, dynamic>? billingAddress, this.shippingMethod, this.paymentMethod, final  Map<String, dynamic>? additionalData, this.createdAt, this.updatedAt}): _shippingAddress = shippingAddress,_billingAddress = billingAddress,_additionalData = additionalData;
  factory _CheckoutSession.fromJson(Map<String, dynamic> json) => _$CheckoutSessionFromJson(json);

@override final  String id;
@override final  String cartId;
@override final  String? email;
 final  Map<String, dynamic>? _shippingAddress;
@override Map<String, dynamic>? get shippingAddress {
  final value = _shippingAddress;
  if (value == null) return null;
  if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _billingAddress;
@override Map<String, dynamic>? get billingAddress {
  final value = _billingAddress;
  if (value == null) return null;
  if (_billingAddress is EqualUnmodifiableMapView) return _billingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? shippingMethod;
@override final  String? paymentMethod;
 final  Map<String, dynamic>? _additionalData;
@override Map<String, dynamic>? get additionalData {
  final value = _additionalData;
  if (value == null) return null;
  if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutSessionCopyWith<_CheckoutSession> get copyWith => __$CheckoutSessionCopyWithImpl<_CheckoutSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutSession&&(identical(other.id, id) || other.id == id)&&(identical(other.cartId, cartId) || other.cartId == cartId)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._shippingAddress, _shippingAddress)&&const DeepCollectionEquality().equals(other._billingAddress, _billingAddress)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&const DeepCollectionEquality().equals(other._additionalData, _additionalData)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cartId,email,const DeepCollectionEquality().hash(_shippingAddress),const DeepCollectionEquality().hash(_billingAddress),shippingMethod,paymentMethod,const DeepCollectionEquality().hash(_additionalData),createdAt,updatedAt);

@override
String toString() {
  return 'CheckoutSession(id: $id, cartId: $cartId, email: $email, shippingAddress: $shippingAddress, billingAddress: $billingAddress, shippingMethod: $shippingMethod, paymentMethod: $paymentMethod, additionalData: $additionalData, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CheckoutSessionCopyWith<$Res> implements $CheckoutSessionCopyWith<$Res> {
  factory _$CheckoutSessionCopyWith(_CheckoutSession value, $Res Function(_CheckoutSession) _then) = __$CheckoutSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String cartId, String? email, Map<String, dynamic>? shippingAddress, Map<String, dynamic>? billingAddress, String? shippingMethod, String? paymentMethod, Map<String, dynamic>? additionalData, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CheckoutSessionCopyWithImpl<$Res>
    implements _$CheckoutSessionCopyWith<$Res> {
  __$CheckoutSessionCopyWithImpl(this._self, this._then);

  final _CheckoutSession _self;
  final $Res Function(_CheckoutSession) _then;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cartId = null,Object? email = freezed,Object? shippingAddress = freezed,Object? billingAddress = freezed,Object? shippingMethod = freezed,Object? paymentMethod = freezed,Object? additionalData = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CheckoutSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,shippingAddress: freezed == shippingAddress ? _self._shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,billingAddress: freezed == billingAddress ? _self._billingAddress : billingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,shippingMethod: freezed == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,additionalData: freezed == additionalData ? _self._additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ShippingMethod {

 String get code; String get title; double get amount; String get currency; String? get carrierCode; String? get carrierTitle; String? get methodCode; String? get methodTitle; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of ShippingMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingMethodCopyWith<ShippingMethod> get copyWith => _$ShippingMethodCopyWithImpl<ShippingMethod>(this as ShippingMethod, _$identity);

  /// Serializes this ShippingMethod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingMethod&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.carrierCode, carrierCode) || other.carrierCode == carrierCode)&&(identical(other.carrierTitle, carrierTitle) || other.carrierTitle == carrierTitle)&&(identical(other.methodCode, methodCode) || other.methodCode == methodCode)&&(identical(other.methodTitle, methodTitle) || other.methodTitle == methodTitle)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,amount,currency,carrierCode,carrierTitle,methodCode,methodTitle,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'ShippingMethod(code: $code, title: $title, amount: $amount, currency: $currency, carrierCode: $carrierCode, carrierTitle: $carrierTitle, methodCode: $methodCode, methodTitle: $methodTitle, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $ShippingMethodCopyWith<$Res>  {
  factory $ShippingMethodCopyWith(ShippingMethod value, $Res Function(ShippingMethod) _then) = _$ShippingMethodCopyWithImpl;
@useResult
$Res call({
 String code, String title, double amount, String currency, String? carrierCode, String? carrierTitle, String? methodCode, String? methodTitle, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$ShippingMethodCopyWithImpl<$Res>
    implements $ShippingMethodCopyWith<$Res> {
  _$ShippingMethodCopyWithImpl(this._self, this._then);

  final ShippingMethod _self;
  final $Res Function(ShippingMethod) _then;

/// Create a copy of ShippingMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? title = null,Object? amount = null,Object? currency = null,Object? carrierCode = freezed,Object? carrierTitle = freezed,Object? methodCode = freezed,Object? methodTitle = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,carrierCode: freezed == carrierCode ? _self.carrierCode : carrierCode // ignore: cast_nullable_to_non_nullable
as String?,carrierTitle: freezed == carrierTitle ? _self.carrierTitle : carrierTitle // ignore: cast_nullable_to_non_nullable
as String?,methodCode: freezed == methodCode ? _self.methodCode : methodCode // ignore: cast_nullable_to_non_nullable
as String?,methodTitle: freezed == methodTitle ? _self.methodTitle : methodTitle // ignore: cast_nullable_to_non_nullable
as String?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingMethod].
extension ShippingMethodPatterns on ShippingMethod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingMethod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingMethod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingMethod value)  $default,){
final _that = this;
switch (_that) {
case _ShippingMethod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingMethod value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingMethod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String title,  double amount,  String currency,  String? carrierCode,  String? carrierTitle,  String? methodCode,  String? methodTitle,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingMethod() when $default != null:
return $default(_that.code,_that.title,_that.amount,_that.currency,_that.carrierCode,_that.carrierTitle,_that.methodCode,_that.methodTitle,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String title,  double amount,  String currency,  String? carrierCode,  String? carrierTitle,  String? methodCode,  String? methodTitle,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _ShippingMethod():
return $default(_that.code,_that.title,_that.amount,_that.currency,_that.carrierCode,_that.carrierTitle,_that.methodCode,_that.methodTitle,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String title,  double amount,  String currency,  String? carrierCode,  String? carrierTitle,  String? methodCode,  String? methodTitle,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _ShippingMethod() when $default != null:
return $default(_that.code,_that.title,_that.amount,_that.currency,_that.carrierCode,_that.carrierTitle,_that.methodCode,_that.methodTitle,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingMethod implements ShippingMethod {
  const _ShippingMethod({required this.code, required this.title, required this.amount, required this.currency, this.carrierCode, this.carrierTitle, this.methodCode, this.methodTitle, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _ShippingMethod.fromJson(Map<String, dynamic> json) => _$ShippingMethodFromJson(json);

@override final  String code;
@override final  String title;
@override final  double amount;
@override final  String currency;
@override final  String? carrierCode;
@override final  String? carrierTitle;
@override final  String? methodCode;
@override final  String? methodTitle;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ShippingMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingMethodCopyWith<_ShippingMethod> get copyWith => __$ShippingMethodCopyWithImpl<_ShippingMethod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingMethodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingMethod&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.carrierCode, carrierCode) || other.carrierCode == carrierCode)&&(identical(other.carrierTitle, carrierTitle) || other.carrierTitle == carrierTitle)&&(identical(other.methodCode, methodCode) || other.methodCode == methodCode)&&(identical(other.methodTitle, methodTitle) || other.methodTitle == methodTitle)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,amount,currency,carrierCode,carrierTitle,methodCode,methodTitle,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'ShippingMethod(code: $code, title: $title, amount: $amount, currency: $currency, carrierCode: $carrierCode, carrierTitle: $carrierTitle, methodCode: $methodCode, methodTitle: $methodTitle, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$ShippingMethodCopyWith<$Res> implements $ShippingMethodCopyWith<$Res> {
  factory _$ShippingMethodCopyWith(_ShippingMethod value, $Res Function(_ShippingMethod) _then) = __$ShippingMethodCopyWithImpl;
@override @useResult
$Res call({
 String code, String title, double amount, String currency, String? carrierCode, String? carrierTitle, String? methodCode, String? methodTitle, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$ShippingMethodCopyWithImpl<$Res>
    implements _$ShippingMethodCopyWith<$Res> {
  __$ShippingMethodCopyWithImpl(this._self, this._then);

  final _ShippingMethod _self;
  final $Res Function(_ShippingMethod) _then;

/// Create a copy of ShippingMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? title = null,Object? amount = null,Object? currency = null,Object? carrierCode = freezed,Object? carrierTitle = freezed,Object? methodCode = freezed,Object? methodTitle = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_ShippingMethod(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,carrierCode: freezed == carrierCode ? _self.carrierCode : carrierCode // ignore: cast_nullable_to_non_nullable
as String?,carrierTitle: freezed == carrierTitle ? _self.carrierTitle : carrierTitle // ignore: cast_nullable_to_non_nullable
as String?,methodCode: freezed == methodCode ? _self.methodCode : methodCode // ignore: cast_nullable_to_non_nullable
as String?,methodTitle: freezed == methodTitle ? _self.methodTitle : methodTitle // ignore: cast_nullable_to_non_nullable
as String?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$PaymentMethod {

 String get code; String get title; String? get description; Map<String, dynamic>? get config; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodCopyWith<PaymentMethod> get copyWith => _$PaymentMethodCopyWithImpl<PaymentMethod>(this as PaymentMethod, _$identity);

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethod&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.config, config)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,description,const DeepCollectionEquality().hash(config),const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'PaymentMethod(code: $code, title: $title, description: $description, config: $config, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodCopyWith<$Res>  {
  factory $PaymentMethodCopyWith(PaymentMethod value, $Res Function(PaymentMethod) _then) = _$PaymentMethodCopyWithImpl;
@useResult
$Res call({
 String code, String title, String? description, Map<String, dynamic>? config, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._self, this._then);

  final PaymentMethod _self;
  final $Res Function(PaymentMethod) _then;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? title = null,Object? description = freezed,Object? config = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethod].
extension PaymentMethodPatterns on PaymentMethod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethod value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethod value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String title,  String? description,  Map<String, dynamic>? config,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.config,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String title,  String? description,  Map<String, dynamic>? config,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethod():
return $default(_that.code,_that.title,_that.description,_that.config,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String title,  String? description,  Map<String, dynamic>? config,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.config,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethod implements PaymentMethod {
  const _PaymentMethod({required this.code, required this.title, this.description, final  Map<String, dynamic>? config, final  Map<String, dynamic>? extensionAttributes}): _config = config,_extensionAttributes = extensionAttributes;
  factory _PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

@override final  String code;
@override final  String title;
@override final  String? description;
 final  Map<String, dynamic>? _config;
@override Map<String, dynamic>? get config {
  final value = _config;
  if (value == null) return null;
  if (_config is EqualUnmodifiableMapView) return _config;
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


/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodCopyWith<_PaymentMethod> get copyWith => __$PaymentMethodCopyWithImpl<_PaymentMethod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethod&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._config, _config)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,description,const DeepCollectionEquality().hash(_config),const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'PaymentMethod(code: $code, title: $title, description: $description, config: $config, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodCopyWith<$Res> implements $PaymentMethodCopyWith<$Res> {
  factory _$PaymentMethodCopyWith(_PaymentMethod value, $Res Function(_PaymentMethod) _then) = __$PaymentMethodCopyWithImpl;
@override @useResult
$Res call({
 String code, String title, String? description, Map<String, dynamic>? config, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$PaymentMethodCopyWithImpl<$Res>
    implements _$PaymentMethodCopyWith<$Res> {
  __$PaymentMethodCopyWithImpl(this._self, this._then);

  final _PaymentMethod _self;
  final $Res Function(_PaymentMethod) _then;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? title = null,Object? description = freezed,Object? config = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_PaymentMethod(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,config: freezed == config ? _self._config : config // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CheckoutValidationResult {

 bool get isValid; List<String>? get errors; List<String>? get warnings; Map<String, dynamic>? get additionalData;
/// Create a copy of CheckoutValidationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutValidationResultCopyWith<CheckoutValidationResult> get copyWith => _$CheckoutValidationResultCopyWithImpl<CheckoutValidationResult>(this as CheckoutValidationResult, _$identity);

  /// Serializes this CheckoutValidationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutValidationResult&&(identical(other.isValid, isValid) || other.isValid == isValid)&&const DeepCollectionEquality().equals(other.errors, errors)&&const DeepCollectionEquality().equals(other.warnings, warnings)&&const DeepCollectionEquality().equals(other.additionalData, additionalData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,const DeepCollectionEquality().hash(errors),const DeepCollectionEquality().hash(warnings),const DeepCollectionEquality().hash(additionalData));

@override
String toString() {
  return 'CheckoutValidationResult(isValid: $isValid, errors: $errors, warnings: $warnings, additionalData: $additionalData)';
}


}

/// @nodoc
abstract mixin class $CheckoutValidationResultCopyWith<$Res>  {
  factory $CheckoutValidationResultCopyWith(CheckoutValidationResult value, $Res Function(CheckoutValidationResult) _then) = _$CheckoutValidationResultCopyWithImpl;
@useResult
$Res call({
 bool isValid, List<String>? errors, List<String>? warnings, Map<String, dynamic>? additionalData
});




}
/// @nodoc
class _$CheckoutValidationResultCopyWithImpl<$Res>
    implements $CheckoutValidationResultCopyWith<$Res> {
  _$CheckoutValidationResultCopyWithImpl(this._self, this._then);

  final CheckoutValidationResult _self;
  final $Res Function(CheckoutValidationResult) _then;

/// Create a copy of CheckoutValidationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isValid = null,Object? errors = freezed,Object? warnings = freezed,Object? additionalData = freezed,}) {
  return _then(_self.copyWith(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,warnings: freezed == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<String>?,additionalData: freezed == additionalData ? _self.additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutValidationResult].
extension CheckoutValidationResultPatterns on CheckoutValidationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutValidationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutValidationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutValidationResult value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutValidationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutValidationResult value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutValidationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isValid,  List<String>? errors,  List<String>? warnings,  Map<String, dynamic>? additionalData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutValidationResult() when $default != null:
return $default(_that.isValid,_that.errors,_that.warnings,_that.additionalData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isValid,  List<String>? errors,  List<String>? warnings,  Map<String, dynamic>? additionalData)  $default,) {final _that = this;
switch (_that) {
case _CheckoutValidationResult():
return $default(_that.isValid,_that.errors,_that.warnings,_that.additionalData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isValid,  List<String>? errors,  List<String>? warnings,  Map<String, dynamic>? additionalData)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutValidationResult() when $default != null:
return $default(_that.isValid,_that.errors,_that.warnings,_that.additionalData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutValidationResult implements CheckoutValidationResult {
  const _CheckoutValidationResult({required this.isValid, final  List<String>? errors, final  List<String>? warnings, final  Map<String, dynamic>? additionalData}): _errors = errors,_warnings = warnings,_additionalData = additionalData;
  factory _CheckoutValidationResult.fromJson(Map<String, dynamic> json) => _$CheckoutValidationResultFromJson(json);

@override final  bool isValid;
 final  List<String>? _errors;
@override List<String>? get errors {
  final value = _errors;
  if (value == null) return null;
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _warnings;
@override List<String>? get warnings {
  final value = _warnings;
  if (value == null) return null;
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _additionalData;
@override Map<String, dynamic>? get additionalData {
  final value = _additionalData;
  if (value == null) return null;
  if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CheckoutValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutValidationResultCopyWith<_CheckoutValidationResult> get copyWith => __$CheckoutValidationResultCopyWithImpl<_CheckoutValidationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutValidationResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutValidationResult&&(identical(other.isValid, isValid) || other.isValid == isValid)&&const DeepCollectionEquality().equals(other._errors, _errors)&&const DeepCollectionEquality().equals(other._warnings, _warnings)&&const DeepCollectionEquality().equals(other._additionalData, _additionalData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isValid,const DeepCollectionEquality().hash(_errors),const DeepCollectionEquality().hash(_warnings),const DeepCollectionEquality().hash(_additionalData));

@override
String toString() {
  return 'CheckoutValidationResult(isValid: $isValid, errors: $errors, warnings: $warnings, additionalData: $additionalData)';
}


}

/// @nodoc
abstract mixin class _$CheckoutValidationResultCopyWith<$Res> implements $CheckoutValidationResultCopyWith<$Res> {
  factory _$CheckoutValidationResultCopyWith(_CheckoutValidationResult value, $Res Function(_CheckoutValidationResult) _then) = __$CheckoutValidationResultCopyWithImpl;
@override @useResult
$Res call({
 bool isValid, List<String>? errors, List<String>? warnings, Map<String, dynamic>? additionalData
});




}
/// @nodoc
class __$CheckoutValidationResultCopyWithImpl<$Res>
    implements _$CheckoutValidationResultCopyWith<$Res> {
  __$CheckoutValidationResultCopyWithImpl(this._self, this._then);

  final _CheckoutValidationResult _self;
  final $Res Function(_CheckoutValidationResult) _then;

/// Create a copy of CheckoutValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? errors = freezed,Object? warnings = freezed,Object? additionalData = freezed,}) {
  return _then(_CheckoutValidationResult(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,errors: freezed == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<String>?,warnings: freezed == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<String>?,additionalData: freezed == additionalData ? _self._additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CheckoutTotals {

 double get grandTotal; double get subtotal; double get subtotalInclTax; double get shippingAmount; double get shippingInclTax; double get taxAmount; double get discountAmount; String get currency; List<CheckoutTotalItem>? get items; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutTotalsCopyWith<CheckoutTotals> get copyWith => _$CheckoutTotalsCopyWithImpl<CheckoutTotals>(this as CheckoutTotals, _$identity);

  /// Serializes this CheckoutTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutTotals&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.subtotalInclTax, subtotalInclTax) || other.subtotalInclTax == subtotalInclTax)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.shippingInclTax, shippingInclTax) || other.shippingInclTax == shippingInclTax)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,grandTotal,subtotal,subtotalInclTax,shippingAmount,shippingInclTax,taxAmount,discountAmount,currency,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CheckoutTotals(grandTotal: $grandTotal, subtotal: $subtotal, subtotalInclTax: $subtotalInclTax, shippingAmount: $shippingAmount, shippingInclTax: $shippingInclTax, taxAmount: $taxAmount, discountAmount: $discountAmount, currency: $currency, items: $items, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CheckoutTotalsCopyWith<$Res>  {
  factory $CheckoutTotalsCopyWith(CheckoutTotals value, $Res Function(CheckoutTotals) _then) = _$CheckoutTotalsCopyWithImpl;
@useResult
$Res call({
 double grandTotal, double subtotal, double subtotalInclTax, double shippingAmount, double shippingInclTax, double taxAmount, double discountAmount, String currency, List<CheckoutTotalItem>? items, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CheckoutTotalsCopyWithImpl<$Res>
    implements $CheckoutTotalsCopyWith<$Res> {
  _$CheckoutTotalsCopyWithImpl(this._self, this._then);

  final CheckoutTotals _self;
  final $Res Function(CheckoutTotals) _then;

/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? grandTotal = null,Object? subtotal = null,Object? subtotalInclTax = null,Object? shippingAmount = null,Object? shippingInclTax = null,Object? taxAmount = null,Object? discountAmount = null,Object? currency = null,Object? items = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,subtotalInclTax: null == subtotalInclTax ? _self.subtotalInclTax : subtotalInclTax // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: null == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double,shippingInclTax: null == shippingInclTax ? _self.shippingInclTax : shippingInclTax // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutTotalItem>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutTotals].
extension CheckoutTotalsPatterns on CheckoutTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutTotals value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutTotals value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double grandTotal,  double subtotal,  double subtotalInclTax,  double shippingAmount,  double shippingInclTax,  double taxAmount,  double discountAmount,  String currency,  List<CheckoutTotalItem>? items,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
return $default(_that.grandTotal,_that.subtotal,_that.subtotalInclTax,_that.shippingAmount,_that.shippingInclTax,_that.taxAmount,_that.discountAmount,_that.currency,_that.items,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double grandTotal,  double subtotal,  double subtotalInclTax,  double shippingAmount,  double shippingInclTax,  double taxAmount,  double discountAmount,  String currency,  List<CheckoutTotalItem>? items,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CheckoutTotals():
return $default(_that.grandTotal,_that.subtotal,_that.subtotalInclTax,_that.shippingAmount,_that.shippingInclTax,_that.taxAmount,_that.discountAmount,_that.currency,_that.items,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double grandTotal,  double subtotal,  double subtotalInclTax,  double shippingAmount,  double shippingInclTax,  double taxAmount,  double discountAmount,  String currency,  List<CheckoutTotalItem>? items,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutTotals() when $default != null:
return $default(_that.grandTotal,_that.subtotal,_that.subtotalInclTax,_that.shippingAmount,_that.shippingInclTax,_that.taxAmount,_that.discountAmount,_that.currency,_that.items,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutTotals implements CheckoutTotals {
  const _CheckoutTotals({required this.grandTotal, required this.subtotal, required this.subtotalInclTax, required this.shippingAmount, required this.shippingInclTax, required this.taxAmount, required this.discountAmount, required this.currency, final  List<CheckoutTotalItem>? items, final  Map<String, dynamic>? extensionAttributes}): _items = items,_extensionAttributes = extensionAttributes;
  factory _CheckoutTotals.fromJson(Map<String, dynamic> json) => _$CheckoutTotalsFromJson(json);

@override final  double grandTotal;
@override final  double subtotal;
@override final  double subtotalInclTax;
@override final  double shippingAmount;
@override final  double shippingInclTax;
@override final  double taxAmount;
@override final  double discountAmount;
@override final  String currency;
 final  List<CheckoutTotalItem>? _items;
@override List<CheckoutTotalItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutTotalsCopyWith<_CheckoutTotals> get copyWith => __$CheckoutTotalsCopyWithImpl<_CheckoutTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutTotals&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.subtotalInclTax, subtotalInclTax) || other.subtotalInclTax == subtotalInclTax)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.shippingInclTax, shippingInclTax) || other.shippingInclTax == shippingInclTax)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,grandTotal,subtotal,subtotalInclTax,shippingAmount,shippingInclTax,taxAmount,discountAmount,currency,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CheckoutTotals(grandTotal: $grandTotal, subtotal: $subtotal, subtotalInclTax: $subtotalInclTax, shippingAmount: $shippingAmount, shippingInclTax: $shippingInclTax, taxAmount: $taxAmount, discountAmount: $discountAmount, currency: $currency, items: $items, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CheckoutTotalsCopyWith<$Res> implements $CheckoutTotalsCopyWith<$Res> {
  factory _$CheckoutTotalsCopyWith(_CheckoutTotals value, $Res Function(_CheckoutTotals) _then) = __$CheckoutTotalsCopyWithImpl;
@override @useResult
$Res call({
 double grandTotal, double subtotal, double subtotalInclTax, double shippingAmount, double shippingInclTax, double taxAmount, double discountAmount, String currency, List<CheckoutTotalItem>? items, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CheckoutTotalsCopyWithImpl<$Res>
    implements _$CheckoutTotalsCopyWith<$Res> {
  __$CheckoutTotalsCopyWithImpl(this._self, this._then);

  final _CheckoutTotals _self;
  final $Res Function(_CheckoutTotals) _then;

/// Create a copy of CheckoutTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? grandTotal = null,Object? subtotal = null,Object? subtotalInclTax = null,Object? shippingAmount = null,Object? shippingInclTax = null,Object? taxAmount = null,Object? discountAmount = null,Object? currency = null,Object? items = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CheckoutTotals(
grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,subtotalInclTax: null == subtotalInclTax ? _self.subtotalInclTax : subtotalInclTax // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: null == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double,shippingInclTax: null == shippingInclTax ? _self.shippingInclTax : shippingInclTax // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutTotalItem>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CheckoutTotalItem {

 String get code; String get title; double get value; String get currency; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CheckoutTotalItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutTotalItemCopyWith<CheckoutTotalItem> get copyWith => _$CheckoutTotalItemCopyWithImpl<CheckoutTotalItem>(this as CheckoutTotalItem, _$identity);

  /// Serializes this CheckoutTotalItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutTotalItem&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,value,currency,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CheckoutTotalItem(code: $code, title: $title, value: $value, currency: $currency, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CheckoutTotalItemCopyWith<$Res>  {
  factory $CheckoutTotalItemCopyWith(CheckoutTotalItem value, $Res Function(CheckoutTotalItem) _then) = _$CheckoutTotalItemCopyWithImpl;
@useResult
$Res call({
 String code, String title, double value, String currency, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CheckoutTotalItemCopyWithImpl<$Res>
    implements $CheckoutTotalItemCopyWith<$Res> {
  _$CheckoutTotalItemCopyWithImpl(this._self, this._then);

  final CheckoutTotalItem _self;
  final $Res Function(CheckoutTotalItem) _then;

/// Create a copy of CheckoutTotalItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? title = null,Object? value = null,Object? currency = null,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutTotalItem].
extension CheckoutTotalItemPatterns on CheckoutTotalItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutTotalItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutTotalItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutTotalItem value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutTotalItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutTotalItem value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutTotalItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String title,  double value,  String currency,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutTotalItem() when $default != null:
return $default(_that.code,_that.title,_that.value,_that.currency,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String title,  double value,  String currency,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CheckoutTotalItem():
return $default(_that.code,_that.title,_that.value,_that.currency,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String title,  double value,  String currency,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutTotalItem() when $default != null:
return $default(_that.code,_that.title,_that.value,_that.currency,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutTotalItem implements CheckoutTotalItem {
  const _CheckoutTotalItem({required this.code, required this.title, required this.value, required this.currency, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CheckoutTotalItem.fromJson(Map<String, dynamic> json) => _$CheckoutTotalItemFromJson(json);

@override final  String code;
@override final  String title;
@override final  double value;
@override final  String currency;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CheckoutTotalItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutTotalItemCopyWith<_CheckoutTotalItem> get copyWith => __$CheckoutTotalItemCopyWithImpl<_CheckoutTotalItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutTotalItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutTotalItem&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,title,value,currency,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CheckoutTotalItem(code: $code, title: $title, value: $value, currency: $currency, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CheckoutTotalItemCopyWith<$Res> implements $CheckoutTotalItemCopyWith<$Res> {
  factory _$CheckoutTotalItemCopyWith(_CheckoutTotalItem value, $Res Function(_CheckoutTotalItem) _then) = __$CheckoutTotalItemCopyWithImpl;
@override @useResult
$Res call({
 String code, String title, double value, String currency, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CheckoutTotalItemCopyWithImpl<$Res>
    implements _$CheckoutTotalItemCopyWith<$Res> {
  __$CheckoutTotalItemCopyWithImpl(this._self, this._then);

  final _CheckoutTotalItem _self;
  final $Res Function(_CheckoutTotalItem) _then;

/// Create a copy of CheckoutTotalItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? title = null,Object? value = null,Object? currency = null,Object? extensionAttributes = freezed,}) {
  return _then(_CheckoutTotalItem(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$GuestCheckoutInfo {

 String get cartId; String? get email; Map<String, dynamic>? get shippingAddress; Map<String, dynamic>? get billingAddress; List<ShippingMethod>? get availableShippingMethods; List<PaymentMethod>? get availablePaymentMethods; CheckoutTotals? get totals; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of GuestCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestCheckoutInfoCopyWith<GuestCheckoutInfo> get copyWith => _$GuestCheckoutInfoCopyWithImpl<GuestCheckoutInfo>(this as GuestCheckoutInfo, _$identity);

  /// Serializes this GuestCheckoutInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestCheckoutInfo&&(identical(other.cartId, cartId) || other.cartId == cartId)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.shippingAddress, shippingAddress)&&const DeepCollectionEquality().equals(other.billingAddress, billingAddress)&&const DeepCollectionEquality().equals(other.availableShippingMethods, availableShippingMethods)&&const DeepCollectionEquality().equals(other.availablePaymentMethods, availablePaymentMethods)&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cartId,email,const DeepCollectionEquality().hash(shippingAddress),const DeepCollectionEquality().hash(billingAddress),const DeepCollectionEquality().hash(availableShippingMethods),const DeepCollectionEquality().hash(availablePaymentMethods),totals,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'GuestCheckoutInfo(cartId: $cartId, email: $email, shippingAddress: $shippingAddress, billingAddress: $billingAddress, availableShippingMethods: $availableShippingMethods, availablePaymentMethods: $availablePaymentMethods, totals: $totals, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $GuestCheckoutInfoCopyWith<$Res>  {
  factory $GuestCheckoutInfoCopyWith(GuestCheckoutInfo value, $Res Function(GuestCheckoutInfo) _then) = _$GuestCheckoutInfoCopyWithImpl;
@useResult
$Res call({
 String cartId, String? email, Map<String, dynamic>? shippingAddress, Map<String, dynamic>? billingAddress, List<ShippingMethod>? availableShippingMethods, List<PaymentMethod>? availablePaymentMethods, CheckoutTotals? totals, Map<String, dynamic>? extensionAttributes
});


$CheckoutTotalsCopyWith<$Res>? get totals;

}
/// @nodoc
class _$GuestCheckoutInfoCopyWithImpl<$Res>
    implements $GuestCheckoutInfoCopyWith<$Res> {
  _$GuestCheckoutInfoCopyWithImpl(this._self, this._then);

  final GuestCheckoutInfo _self;
  final $Res Function(GuestCheckoutInfo) _then;

/// Create a copy of GuestCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cartId = null,Object? email = freezed,Object? shippingAddress = freezed,Object? billingAddress = freezed,Object? availableShippingMethods = freezed,Object? availablePaymentMethods = freezed,Object? totals = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,billingAddress: freezed == billingAddress ? _self.billingAddress : billingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,availableShippingMethods: freezed == availableShippingMethods ? _self.availableShippingMethods : availableShippingMethods // ignore: cast_nullable_to_non_nullable
as List<ShippingMethod>?,availablePaymentMethods: freezed == availablePaymentMethods ? _self.availablePaymentMethods : availablePaymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CheckoutTotals?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of GuestCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutTotalsCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $CheckoutTotalsCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [GuestCheckoutInfo].
extension GuestCheckoutInfoPatterns on GuestCheckoutInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestCheckoutInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestCheckoutInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestCheckoutInfo value)  $default,){
final _that = this;
switch (_that) {
case _GuestCheckoutInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestCheckoutInfo value)?  $default,){
final _that = this;
switch (_that) {
case _GuestCheckoutInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cartId,  String? email,  Map<String, dynamic>? shippingAddress,  Map<String, dynamic>? billingAddress,  List<ShippingMethod>? availableShippingMethods,  List<PaymentMethod>? availablePaymentMethods,  CheckoutTotals? totals,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestCheckoutInfo() when $default != null:
return $default(_that.cartId,_that.email,_that.shippingAddress,_that.billingAddress,_that.availableShippingMethods,_that.availablePaymentMethods,_that.totals,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cartId,  String? email,  Map<String, dynamic>? shippingAddress,  Map<String, dynamic>? billingAddress,  List<ShippingMethod>? availableShippingMethods,  List<PaymentMethod>? availablePaymentMethods,  CheckoutTotals? totals,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _GuestCheckoutInfo():
return $default(_that.cartId,_that.email,_that.shippingAddress,_that.billingAddress,_that.availableShippingMethods,_that.availablePaymentMethods,_that.totals,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cartId,  String? email,  Map<String, dynamic>? shippingAddress,  Map<String, dynamic>? billingAddress,  List<ShippingMethod>? availableShippingMethods,  List<PaymentMethod>? availablePaymentMethods,  CheckoutTotals? totals,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _GuestCheckoutInfo() when $default != null:
return $default(_that.cartId,_that.email,_that.shippingAddress,_that.billingAddress,_that.availableShippingMethods,_that.availablePaymentMethods,_that.totals,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuestCheckoutInfo implements GuestCheckoutInfo {
  const _GuestCheckoutInfo({required this.cartId, this.email, final  Map<String, dynamic>? shippingAddress, final  Map<String, dynamic>? billingAddress, final  List<ShippingMethod>? availableShippingMethods, final  List<PaymentMethod>? availablePaymentMethods, this.totals, final  Map<String, dynamic>? extensionAttributes}): _shippingAddress = shippingAddress,_billingAddress = billingAddress,_availableShippingMethods = availableShippingMethods,_availablePaymentMethods = availablePaymentMethods,_extensionAttributes = extensionAttributes;
  factory _GuestCheckoutInfo.fromJson(Map<String, dynamic> json) => _$GuestCheckoutInfoFromJson(json);

@override final  String cartId;
@override final  String? email;
 final  Map<String, dynamic>? _shippingAddress;
@override Map<String, dynamic>? get shippingAddress {
  final value = _shippingAddress;
  if (value == null) return null;
  if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _billingAddress;
@override Map<String, dynamic>? get billingAddress {
  final value = _billingAddress;
  if (value == null) return null;
  if (_billingAddress is EqualUnmodifiableMapView) return _billingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<ShippingMethod>? _availableShippingMethods;
@override List<ShippingMethod>? get availableShippingMethods {
  final value = _availableShippingMethods;
  if (value == null) return null;
  if (_availableShippingMethods is EqualUnmodifiableListView) return _availableShippingMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PaymentMethod>? _availablePaymentMethods;
@override List<PaymentMethod>? get availablePaymentMethods {
  final value = _availablePaymentMethods;
  if (value == null) return null;
  if (_availablePaymentMethods is EqualUnmodifiableListView) return _availablePaymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CheckoutTotals? totals;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of GuestCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestCheckoutInfoCopyWith<_GuestCheckoutInfo> get copyWith => __$GuestCheckoutInfoCopyWithImpl<_GuestCheckoutInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuestCheckoutInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestCheckoutInfo&&(identical(other.cartId, cartId) || other.cartId == cartId)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._shippingAddress, _shippingAddress)&&const DeepCollectionEquality().equals(other._billingAddress, _billingAddress)&&const DeepCollectionEquality().equals(other._availableShippingMethods, _availableShippingMethods)&&const DeepCollectionEquality().equals(other._availablePaymentMethods, _availablePaymentMethods)&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cartId,email,const DeepCollectionEquality().hash(_shippingAddress),const DeepCollectionEquality().hash(_billingAddress),const DeepCollectionEquality().hash(_availableShippingMethods),const DeepCollectionEquality().hash(_availablePaymentMethods),totals,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'GuestCheckoutInfo(cartId: $cartId, email: $email, shippingAddress: $shippingAddress, billingAddress: $billingAddress, availableShippingMethods: $availableShippingMethods, availablePaymentMethods: $availablePaymentMethods, totals: $totals, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$GuestCheckoutInfoCopyWith<$Res> implements $GuestCheckoutInfoCopyWith<$Res> {
  factory _$GuestCheckoutInfoCopyWith(_GuestCheckoutInfo value, $Res Function(_GuestCheckoutInfo) _then) = __$GuestCheckoutInfoCopyWithImpl;
@override @useResult
$Res call({
 String cartId, String? email, Map<String, dynamic>? shippingAddress, Map<String, dynamic>? billingAddress, List<ShippingMethod>? availableShippingMethods, List<PaymentMethod>? availablePaymentMethods, CheckoutTotals? totals, Map<String, dynamic>? extensionAttributes
});


@override $CheckoutTotalsCopyWith<$Res>? get totals;

}
/// @nodoc
class __$GuestCheckoutInfoCopyWithImpl<$Res>
    implements _$GuestCheckoutInfoCopyWith<$Res> {
  __$GuestCheckoutInfoCopyWithImpl(this._self, this._then);

  final _GuestCheckoutInfo _self;
  final $Res Function(_GuestCheckoutInfo) _then;

/// Create a copy of GuestCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cartId = null,Object? email = freezed,Object? shippingAddress = freezed,Object? billingAddress = freezed,Object? availableShippingMethods = freezed,Object? availablePaymentMethods = freezed,Object? totals = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_GuestCheckoutInfo(
cartId: null == cartId ? _self.cartId : cartId // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,shippingAddress: freezed == shippingAddress ? _self._shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,billingAddress: freezed == billingAddress ? _self._billingAddress : billingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,availableShippingMethods: freezed == availableShippingMethods ? _self._availableShippingMethods : availableShippingMethods // ignore: cast_nullable_to_non_nullable
as List<ShippingMethod>?,availablePaymentMethods: freezed == availablePaymentMethods ? _self._availablePaymentMethods : availablePaymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CheckoutTotals?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of GuestCheckoutInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutTotalsCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $CheckoutTotalsCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$CheckoutAddress {

 String? get id; String? get customerId; String? get customerAddressId; String? get email; String? get firstName; String? get lastName; String? get middleName; String? get prefix; String? get suffix; String? get company; List<String>? get street; String? get city; String? get region; String? get regionId; String? get regionCode; String? get postcode; String? get countryId; String? get telephone; String? get fax; bool? get sameAsBilling; bool? get saveInAddressBook; Map<String, dynamic>? get customAttributes; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CheckoutAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutAddressCopyWith<CheckoutAddress> get copyWith => _$CheckoutAddressCopyWithImpl<CheckoutAddress>(this as CheckoutAddress, _$identity);

  /// Serializes this CheckoutAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerAddressId, customerAddressId) || other.customerAddressId == customerAddressId)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&const DeepCollectionEquality().equals(other.street, street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.sameAsBilling, sameAsBilling) || other.sameAsBilling == sameAsBilling)&&(identical(other.saveInAddressBook, saveInAddressBook) || other.saveInAddressBook == saveInAddressBook)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,customerAddressId,email,firstName,lastName,middleName,prefix,suffix,company,const DeepCollectionEquality().hash(street),city,region,regionId,regionCode,postcode,countryId,telephone,fax,sameAsBilling,saveInAddressBook,const DeepCollectionEquality().hash(customAttributes),const DeepCollectionEquality().hash(extensionAttributes)]);

@override
String toString() {
  return 'CheckoutAddress(id: $id, customerId: $customerId, customerAddressId: $customerAddressId, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, regionCode: $regionCode, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, sameAsBilling: $sameAsBilling, saveInAddressBook: $saveInAddressBook, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CheckoutAddressCopyWith<$Res>  {
  factory $CheckoutAddressCopyWith(CheckoutAddress value, $Res Function(CheckoutAddress) _then) = _$CheckoutAddressCopyWithImpl;
@useResult
$Res call({
 String? id, String? customerId, String? customerAddressId, String? email, String? firstName, String? lastName, String? middleName, String? prefix, String? suffix, String? company, List<String>? street, String? city, String? region, String? regionId, String? regionCode, String? postcode, String? countryId, String? telephone, String? fax, bool? sameAsBilling, bool? saveInAddressBook, Map<String, dynamic>? customAttributes, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CheckoutAddressCopyWithImpl<$Res>
    implements $CheckoutAddressCopyWith<$Res> {
  _$CheckoutAddressCopyWithImpl(this._self, this._then);

  final CheckoutAddress _self;
  final $Res Function(CheckoutAddress) _then;

/// Create a copy of CheckoutAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? customerId = freezed,Object? customerAddressId = freezed,Object? email = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = freezed,Object? city = freezed,Object? region = freezed,Object? regionId = freezed,Object? regionCode = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? telephone = freezed,Object? fax = freezed,Object? sameAsBilling = freezed,Object? saveInAddressBook = freezed,Object? customAttributes = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
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
as String?,sameAsBilling: freezed == sameAsBilling ? _self.sameAsBilling : sameAsBilling // ignore: cast_nullable_to_non_nullable
as bool?,saveInAddressBook: freezed == saveInAddressBook ? _self.saveInAddressBook : saveInAddressBook // ignore: cast_nullable_to_non_nullable
as bool?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutAddress].
extension CheckoutAddressPatterns on CheckoutAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutAddress value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutAddress value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? customerId,  String? customerAddressId,  String? email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? regionCode,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? sameAsBilling,  bool? saveInAddressBook,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutAddress() when $default != null:
return $default(_that.id,_that.customerId,_that.customerAddressId,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.regionCode,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.sameAsBilling,_that.saveInAddressBook,_that.customAttributes,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? customerId,  String? customerAddressId,  String? email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? regionCode,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? sameAsBilling,  bool? saveInAddressBook,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CheckoutAddress():
return $default(_that.id,_that.customerId,_that.customerAddressId,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.regionCode,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.sameAsBilling,_that.saveInAddressBook,_that.customAttributes,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? customerId,  String? customerAddressId,  String? email,  String? firstName,  String? lastName,  String? middleName,  String? prefix,  String? suffix,  String? company,  List<String>? street,  String? city,  String? region,  String? regionId,  String? regionCode,  String? postcode,  String? countryId,  String? telephone,  String? fax,  bool? sameAsBilling,  bool? saveInAddressBook,  Map<String, dynamic>? customAttributes,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutAddress() when $default != null:
return $default(_that.id,_that.customerId,_that.customerAddressId,_that.email,_that.firstName,_that.lastName,_that.middleName,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.regionId,_that.regionCode,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.sameAsBilling,_that.saveInAddressBook,_that.customAttributes,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutAddress implements CheckoutAddress {
  const _CheckoutAddress({this.id, this.customerId, this.customerAddressId, this.email, this.firstName, this.lastName, this.middleName, this.prefix, this.suffix, this.company, final  List<String>? street, this.city, this.region, this.regionId, this.regionCode, this.postcode, this.countryId, this.telephone, this.fax, this.sameAsBilling, this.saveInAddressBook, final  Map<String, dynamic>? customAttributes, final  Map<String, dynamic>? extensionAttributes}): _street = street,_customAttributes = customAttributes,_extensionAttributes = extensionAttributes;
  factory _CheckoutAddress.fromJson(Map<String, dynamic> json) => _$CheckoutAddressFromJson(json);

@override final  String? id;
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
@override final  bool? sameAsBilling;
@override final  bool? saveInAddressBook;
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


/// Create a copy of CheckoutAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutAddressCopyWith<_CheckoutAddress> get copyWith => __$CheckoutAddressCopyWithImpl<_CheckoutAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerAddressId, customerAddressId) || other.customerAddressId == customerAddressId)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&const DeepCollectionEquality().equals(other._street, _street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.regionId, regionId) || other.regionId == regionId)&&(identical(other.regionCode, regionCode) || other.regionCode == regionCode)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.sameAsBilling, sameAsBilling) || other.sameAsBilling == sameAsBilling)&&(identical(other.saveInAddressBook, saveInAddressBook) || other.saveInAddressBook == saveInAddressBook)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,customerId,customerAddressId,email,firstName,lastName,middleName,prefix,suffix,company,const DeepCollectionEquality().hash(_street),city,region,regionId,regionCode,postcode,countryId,telephone,fax,sameAsBilling,saveInAddressBook,const DeepCollectionEquality().hash(_customAttributes),const DeepCollectionEquality().hash(_extensionAttributes)]);

@override
String toString() {
  return 'CheckoutAddress(id: $id, customerId: $customerId, customerAddressId: $customerAddressId, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, regionCode: $regionCode, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, sameAsBilling: $sameAsBilling, saveInAddressBook: $saveInAddressBook, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CheckoutAddressCopyWith<$Res> implements $CheckoutAddressCopyWith<$Res> {
  factory _$CheckoutAddressCopyWith(_CheckoutAddress value, $Res Function(_CheckoutAddress) _then) = __$CheckoutAddressCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? customerId, String? customerAddressId, String? email, String? firstName, String? lastName, String? middleName, String? prefix, String? suffix, String? company, List<String>? street, String? city, String? region, String? regionId, String? regionCode, String? postcode, String? countryId, String? telephone, String? fax, bool? sameAsBilling, bool? saveInAddressBook, Map<String, dynamic>? customAttributes, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CheckoutAddressCopyWithImpl<$Res>
    implements _$CheckoutAddressCopyWith<$Res> {
  __$CheckoutAddressCopyWithImpl(this._self, this._then);

  final _CheckoutAddress _self;
  final $Res Function(_CheckoutAddress) _then;

/// Create a copy of CheckoutAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? customerId = freezed,Object? customerAddressId = freezed,Object? email = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = freezed,Object? city = freezed,Object? region = freezed,Object? regionId = freezed,Object? regionCode = freezed,Object? postcode = freezed,Object? countryId = freezed,Object? telephone = freezed,Object? fax = freezed,Object? sameAsBilling = freezed,Object? saveInAddressBook = freezed,Object? customAttributes = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CheckoutAddress(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
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
as String?,sameAsBilling: freezed == sameAsBilling ? _self.sameAsBilling : sameAsBilling // ignore: cast_nullable_to_non_nullable
as bool?,saveInAddressBook: freezed == saveInAddressBook ? _self.saveInAddressBook : saveInAddressBook // ignore: cast_nullable_to_non_nullable
as bool?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CheckoutPaymentInfo {

 String get method; Map<String, dynamic>? get additionalData; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CheckoutPaymentInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutPaymentInfoCopyWith<CheckoutPaymentInfo> get copyWith => _$CheckoutPaymentInfoCopyWithImpl<CheckoutPaymentInfo>(this as CheckoutPaymentInfo, _$identity);

  /// Serializes this CheckoutPaymentInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutPaymentInfo&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other.additionalData, additionalData)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,const DeepCollectionEquality().hash(additionalData),const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CheckoutPaymentInfo(method: $method, additionalData: $additionalData, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CheckoutPaymentInfoCopyWith<$Res>  {
  factory $CheckoutPaymentInfoCopyWith(CheckoutPaymentInfo value, $Res Function(CheckoutPaymentInfo) _then) = _$CheckoutPaymentInfoCopyWithImpl;
@useResult
$Res call({
 String method, Map<String, dynamic>? additionalData, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class _$CheckoutPaymentInfoCopyWithImpl<$Res>
    implements $CheckoutPaymentInfoCopyWith<$Res> {
  _$CheckoutPaymentInfoCopyWithImpl(this._self, this._then);

  final CheckoutPaymentInfo _self;
  final $Res Function(CheckoutPaymentInfo) _then;

/// Create a copy of CheckoutPaymentInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? additionalData = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,additionalData: freezed == additionalData ? _self.additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutPaymentInfo].
extension CheckoutPaymentInfoPatterns on CheckoutPaymentInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutPaymentInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutPaymentInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutPaymentInfo value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutPaymentInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutPaymentInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutPaymentInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  Map<String, dynamic>? additionalData,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutPaymentInfo() when $default != null:
return $default(_that.method,_that.additionalData,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  Map<String, dynamic>? additionalData,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CheckoutPaymentInfo():
return $default(_that.method,_that.additionalData,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  Map<String, dynamic>? additionalData,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutPaymentInfo() when $default != null:
return $default(_that.method,_that.additionalData,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutPaymentInfo implements CheckoutPaymentInfo {
  const _CheckoutPaymentInfo({required this.method, final  Map<String, dynamic>? additionalData, final  Map<String, dynamic>? extensionAttributes}): _additionalData = additionalData,_extensionAttributes = extensionAttributes;
  factory _CheckoutPaymentInfo.fromJson(Map<String, dynamic> json) => _$CheckoutPaymentInfoFromJson(json);

@override final  String method;
 final  Map<String, dynamic>? _additionalData;
@override Map<String, dynamic>? get additionalData {
  final value = _additionalData;
  if (value == null) return null;
  if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
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


/// Create a copy of CheckoutPaymentInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutPaymentInfoCopyWith<_CheckoutPaymentInfo> get copyWith => __$CheckoutPaymentInfoCopyWithImpl<_CheckoutPaymentInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutPaymentInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutPaymentInfo&&(identical(other.method, method) || other.method == method)&&const DeepCollectionEquality().equals(other._additionalData, _additionalData)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,const DeepCollectionEquality().hash(_additionalData),const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CheckoutPaymentInfo(method: $method, additionalData: $additionalData, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CheckoutPaymentInfoCopyWith<$Res> implements $CheckoutPaymentInfoCopyWith<$Res> {
  factory _$CheckoutPaymentInfoCopyWith(_CheckoutPaymentInfo value, $Res Function(_CheckoutPaymentInfo) _then) = __$CheckoutPaymentInfoCopyWithImpl;
@override @useResult
$Res call({
 String method, Map<String, dynamic>? additionalData, Map<String, dynamic>? extensionAttributes
});




}
/// @nodoc
class __$CheckoutPaymentInfoCopyWithImpl<$Res>
    implements _$CheckoutPaymentInfoCopyWith<$Res> {
  __$CheckoutPaymentInfoCopyWithImpl(this._self, this._then);

  final _CheckoutPaymentInfo _self;
  final $Res Function(_CheckoutPaymentInfo) _then;

/// Create a copy of CheckoutPaymentInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? additionalData = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CheckoutPaymentInfo(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,additionalData: freezed == additionalData ? _self._additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CheckoutShippingInfo {

 String get method; CheckoutAddress? get address; Map<String, dynamic>? get extensionAttributes;
/// Create a copy of CheckoutShippingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutShippingInfoCopyWith<CheckoutShippingInfo> get copyWith => _$CheckoutShippingInfoCopyWithImpl<CheckoutShippingInfo>(this as CheckoutShippingInfo, _$identity);

  /// Serializes this CheckoutShippingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutShippingInfo&&(identical(other.method, method) || other.method == method)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.extensionAttributes, extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,address,const DeepCollectionEquality().hash(extensionAttributes));

@override
String toString() {
  return 'CheckoutShippingInfo(method: $method, address: $address, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class $CheckoutShippingInfoCopyWith<$Res>  {
  factory $CheckoutShippingInfoCopyWith(CheckoutShippingInfo value, $Res Function(CheckoutShippingInfo) _then) = _$CheckoutShippingInfoCopyWithImpl;
@useResult
$Res call({
 String method, CheckoutAddress? address, Map<String, dynamic>? extensionAttributes
});


$CheckoutAddressCopyWith<$Res>? get address;

}
/// @nodoc
class _$CheckoutShippingInfoCopyWithImpl<$Res>
    implements $CheckoutShippingInfoCopyWith<$Res> {
  _$CheckoutShippingInfoCopyWithImpl(this._self, this._then);

  final CheckoutShippingInfo _self;
  final $Res Function(CheckoutShippingInfo) _then;

/// Create a copy of CheckoutShippingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? address = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as CheckoutAddress?,extensionAttributes: freezed == extensionAttributes ? _self.extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of CheckoutShippingInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $CheckoutAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckoutShippingInfo].
extension CheckoutShippingInfoPatterns on CheckoutShippingInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutShippingInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutShippingInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutShippingInfo value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutShippingInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutShippingInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutShippingInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  CheckoutAddress? address,  Map<String, dynamic>? extensionAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutShippingInfo() when $default != null:
return $default(_that.method,_that.address,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  CheckoutAddress? address,  Map<String, dynamic>? extensionAttributes)  $default,) {final _that = this;
switch (_that) {
case _CheckoutShippingInfo():
return $default(_that.method,_that.address,_that.extensionAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  CheckoutAddress? address,  Map<String, dynamic>? extensionAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutShippingInfo() when $default != null:
return $default(_that.method,_that.address,_that.extensionAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutShippingInfo implements CheckoutShippingInfo {
  const _CheckoutShippingInfo({required this.method, this.address, final  Map<String, dynamic>? extensionAttributes}): _extensionAttributes = extensionAttributes;
  factory _CheckoutShippingInfo.fromJson(Map<String, dynamic> json) => _$CheckoutShippingInfoFromJson(json);

@override final  String method;
@override final  CheckoutAddress? address;
 final  Map<String, dynamic>? _extensionAttributes;
@override Map<String, dynamic>? get extensionAttributes {
  final value = _extensionAttributes;
  if (value == null) return null;
  if (_extensionAttributes is EqualUnmodifiableMapView) return _extensionAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CheckoutShippingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutShippingInfoCopyWith<_CheckoutShippingInfo> get copyWith => __$CheckoutShippingInfoCopyWithImpl<_CheckoutShippingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutShippingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutShippingInfo&&(identical(other.method, method) || other.method == method)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._extensionAttributes, _extensionAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,address,const DeepCollectionEquality().hash(_extensionAttributes));

@override
String toString() {
  return 'CheckoutShippingInfo(method: $method, address: $address, extensionAttributes: $extensionAttributes)';
}


}

/// @nodoc
abstract mixin class _$CheckoutShippingInfoCopyWith<$Res> implements $CheckoutShippingInfoCopyWith<$Res> {
  factory _$CheckoutShippingInfoCopyWith(_CheckoutShippingInfo value, $Res Function(_CheckoutShippingInfo) _then) = __$CheckoutShippingInfoCopyWithImpl;
@override @useResult
$Res call({
 String method, CheckoutAddress? address, Map<String, dynamic>? extensionAttributes
});


@override $CheckoutAddressCopyWith<$Res>? get address;

}
/// @nodoc
class __$CheckoutShippingInfoCopyWithImpl<$Res>
    implements _$CheckoutShippingInfoCopyWith<$Res> {
  __$CheckoutShippingInfoCopyWithImpl(this._self, this._then);

  final _CheckoutShippingInfo _self;
  final $Res Function(_CheckoutShippingInfo) _then;

/// Create a copy of CheckoutShippingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? address = freezed,Object? extensionAttributes = freezed,}) {
  return _then(_CheckoutShippingInfo(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as CheckoutAddress?,extensionAttributes: freezed == extensionAttributes ? _self._extensionAttributes : extensionAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of CheckoutShippingInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutAddressCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $CheckoutAddressCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

// dart format on
