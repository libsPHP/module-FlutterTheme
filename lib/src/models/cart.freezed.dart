// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cart {

 String get id; int get customerId; List<CartItem> get items; double get subtotal; double get grandTotal; double? get shippingAmount; double? get taxAmount; double? get discountAmount; String? get couponCode; List<CartDiscount>? get discounts; CartTotals? get totals; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&const DeepCollectionEquality().equals(other.discounts, discounts)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,const DeepCollectionEquality().hash(items),subtotal,grandTotal,shippingAmount,taxAmount,discountAmount,couponCode,const DeepCollectionEquality().hash(discounts),totals,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, customerId: $customerId, items: $items, subtotal: $subtotal, grandTotal: $grandTotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, couponCode: $couponCode, discounts: $discounts, totals: $totals, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
 String id, int customerId, List<CartItem> items, double subtotal, double grandTotal, double? shippingAmount, double? taxAmount, double? discountAmount, String? couponCode, List<CartDiscount>? discounts, CartTotals? totals, DateTime? createdAt, DateTime? updatedAt
});


$CartTotalsCopyWith<$Res>? get totals;

}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerId = null,Object? items = null,Object? subtotal = null,Object? grandTotal = null,Object? shippingAmount = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? couponCode = freezed,Object? discounts = freezed,Object? totals = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: freezed == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,discounts: freezed == discounts ? _self.discounts : discounts // ignore: cast_nullable_to_non_nullable
as List<CartDiscount>?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $CartTotalsCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [Cart].
extension CartPatterns on Cart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cart value)  $default,){
final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cart value)?  $default,){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int customerId,  List<CartItem> items,  double subtotal,  double grandTotal,  double? shippingAmount,  double? taxAmount,  double? discountAmount,  String? couponCode,  List<CartDiscount>? discounts,  CartTotals? totals,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.customerId,_that.items,_that.subtotal,_that.grandTotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.couponCode,_that.discounts,_that.totals,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int customerId,  List<CartItem> items,  double subtotal,  double grandTotal,  double? shippingAmount,  double? taxAmount,  double? discountAmount,  String? couponCode,  List<CartDiscount>? discounts,  CartTotals? totals,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Cart():
return $default(_that.id,_that.customerId,_that.items,_that.subtotal,_that.grandTotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.couponCode,_that.discounts,_that.totals,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int customerId,  List<CartItem> items,  double subtotal,  double grandTotal,  double? shippingAmount,  double? taxAmount,  double? discountAmount,  String? couponCode,  List<CartDiscount>? discounts,  CartTotals? totals,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.customerId,_that.items,_that.subtotal,_that.grandTotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.couponCode,_that.discounts,_that.totals,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cart implements Cart {
  const _Cart({required this.id, required this.customerId, required final  List<CartItem> items, required this.subtotal, required this.grandTotal, this.shippingAmount, this.taxAmount, this.discountAmount, this.couponCode, final  List<CartDiscount>? discounts, this.totals, this.createdAt, this.updatedAt}): _items = items,_discounts = discounts;
  factory _Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

@override final  String id;
@override final  int customerId;
 final  List<CartItem> _items;
@override List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double subtotal;
@override final  double grandTotal;
@override final  double? shippingAmount;
@override final  double? taxAmount;
@override final  double? discountAmount;
@override final  String? couponCode;
 final  List<CartDiscount>? _discounts;
@override List<CartDiscount>? get discounts {
  final value = _discounts;
  if (value == null) return null;
  if (_discounts is EqualUnmodifiableListView) return _discounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CartTotals? totals;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartCopyWith<_Cart> get copyWith => __$CartCopyWithImpl<_Cart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&const DeepCollectionEquality().equals(other._discounts, _discounts)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,const DeepCollectionEquality().hash(_items),subtotal,grandTotal,shippingAmount,taxAmount,discountAmount,couponCode,const DeepCollectionEquality().hash(_discounts),totals,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, customerId: $customerId, items: $items, subtotal: $subtotal, grandTotal: $grandTotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, couponCode: $couponCode, discounts: $discounts, totals: $totals, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
 String id, int customerId, List<CartItem> items, double subtotal, double grandTotal, double? shippingAmount, double? taxAmount, double? discountAmount, String? couponCode, List<CartDiscount>? discounts, CartTotals? totals, DateTime? createdAt, DateTime? updatedAt
});


@override $CartTotalsCopyWith<$Res>? get totals;

}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerId = null,Object? items = null,Object? subtotal = null,Object? grandTotal = null,Object? shippingAmount = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? couponCode = freezed,Object? discounts = freezed,Object? totals = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Cart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: freezed == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,discounts: freezed == discounts ? _self._discounts : discounts // ignore: cast_nullable_to_non_nullable
as List<CartDiscount>?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<$Res>? get totals {
    if (_self.totals == null) {
    return null;
  }

  return $CartTotalsCopyWith<$Res>(_self.totals!, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$CartItem {

 int get id; String get sku; String get name; double get price; int get quantity; double? get rowTotal; String? get image; List<CartItemOption>? get options; Map<String, dynamic>? get customAttributes;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,price,quantity,rowTotal,image,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(customAttributes));

@override
String toString() {
  return 'CartItem(id: $id, sku: $sku, name: $name, price: $price, quantity: $quantity, rowTotal: $rowTotal, image: $image, options: $options, customAttributes: $customAttributes)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 int id, String sku, String name, double price, int quantity, double? rowTotal, String? image, List<CartItemOption>? options, Map<String, dynamic>? customAttributes
});




}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? price = null,Object? quantity = null,Object? rowTotal = freezed,Object? image = freezed,Object? options = freezed,Object? customAttributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<CartItemOption>?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  double price,  int quantity,  double? rowTotal,  String? image,  List<CartItemOption>? options,  Map<String, dynamic>? customAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.price,_that.quantity,_that.rowTotal,_that.image,_that.options,_that.customAttributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  double price,  int quantity,  double? rowTotal,  String? image,  List<CartItemOption>? options,  Map<String, dynamic>? customAttributes)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.id,_that.sku,_that.name,_that.price,_that.quantity,_that.rowTotal,_that.image,_that.options,_that.customAttributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sku,  String name,  double price,  int quantity,  double? rowTotal,  String? image,  List<CartItemOption>? options,  Map<String, dynamic>? customAttributes)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.price,_that.quantity,_that.rowTotal,_that.image,_that.options,_that.customAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem implements CartItem {
  const _CartItem({required this.id, required this.sku, required this.name, required this.price, required this.quantity, this.rowTotal, this.image, final  List<CartItemOption>? options, final  Map<String, dynamic>? customAttributes}): _options = options,_customAttributes = customAttributes;
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override final  int id;
@override final  String sku;
@override final  String name;
@override final  double price;
@override final  int quantity;
@override final  double? rowTotal;
@override final  String? image;
 final  List<CartItemOption>? _options;
@override List<CartItemOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
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


/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,price,quantity,rowTotal,image,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_customAttributes));

