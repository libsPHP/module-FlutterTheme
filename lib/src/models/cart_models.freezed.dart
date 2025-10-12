// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cart {

 String? get id; int? get customerId; String? get customerEmail; List<CartItem>? get items; CartTotals? get totals; List<CartCoupon>? get appliedCoupons; List<CartGiftCard>? get appliedGiftCards; String? get currencyCode; String? get couponCode; bool? get isActive; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other.appliedCoupons, appliedCoupons)&&const DeepCollectionEquality().equals(other.appliedGiftCards, appliedGiftCards)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,customerEmail,const DeepCollectionEquality().hash(items),totals,const DeepCollectionEquality().hash(appliedCoupons),const DeepCollectionEquality().hash(appliedGiftCards),currencyCode,couponCode,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, customerId: $customerId, customerEmail: $customerEmail, items: $items, totals: $totals, appliedCoupons: $appliedCoupons, appliedGiftCards: $appliedGiftCards, currencyCode: $currencyCode, couponCode: $couponCode, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
 String? id, int? customerId, String? customerEmail, List<CartItem>? items, CartTotals? totals, List<CartCoupon>? appliedCoupons, List<CartGiftCard>? appliedGiftCards, String? currencyCode, String? couponCode, bool? isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? customerId = freezed,Object? customerEmail = freezed,Object? items = freezed,Object? totals = freezed,Object? appliedCoupons = freezed,Object? appliedGiftCards = freezed,Object? currencyCode = freezed,Object? couponCode = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerEmail: freezed == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals?,appliedCoupons: freezed == appliedCoupons ? _self.appliedCoupons : appliedCoupons // ignore: cast_nullable_to_non_nullable
