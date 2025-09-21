// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  String get id => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  double? get shippingAmount => throw _privateConstructorUsedError;
  double? get taxAmount => throw _privateConstructorUsedError;
  double? get discountAmount => throw _privateConstructorUsedError;
  String? get couponCode => throw _privateConstructorUsedError;
  List<CartDiscount>? get discounts => throw _privateConstructorUsedError;
  CartTotals? get totals => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call({
    String id,
    int customerId,
    List<CartItem> items,
    double subtotal,
    double grandTotal,
    double? shippingAmount,
    double? taxAmount,
    double? discountAmount,
    String? couponCode,
    List<CartDiscount>? discounts,
    CartTotals? totals,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $CartTotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? items = null,
    Object? subtotal = null,
    Object? grandTotal = null,
    Object? shippingAmount = freezed,
    Object? taxAmount = freezed,
    Object? discountAmount = freezed,
    Object? couponCode = freezed,
    Object? discounts = freezed,
    Object? totals = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as int,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<CartItem>,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            grandTotal: null == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                      as double,
            shippingAmount: freezed == shippingAmount
                ? _value.shippingAmount
                : shippingAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            taxAmount: freezed == taxAmount
                ? _value.taxAmount
                : taxAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            couponCode: freezed == couponCode
                ? _value.couponCode
                : couponCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            discounts: freezed == discounts
                ? _value.discounts
                : discounts // ignore: cast_nullable_to_non_nullable
                      as List<CartDiscount>?,
            totals: freezed == totals
                ? _value.totals
                : totals // ignore: cast_nullable_to_non_nullable
                      as CartTotals?,
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

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CartTotalsCopyWith<$Res>? get totals {
    if (_value.totals == null) {
      return null;
    }

    return $CartTotalsCopyWith<$Res>(_value.totals!, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
    _$CartImpl value,
    $Res Function(_$CartImpl) then,
  ) = __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int customerId,
    List<CartItem> items,
    double subtotal,
    double grandTotal,
    double? shippingAmount,
    double? taxAmount,
    double? discountAmount,
    String? couponCode,
    List<CartDiscount>? discounts,
    CartTotals? totals,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $CartTotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
    : super(_value, _then);

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? items = null,
    Object? subtotal = null,
    Object? grandTotal = null,
    Object? shippingAmount = freezed,
    Object? taxAmount = freezed,
    Object? discountAmount = freezed,
    Object? couponCode = freezed,
    Object? discounts = freezed,
    Object? totals = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$CartImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as int,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CartItem>,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        grandTotal: null == grandTotal
            ? _value.grandTotal
            : grandTotal // ignore: cast_nullable_to_non_nullable
                  as double,
        shippingAmount: freezed == shippingAmount
            ? _value.shippingAmount
            : shippingAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        taxAmount: freezed == taxAmount
            ? _value.taxAmount
            : taxAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        couponCode: freezed == couponCode
            ? _value.couponCode
            : couponCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        discounts: freezed == discounts
            ? _value._discounts
            : discounts // ignore: cast_nullable_to_non_nullable
                  as List<CartDiscount>?,
        totals: freezed == totals
            ? _value.totals
            : totals // ignore: cast_nullable_to_non_nullable
                  as CartTotals?,
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
class _$CartImpl implements _Cart {
  const _$CartImpl({
    required this.id,
    required this.customerId,
    required final List<CartItem> items,
    required this.subtotal,
    required this.grandTotal,
    this.shippingAmount,
    this.taxAmount,
    this.discountAmount,
    this.couponCode,
    final List<CartDiscount>? discounts,
    this.totals,
    this.createdAt,
    this.updatedAt,
  }) : _items = items,
       _discounts = discounts;

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final String id;
  @override
  final int customerId;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double subtotal;
  @override
  final double grandTotal;
  @override
  final double? shippingAmount;
  @override
  final double? taxAmount;
  @override
  final double? discountAmount;
  @override
  final String? couponCode;
  final List<CartDiscount>? _discounts;
  @override
  List<CartDiscount>? get discounts {
    final value = _discounts;
    if (value == null) return null;
    if (_discounts is EqualUnmodifiableListView) return _discounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CartTotals? totals;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Cart(id: $id, customerId: $customerId, items: $items, subtotal: $subtotal, grandTotal: $grandTotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, couponCode: $couponCode, discounts: $discounts, totals: $totals, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            const DeepCollectionEquality().equals(
              other._discounts,
              _discounts,
            ) &&
            (identical(other.totals, totals) || other.totals == totals) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    customerId,
    const DeepCollectionEquality().hash(_items),
    subtotal,
    grandTotal,
    shippingAmount,
    taxAmount,
    discountAmount,
    couponCode,
    const DeepCollectionEquality().hash(_discounts),
    totals,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(this);
  }
}

abstract class _Cart implements Cart {
  const factory _Cart({
    required final String id,
    required final int customerId,
    required final List<CartItem> items,
    required final double subtotal,
    required final double grandTotal,
    final double? shippingAmount,
    final double? taxAmount,
    final double? discountAmount,
    final String? couponCode,
    final List<CartDiscount>? discounts,
    final CartTotals? totals,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  String get id;
  @override
  int get customerId;
  @override
  List<CartItem> get items;
  @override
  double get subtotal;
  @override
  double get grandTotal;
  @override
  double? get shippingAmount;
  @override
  double? get taxAmount;
  @override
  double? get discountAmount;
  @override
  String? get couponCode;
  @override
  List<CartDiscount>? get discounts;
  @override
  CartTotals? get totals;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Cart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  int get id => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double? get rowTotal => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<CartItemOption>? get options => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({
    int id,
    String sku,
    String name,
    double price,
    int quantity,
    double? rowTotal,
    String? image,
    List<CartItemOption>? options,
    Map<String, dynamic>? customAttributes,
  });
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
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
                      as List<CartItemOption>?,
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
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
    _$CartItemImpl value,
    $Res Function(_$CartItemImpl) then,
  ) = __$$CartItemImplCopyWithImpl<$Res>;
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
    List<CartItemOption>? options,
    Map<String, dynamic>? customAttributes,
  });
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
    _$CartItemImpl _value,
    $Res Function(_$CartItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItem
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
      _$CartItemImpl(
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
                  as List<CartItemOption>?,
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
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl({
    required this.id,
    required this.sku,
    required this.name,
    required this.price,
    required this.quantity,
    this.rowTotal,
    this.image,
    final List<CartItemOption>? options,
    final Map<String, dynamic>? customAttributes,
  }) : _options = options,
       _customAttributes = customAttributes;

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

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
  final List<CartItemOption>? _options;
  @override
  List<CartItemOption>? get options {
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
    return 'CartItem(id: $id, sku: $sku, name: $name, price: $price, quantity: $quantity, rowTotal: $rowTotal, image: $image, options: $options, customAttributes: $customAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
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

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(this);
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem({
    required final int id,
    required final String sku,
    required final String name,
    required final double price,
    required final int quantity,
    final double? rowTotal,
    final String? image,
    final List<CartItemOption>? options,
    final Map<String, dynamic>? customAttributes,
  }) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

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
  List<CartItemOption>? get options;
  @override
  Map<String, dynamic>? get customAttributes;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItemOption _$CartItemOptionFromJson(Map<String, dynamic> json) {
  return _CartItemOption.fromJson(json);
}

/// @nodoc
mixin _$CartItemOption {
  String get code => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get priceType => throw _privateConstructorUsedError;

  /// Serializes this CartItemOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItemOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemOptionCopyWith<CartItemOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemOptionCopyWith<$Res> {
  factory $CartItemOptionCopyWith(
    CartItemOption value,
    $Res Function(CartItemOption) then,
  ) = _$CartItemOptionCopyWithImpl<$Res, CartItemOption>;
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
class _$CartItemOptionCopyWithImpl<$Res, $Val extends CartItemOption>
    implements $CartItemOptionCopyWith<$Res> {
  _$CartItemOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItemOption
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
abstract class _$$CartItemOptionImplCopyWith<$Res>
    implements $CartItemOptionCopyWith<$Res> {
  factory _$$CartItemOptionImplCopyWith(
    _$CartItemOptionImpl value,
    $Res Function(_$CartItemOptionImpl) then,
  ) = __$$CartItemOptionImplCopyWithImpl<$Res>;
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
class __$$CartItemOptionImplCopyWithImpl<$Res>
    extends _$CartItemOptionCopyWithImpl<$Res, _$CartItemOptionImpl>
    implements _$$CartItemOptionImplCopyWith<$Res> {
  __$$CartItemOptionImplCopyWithImpl(
    _$CartItemOptionImpl _value,
    $Res Function(_$CartItemOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartItemOption
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
      _$CartItemOptionImpl(
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
class _$CartItemOptionImpl implements _CartItemOption {
  const _$CartItemOptionImpl({
    required this.code,
    required this.label,
    required this.value,
    this.price,
    this.priceType,
  });

  factory _$CartItemOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemOptionImplFromJson(json);

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
    return 'CartItemOption(code: $code, label: $label, value: $value, price: $price, priceType: $priceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemOptionImpl &&
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

  /// Create a copy of CartItemOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemOptionImplCopyWith<_$CartItemOptionImpl> get copyWith =>
      __$$CartItemOptionImplCopyWithImpl<_$CartItemOptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemOptionImplToJson(this);
  }
}

abstract class _CartItemOption implements CartItemOption {
  const factory _CartItemOption({
    required final String code,
    required final String label,
    required final String value,
    final double? price,
    final String? priceType,
  }) = _$CartItemOptionImpl;

  factory _CartItemOption.fromJson(Map<String, dynamic> json) =
      _$CartItemOptionImpl.fromJson;

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

  /// Create a copy of CartItemOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemOptionImplCopyWith<_$CartItemOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartDiscount _$CartDiscountFromJson(Map<String, dynamic> json) {
  return _CartDiscount.fromJson(json);
}

/// @nodoc
mixin _$CartDiscount {
  String get code => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this CartDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartDiscountCopyWith<CartDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDiscountCopyWith<$Res> {
  factory $CartDiscountCopyWith(
    CartDiscount value,
    $Res Function(CartDiscount) then,
  ) = _$CartDiscountCopyWithImpl<$Res, CartDiscount>;
  @useResult
  $Res call({String code, String label, double amount, String? type});
}

/// @nodoc
class _$CartDiscountCopyWithImpl<$Res, $Val extends CartDiscount>
    implements $CartDiscountCopyWith<$Res> {
  _$CartDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? amount = null,
    Object? type = freezed,
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
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartDiscountImplCopyWith<$Res>
    implements $CartDiscountCopyWith<$Res> {
  factory _$$CartDiscountImplCopyWith(
    _$CartDiscountImpl value,
    $Res Function(_$CartDiscountImpl) then,
  ) = __$$CartDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String label, double amount, String? type});
}

/// @nodoc
class __$$CartDiscountImplCopyWithImpl<$Res>
    extends _$CartDiscountCopyWithImpl<$Res, _$CartDiscountImpl>
    implements _$$CartDiscountImplCopyWith<$Res> {
  __$$CartDiscountImplCopyWithImpl(
    _$CartDiscountImpl _value,
    $Res Function(_$CartDiscountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? label = null,
    Object? amount = null,
    Object? type = freezed,
  }) {
    return _then(
      _$CartDiscountImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartDiscountImpl implements _CartDiscount {
  const _$CartDiscountImpl({
    required this.code,
    required this.label,
    required this.amount,
    this.type,
  });

  factory _$CartDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartDiscountImplFromJson(json);

  @override
  final String code;
  @override
  final String label;
  @override
  final double amount;
  @override
  final String? type;

  @override
  String toString() {
    return 'CartDiscount(code: $code, label: $label, amount: $amount, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDiscountImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, label, amount, type);

  /// Create a copy of CartDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartDiscountImplCopyWith<_$CartDiscountImpl> get copyWith =>
      __$$CartDiscountImplCopyWithImpl<_$CartDiscountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartDiscountImplToJson(this);
  }
}

abstract class _CartDiscount implements CartDiscount {
  const factory _CartDiscount({
    required final String code,
    required final String label,
    required final double amount,
    final String? type,
  }) = _$CartDiscountImpl;

  factory _CartDiscount.fromJson(Map<String, dynamic> json) =
      _$CartDiscountImpl.fromJson;

  @override
  String get code;
  @override
  String get label;
  @override
  double get amount;
  @override
  String? get type;

  /// Create a copy of CartDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartDiscountImplCopyWith<_$CartDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartTotals _$CartTotalsFromJson(Map<String, dynamic> json) {
  return _CartTotals.fromJson(json);
}

/// @nodoc
mixin _$CartTotals {
  double get subtotal => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  double? get shippingAmount => throw _privateConstructorUsedError;
  double? get taxAmount => throw _privateConstructorUsedError;
  double? get discountAmount => throw _privateConstructorUsedError;
  double? get subtotalInclTax => throw _privateConstructorUsedError;
  double? get shippingInclTax => throw _privateConstructorUsedError;
  Map<String, double>? get taxBreakdown => throw _privateConstructorUsedError;

  /// Serializes this CartTotals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartTotalsCopyWith<CartTotals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartTotalsCopyWith<$Res> {
  factory $CartTotalsCopyWith(
    CartTotals value,
    $Res Function(CartTotals) then,
  ) = _$CartTotalsCopyWithImpl<$Res, CartTotals>;
  @useResult
  $Res call({
    double subtotal,
    double grandTotal,
    double? shippingAmount,
    double? taxAmount,
    double? discountAmount,
    double? subtotalInclTax,
    double? shippingInclTax,
    Map<String, double>? taxBreakdown,
  });
}

/// @nodoc
class _$CartTotalsCopyWithImpl<$Res, $Val extends CartTotals>
    implements $CartTotalsCopyWith<$Res> {
  _$CartTotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? grandTotal = null,
    Object? shippingAmount = freezed,
    Object? taxAmount = freezed,
    Object? discountAmount = freezed,
    Object? subtotalInclTax = freezed,
    Object? shippingInclTax = freezed,
    Object? taxBreakdown = freezed,
  }) {
    return _then(
      _value.copyWith(
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            grandTotal: null == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                      as double,
            shippingAmount: freezed == shippingAmount
                ? _value.shippingAmount
                : shippingAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            taxAmount: freezed == taxAmount
                ? _value.taxAmount
                : taxAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            subtotalInclTax: freezed == subtotalInclTax
                ? _value.subtotalInclTax
                : subtotalInclTax // ignore: cast_nullable_to_non_nullable
                      as double?,
            shippingInclTax: freezed == shippingInclTax
                ? _value.shippingInclTax
                : shippingInclTax // ignore: cast_nullable_to_non_nullable
                      as double?,
            taxBreakdown: freezed == taxBreakdown
                ? _value.taxBreakdown
                : taxBreakdown // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CartTotalsImplCopyWith<$Res>
    implements $CartTotalsCopyWith<$Res> {
  factory _$$CartTotalsImplCopyWith(
    _$CartTotalsImpl value,
    $Res Function(_$CartTotalsImpl) then,
  ) = __$$CartTotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double subtotal,
    double grandTotal,
    double? shippingAmount,
    double? taxAmount,
    double? discountAmount,
    double? subtotalInclTax,
    double? shippingInclTax,
    Map<String, double>? taxBreakdown,
  });
}

/// @nodoc
class __$$CartTotalsImplCopyWithImpl<$Res>
    extends _$CartTotalsCopyWithImpl<$Res, _$CartTotalsImpl>
    implements _$$CartTotalsImplCopyWith<$Res> {
  __$$CartTotalsImplCopyWithImpl(
    _$CartTotalsImpl _value,
    $Res Function(_$CartTotalsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? grandTotal = null,
    Object? shippingAmount = freezed,
    Object? taxAmount = freezed,
    Object? discountAmount = freezed,
    Object? subtotalInclTax = freezed,
    Object? shippingInclTax = freezed,
    Object? taxBreakdown = freezed,
  }) {
    return _then(
      _$CartTotalsImpl(
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        grandTotal: null == grandTotal
            ? _value.grandTotal
            : grandTotal // ignore: cast_nullable_to_non_nullable
                  as double,
        shippingAmount: freezed == shippingAmount
            ? _value.shippingAmount
            : shippingAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        taxAmount: freezed == taxAmount
            ? _value.taxAmount
            : taxAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        subtotalInclTax: freezed == subtotalInclTax
            ? _value.subtotalInclTax
            : subtotalInclTax // ignore: cast_nullable_to_non_nullable
                  as double?,
        shippingInclTax: freezed == shippingInclTax
            ? _value.shippingInclTax
            : shippingInclTax // ignore: cast_nullable_to_non_nullable
                  as double?,
        taxBreakdown: freezed == taxBreakdown
            ? _value._taxBreakdown
            : taxBreakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CartTotalsImpl implements _CartTotals {
  const _$CartTotalsImpl({
    required this.subtotal,
    required this.grandTotal,
    this.shippingAmount,
    this.taxAmount,
    this.discountAmount,
    this.subtotalInclTax,
    this.shippingInclTax,
    final Map<String, double>? taxBreakdown,
  }) : _taxBreakdown = taxBreakdown;

  factory _$CartTotalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartTotalsImplFromJson(json);

  @override
  final double subtotal;
  @override
  final double grandTotal;
  @override
  final double? shippingAmount;
  @override
  final double? taxAmount;
  @override
  final double? discountAmount;
  @override
  final double? subtotalInclTax;
  @override
  final double? shippingInclTax;
  final Map<String, double>? _taxBreakdown;
  @override
  Map<String, double>? get taxBreakdown {
    final value = _taxBreakdown;
    if (value == null) return null;
    if (_taxBreakdown is EqualUnmodifiableMapView) return _taxBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CartTotals(subtotal: $subtotal, grandTotal: $grandTotal, shippingAmount: $shippingAmount, taxAmount: $taxAmount, discountAmount: $discountAmount, subtotalInclTax: $subtotalInclTax, shippingInclTax: $shippingInclTax, taxBreakdown: $taxBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartTotalsImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.subtotalInclTax, subtotalInclTax) ||
                other.subtotalInclTax == subtotalInclTax) &&
            (identical(other.shippingInclTax, shippingInclTax) ||
                other.shippingInclTax == shippingInclTax) &&
            const DeepCollectionEquality().equals(
              other._taxBreakdown,
              _taxBreakdown,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    subtotal,
    grandTotal,
    shippingAmount,
    taxAmount,
    discountAmount,
    subtotalInclTax,
    shippingInclTax,
    const DeepCollectionEquality().hash(_taxBreakdown),
  );

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartTotalsImplCopyWith<_$CartTotalsImpl> get copyWith =>
      __$$CartTotalsImplCopyWithImpl<_$CartTotalsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartTotalsImplToJson(this);
  }
}

abstract class _CartTotals implements CartTotals {
  const factory _CartTotals({
    required final double subtotal,
    required final double grandTotal,
    final double? shippingAmount,
    final double? taxAmount,
    final double? discountAmount,
    final double? subtotalInclTax,
    final double? shippingInclTax,
    final Map<String, double>? taxBreakdown,
  }) = _$CartTotalsImpl;

  factory _CartTotals.fromJson(Map<String, dynamic> json) =
      _$CartTotalsImpl.fromJson;

  @override
  double get subtotal;
  @override
  double get grandTotal;
  @override
  double? get shippingAmount;
  @override
  double? get taxAmount;
  @override
  double? get discountAmount;
  @override
  double? get subtotalInclTax;
  @override
  double? get shippingInclTax;
  @override
  Map<String, double>? get taxBreakdown;

  /// Create a copy of CartTotals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartTotalsImplCopyWith<_$CartTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