@override
String toString() {
  return 'CartItem(id: $id, sku: $sku, name: $name, price: $price, quantity: $quantity, rowTotal: $rowTotal, image: $image, options: $options, customAttributes: $customAttributes)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String sku, String name, double price, int quantity, double? rowTotal, String? image, List<CartItemOption>? options, Map<String, dynamic>? customAttributes
});




}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? price = null,Object? quantity = null,Object? rowTotal = freezed,Object? image = freezed,Object? options = freezed,Object? customAttributes = freezed,}) {
  return _then(_CartItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<CartItemOption>?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$CartItemOption {

 String get code; String get label; String get value; double? get price; String? get priceType;
/// Create a copy of CartItemOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemOptionCopyWith<CartItemOption> get copyWith => _$CartItemOptionCopyWithImpl<CartItemOption>(this as CartItemOption, _$identity);

  /// Serializes this CartItemOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemOption&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value,price,priceType);

@override
String toString() {
  return 'CartItemOption(code: $code, label: $label, value: $value, price: $price, priceType: $priceType)';
}


}

/// @nodoc
abstract mixin class $CartItemOptionCopyWith<$Res>  {
  factory $CartItemOptionCopyWith(CartItemOption value, $Res Function(CartItemOption) _then) = _$CartItemOptionCopyWithImpl;
@useResult
$Res call({
 String code, String label, String value, double? price, String? priceType
});




}
/// @nodoc
class _$CartItemOptionCopyWithImpl<$Res>
    implements $CartItemOptionCopyWith<$Res> {
  _$CartItemOptionCopyWithImpl(this._self, this._then);

  final CartItemOption _self;
  final $Res Function(CartItemOption) _then;

/// Create a copy of CartItemOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,Object? value = null,Object? price = freezed,Object? priceType = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItemOption].
extension CartItemOptionPatterns on CartItemOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItemOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItemOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItemOption value)  $default,){
final _that = this;
switch (_that) {
case _CartItemOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItemOption value)?  $default,){
final _that = this;
switch (_that) {
case _CartItemOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String label,  String value,  double? price,  String? priceType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItemOption() when $default != null:
return $default(_that.code,_that.label,_that.value,_that.price,_that.priceType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String label,  String value,  double? price,  String? priceType)  $default,) {final _that = this;
switch (_that) {
case _CartItemOption():
return $default(_that.code,_that.label,_that.value,_that.price,_that.priceType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String label,  String value,  double? price,  String? priceType)?  $default,) {final _that = this;
switch (_that) {
case _CartItemOption() when $default != null:
return $default(_that.code,_that.label,_that.value,_that.price,_that.priceType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItemOption implements CartItemOption {
  const _CartItemOption({required this.code, required this.label, required this.value, this.price, this.priceType});
  factory _CartItemOption.fromJson(Map<String, dynamic> json) => _$CartItemOptionFromJson(json);

@override final  String code;
@override final  String label;
@override final  String value;
@override final  double? price;
@override final  String? priceType;

/// Create a copy of CartItemOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemOptionCopyWith<_CartItemOption> get copyWith => __$CartItemOptionCopyWithImpl<_CartItemOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemOption&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value,price,priceType);

@override
String toString() {
  return 'CartItemOption(code: $code, label: $label, value: $value, price: $price, priceType: $priceType)';
}


}

/// @nodoc
abstract mixin class _$CartItemOptionCopyWith<$Res> implements $CartItemOptionCopyWith<$Res> {
  factory _$CartItemOptionCopyWith(_CartItemOption value, $Res Function(_CartItemOption) _then) = __$CartItemOptionCopyWithImpl;
@override @useResult
$Res call({
 String code, String label, String value, double? price, String? priceType
});




}
/// @nodoc
class __$CartItemOptionCopyWithImpl<$Res>
    implements _$CartItemOptionCopyWith<$Res> {
  __$CartItemOptionCopyWithImpl(this._self, this._then);

  final _CartItemOption _self;
  final $Res Function(_CartItemOption) _then;

/// Create a copy of CartItemOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,Object? value = null,Object? price = freezed,Object? priceType = freezed,}) {
  return _then(_CartItemOption(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CartDiscount {

 String get code; String get label; double get amount; String? get type;
/// Create a copy of CartDiscount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartDiscountCopyWith<CartDiscount> get copyWith => _$CartDiscountCopyWithImpl<CartDiscount>(this as CartDiscount, _$identity);

  /// Serializes this CartDiscount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartDiscount&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,amount,type);

@override
String toString() {
  return 'CartDiscount(code: $code, label: $label, amount: $amount, type: $type)';
}


}

/// @nodoc
abstract mixin class $CartDiscountCopyWith<$Res>  {
  factory $CartDiscountCopyWith(CartDiscount value, $Res Function(CartDiscount) _then) = _$CartDiscountCopyWithImpl;
@useResult
$Res call({
 String code, String label, double amount, String? type
});




}
/// @nodoc
class _$CartDiscountCopyWithImpl<$Res>
    implements $CartDiscountCopyWith<$Res> {
  _$CartDiscountCopyWithImpl(this._self, this._then);

  final CartDiscount _self;
  final $Res Function(CartDiscount) _then;

/// Create a copy of CartDiscount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,Object? amount = null,Object? type = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartDiscount].
extension CartDiscountPatterns on CartDiscount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartDiscount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartDiscount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartDiscount value)  $default,){
final _that = this;
switch (_that) {
case _CartDiscount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartDiscount value)?  $default,){
final _that = this;
switch (_that) {
case _CartDiscount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String label,  double amount,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartDiscount() when $default != null:
return $default(_that.code,_that.label,_that.amount,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String label,  double amount,  String? type)  $default,) {final _that = this;
switch (_that) {
case _CartDiscount():
return $default(_that.code,_that.label,_that.amount,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String label,  double amount,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _CartDiscount() when $default != null:
return $default(_that.code,_that.label,_that.amount,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartDiscount implements CartDiscount {
  const _CartDiscount({required this.code, required this.label, required this.amount, this.type});
  factory _CartDiscount.fromJson(Map<String, dynamic> json) => _$CartDiscountFromJson(json);

@override final  String code;
@override final  String label;
@override final  double amount;
@override final  String? type;

/// Create a copy of CartDiscount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartDiscountCopyWith<_CartDiscount> get copyWith => __$CartDiscountCopyWithImpl<_CartDiscount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartDiscountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartDiscount&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,amount,type);

@override
String toString() {
  return 'CartDiscount(code: $code, label: $label, amount: $amount, type: $type)';
}


}

/// @nodoc
abstract mixin class _$CartDiscountCopyWith<$Res> implements $CartDiscountCopyWith<$Res> {
  factory _$CartDiscountCopyWith(_CartDiscount value, $Res Function(_CartDiscount) _then) = __$CartDiscountCopyWithImpl;
@override @useResult
$Res call({
 String code, String label, double amount, String? type
});




}
/// @nodoc
class __$CartDiscountCopyWithImpl<$Res>
    implements _$CartDiscountCopyWith<$Res> {
  __$CartDiscountCopyWithImpl(this._self, this._then);

  final _CartDiscount _self;
  final $Res Function(_CartDiscount) _then;

/// Create a copy of CartDiscount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,Object? amount = null,Object? type = freezed,}) {
  return _then(_CartDiscount(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CartTotals {

 double get subtotal; double get grandTotal; double? get shippingAmount; double? get taxAmount; double? get discountAmount; double? get subtotalInclTax; double? get shippingInclTax; Map<String, double>? get taxBreakdown;
/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartTotalsCopyWith<CartTotals> get copyWith => _$CartTotalsCopyWithImpl<CartTotals>(this as CartTotals, _$identity);

  /// Serializes this CartTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.subtotalInclTax, subtotalInclTax) || other.subtotalInclTax == subtotalInclTax)&&(identical(other.shippingInclTax, shippingInclTax) || other.shippingInclTax == shippingInclTax)&&const DeepCollectionEquality().equals(other.taxBreakdown, taxBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,grandTotal,shippingAmount,taxAmount,discountAmount,subtotalInclTax,shippingInclTax,const DeepCollectionEquality().hash(taxBreakdown));

@override
String toString() {
  return 'CartTotals(subtotal: $subtotal, grandTotal: $grandTotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, subtotalInclTax: $subtotalInclTax, shippingInclTax: $shippingInclTax, taxBreakdown: $taxBreakdown)';
}


}

/// @nodoc
abstract mixin class $CartTotalsCopyWith<$Res>  {
  factory $CartTotalsCopyWith(CartTotals value, $Res Function(CartTotals) _then) = _$CartTotalsCopyWithImpl;
@useResult
$Res call({
 double subtotal, double grandTotal, double? shippingAmount, double? taxAmount, double? discountAmount, double? subtotalInclTax, double? shippingInclTax, Map<String, double>? taxBreakdown
});




}
/// @nodoc
class _$CartTotalsCopyWithImpl<$Res>
    implements $CartTotalsCopyWith<$Res> {
  _$CartTotalsCopyWithImpl(this._self, this._then);

  final CartTotals _self;
  final $Res Function(CartTotals) _then;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? grandTotal = null,Object? shippingAmount = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? subtotalInclTax = freezed,Object? shippingInclTax = freezed,Object? taxBreakdown = freezed,}) {
  return _then(_self.copyWith(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: freezed == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,subtotalInclTax: freezed == subtotalInclTax ? _self.subtotalInclTax : subtotalInclTax // ignore: cast_nullable_to_non_nullable
as double?,shippingInclTax: freezed == shippingInclTax ? _self.shippingInclTax : shippingInclTax // ignore: cast_nullable_to_non_nullable
as double?,taxBreakdown: freezed == taxBreakdown ? _self.taxBreakdown : taxBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartTotals].
extension CartTotalsPatterns on CartTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartTotals value)  $default,){
final _that = this;
switch (_that) {
case _CartTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartTotals value)?  $default,){
final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double subtotal,  double grandTotal,  double? shippingAmount,  double? taxAmount,  double? discountAmount,  double? subtotalInclTax,  double? shippingInclTax,  Map<String, double>? taxBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that.subtotal,_that.grandTotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.subtotalInclTax,_that.shippingInclTax,_that.taxBreakdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double subtotal,  double grandTotal,  double? shippingAmount,  double? taxAmount,  double? discountAmount,  double? subtotalInclTax,  double? shippingInclTax,  Map<String, double>? taxBreakdown)  $default,) {final _that = this;
switch (_that) {
case _CartTotals():
return $default(_that.subtotal,_that.grandTotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.subtotalInclTax,_that.shippingInclTax,_that.taxBreakdown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double subtotal,  double grandTotal,  double? shippingAmount,  double? taxAmount,  double? discountAmount,  double? subtotalInclTax,  double? shippingInclTax,  Map<String, double>? taxBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _CartTotals() when $default != null:
return $default(_that.subtotal,_that.grandTotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.subtotalInclTax,_that.shippingInclTax,_that.taxBreakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartTotals implements CartTotals {
  const _CartTotals({required this.subtotal, required this.grandTotal, this.shippingAmount, this.taxAmount, this.discountAmount, this.subtotalInclTax, this.shippingInclTax, final  Map<String, double>? taxBreakdown}): _taxBreakdown = taxBreakdown;
  factory _CartTotals.fromJson(Map<String, dynamic> json) => _$CartTotalsFromJson(json);

@override final  double subtotal;
@override final  double grandTotal;
@override final  double? shippingAmount;
@override final  double? taxAmount;
@override final  double? discountAmount;
@override final  double? subtotalInclTax;
@override final  double? shippingInclTax;
 final  Map<String, double>? _taxBreakdown;
@override Map<String, double>? get taxBreakdown {
  final value = _taxBreakdown;
  if (value == null) return null;
  if (_taxBreakdown is EqualUnmodifiableMapView) return _taxBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartTotalsCopyWith<_CartTotals> get copyWith => __$CartTotalsCopyWithImpl<_CartTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.subtotalInclTax, subtotalInclTax) || other.subtotalInclTax == subtotalInclTax)&&(identical(other.shippingInclTax, shippingInclTax) || other.shippingInclTax == shippingInclTax)&&const DeepCollectionEquality().equals(other._taxBreakdown, _taxBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,grandTotal,shippingAmount,taxAmount,discountAmount,subtotalInclTax,shippingInclTax,const DeepCollectionEquality().hash(_taxBreakdown));

@override
String toString() {
  return 'CartTotals(subtotal: $subtotal, grandTotal: $grandTotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, subtotalInclTax: $subtotalInclTax, shippingInclTax: $shippingInclTax, taxBreakdown: $taxBreakdown)';
}


}

/// @nodoc
abstract mixin class _$CartTotalsCopyWith<$Res> implements $CartTotalsCopyWith<$Res> {
  factory _$CartTotalsCopyWith(_CartTotals value, $Res Function(_CartTotals) _then) = __$CartTotalsCopyWithImpl;
@override @useResult
$Res call({
 double subtotal, double grandTotal, double? shippingAmount, double? taxAmount, double? discountAmount, double? subtotalInclTax, double? shippingInclTax, Map<String, double>? taxBreakdown
});




}
/// @nodoc
class __$CartTotalsCopyWithImpl<$Res>
    implements _$CartTotalsCopyWith<$Res> {
  __$CartTotalsCopyWithImpl(this._self, this._then);

  final _CartTotals _self;
  final $Res Function(_CartTotals) _then;

/// Create a copy of CartTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? grandTotal = null,Object? shippingAmount = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? subtotalInclTax = freezed,Object? shippingInclTax = freezed,Object? taxBreakdown = freezed,}) {
  return _then(_CartTotals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: freezed == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,subtotalInclTax: freezed == subtotalInclTax ? _self.subtotalInclTax : subtotalInclTax // ignore: cast_nullable_to_non_nullable
as double?,shippingInclTax: freezed == shippingInclTax ? _self.shippingInclTax : shippingInclTax // ignore: cast_nullable_to_non_nullable
as double?,taxBreakdown: freezed == taxBreakdown ? _self._taxBreakdown : taxBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}


}

// dart format on