as List<CartCoupon>?,appliedGiftCards: freezed == appliedGiftCards ? _self.appliedGiftCards : appliedGiftCards // ignore: cast_nullable_to_non_nullable
as List<CartGiftCard>?,currencyCode: freezed == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int? customerId,  String? customerEmail,  List<CartItem>? items,  CartTotals? totals,  List<CartCoupon>? appliedCoupons,  List<CartGiftCard>? appliedGiftCards,  String? currencyCode,  String? couponCode,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.customerId,_that.customerEmail,_that.items,_that.totals,_that.appliedCoupons,_that.appliedGiftCards,_that.currencyCode,_that.couponCode,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int? customerId,  String? customerEmail,  List<CartItem>? items,  CartTotals? totals,  List<CartCoupon>? appliedCoupons,  List<CartGiftCard>? appliedGiftCards,  String? currencyCode,  String? couponCode,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Cart():
return $default(_that.id,_that.customerId,_that.customerEmail,_that.items,_that.totals,_that.appliedCoupons,_that.appliedGiftCards,_that.currencyCode,_that.couponCode,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int? customerId,  String? customerEmail,  List<CartItem>? items,  CartTotals? totals,  List<CartCoupon>? appliedCoupons,  List<CartGiftCard>? appliedGiftCards,  String? currencyCode,  String? couponCode,  bool? isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.customerId,_that.customerEmail,_that.items,_that.totals,_that.appliedCoupons,_that.appliedGiftCards,_that.currencyCode,_that.couponCode,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cart extends Cart {
  const _Cart({this.id, this.customerId, this.customerEmail, final  List<CartItem>? items, this.totals, final  List<CartCoupon>? appliedCoupons, final  List<CartGiftCard>? appliedGiftCards, this.currencyCode, this.couponCode, this.isActive, this.createdAt, this.updatedAt}): _items = items,_appliedCoupons = appliedCoupons,_appliedGiftCards = appliedGiftCards,super._();
  factory _Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

@override final  String? id;
@override final  int? customerId;
@override final  String? customerEmail;
 final  List<CartItem>? _items;
@override List<CartItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CartTotals? totals;
 final  List<CartCoupon>? _appliedCoupons;
@override List<CartCoupon>? get appliedCoupons {
  final value = _appliedCoupons;
  if (value == null) return null;
  if (_appliedCoupons is EqualUnmodifiableListView) return _appliedCoupons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CartGiftCard>? _appliedGiftCards;
@override List<CartGiftCard>? get appliedGiftCards {
  final value = _appliedGiftCards;
  if (value == null) return null;
  if (_appliedGiftCards is EqualUnmodifiableListView) return _appliedGiftCards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? currencyCode;
@override final  String? couponCode;
@override final  bool? isActive;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&(identical(other.id, id) || other.id == id)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totals, totals) || other.totals == totals)&&const DeepCollectionEquality().equals(other._appliedCoupons, _appliedCoupons)&&const DeepCollectionEquality().equals(other._appliedGiftCards, _appliedGiftCards)&&(identical(other.currencyCode, currencyCode) || other.currencyCode == currencyCode)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerId,customerEmail,const DeepCollectionEquality().hash(_items),totals,const DeepCollectionEquality().hash(_appliedCoupons),const DeepCollectionEquality().hash(_appliedGiftCards),currencyCode,couponCode,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, customerId: $customerId, customerEmail: $customerEmail, items: $items, totals: $totals, appliedCoupons: $appliedCoupons, appliedGiftCards: $appliedGiftCards, currencyCode: $currencyCode, couponCode: $couponCode, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
 String? id, int? customerId, String? customerEmail, List<CartItem>? items, CartTotals? totals, List<CartCoupon>? appliedCoupons, List<CartGiftCard>? appliedGiftCards, String? currencyCode, String? couponCode, bool? isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? customerId = freezed,Object? customerEmail = freezed,Object? items = freezed,Object? totals = freezed,Object? appliedCoupons = freezed,Object? appliedGiftCards = freezed,Object? currencyCode = freezed,Object? couponCode = freezed,Object? isActive = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Cart(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,customerId: freezed == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int?,customerEmail: freezed == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>?,totals: freezed == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as CartTotals?,appliedCoupons: freezed == appliedCoupons ? _self._appliedCoupons : appliedCoupons // ignore: cast_nullable_to_non_nullable
as List<CartCoupon>?,appliedGiftCards: freezed == appliedGiftCards ? _self._appliedGiftCards : appliedGiftCards // ignore: cast_nullable_to_non_nullable
as List<CartGiftCard>?,currencyCode: freezed == currencyCode ? _self.currencyCode : currencyCode // ignore: cast_nullable_to_non_nullable
as String?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CartItem {

 int? get itemId; String? get sku; String? get name; int? get qty; double? get price; double? get rowTotal; double? get taxAmount; double? get discountAmount; String? get productType; Map<String, dynamic>? get productOptions; List<CartItemOption>? get options; bool? get isVirtual; String? get imageUrl; String? get thumbnailUrl;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.price, price) || other.price == price)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.productType, productType) || other.productType == productType)&&const DeepCollectionEquality().equals(other.productOptions, productOptions)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.isVirtual, isVirtual) || other.isVirtual == isVirtual)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,sku,name,qty,price,rowTotal,taxAmount,discountAmount,productType,const DeepCollectionEquality().hash(productOptions),const DeepCollectionEquality().hash(options),isVirtual,imageUrl,thumbnailUrl);

