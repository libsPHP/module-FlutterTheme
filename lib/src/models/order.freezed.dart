// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get id => throw _privateConstructorUsedError;
  String get incrementId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get shippingAmount => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  List<OrderItem> get items => throw _privateConstructorUsedError;
  OrderAddress get billingAddress => throw _privateConstructorUsedError;
  OrderAddress get shippingAddress => throw _privateConstructorUsedError;
  OrderPayment get payment => throw _privateConstructorUsedError;
  OrderShipping? get shipping => throw _privateConstructorUsedError;
  List<OrderComment>? get comments => throw _privateConstructorUsedError;
  String? get customerEmail => throw _privateConstructorUsedError;
  String? get customerFirstname => throw _privateConstructorUsedError;
  String? get customerLastname => throw _privateConstructorUsedError;
  String? get couponCode => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call({
    int id,
    String incrementId,
    String status,
    String state,
    double grandTotal,
    double subtotal,
    double shippingAmount,
    double taxAmount,
    double discountAmount,
    List<OrderItem> items,
    OrderAddress billingAddress,
    OrderAddress shippingAddress,
    OrderPayment payment,
    OrderShipping? shipping,
    List<OrderComment>? comments,
    String? customerEmail,
    String? customerFirstname,
    String? customerLastname,
    String? couponCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $OrderAddressCopyWith<$Res> get billingAddress;
  $OrderAddressCopyWith<$Res> get shippingAddress;
  $OrderPaymentCopyWith<$Res> get payment;
  $OrderShippingCopyWith<$Res>? get shipping;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incrementId = null,
    Object? status = null,
    Object? state = null,
    Object? grandTotal = null,
    Object? subtotal = null,
    Object? shippingAmount = null,
    Object? taxAmount = null,
    Object? discountAmount = null,
    Object? items = null,
    Object? billingAddress = null,
    Object? shippingAddress = null,
    Object? payment = null,
    Object? shipping = freezed,
    Object? comments = freezed,
    Object? customerEmail = freezed,
    Object? customerFirstname = freezed,
    Object? customerLastname = freezed,
    Object? couponCode = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            incrementId: null == incrementId
                ? _value.incrementId
                : incrementId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String,
            grandTotal: null == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                      as double,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            shippingAmount: null == shippingAmount
                ? _value.shippingAmount
                : shippingAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            taxAmount: null == taxAmount
                ? _value.taxAmount
                : taxAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            discountAmount: null == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<OrderItem>,
            billingAddress: null == billingAddress
                ? _value.billingAddress
                : billingAddress // ignore: cast_nullable_to_non_nullable
                      as OrderAddress,
            shippingAddress: null == shippingAddress
                ? _value.shippingAddress
                : shippingAddress // ignore: cast_nullable_to_non_nullable
                      as OrderAddress,
            payment: null == payment
                ? _value.payment
                : payment // ignore: cast_nullable_to_non_nullable
                      as OrderPayment,
            shipping: freezed == shipping
                ? _value.shipping
                : shipping // ignore: cast_nullable_to_non_nullable
                      as OrderShipping?,
            comments: freezed == comments
                ? _value.comments
                : comments // ignore: cast_nullable_to_non_nullable
                      as List<OrderComment>?,
            customerEmail: freezed == customerEmail
                ? _value.customerEmail
                : customerEmail // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerFirstname: freezed == customerFirstname
                ? _value.customerFirstname
                : customerFirstname // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerLastname: freezed == customerLastname
                ? _value.customerLastname
                : customerLastname // ignore: cast_nullable_to_non_nullable
                      as String?,
            couponCode: freezed == couponCode
                ? _value.couponCode
                : couponCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderAddressCopyWith<$Res> get billingAddress {
    return $OrderAddressCopyWith<$Res>(_value.billingAddress, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
    });
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderAddressCopyWith<$Res> get shippingAddress {
    return $OrderAddressCopyWith<$Res>(_value.shippingAddress, (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderPaymentCopyWith<$Res> get payment {
    return $OrderPaymentCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrderShippingCopyWith<$Res>? get shipping {
    if (_value.shipping == null) {
      return null;
    }

    return $OrderShippingCopyWith<$Res>(_value.shipping!, (value) {
      return _then(_value.copyWith(shipping: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
    _$OrderImpl value,
    $Res Function(_$OrderImpl) then,
  ) = __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String incrementId,
    String status,
    String state,
    double grandTotal,
    double subtotal,
    double shippingAmount,
    double taxAmount,
    double discountAmount,
    List<OrderItem> items,
    OrderAddress billingAddress,
    OrderAddress shippingAddress,
    OrderPayment payment,
    OrderShipping? shipping,
    List<OrderComment>? comments,
    String? customerEmail,
    String? customerFirstname,
    String? customerLastname,
    String? couponCode,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $OrderAddressCopyWith<$Res> get billingAddress;
  @override
  $OrderAddressCopyWith<$Res> get shippingAddress;
  @override
  $OrderPaymentCopyWith<$Res> get payment;
  @override
  $OrderShippingCopyWith<$Res>? get shipping;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
    _$OrderImpl _value,
    $Res Function(_$OrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? incrementId = null,
    Object? status = null,
    Object? state = null,
    Object? grandTotal = null,
    Object? subtotal = null,
    Object? shippingAmount = null,
    Object? taxAmount = null,
    Object? discountAmount = null,
    Object? items = null,
    Object? billingAddress = null,
    Object? shippingAddress = null,
    Object? payment = null,
    Object? shipping = freezed,
    Object? comments = freezed,
    Object? customerEmail = freezed,
    Object? customerFirstname = freezed,
    Object? customerLastname = freezed,
    Object? couponCode = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$OrderImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        incrementId: null == incrementId
            ? _value.incrementId
            : incrementId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String,
        grandTotal: null == grandTotal
            ? _value.grandTotal
            : grandTotal // ignore: cast_nullable_to_non_nullable
                  as double,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        shippingAmount: null == shippingAmount
            ? _value.shippingAmount
            : shippingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        taxAmount: null == taxAmount
            ? _value.taxAmount
            : taxAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        discountAmount: null == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<OrderItem>,
        billingAddress: null == billingAddress
            ? _value.billingAddress
            : billingAddress // ignore: cast_nullable_to_non_nullable
                  as OrderAddress,
        shippingAddress: null == shippingAddress
            ? _value.shippingAddress
            : shippingAddress // ignore: cast_nullable_to_non_nullable
                  as OrderAddress,
        payment: null == payment
            ? _value.payment
            : payment // ignore: cast_nullable_to_non_nullable
                  as OrderPayment,
        shipping: freezed == shipping
            ? _value.shipping
            : shipping // ignore: cast_nullable_to_non_nullable
                  as OrderShipping?,
        comments: freezed == comments
            ? _value._comments
            : comments // ignore: cast_nullable_to_non_nullable
                  as List<OrderComment>?,
        customerEmail: freezed == customerEmail
            ? _value.customerEmail
            : customerEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerFirstname: freezed == customerFirstname
            ? _value.customerFirstname
            : customerFirstname // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerLastname: freezed == customerLastname
            ? _value.customerLastname
            : customerLastname // ignore: cast_nullable_to_non_nullable
                  as String?,
        couponCode: freezed == couponCode
            ? _value.couponCode
            : couponCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl({
    required this.id,
    required this.incrementId,
    required this.status,
    required this.state,
    required this.grandTotal,
    required this.subtotal,
    required this.shippingAmount,
    required this.taxAmount,
    required this.discountAmount,
    required final List<OrderItem> items,
    required this.billingAddress,
    required this.shippingAddress,
    required this.payment,
    this.shipping,
    final List<OrderComment>? comments,
    this.customerEmail,
    this.customerFirstname,
    this.customerLastname,
    this.couponCode,
    this.createdAt,
    this.updatedAt,
  }) : _items = items,
       _comments = comments;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int id;
  @override
  final String incrementId;
  @override
  final String status;
  @override
  final String state;
  @override
  final double grandTotal;
  @override
  final double subtotal;
  @override
  final double shippingAmount;
  @override
  final double taxAmount;
  @override
  final double discountAmount;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final OrderAddress billingAddress;
  @override
  final OrderAddress shippingAddress;
  @override
  final OrderPayment payment;
  @override
  final OrderShipping? shipping;
  final List<OrderComment>? _comments;
  @override
  List<OrderComment>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? customerEmail;
  @override
  final String? customerFirstname;
  @override
  final String? customerLastname;
  @override
  final String? couponCode;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Order(id: $id, incrementId: $incrementId, status: $status, state: $state, grandTotal: $grandTotal, subtotal: $subtotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, items: $items, billingAddress: $billingAddress, shippingAddress: $shippingAddress, payment: $payment, shipping: $shipping, comments: $comments, customerEmail: $customerEmail, customerFirstname: $customerFirstname, customerLastname: $customerLastname, couponCode: $couponCode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.incrementId, incrementId) ||
                other.incrementId == incrementId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.payment, payment) || other.payment == payment) &&
            (identical(other.shipping, shipping) ||
                other.shipping == shipping) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.customerFirstname, customerFirstname) ||
                other.customerFirstname == customerFirstname) &&
            (identical(other.customerLastname, customerLastname) ||
                other.customerLastname == customerLastname) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    incrementId,
    status,
    state,
    grandTotal,
    subtotal,
    shippingAmount,
    taxAmount,
    discountAmount,
    const DeepCollectionEquality().hash(_items),
    billingAddress,
    shippingAddress,
    payment,
    shipping,
    const DeepCollectionEquality().hash(_comments),
    customerEmail,
    customerFirstname,
    customerLastname,
    couponCode,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(this);
  }
}

abstract class _Order implements Order {
  const factory _Order({
    required final int id,
    required final String incrementId,
    required final String status,
    required final String state,
    required final double grandTotal,
    required final double subtotal,
    required final double shippingAmount,
    required final double taxAmount,
    required final double discountAmount,
    required final List<OrderItem> items,
    required final OrderAddress billingAddress,
    required final OrderAddress shippingAddress,
    required final OrderPayment payment,
    final OrderShipping? shipping,
    final List<OrderComment>? comments,
    final String? customerEmail,
    final String? customerFirstname,
    final String? customerLastname,
    final String? couponCode,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int get id;
  @override
  String get incrementId;
  @override
  String get status;
  @override
  String get state;
  @override
  double get grandTotal;
  @override
  double get subtotal;
  @override
  double get shippingAmount;
  @override
  double get taxAmount;
  @override
  double get discountAmount;
  @override
  List<OrderItem> get items;
  @override
  OrderAddress get billingAddress;
  @override
  OrderAddress get shippingAddress;
  @override
  OrderPayment get payment;
  @override
  OrderShipping? get shipping;
  @override
  List<OrderComment>? get comments;
  @override
  String? get customerEmail;
  @override
  String? get customerFirstname;
  @override
  String? get customerLastname;
  @override
  String? get couponCode;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  int get id => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double? get rowTotal => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<OrderItemOption>? get options => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call({
    int id,
    String sku,
    String name,
    double price,
    int quantity,
    double? rowTotal,
    String? image,
    List<OrderItemOption>? options,
    Map<String, dynamic>? customAttributes,
  });
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? rowTotal = freezed,
    Object? image = freezed,
    Object? options = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            sku: null == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            rowTotal: freezed == rowTotal
                ? _value.rowTotal
                : rowTotal // ignore: cast_nullable_to_non_nullable
                      as double?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            options: freezed == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<OrderItemOption>?,
            customAttributes: freezed == customAttributes
                ? _value.customAttributes
                : customAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemImplCopyWith<$Res>
    implements $OrderItemCopyWith<$Res> {
  factory _$$OrderItemImplCopyWith(
    _$OrderItemImpl value,
    $Res Function(_$OrderItemImpl) then,
  ) = __$$OrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String sku,
    String name,
    double price,
    int quantity,
    double? rowTotal,
    String? image,
    List<OrderItemOption>? options,
    Map<String, dynamic>? customAttributes,
  });
}

/// @nodoc
class __$$OrderItemImplCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$OrderItemImpl>
    implements _$$OrderItemImplCopyWith<$Res> {
  __$$OrderItemImplCopyWithImpl(
    _$OrderItemImpl _value,
    $Res Function(_$OrderItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? rowTotal = freezed,
    Object? image = freezed,
    Object? options = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _$OrderItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        sku: null == sku
            ? _value.sku
            : sku // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        rowTotal: freezed == rowTotal
            ? _value.rowTotal
            : rowTotal // ignore: cast_nullable_to_non_nullable
                  as double?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        options: freezed == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<OrderItemOption>?,
        customAttributes: freezed == customAttributes
            ? _value._customAttributes
            : customAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemImpl implements _OrderItem {
  const _$OrderItemImpl({
    required this.id,
    required this.sku,
    required this.name,
    required this.price,
    required this.quantity,
    this.rowTotal,
    this.image,
    final List<OrderItemOption>? options,
    final Map<String, dynamic>? customAttributes,
  }) : _options = options,
       _customAttributes = customAttributes;

  factory _$OrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemImplFromJson(json);

  @override
  final int id;
  @override
  final String sku;
  @override
  final String name;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final double? rowTotal;
  @override
  final String? image;
  final List<OrderItemOption>? _options;
  @override
  List<OrderItemOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _customAttributes;
  @override
  Map<String, dynamic>? get customAttributes {
    final value = _customAttributes;
    if (value == null) return null;
    if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'OrderItem(id: $id, sku: $sku, name: $name, price: $price, quantity: $quantity, rowTotal: $rowTotal, image: $image, options: $options, customAttributes: $customAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rowTotal, rowTotal) ||
                other.rowTotal == rowTotal) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality().equals(
              other._customAttributes,
              _customAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sku,
    name,
    price,
    quantity,
    rowTotal,
    image,
    const DeepCollectionEquality().hash(_options),
    const DeepCollectionEquality().hash(_customAttributes),
  );

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      __$$OrderItemImplCopyWithImpl<_$OrderItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemImplToJson(this);
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem({
    required final int id,
    required final String sku,
    required final String name,
    required final double price,
    required final int quantity,
    final double? rowTotal,
    final String? image,
    final List<OrderItemOption>? options,
    final Map<String, dynamic>? customAttributes,
  }) = _$OrderItemImpl;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$OrderItemImpl.fromJson;

  @override
  int get id;
  @override
  String get sku;
  @override
  String get name;
  @override
  double get price;
  @override
  int get quantity;
  @override
  double? get rowTotal;
  @override
  String? get image;
  @override
  List<OrderItemOption>? get options;
  @override
  Map<String, dynamic>? get customAttributes;

  /// Create a copy of OrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemImplCopyWith<_$OrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItemOption _$OrderItemOptionFromJson(Map<String, dynamic> json) {
  return _OrderItemOption.fromJson(json);
}

/// @nodoc
mixin _$OrderItemOption {
  String get code => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get priceType => throw _privateConstructorUsedError;

  /// Serializes this OrderItemOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderItemOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderItemOptionCopyWith<OrderItemOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemOptionCopyWith<$Res> {
  factory $OrderItemOptionCopyWith(
    OrderItemOption value,
    $Res Function(OrderItemOption) then,
  ) = _$OrderItemOptionCopyWithImpl<$Res, OrderItemOption>;
  @useResult
  $Res call({
    String code,
    String label,
    String value,
    double? price,
    String? priceType,
  });
}

/// @nodoc
class _$OrderItemOptionCopyWithImpl<$Res, $Val extends OrderItemOption>
    implements $OrderItemOptionCopyWith<$Res> {
  _$OrderItemOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderItemOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? value = null,
    Object? price = freezed,
    Object? priceType = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            priceType: freezed == priceType
                ? _value.priceType
                : priceType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderItemOptionImplCopyWith<$Res>
    implements $OrderItemOptionCopyWith<$Res> {
  factory _$$OrderItemOptionImplCopyWith(
    _$OrderItemOptionImpl value,
    $Res Function(_$OrderItemOptionImpl) then,
  ) = __$$OrderItemOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String label,
    String value,
    double? price,
    String? priceType,
  });
}

/// @nodoc
class __$$OrderItemOptionImplCopyWithImpl<$Res>
    extends _$OrderItemOptionCopyWithImpl<$Res, _$OrderItemOptionImpl>
    implements _$$OrderItemOptionImplCopyWith<$Res> {
  __$$OrderItemOptionImplCopyWithImpl(
    _$OrderItemOptionImpl _value,
    $Res Function(_$OrderItemOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderItemOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? value = null,
    Object? price = freezed,
    Object? priceType = freezed,
  }) {
    return _then(
      _$OrderItemOptionImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        priceType: freezed == priceType
            ? _value.priceType
            : priceType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderItemOptionImpl implements _OrderItemOption {
  const _$OrderItemOptionImpl({
    required this.code,
    required this.label,
    required this.value,
    this.price,
    this.priceType,
  });

  factory _$OrderItemOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderItemOptionImplFromJson(json);

  @override
  final String code;
  @override
  final String label;
  @override
  final String value;
  @override
  final double? price;
  @override
  final String? priceType;

  @override
  String toString() {
    return 'OrderItemOption(code: $code, label: $label, value: $value, price: $price, priceType: $priceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderItemOptionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, label, value, price, priceType);

  /// Create a copy of OrderItemOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderItemOptionImplCopyWith<_$OrderItemOptionImpl> get copyWith =>
      __$$OrderItemOptionImplCopyWithImpl<_$OrderItemOptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderItemOptionImplToJson(this);
  }
}

abstract class _OrderItemOption implements OrderItemOption {
  const factory _OrderItemOption({
    required final String code,
    required final String label,
    required final String value,
    final double? price,
    final String? priceType,
  }) = _$OrderItemOptionImpl;

  factory _OrderItemOption.fromJson(Map<String, dynamic> json) =
      _$OrderItemOptionImpl.fromJson;

  @override
  String get code;
  @override
  String get label;
  @override
  String get value;
  @override
  double? get price;
  @override
  String? get priceType;

  /// Create a copy of OrderItemOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderItemOptionImplCopyWith<_$OrderItemOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderAddress _$OrderAddressFromJson(Map<String, dynamic> json) {
  return _OrderAddress.fromJson(json);
}

/// @nodoc
mixin _$OrderAddress {
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String? get middlename => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  String get postcode => throw _privateConstructorUsedError;
  String get countryId => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  String? get fax => throw _privateConstructorUsedError;
  String? get vatId => throw _privateConstructorUsedError;

  /// Serializes this OrderAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderAddressCopyWith<OrderAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderAddressCopyWith<$Res> {
  factory $OrderAddressCopyWith(
    OrderAddress value,
    $Res Function(OrderAddress) then,
  ) = _$OrderAddressCopyWithImpl<$Res, OrderAddress>;
  @useResult
  $Res call({
    String firstname,
    String lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? company,
    String street,
    String city,
    String region,
    String postcode,
    String countryId,
    String? telephone,
    String? fax,
    String? vatId,
  });
}

/// @nodoc
class _$OrderAddressCopyWithImpl<$Res, $Val extends OrderAddress>
    implements $OrderAddressCopyWith<$Res> {
  _$OrderAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? company = freezed,
    Object? street = null,
    Object? city = null,
    Object? region = null,
    Object? postcode = null,
    Object? countryId = null,
    Object? telephone = freezed,
    Object? fax = freezed,
    Object? vatId = freezed,
  }) {
    return _then(
      _value.copyWith(
            firstname: null == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                      as String,
            lastname: null == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                      as String,
            middlename: freezed == middlename
                ? _value.middlename
                : middlename // ignore: cast_nullable_to_non_nullable
                      as String?,
            prefix: freezed == prefix
                ? _value.prefix
                : prefix // ignore: cast_nullable_to_non_nullable
                      as String?,
            suffix: freezed == suffix
                ? _value.suffix
                : suffix // ignore: cast_nullable_to_non_nullable
                      as String?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String?,
            street: null == street
                ? _value.street
                : street // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            region: null == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String,
            postcode: null == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                      as String,
            countryId: null == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                      as String,
            telephone: freezed == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                      as String?,
            fax: freezed == fax
                ? _value.fax
                : fax // ignore: cast_nullable_to_non_nullable
                      as String?,
            vatId: freezed == vatId
                ? _value.vatId
                : vatId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderAddressImplCopyWith<$Res>
    implements $OrderAddressCopyWith<$Res> {
  factory _$$OrderAddressImplCopyWith(
    _$OrderAddressImpl value,
    $Res Function(_$OrderAddressImpl) then,
  ) = __$$OrderAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String firstname,
    String lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? company,
    String street,
    String city,
    String region,
    String postcode,
    String countryId,
    String? telephone,
    String? fax,
    String? vatId,
  });
}

/// @nodoc
class __$$OrderAddressImplCopyWithImpl<$Res>
    extends _$OrderAddressCopyWithImpl<$Res, _$OrderAddressImpl>
    implements _$$OrderAddressImplCopyWith<$Res> {
  __$$OrderAddressImplCopyWithImpl(
    _$OrderAddressImpl _value,
    $Res Function(_$OrderAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? company = freezed,
    Object? street = null,
    Object? city = null,
    Object? region = null,
    Object? postcode = null,
    Object? countryId = null,
    Object? telephone = freezed,
    Object? fax = freezed,
    Object? vatId = freezed,
  }) {
    return _then(
      _$OrderAddressImpl(
        firstname: null == firstname
            ? _value.firstname
            : firstname // ignore: cast_nullable_to_non_nullable
                  as String,
        lastname: null == lastname
            ? _value.lastname
            : lastname // ignore: cast_nullable_to_non_nullable
                  as String,
        middlename: freezed == middlename
            ? _value.middlename
            : middlename // ignore: cast_nullable_to_non_nullable
                  as String?,
        prefix: freezed == prefix
            ? _value.prefix
            : prefix // ignore: cast_nullable_to_non_nullable
                  as String?,
        suffix: freezed == suffix
            ? _value.suffix
            : suffix // ignore: cast_nullable_to_non_nullable
                  as String?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String?,
        street: null == street
            ? _value.street
            : street // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        region: null == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String,
        postcode: null == postcode
            ? _value.postcode
            : postcode // ignore: cast_nullable_to_non_nullable
                  as String,
        countryId: null == countryId
            ? _value.countryId
            : countryId // ignore: cast_nullable_to_non_nullable
                  as String,
        telephone: freezed == telephone
            ? _value.telephone
            : telephone // ignore: cast_nullable_to_non_nullable
                  as String?,
        fax: freezed == fax
            ? _value.fax
            : fax // ignore: cast_nullable_to_non_nullable
                  as String?,
        vatId: freezed == vatId
            ? _value.vatId
            : vatId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderAddressImpl implements _OrderAddress {
  const _$OrderAddressImpl({
    required this.firstname,
    required this.lastname,
    this.middlename,
    this.prefix,
    this.suffix,
    this.company,
    required this.street,
    required this.city,
    required this.region,
    required this.postcode,
    required this.countryId,
    this.telephone,
    this.fax,
    this.vatId,
  });

  factory _$OrderAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderAddressImplFromJson(json);

  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String? middlename;
  @override
  final String? prefix;
  @override
  final String? suffix;
  @override
  final String? company;
  @override
  final String street;
  @override
  final String city;
  @override
  final String region;
  @override
  final String postcode;
  @override
  final String countryId;
  @override
  final String? telephone;
  @override
  final String? fax;
  @override
  final String? vatId;

  @override
  String toString() {
    return 'OrderAddress(firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, vatId: $vatId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderAddressImpl &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.vatId, vatId) || other.vatId == vatId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    firstname,
    lastname,
    middlename,
    prefix,
    suffix,
    company,
    street,
    city,
    region,
    postcode,
    countryId,
    telephone,
    fax,
    vatId,
  );

  /// Create a copy of OrderAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderAddressImplCopyWith<_$OrderAddressImpl> get copyWith =>
      __$$OrderAddressImplCopyWithImpl<_$OrderAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderAddressImplToJson(this);
  }
}

abstract class _OrderAddress implements OrderAddress {
  const factory _OrderAddress({
    required final String firstname,
    required final String lastname,
    final String? middlename,
    final String? prefix,
    final String? suffix,
    final String? company,
    required final String street,
    required final String city,
    required final String region,
    required final String postcode,
    required final String countryId,
    final String? telephone,
    final String? fax,
    final String? vatId,
  }) = _$OrderAddressImpl;

  factory _OrderAddress.fromJson(Map<String, dynamic> json) =
      _$OrderAddressImpl.fromJson;

  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String? get middlename;
  @override
  String? get prefix;
  @override
  String? get suffix;
  @override
  String? get company;
  @override
  String get street;
  @override
  String get city;
  @override
  String get region;
  @override
  String get postcode;
  @override
  String get countryId;
  @override
  String? get telephone;
  @override
  String? get fax;
  @override
  String? get vatId;

  /// Create a copy of OrderAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderAddressImplCopyWith<_$OrderAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) {
  return _OrderPayment.fromJson(json);
}

/// @nodoc
mixin _$OrderPayment {
  String get method => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Serializes this OrderPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderPaymentCopyWith<OrderPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentCopyWith<$Res> {
  factory $OrderPaymentCopyWith(
    OrderPayment value,
    $Res Function(OrderPayment) then,
  ) = _$OrderPaymentCopyWithImpl<$Res, OrderPayment>;
  @useResult
  $Res call({
    String method,
    String title,
    double amount,
    String? transactionId,
    Map<String, dynamic>? additionalData,
  });
}

/// @nodoc
class _$OrderPaymentCopyWithImpl<$Res, $Val extends OrderPayment>
    implements $OrderPaymentCopyWith<$Res> {
  _$OrderPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? title = null,
    Object? amount = null,
    Object? transactionId = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(
      _value.copyWith(
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            transactionId: freezed == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            additionalData: freezed == additionalData
                ? _value.additionalData
                : additionalData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderPaymentImplCopyWith<$Res>
    implements $OrderPaymentCopyWith<$Res> {
  factory _$$OrderPaymentImplCopyWith(
    _$OrderPaymentImpl value,
    $Res Function(_$OrderPaymentImpl) then,
  ) = __$$OrderPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String method,
    String title,
    double amount,
    String? transactionId,
    Map<String, dynamic>? additionalData,
  });
}

/// @nodoc
class __$$OrderPaymentImplCopyWithImpl<$Res>
    extends _$OrderPaymentCopyWithImpl<$Res, _$OrderPaymentImpl>
    implements _$$OrderPaymentImplCopyWith<$Res> {
  __$$OrderPaymentImplCopyWithImpl(
    _$OrderPaymentImpl _value,
    $Res Function(_$OrderPaymentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? title = null,
    Object? amount = null,
    Object? transactionId = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(
      _$OrderPaymentImpl(
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        transactionId: freezed == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        additionalData: freezed == additionalData
            ? _value._additionalData
            : additionalData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderPaymentImpl implements _OrderPayment {
  const _$OrderPaymentImpl({
    required this.method,
    required this.title,
    required this.amount,
    this.transactionId,
    final Map<String, dynamic>? additionalData,
  }) : _additionalData = additionalData;

  factory _$OrderPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderPaymentImplFromJson(json);

  @override
  final String method;
  @override
  final String title;
  @override
  final double amount;
  @override
  final String? transactionId;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'OrderPayment(method: $method, title: $title, amount: $amount, transactionId: $transactionId, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderPaymentImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            const DeepCollectionEquality().equals(
              other._additionalData,
              _additionalData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    method,
    title,
    amount,
    transactionId,
    const DeepCollectionEquality().hash(_additionalData),
  );

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderPaymentImplCopyWith<_$OrderPaymentImpl> get copyWith =>
      __$$OrderPaymentImplCopyWithImpl<_$OrderPaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderPaymentImplToJson(this);
  }
}

abstract class _OrderPayment implements OrderPayment {
  const factory _OrderPayment({
    required final String method,
    required final String title,
    required final double amount,
    final String? transactionId,
    final Map<String, dynamic>? additionalData,
  }) = _$OrderPaymentImpl;

  factory _OrderPayment.fromJson(Map<String, dynamic> json) =
      _$OrderPaymentImpl.fromJson;

  @override
  String get method;
  @override
  String get title;
  @override
  double get amount;
  @override
  String? get transactionId;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of OrderPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderPaymentImplCopyWith<_$OrderPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderShipping _$OrderShippingFromJson(Map<String, dynamic> json) {
  return _OrderShipping.fromJson(json);
}

/// @nodoc
mixin _$OrderShipping {
  String get method => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Serializes this OrderShipping to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderShipping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderShippingCopyWith<OrderShipping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderShippingCopyWith<$Res> {
  factory $OrderShippingCopyWith(
    OrderShipping value,
    $Res Function(OrderShipping) then,
  ) = _$OrderShippingCopyWithImpl<$Res, OrderShipping>;
  @useResult
  $Res call({
    String method,
    String title,
    double amount,
    Map<String, dynamic>? additionalData,
  });
}

/// @nodoc
class _$OrderShippingCopyWithImpl<$Res, $Val extends OrderShipping>
    implements $OrderShippingCopyWith<$Res> {
  _$OrderShippingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderShipping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? title = null,
    Object? amount = null,
    Object? additionalData = freezed,
  }) {
    return _then(
      _value.copyWith(
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            additionalData: freezed == additionalData
                ? _value.additionalData
                : additionalData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderShippingImplCopyWith<$Res>
    implements $OrderShippingCopyWith<$Res> {
  factory _$$OrderShippingImplCopyWith(
    _$OrderShippingImpl value,
    $Res Function(_$OrderShippingImpl) then,
  ) = __$$OrderShippingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String method,
    String title,
    double amount,
    Map<String, dynamic>? additionalData,
  });
}

/// @nodoc
class __$$OrderShippingImplCopyWithImpl<$Res>
    extends _$OrderShippingCopyWithImpl<$Res, _$OrderShippingImpl>
    implements _$$OrderShippingImplCopyWith<$Res> {
  __$$OrderShippingImplCopyWithImpl(
    _$OrderShippingImpl _value,
    $Res Function(_$OrderShippingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderShipping
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? title = null,
    Object? amount = null,
    Object? additionalData = freezed,
  }) {
    return _then(
      _$OrderShippingImpl(
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        additionalData: freezed == additionalData
            ? _value._additionalData
            : additionalData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderShippingImpl implements _OrderShipping {
  const _$OrderShippingImpl({
    required this.method,
    required this.title,
    required this.amount,
    final Map<String, dynamic>? additionalData,
  }) : _additionalData = additionalData;

  factory _$OrderShippingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderShippingImplFromJson(json);

  @override
  final String method;
  @override
  final String title;
  @override
  final double amount;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'OrderShipping(method: $method, title: $title, amount: $amount, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderShippingImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(
              other._additionalData,
              _additionalData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    method,
    title,
    amount,
    const DeepCollectionEquality().hash(_additionalData),
  );

  /// Create a copy of OrderShipping
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderShippingImplCopyWith<_$OrderShippingImpl> get copyWith =>
      __$$OrderShippingImplCopyWithImpl<_$OrderShippingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderShippingImplToJson(this);
  }
}

abstract class _OrderShipping implements OrderShipping {
  const factory _OrderShipping({
    required final String method,
    required final String title,
    required final double amount,
    final Map<String, dynamic>? additionalData,
  }) = _$OrderShippingImpl;

  factory _OrderShipping.fromJson(Map<String, dynamic> json) =
      _$OrderShippingImpl.fromJson;

  @override
  String get method;
  @override
  String get title;
  @override
  double get amount;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of OrderShipping
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderShippingImplCopyWith<_$OrderShippingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderComment _$OrderCommentFromJson(Map<String, dynamic> json) {
  return _OrderComment.fromJson(json);
}

/// @nodoc
mixin _$OrderComment {
  String get comment => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool? get isVisibleOnFront => throw _privateConstructorUsedError;

  /// Serializes this OrderComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCommentCopyWith<OrderComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCommentCopyWith<$Res> {
  factory $OrderCommentCopyWith(
    OrderComment value,
    $Res Function(OrderComment) then,
  ) = _$OrderCommentCopyWithImpl<$Res, OrderComment>;
  @useResult
  $Res call({String comment, DateTime createdAt, bool? isVisibleOnFront});
}

/// @nodoc
class _$OrderCommentCopyWithImpl<$Res, $Val extends OrderComment>
    implements $OrderCommentCopyWith<$Res> {
  _$OrderCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? createdAt = null,
    Object? isVisibleOnFront = freezed,
  }) {
    return _then(
      _value.copyWith(
            comment: null == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isVisibleOnFront: freezed == isVisibleOnFront
                ? _value.isVisibleOnFront
                : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderCommentImplCopyWith<$Res>
    implements $OrderCommentCopyWith<$Res> {
  factory _$$OrderCommentImplCopyWith(
    _$OrderCommentImpl value,
    $Res Function(_$OrderCommentImpl) then,
  ) = __$$OrderCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comment, DateTime createdAt, bool? isVisibleOnFront});
}

/// @nodoc
class __$$OrderCommentImplCopyWithImpl<$Res>
    extends _$OrderCommentCopyWithImpl<$Res, _$OrderCommentImpl>
    implements _$$OrderCommentImplCopyWith<$Res> {
  __$$OrderCommentImplCopyWithImpl(
    _$OrderCommentImpl _value,
    $Res Function(_$OrderCommentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? createdAt = null,
    Object? isVisibleOnFront = freezed,
  }) {
    return _then(
      _$OrderCommentImpl(
        comment: null == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isVisibleOnFront: freezed == isVisibleOnFront
            ? _value.isVisibleOnFront
            : isVisibleOnFront // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderCommentImpl implements _OrderComment {
  const _$OrderCommentImpl({
    required this.comment,
    required this.createdAt,
    this.isVisibleOnFront,
  });

  factory _$OrderCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderCommentImplFromJson(json);

  @override
  final String comment;
  @override
  final DateTime createdAt;
  @override
  final bool? isVisibleOnFront;

  @override
  String toString() {
    return 'OrderComment(comment: $comment, createdAt: $createdAt, isVisibleOnFront: $isVisibleOnFront)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderCommentImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isVisibleOnFront, isVisibleOnFront) ||
                other.isVisibleOnFront == isVisibleOnFront));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, comment, createdAt, isVisibleOnFront);

  /// Create a copy of OrderComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderCommentImplCopyWith<_$OrderCommentImpl> get copyWith =>
      __$$OrderCommentImplCopyWithImpl<_$OrderCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderCommentImplToJson(this);
  }
}

abstract class _OrderComment implements OrderComment {
  const factory _OrderComment({
    required final String comment,
    required final DateTime createdAt,
    final bool? isVisibleOnFront,
  }) = _$OrderCommentImpl;

  factory _OrderComment.fromJson(Map<String, dynamic> json) =
      _$OrderCommentImpl.fromJson;

  @override
  String get comment;
  @override
  DateTime get createdAt;
  @override
  bool? get isVisibleOnFront;

  /// Create a copy of OrderComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderCommentImplCopyWith<_$OrderCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
