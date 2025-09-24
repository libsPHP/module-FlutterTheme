// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Order {

 int get id; String get incrementId; String get status; String get state; double get grandTotal; double get subtotal; double get shippingAmount; double get taxAmount; double get discountAmount; List<OrderItem> get items; OrderAddress get billingAddress; OrderAddress get shippingAddress; OrderPayment get payment; OrderShipping? get shipping; List<OrderComment>? get comments; String? get customerEmail; String? get customerFirstname; String? get customerLastname; String? get couponCode; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.incrementId, incrementId) || other.incrementId == incrementId)&&(identical(other.status, status) || other.status == status)&&(identical(other.state, state) || other.state == state)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.billingAddress, billingAddress) || other.billingAddress == billingAddress)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.shipping, shipping) || other.shipping == shipping)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&(identical(other.customerFirstname, customerFirstname) || other.customerFirstname == customerFirstname)&&(identical(other.customerLastname, customerLastname) || other.customerLastname == customerLastname)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,incrementId,status,state,grandTotal,subtotal,shippingAmount,taxAmount,discountAmount,const DeepCollectionEquality().hash(items),billingAddress,shippingAddress,payment,shipping,const DeepCollectionEquality().hash(comments),customerEmail,customerFirstname,customerLastname,couponCode,createdAt,updatedAt]);

@override
String toString() {
  return 'Order(id: $id, incrementId: $incrementId, status: $status, state: $state, grandTotal: $grandTotal, subtotal: $subtotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, items: $items, billingAddress: $billingAddress, shippingAddress: $shippingAddress, payment: $payment, shipping: $shipping, comments: $comments, customerEmail: $customerEmail, customerFirstname: $customerFirstname, customerLastname: $customerLastname, couponCode: $couponCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 int id, String incrementId, String status, String state, double grandTotal, double subtotal, double shippingAmount, double taxAmount, double discountAmount, List<OrderItem> items, OrderAddress billingAddress, OrderAddress shippingAddress, OrderPayment payment, OrderShipping? shipping, List<OrderComment>? comments, String? customerEmail, String? customerFirstname, String? customerLastname, String? couponCode, DateTime? createdAt, DateTime? updatedAt
});