@override
String toString() {
  return 'CartItem(itemId: $itemId, sku: $sku, name: $name, qty: $qty, price: $price, rowTotal: $rowTotal, taxAmount: $taxAmount, discountAmount: $discountAmount, productType: $productType, productOptions: $productOptions, options: $options, isVirtual: $isVirtual, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 int? itemId, String? sku, String? name, int? qty, double? price, double? rowTotal, double? taxAmount, double? discountAmount, String? productType, Map<String, dynamic>? productOptions, List<CartItemOption>? options, bool? isVirtual, String? imageUrl, String? thumbnailUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = freezed,Object? sku = freezed,Object? name = freezed,Object? qty = freezed,Object? price = freezed,Object? rowTotal = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? productType = freezed,Object? productOptions = freezed,Object? options = freezed,Object? isVirtual = freezed,Object? imageUrl = freezed,Object? thumbnailUrl = freezed,}) {
  return _then(_self.copyWith(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,productType: freezed == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String?,productOptions: freezed == productOptions ? _self.productOptions : productOptions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<CartItemOption>?,isVirtual: freezed == isVirtual ? _self.isVirtual : isVirtual // ignore: cast_nullable_to_non_nullable
as bool?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? itemId,  String? sku,  String? name,  int? qty,  double? price,  double? rowTotal,  double? taxAmount,  double? discountAmount,  String? productType,  Map<String, dynamic>? productOptions,  List<CartItemOption>? options,  bool? isVirtual,  String? imageUrl,  String? thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.itemId,_that.sku,_that.name,_that.qty,_that.price,_that.rowTotal,_that.taxAmount,_that.discountAmount,_that.productType,_that.productOptions,_that.options,_that.isVirtual,_that.imageUrl,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? itemId,  String? sku,  String? name,  int? qty,  double? price,  double? rowTotal,  double? taxAmount,  double? discountAmount,  String? productType,  Map<String, dynamic>? productOptions,  List<CartItemOption>? options,  bool? isVirtual,  String? imageUrl,  String? thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.itemId,_that.sku,_that.name,_that.qty,_that.price,_that.rowTotal,_that.taxAmount,_that.discountAmount,_that.productType,_that.productOptions,_that.options,_that.isVirtual,_that.imageUrl,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? itemId,  String? sku,  String? name,  int? qty,  double? price,  double? rowTotal,  double? taxAmount,  double? discountAmount,  String? productType,  Map<String, dynamic>? productOptions,  List<CartItemOption>? options,  bool? isVirtual,  String? imageUrl,  String? thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.itemId,_that.sku,_that.name,_that.qty,_that.price,_that.rowTotal,_that.taxAmount,_that.discountAmount,_that.productType,_that.productOptions,_that.options,_that.isVirtual,_that.imageUrl,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem extends CartItem {
  const _CartItem({this.itemId, this.sku, this.name, this.qty, this.price, this.rowTotal, this.taxAmount, this.discountAmount, this.productType, final  Map<String, dynamic>? productOptions, final  List<CartItemOption>? options, this.isVirtual, this.imageUrl, this.thumbnailUrl}): _productOptions = productOptions,_options = options,super._();
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override final  int? itemId;
@override final  String? sku;
@override final  String? name;
@override final  int? qty;
@override final  double? price;
@override final  double? rowTotal;
@override final  double? taxAmount;
@override final  double? discountAmount;
@override final  String? productType;
 final  Map<String, dynamic>? _productOptions;
@override Map<String, dynamic>? get productOptions {
  final value = _productOptions;
  if (value == null) return null;
  if (_productOptions is EqualUnmodifiableMapView) return _productOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<CartItemOption>? _options;
@override List<CartItemOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? isVirtual;
@override final  String? imageUrl;
@override final  String? thumbnailUrl;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.price, price) || other.price == price)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.productType, productType) || other.productType == productType)&&const DeepCollectionEquality().equals(other._productOptions, _productOptions)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.isVirtual, isVirtual) || other.isVirtual == isVirtual)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,sku,name,qty,price,rowTotal,taxAmount,discountAmount,productType,const DeepCollectionEquality().hash(_productOptions),const DeepCollectionEquality().hash(_options),isVirtual,imageUrl,thumbnailUrl);

@override
String toString() {
  return 'CartItem(itemId: $itemId, sku: $sku, name: $name, qty: $qty, price: $price, rowTotal: $rowTotal, taxAmount: $taxAmount, discountAmount: $discountAmount, productType: $productType, productOptions: $productOptions, options: $options, isVirtual: $isVirtual, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 int? itemId, String? sku, String? name, int? qty, double? price, double? rowTotal, double? taxAmount, double? discountAmount, String? productType, Map<String, dynamic>? productOptions, List<CartItemOption>? options, bool? isVirtual, String? imageUrl, String? thumbnailUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = freezed,Object? sku = freezed,Object? name = freezed,Object? qty = freezed,Object? price = freezed,Object? rowTotal = freezed,Object? taxAmount = freezed,Object? discountAmount = freezed,Object? productType = freezed,Object? productOptions = freezed,Object? options = freezed,Object? isVirtual = freezed,Object? imageUrl = freezed,Object? thumbnailUrl = freezed,}) {
  return _then(_CartItem(
itemId: freezed == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as int?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,taxAmount: freezed == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double?,productType: freezed == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String?,productOptions: freezed == productOptions ? _self._productOptions : productOptions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<CartItemOption>?,isVirtual: freezed == isVirtual ? _self.isVirtual : isVirtual // ignore: cast_nullable_to_non_nullable
as bool?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