$OrderAddressCopyWith<$Res> get billingAddress;$OrderAddressCopyWith<$Res> get shippingAddress;$OrderPaymentCopyWith<$Res> get payment;$OrderShippingCopyWith<$Res>? get shipping;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? incrementId = null,Object? status = null,Object? state = null,Object? grandTotal = null,Object? subtotal = null,Object? shippingAmount = null,Object? taxAmount = null,Object? discountAmount = null,Object? items = null,Object? billingAddress = null,Object? shippingAddress = null,Object? payment = null,Object? shipping = freezed,Object? comments = freezed,Object? customerEmail = freezed,Object? customerFirstname = freezed,Object? customerLastname = freezed,Object? couponCode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,incrementId: null == incrementId ? _self.incrementId : incrementId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: null == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,billingAddress: null == billingAddress ? _self.billingAddress : billingAddress // ignore: cast_nullable_to_non_nullable
as OrderAddress,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as OrderAddress,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as OrderPayment,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as OrderShipping?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<OrderComment>?,customerEmail: freezed == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String?,customerFirstname: freezed == customerFirstname ? _self.customerFirstname : customerFirstname // ignore: cast_nullable_to_non_nullable
as String?,customerLastname: freezed == customerLastname ? _self.customerLastname : customerLastname // ignore: cast_nullable_to_non_nullable
as String?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressCopyWith<$Res> get billingAddress {
  
  return $OrderAddressCopyWith<$Res>(_self.billingAddress, (value) {
    return _then(_self.copyWith(billingAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressCopyWith<$Res> get shippingAddress {
  
  return $OrderAddressCopyWith<$Res>(_self.shippingAddress, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<$Res> get payment {
  
  return $OrderPaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderShippingCopyWith<$Res>? get shipping {
    if (_self.shipping == null) {
    return null;
  }

  return $OrderShippingCopyWith<$Res>(_self.shipping!, (value) {
    return _then(_self.copyWith(shipping: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String incrementId,  String status,  String state,  double grandTotal,  double subtotal,  double shippingAmount,  double taxAmount,  double discountAmount,  List<OrderItem> items,  OrderAddress billingAddress,  OrderAddress shippingAddress,  OrderPayment payment,  OrderShipping? shipping,  List<OrderComment>? comments,  String? customerEmail,  String? customerFirstname,  String? customerLastname,  String? couponCode,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.incrementId,_that.status,_that.state,_that.grandTotal,_that.subtotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.items,_that.billingAddress,_that.shippingAddress,_that.payment,_that.shipping,_that.comments,_that.customerEmail,_that.customerFirstname,_that.customerLastname,_that.couponCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String incrementId,  String status,  String state,  double grandTotal,  double subtotal,  double shippingAmount,  double taxAmount,  double discountAmount,  List<OrderItem> items,  OrderAddress billingAddress,  OrderAddress shippingAddress,  OrderPayment payment,  OrderShipping? shipping,  List<OrderComment>? comments,  String? customerEmail,  String? customerFirstname,  String? customerLastname,  String? couponCode,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.incrementId,_that.status,_that.state,_that.grandTotal,_that.subtotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.items,_that.billingAddress,_that.shippingAddress,_that.payment,_that.shipping,_that.comments,_that.customerEmail,_that.customerFirstname,_that.customerLastname,_that.couponCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String incrementId,  String status,  String state,  double grandTotal,  double subtotal,  double shippingAmount,  double taxAmount,  double discountAmount,  List<OrderItem> items,  OrderAddress billingAddress,  OrderAddress shippingAddress,  OrderPayment payment,  OrderShipping? shipping,  List<OrderComment>? comments,  String? customerEmail,  String? customerFirstname,  String? customerLastname,  String? couponCode,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.incrementId,_that.status,_that.state,_that.grandTotal,_that.subtotal,_that.shippingAmount,_that.taxAmount,_that.discountAmount,_that.items,_that.billingAddress,_that.shippingAddress,_that.payment,_that.shipping,_that.comments,_that.customerEmail,_that.customerFirstname,_that.customerLastname,_that.couponCode,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order implements Order {
  const _Order({required this.id, required this.incrementId, required this.status, required this.state, required this.grandTotal, required this.subtotal, required this.shippingAmount, required this.taxAmount, required this.discountAmount, required final  List<OrderItem> items, required this.billingAddress, required this.shippingAddress, required this.payment, this.shipping, final  List<OrderComment>? comments, this.customerEmail, this.customerFirstname, this.customerLastname, this.couponCode, this.createdAt, this.updatedAt}): _items = items,_comments = comments;
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  int id;
@override final  String incrementId;
@override final  String status;
@override final  String state;
@override final  double grandTotal;
@override final  double subtotal;
@override final  double shippingAmount;
@override final  double taxAmount;
@override final  double discountAmount;
 final  List<OrderItem> _items;
@override List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  OrderAddress billingAddress;
@override final  OrderAddress shippingAddress;
@override final  OrderPayment payment;
@override final  OrderShipping? shipping;
 final  List<OrderComment>? _comments;
@override List<OrderComment>? get comments {
  final value = _comments;
  if (value == null) return null;
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? customerEmail;
@override final  String? customerFirstname;
@override final  String? customerLastname;
@override final  String? couponCode;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.incrementId, incrementId) || other.incrementId == incrementId)&&(identical(other.status, status) || other.status == status)&&(identical(other.state, state) || other.state == state)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingAmount, shippingAmount) || other.shippingAmount == shippingAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.billingAddress, billingAddress) || other.billingAddress == billingAddress)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.shipping, shipping) || other.shipping == shipping)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&(identical(other.customerFirstname, customerFirstname) || other.customerFirstname == customerFirstname)&&(identical(other.customerLastname, customerLastname) || other.customerLastname == customerLastname)&&(identical(other.couponCode, couponCode) || other.couponCode == couponCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,incrementId,status,state,grandTotal,subtotal,shippingAmount,taxAmount,discountAmount,const DeepCollectionEquality().hash(_items),billingAddress,shippingAddress,payment,shipping,const DeepCollectionEquality().hash(_comments),customerEmail,customerFirstname,customerLastname,couponCode,createdAt,updatedAt]);

@override
String toString() {
  return 'Order(id: $id, incrementId: $incrementId, status: $status, state: $state, grandTotal: $grandTotal, subtotal: $subtotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, items: $items, billingAddress: $billingAddress, shippingAddress: $shippingAddress, payment: $payment, shipping: $shipping, comments: $comments, customerEmail: $customerEmail, customerFirstname: $customerFirstname, customerLastname: $customerLastname, couponCode: $couponCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 int id, String incrementId, String status, String state, double grandTotal, double subtotal, double shippingAmount, double taxAmount, double discountAmount, List<OrderItem> items, OrderAddress billingAddress, OrderAddress shippingAddress, OrderPayment payment, OrderShipping? shipping, List<OrderComment>? comments, String? customerEmail, String? customerFirstname, String? customerLastname, String? couponCode, DateTime? createdAt, DateTime? updatedAt
});


@override $OrderAddressCopyWith<$Res> get billingAddress;@override $OrderAddressCopyWith<$Res> get shippingAddress;@override $OrderPaymentCopyWith<$Res> get payment;@override $OrderShippingCopyWith<$Res>? get shipping;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? incrementId = null,Object? status = null,Object? state = null,Object? grandTotal = null,Object? subtotal = null,Object? shippingAmount = null,Object? taxAmount = null,Object? discountAmount = null,Object? items = null,Object? billingAddress = null,Object? shippingAddress = null,Object? payment = null,Object? shipping = freezed,Object? comments = freezed,Object? customerEmail = freezed,Object? customerFirstname = freezed,Object? customerLastname = freezed,Object? couponCode = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,incrementId: null == incrementId ? _self.incrementId : incrementId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,shippingAmount: null == shippingAmount ? _self.shippingAmount : shippingAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,billingAddress: null == billingAddress ? _self.billingAddress : billingAddress // ignore: cast_nullable_to_non_nullable
as OrderAddress,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as OrderAddress,payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as OrderPayment,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as OrderShipping?,comments: freezed == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<OrderComment>?,customerEmail: freezed == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String?,customerFirstname: freezed == customerFirstname ? _self.customerFirstname : customerFirstname // ignore: cast_nullable_to_non_nullable
as String?,customerLastname: freezed == customerLastname ? _self.customerLastname : customerLastname // ignore: cast_nullable_to_non_nullable
as String?,couponCode: freezed == couponCode ? _self.couponCode : couponCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressCopyWith<$Res> get billingAddress {
  
  return $OrderAddressCopyWith<$Res>(_self.billingAddress, (value) {
    return _then(_self.copyWith(billingAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderAddressCopyWith<$Res> get shippingAddress {
  
  return $OrderAddressCopyWith<$Res>(_self.shippingAddress, (value) {
    return _then(_self.copyWith(shippingAddress: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<$Res> get payment {
  
  return $OrderPaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderShippingCopyWith<$Res>? get shipping {
    if (_self.shipping == null) {
    return null;
  }

  return $OrderShippingCopyWith<$Res>(_self.shipping!, (value) {
    return _then(_self.copyWith(shipping: value));
  });
}
}


/// @nodoc
mixin _$OrderItem {

 int get id; String get sku; String get name; double get price; int get quantity; double? get rowTotal; String? get image; List<OrderItemOption>? get options; Map<String, dynamic>? get customAttributes;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,price,quantity,rowTotal,image,const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(customAttributes));

@override
String toString() {
  return 'OrderItem(id: $id, sku: $sku, name: $name, price: $price, quantity: $quantity, rowTotal: $rowTotal, image: $image, options: $options, customAttributes: $customAttributes)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 int id, String sku, String name, double price, int quantity, double? rowTotal, String? image, List<OrderItemOption>? options, Map<String, dynamic>? customAttributes
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
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
as List<OrderItemOption>?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  double price,  int quantity,  double? rowTotal,  String? image,  List<OrderItemOption>? options,  Map<String, dynamic>? customAttributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  double price,  int quantity,  double? rowTotal,  String? image,  List<OrderItemOption>? options,  Map<String, dynamic>? customAttributes)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sku,  String name,  double price,  int quantity,  double? rowTotal,  String? image,  List<OrderItemOption>? options,  Map<String, dynamic>? customAttributes)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.price,_that.quantity,_that.rowTotal,_that.image,_that.options,_that.customAttributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, required this.sku, required this.name, required this.price, required this.quantity, this.rowTotal, this.image, final  List<OrderItemOption>? options, final  Map<String, dynamic>? customAttributes}): _options = options,_customAttributes = customAttributes;
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  int id;
@override final  String sku;
@override final  String name;
@override final  double price;
@override final  int quantity;
@override final  double? rowTotal;
@override final  String? image;
 final  List<OrderItemOption>? _options;
@override List<OrderItemOption>? get options {
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


/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.rowTotal, rowTotal) || other.rowTotal == rowTotal)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,name,price,quantity,rowTotal,image,const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_customAttributes));

@override
String toString() {
  return 'OrderItem(id: $id, sku: $sku, name: $name, price: $price, quantity: $quantity, rowTotal: $rowTotal, image: $image, options: $options, customAttributes: $customAttributes)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 int id, String sku, String name, double price, int quantity, double? rowTotal, String? image, List<OrderItemOption>? options, Map<String, dynamic>? customAttributes
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? price = null,Object? quantity = null,Object? rowTotal = freezed,Object? image = freezed,Object? options = freezed,Object? customAttributes = freezed,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,rowTotal: freezed == rowTotal ? _self.rowTotal : rowTotal // ignore: cast_nullable_to_non_nullable
as double?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<OrderItemOption>?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$OrderItemOption {

 String get code; String get label; String get value; double? get price; String? get priceType;
/// Create a copy of OrderItemOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemOptionCopyWith<OrderItemOption> get copyWith => _$OrderItemOptionCopyWithImpl<OrderItemOption>(this as OrderItemOption, _$identity);

  /// Serializes this OrderItemOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItemOption&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value,price,priceType);

@override
String toString() {
  return 'OrderItemOption(code: $code, label: $label, value: $value, price: $price, priceType: $priceType)';
}


}

/// @nodoc
abstract mixin class $OrderItemOptionCopyWith<$Res>  {
  factory $OrderItemOptionCopyWith(OrderItemOption value, $Res Function(OrderItemOption) _then) = _$OrderItemOptionCopyWithImpl;
@useResult
$Res call({
 String code, String label, String value, double? price, String? priceType
});




}
/// @nodoc
class _$OrderItemOptionCopyWithImpl<$Res>
    implements $OrderItemOptionCopyWith<$Res> {
  _$OrderItemOptionCopyWithImpl(this._self, this._then);

  final OrderItemOption _self;
  final $Res Function(OrderItemOption) _then;

/// Create a copy of OrderItemOption
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


/// Adds pattern-matching-related methods to [OrderItemOption].
extension OrderItemOptionPatterns on OrderItemOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItemOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItemOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItemOption value)  $default,){
final _that = this;
switch (_that) {
case _OrderItemOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItemOption value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItemOption() when $default != null:
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
case _OrderItemOption() when $default != null:
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
case _OrderItemOption():
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
case _OrderItemOption() when $default != null:
return $default(_that.code,_that.label,_that.value,_that.price,_that.priceType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItemOption implements OrderItemOption {
  const _OrderItemOption({required this.code, required this.label, required this.value, this.price, this.priceType});
  factory _OrderItemOption.fromJson(Map<String, dynamic> json) => _$OrderItemOptionFromJson(json);

@override final  String code;
@override final  String label;
@override final  String value;
@override final  double? price;
@override final  String? priceType;

/// Create a copy of OrderItemOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemOptionCopyWith<_OrderItemOption> get copyWith => __$OrderItemOptionCopyWithImpl<_OrderItemOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItemOption&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value,price,priceType);

@override
String toString() {
  return 'OrderItemOption(code: $code, label: $label, value: $value, price: $price, priceType: $priceType)';
}


}

/// @nodoc
abstract mixin class _$OrderItemOptionCopyWith<$Res> implements $OrderItemOptionCopyWith<$Res> {
  factory _$OrderItemOptionCopyWith(_OrderItemOption value, $Res Function(_OrderItemOption) _then) = __$OrderItemOptionCopyWithImpl;
@override @useResult
$Res call({
 String code, String label, String value, double? price, String? priceType
});




}
/// @nodoc
class __$OrderItemOptionCopyWithImpl<$Res>
    implements _$OrderItemOptionCopyWith<$Res> {
  __$OrderItemOptionCopyWithImpl(this._self, this._then);

  final _OrderItemOption _self;
  final $Res Function(_OrderItemOption) _then;

/// Create a copy of OrderItemOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,Object? value = null,Object? price = freezed,Object? priceType = freezed,}) {
  return _then(_OrderItemOption(
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
mixin _$OrderAddress {

 String get firstname; String get lastname; String? get middlename; String? get prefix; String? get suffix; String? get company; String get street; String get city; String get region; String get postcode; String get countryId; String? get telephone; String? get fax; String? get vatId;
/// Create a copy of OrderAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderAddressCopyWith<OrderAddress> get copyWith => _$OrderAddressCopyWithImpl<OrderAddress>(this as OrderAddress, _$identity);

  /// Serializes this OrderAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderAddress&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.vatId, vatId) || other.vatId == vatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstname,lastname,middlename,prefix,suffix,company,street,city,region,postcode,countryId,telephone,fax,vatId);

@override
String toString() {
  return 'OrderAddress(firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, vatId: $vatId)';
}


}

/// @nodoc
abstract mixin class $OrderAddressCopyWith<$Res>  {
  factory $OrderAddressCopyWith(OrderAddress value, $Res Function(OrderAddress) _then) = _$OrderAddressCopyWithImpl;
@useResult
$Res call({
 String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? company, String street, String city, String region, String postcode, String countryId, String? telephone, String? fax, String? vatId
});




}
/// @nodoc
class _$OrderAddressCopyWithImpl<$Res>
    implements $OrderAddressCopyWith<$Res> {
  _$OrderAddressCopyWithImpl(this._self, this._then);

  final OrderAddress _self;
  final $Res Function(OrderAddress) _then;

/// Create a copy of OrderAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = null,Object? city = null,Object? region = null,Object? postcode = null,Object? countryId = null,Object? telephone = freezed,Object? fax = freezed,Object? vatId = freezed,}) {
  return _then(_self.copyWith(
firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
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
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderAddress].
extension OrderAddressPatterns on OrderAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderAddress value)  $default,){
final _that = this;
switch (_that) {
case _OrderAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderAddress value)?  $default,){
final _that = this;
switch (_that) {
case _OrderAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? company,  String street,  String city,  String region,  String postcode,  String countryId,  String? telephone,  String? fax,  String? vatId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderAddress() when $default != null:
return $default(_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.vatId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? company,  String street,  String city,  String region,  String postcode,  String countryId,  String? telephone,  String? fax,  String? vatId)  $default,) {final _that = this;
switch (_that) {
case _OrderAddress():
return $default(_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.vatId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstname,  String lastname,  String? middlename,  String? prefix,  String? suffix,  String? company,  String street,  String city,  String region,  String postcode,  String countryId,  String? telephone,  String? fax,  String? vatId)?  $default,) {final _that = this;
switch (_that) {
case _OrderAddress() when $default != null:
return $default(_that.firstname,_that.lastname,_that.middlename,_that.prefix,_that.suffix,_that.company,_that.street,_that.city,_that.region,_that.postcode,_that.countryId,_that.telephone,_that.fax,_that.vatId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderAddress implements OrderAddress {
  const _OrderAddress({required this.firstname, required this.lastname, this.middlename, this.prefix, this.suffix, this.company, required this.street, required this.city, required this.region, required this.postcode, required this.countryId, this.telephone, this.fax, this.vatId});
  factory _OrderAddress.fromJson(Map<String, dynamic> json) => _$OrderAddressFromJson(json);

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

/// Create a copy of OrderAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderAddressCopyWith<_OrderAddress> get copyWith => __$OrderAddressCopyWithImpl<_OrderAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderAddress&&(identical(other.firstname, firstname) || other.firstname == firstname)&&(identical(other.lastname, lastname) || other.lastname == lastname)&&(identical(other.middlename, middlename) || other.middlename == middlename)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.company, company) || other.company == company)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.region, region) || other.region == region)&&(identical(other.postcode, postcode) || other.postcode == postcode)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.fax, fax) || other.fax == fax)&&(identical(other.vatId, vatId) || other.vatId == vatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstname,lastname,middlename,prefix,suffix,company,street,city,region,postcode,countryId,telephone,fax,vatId);

@override
String toString() {
  return 'OrderAddress(firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, vatId: $vatId)';
}


}

/// @nodoc
abstract mixin class _$OrderAddressCopyWith<$Res> implements $OrderAddressCopyWith<$Res> {
  factory _$OrderAddressCopyWith(_OrderAddress value, $Res Function(_OrderAddress) _then) = __$OrderAddressCopyWithImpl;
@override @useResult
$Res call({
 String firstname, String lastname, String? middlename, String? prefix, String? suffix, String? company, String street, String city, String region, String postcode, String countryId, String? telephone, String? fax, String? vatId
});




}
/// @nodoc
class __$OrderAddressCopyWithImpl<$Res>
    implements _$OrderAddressCopyWith<$Res> {
  __$OrderAddressCopyWithImpl(this._self, this._then);

  final _OrderAddress _self;
  final $Res Function(_OrderAddress) _then;

/// Create a copy of OrderAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstname = null,Object? lastname = null,Object? middlename = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? company = freezed,Object? street = null,Object? city = null,Object? region = null,Object? postcode = null,Object? countryId = null,Object? telephone = freezed,Object? fax = freezed,Object? vatId = freezed,}) {
  return _then(_OrderAddress(
firstname: null == firstname ? _self.firstname : firstname // ignore: cast_nullable_to_non_nullable
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
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderPayment {

 String get method; String get title; double get amount; String? get transactionId; Map<String, dynamic>? get additionalData;
/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPaymentCopyWith<OrderPayment> get copyWith => _$OrderPaymentCopyWithImpl<OrderPayment>(this as OrderPayment, _$identity);

  /// Serializes this OrderPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&const DeepCollectionEquality().equals(other.additionalData, additionalData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,title,amount,transactionId,const DeepCollectionEquality().hash(additionalData));

@override
String toString() {
  return 'OrderPayment(method: $method, title: $title, amount: $amount, transactionId: $transactionId, additionalData: $additionalData)';
}


}

/// @nodoc
abstract mixin class $OrderPaymentCopyWith<$Res>  {
  factory $OrderPaymentCopyWith(OrderPayment value, $Res Function(OrderPayment) _then) = _$OrderPaymentCopyWithImpl;
@useResult
$Res call({
 String method, String title, double amount, String? transactionId, Map<String, dynamic>? additionalData
});




}
/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._self, this._then);

  final OrderPayment _self;
  final $Res Function(OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? title = null,Object? amount = null,Object? transactionId = freezed,Object? additionalData = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,additionalData: freezed == additionalData ? _self.additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderPayment].
extension OrderPaymentPatterns on OrderPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPayment value)  $default,){
final _that = this;
switch (_that) {
case _OrderPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPayment value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  String title,  double amount,  String? transactionId,  Map<String, dynamic>? additionalData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.method,_that.title,_that.amount,_that.transactionId,_that.additionalData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  String title,  double amount,  String? transactionId,  Map<String, dynamic>? additionalData)  $default,) {final _that = this;
switch (_that) {
case _OrderPayment():
return $default(_that.method,_that.title,_that.amount,_that.transactionId,_that.additionalData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  String title,  double amount,  String? transactionId,  Map<String, dynamic>? additionalData)?  $default,) {final _that = this;
switch (_that) {
case _OrderPayment() when $default != null:
return $default(_that.method,_that.title,_that.amount,_that.transactionId,_that.additionalData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderPayment implements OrderPayment {
  const _OrderPayment({required this.method, required this.title, required this.amount, this.transactionId, final  Map<String, dynamic>? additionalData}): _additionalData = additionalData;
  factory _OrderPayment.fromJson(Map<String, dynamic> json) => _$OrderPaymentFromJson(json);

@override final  String method;
@override final  String title;
@override final  double amount;
@override final  String? transactionId;
 final  Map<String, dynamic>? _additionalData;
@override Map<String, dynamic>? get additionalData {
  final value = _additionalData;
  if (value == null) return null;
  if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPaymentCopyWith<_OrderPayment> get copyWith => __$OrderPaymentCopyWithImpl<_OrderPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPayment&&(identical(other.method, method) || other.method == method)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&const DeepCollectionEquality().equals(other._additionalData, _additionalData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,title,amount,transactionId,const DeepCollectionEquality().hash(_additionalData));

@override
String toString() {
  return 'OrderPayment(method: $method, title: $title, amount: $amount, transactionId: $transactionId, additionalData: $additionalData)';
}


}

/// @nodoc
abstract mixin class _$OrderPaymentCopyWith<$Res> implements $OrderPaymentCopyWith<$Res> {
  factory _$OrderPaymentCopyWith(_OrderPayment value, $Res Function(_OrderPayment) _then) = __$OrderPaymentCopyWithImpl;
@override @useResult
$Res call({
 String method, String title, double amount, String? transactionId, Map<String, dynamic>? additionalData
});




}
/// @nodoc
class __$OrderPaymentCopyWithImpl<$Res>
    implements _$OrderPaymentCopyWith<$Res> {
  __$OrderPaymentCopyWithImpl(this._self, this._then);

  final _OrderPayment _self;
  final $Res Function(_OrderPayment) _then;

/// Create a copy of OrderPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? title = null,Object? amount = null,Object? transactionId = freezed,Object? additionalData = freezed,}) {
  return _then(_OrderPayment(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,additionalData: freezed == additionalData ? _self._additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$OrderShipping {

 String get method; String get title; double get amount; Map<String, dynamic>? get additionalData;
/// Create a copy of OrderShipping
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderShippingCopyWith<OrderShipping> get copyWith => _$OrderShippingCopyWithImpl<OrderShipping>(this as OrderShipping, _$identity);

  /// Serializes this OrderShipping to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderShipping&&(identical(other.method, method) || other.method == method)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other.additionalData, additionalData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,title,amount,const DeepCollectionEquality().hash(additionalData));

@override
String toString() {
  return 'OrderShipping(method: $method, title: $title, amount: $amount, additionalData: $additionalData)';
}


}

/// @nodoc
abstract mixin class $OrderShippingCopyWith<$Res>  {
  factory $OrderShippingCopyWith(OrderShipping value, $Res Function(OrderShipping) _then) = _$OrderShippingCopyWithImpl;
@useResult
$Res call({
 String method, String title, double amount, Map<String, dynamic>? additionalData
});




}
/// @nodoc
class _$OrderShippingCopyWithImpl<$Res>
    implements $OrderShippingCopyWith<$Res> {
  _$OrderShippingCopyWithImpl(this._self, this._then);

  final OrderShipping _self;
  final $Res Function(OrderShipping) _then;

/// Create a copy of OrderShipping
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? method = null,Object? title = null,Object? amount = null,Object? additionalData = freezed,}) {
  return _then(_self.copyWith(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,additionalData: freezed == additionalData ? _self.additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderShipping].
extension OrderShippingPatterns on OrderShipping {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderShipping value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderShipping() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderShipping value)  $default,){
final _that = this;
switch (_that) {
case _OrderShipping():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderShipping value)?  $default,){
final _that = this;
switch (_that) {
case _OrderShipping() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String method,  String title,  double amount,  Map<String, dynamic>? additionalData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderShipping() when $default != null:
return $default(_that.method,_that.title,_that.amount,_that.additionalData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String method,  String title,  double amount,  Map<String, dynamic>? additionalData)  $default,) {final _that = this;
switch (_that) {
case _OrderShipping():
return $default(_that.method,_that.title,_that.amount,_that.additionalData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String method,  String title,  double amount,  Map<String, dynamic>? additionalData)?  $default,) {final _that = this;
switch (_that) {
case _OrderShipping() when $default != null:
return $default(_that.method,_that.title,_that.amount,_that.additionalData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderShipping implements OrderShipping {
  const _OrderShipping({required this.method, required this.title, required this.amount, final  Map<String, dynamic>? additionalData}): _additionalData = additionalData;
  factory _OrderShipping.fromJson(Map<String, dynamic> json) => _$OrderShippingFromJson(json);

@override final  String method;
@override final  String title;
@override final  double amount;
 final  Map<String, dynamic>? _additionalData;
@override Map<String, dynamic>? get additionalData {
  final value = _additionalData;
  if (value == null) return null;
  if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OrderShipping
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderShippingCopyWith<_OrderShipping> get copyWith => __$OrderShippingCopyWithImpl<_OrderShipping>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderShippingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderShipping&&(identical(other.method, method) || other.method == method)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other._additionalData, _additionalData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,method,title,amount,const DeepCollectionEquality().hash(_additionalData));

@override
String toString() {
  return 'OrderShipping(method: $method, title: $title, amount: $amount, additionalData: $additionalData)';
}


}

/// @nodoc
abstract mixin class _$OrderShippingCopyWith<$Res> implements $OrderShippingCopyWith<$Res> {
  factory _$OrderShippingCopyWith(_OrderShipping value, $Res Function(_OrderShipping) _then) = __$OrderShippingCopyWithImpl;
@override @useResult
$Res call({
 String method, String title, double amount, Map<String, dynamic>? additionalData
});




}
/// @nodoc
class __$OrderShippingCopyWithImpl<$Res>
    implements _$OrderShippingCopyWith<$Res> {
  __$OrderShippingCopyWithImpl(this._self, this._then);

  final _OrderShipping _self;
  final $Res Function(_OrderShipping) _then;

/// Create a copy of OrderShipping
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? method = null,Object? title = null,Object? amount = null,Object? additionalData = freezed,}) {
  return _then(_OrderShipping(
method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,additionalData: freezed == additionalData ? _self._additionalData : additionalData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$OrderComment {

 String get comment; DateTime get createdAt; bool? get isVisibleOnFront;
/// Create a copy of OrderComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCommentCopyWith<OrderComment> get copyWith => _$OrderCommentCopyWithImpl<OrderComment>(this as OrderComment, _$identity);

  /// Serializes this OrderComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderComment&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isVisibleOnFront, isVisibleOnFront) || other.isVisibleOnFront == isVisibleOnFront));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comment,createdAt,isVisibleOnFront);

@override
String toString() {
  return 'OrderComment(comment: $comment, createdAt: $createdAt, isVisibleOnFront: $isVisibleOnFront)';
}


}

/// @nodoc
abstract mixin class $OrderCommentCopyWith<$Res>  {
  factory $OrderCommentCopyWith(OrderComment value, $Res Function(OrderComment) _then) = _$OrderCommentCopyWithImpl;
@useResult
$Res call({
 String comment, DateTime createdAt, bool? isVisibleOnFront
});




}
/// @nodoc
class _$OrderCommentCopyWithImpl<$Res>
    implements $OrderCommentCopyWith<$Res> {
  _$OrderCommentCopyWithImpl(this._self, this._then);

  final OrderComment _self;
  final $Res Function(OrderComment) _then;

/// Create a copy of OrderComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,Object? createdAt = null,Object? isVisibleOnFront = freezed,}) {
  return _then(_self.copyWith(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isVisibleOnFront: freezed == isVisibleOnFront ? _self.isVisibleOnFront : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderComment].
extension OrderCommentPatterns on OrderComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderComment value)  $default,){
final _that = this;
switch (_that) {
case _OrderComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderComment value)?  $default,){
final _that = this;
switch (_that) {
case _OrderComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String comment,  DateTime createdAt,  bool? isVisibleOnFront)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderComment() when $default != null:
return $default(_that.comment,_that.createdAt,_that.isVisibleOnFront);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String comment,  DateTime createdAt,  bool? isVisibleOnFront)  $default,) {final _that = this;
switch (_that) {
case _OrderComment():
return $default(_that.comment,_that.createdAt,_that.isVisibleOnFront);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String comment,  DateTime createdAt,  bool? isVisibleOnFront)?  $default,) {final _that = this;
switch (_that) {
case _OrderComment() when $default != null:
return $default(_that.comment,_that.createdAt,_that.isVisibleOnFront);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderComment implements OrderComment {
  const _OrderComment({required this.comment, required this.createdAt, this.isVisibleOnFront});
  factory _OrderComment.fromJson(Map<String, dynamic> json) => _$OrderCommentFromJson(json);

@override final  String comment;
@override final  DateTime createdAt;
@override final  bool? isVisibleOnFront;

/// Create a copy of OrderComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCommentCopyWith<_OrderComment> get copyWith => __$OrderCommentCopyWithImpl<_OrderComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderComment&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isVisibleOnFront, isVisibleOnFront) || other.isVisibleOnFront == isVisibleOnFront));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,comment,createdAt,isVisibleOnFront);

@override
String toString() {
  return 'OrderComment(comment: $comment, createdAt: $createdAt, isVisibleOnFront: $isVisibleOnFront)';
}


}

/// @nodoc
abstract mixin class _$OrderCommentCopyWith<$Res> implements $OrderCommentCopyWith<$Res> {
  factory _$OrderCommentCopyWith(_OrderComment value, $Res Function(_OrderComment) _then) = __$OrderCommentCopyWithImpl;
@override @useResult
$Res call({
 String comment, DateTime createdAt, bool? isVisibleOnFront
});




}
/// @nodoc
class __$OrderCommentCopyWithImpl<$Res>
    implements _$OrderCommentCopyWith<$Res> {
  __$OrderCommentCopyWithImpl(this._self, this._then);

  final _OrderComment _self;
  final $Res Function(_OrderComment) _then;

/// Create a copy of OrderComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comment = null,Object? createdAt = null,Object? isVisibleOnFront = freezed,}) {
  return _then(_OrderComment(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,isVisibleOnFront: freezed == isVisibleOnFront ? _self.isVisibleOnFront : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
