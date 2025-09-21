// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckoutSession _$CheckoutSessionFromJson(Map<String, dynamic> json) {
  return _CheckoutSession.fromJson(json);
}

/// @nodoc
mixin _$CheckoutSession {
  String get id => throw _privateConstructorUsedError;
  String get cartId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  Map<String, dynamic>? get shippingAddress =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get billingAddress =>
      throw _privateConstructorUsedError;
  String? get shippingMethod => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CheckoutSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutSessionCopyWith<CheckoutSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutSessionCopyWith<$Res> {
  factory $CheckoutSessionCopyWith(
    CheckoutSession value,
    $Res Function(CheckoutSession) then,
  ) = _$CheckoutSessionCopyWithImpl<$Res, CheckoutSession>;
  @useResult
  $Res call({
    String id,
    String cartId,
    String? email,
    Map<String, dynamic>? shippingAddress,
    Map<String, dynamic>? billingAddress,
    String? shippingMethod,
    String? paymentMethod,
    Map<String, dynamic>? additionalData,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$CheckoutSessionCopyWithImpl<$Res, $Val extends CheckoutSession>
    implements $CheckoutSessionCopyWith<$Res> {
  _$CheckoutSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cartId = null,
    Object? email = freezed,
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? shippingMethod = freezed,
    Object? paymentMethod = freezed,
    Object? additionalData = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            cartId: null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            shippingAddress: freezed == shippingAddress
                ? _value.shippingAddress
                : shippingAddress // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            billingAddress: freezed == billingAddress
                ? _value.billingAddress
                : billingAddress // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            shippingMethod: freezed == shippingMethod
                ? _value.shippingMethod
                : shippingMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentMethod: freezed == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String?,
            additionalData: freezed == additionalData
                ? _value.additionalData
                : additionalData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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
}

/// @nodoc
abstract class _$$CheckoutSessionImplCopyWith<$Res>
    implements $CheckoutSessionCopyWith<$Res> {
  factory _$$CheckoutSessionImplCopyWith(
    _$CheckoutSessionImpl value,
    $Res Function(_$CheckoutSessionImpl) then,
  ) = __$$CheckoutSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String cartId,
    String? email,
    Map<String, dynamic>? shippingAddress,
    Map<String, dynamic>? billingAddress,
    String? shippingMethod,
    String? paymentMethod,
    Map<String, dynamic>? additionalData,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$CheckoutSessionImplCopyWithImpl<$Res>
    extends _$CheckoutSessionCopyWithImpl<$Res, _$CheckoutSessionImpl>
    implements _$$CheckoutSessionImplCopyWith<$Res> {
  __$$CheckoutSessionImplCopyWithImpl(
    _$CheckoutSessionImpl _value,
    $Res Function(_$CheckoutSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cartId = null,
    Object? email = freezed,
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? shippingMethod = freezed,
    Object? paymentMethod = freezed,
    Object? additionalData = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$CheckoutSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        cartId: null == cartId
            ? _value.cartId
            : cartId // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        shippingAddress: freezed == shippingAddress
            ? _value._shippingAddress
            : shippingAddress // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        billingAddress: freezed == billingAddress
            ? _value._billingAddress
            : billingAddress // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        shippingMethod: freezed == shippingMethod
            ? _value.shippingMethod
            : shippingMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentMethod: freezed == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String?,
        additionalData: freezed == additionalData
            ? _value._additionalData
            : additionalData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
class _$CheckoutSessionImpl implements _CheckoutSession {
  const _$CheckoutSessionImpl({
    required this.id,
    required this.cartId,
    this.email,
    final Map<String, dynamic>? shippingAddress,
    final Map<String, dynamic>? billingAddress,
    this.shippingMethod,
    this.paymentMethod,
    final Map<String, dynamic>? additionalData,
    this.createdAt,
    this.updatedAt,
  }) : _shippingAddress = shippingAddress,
       _billingAddress = billingAddress,
       _additionalData = additionalData;

  factory _$CheckoutSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String cartId;
  @override
  final String? email;
  final Map<String, dynamic>? _shippingAddress;
  @override
  Map<String, dynamic>? get shippingAddress {
    final value = _shippingAddress;
    if (value == null) return null;
    if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _billingAddress;
  @override
  Map<String, dynamic>? get billingAddress {
    final value = _billingAddress;
    if (value == null) return null;
    if (_billingAddress is EqualUnmodifiableMapView) return _billingAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? shippingMethod;
  @override
  final String? paymentMethod;
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
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CheckoutSession(id: $id, cartId: $cartId, email: $email, shippingAddress: $shippingAddress, billingAddress: $billingAddress, shippingMethod: $shippingMethod, paymentMethod: $paymentMethod, additionalData: $additionalData, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(
              other._shippingAddress,
              _shippingAddress,
            ) &&
            const DeepCollectionEquality().equals(
              other._billingAddress,
              _billingAddress,
            ) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(
              other._additionalData,
              _additionalData,
            ) &&
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
    cartId,
    email,
    const DeepCollectionEquality().hash(_shippingAddress),
    const DeepCollectionEquality().hash(_billingAddress),
    shippingMethod,
    paymentMethod,
    const DeepCollectionEquality().hash(_additionalData),
    createdAt,
    updatedAt,
  );

  /// Create a copy of CheckoutSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutSessionImplCopyWith<_$CheckoutSessionImpl> get copyWith =>
      __$$CheckoutSessionImplCopyWithImpl<_$CheckoutSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutSessionImplToJson(this);
  }
}

abstract class _CheckoutSession implements CheckoutSession {
  const factory _CheckoutSession({
    required final String id,
    required final String cartId,
    final String? email,
    final Map<String, dynamic>? shippingAddress,
    final Map<String, dynamic>? billingAddress,
    final String? shippingMethod,
    final String? paymentMethod,
    final Map<String, dynamic>? additionalData,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$CheckoutSessionImpl;

  factory _CheckoutSession.fromJson(Map<String, dynamic> json) =
      _$CheckoutSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get cartId;
  @override
  String? get email;
  @override
  Map<String, dynamic>? get shippingAddress;
  @override
  Map<String, dynamic>? get billingAddress;
  @override
  String? get shippingMethod;
  @override
  String? get paymentMethod;
  @override
  Map<String, dynamic>? get additionalData;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of CheckoutSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutSessionImplCopyWith<_$CheckoutSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) {
  return _ShippingMethod.fromJson(json);
}

/// @nodoc
mixin _$ShippingMethod {
  String get code => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get carrierCode => throw _privateConstructorUsedError;
  String? get carrierTitle => throw _privateConstructorUsedError;
  String? get methodCode => throw _privateConstructorUsedError;
  String? get methodTitle => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this ShippingMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShippingMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShippingMethodCopyWith<ShippingMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingMethodCopyWith<$Res> {
  factory $ShippingMethodCopyWith(
    ShippingMethod value,
    $Res Function(ShippingMethod) then,
  ) = _$ShippingMethodCopyWithImpl<$Res, ShippingMethod>;
  @useResult
  $Res call({
    String code,
    String title,
    double amount,
    String currency,
    String? carrierCode,
    String? carrierTitle,
    String? methodCode,
    String? methodTitle,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$ShippingMethodCopyWithImpl<$Res, $Val extends ShippingMethod>
    implements $ShippingMethodCopyWith<$Res> {
  _$ShippingMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShippingMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? amount = null,
    Object? currency = null,
    Object? carrierCode = freezed,
    Object? carrierTitle = freezed,
    Object? methodCode = freezed,
    Object? methodTitle = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            carrierCode: freezed == carrierCode
                ? _value.carrierCode
                : carrierCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            carrierTitle: freezed == carrierTitle
                ? _value.carrierTitle
                : carrierTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            methodCode: freezed == methodCode
                ? _value.methodCode
                : methodCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            methodTitle: freezed == methodTitle
                ? _value.methodTitle
                : methodTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShippingMethodImplCopyWith<$Res>
    implements $ShippingMethodCopyWith<$Res> {
  factory _$$ShippingMethodImplCopyWith(
    _$ShippingMethodImpl value,
    $Res Function(_$ShippingMethodImpl) then,
  ) = __$$ShippingMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String title,
    double amount,
    String currency,
    String? carrierCode,
    String? carrierTitle,
    String? methodCode,
    String? methodTitle,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$ShippingMethodImplCopyWithImpl<$Res>
    extends _$ShippingMethodCopyWithImpl<$Res, _$ShippingMethodImpl>
    implements _$$ShippingMethodImplCopyWith<$Res> {
  __$$ShippingMethodImplCopyWithImpl(
    _$ShippingMethodImpl _value,
    $Res Function(_$ShippingMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShippingMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? amount = null,
    Object? currency = null,
    Object? carrierCode = freezed,
    Object? carrierTitle = freezed,
    Object? methodCode = freezed,
    Object? methodTitle = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$ShippingMethodImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        carrierCode: freezed == carrierCode
            ? _value.carrierCode
            : carrierCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        carrierTitle: freezed == carrierTitle
            ? _value.carrierTitle
            : carrierTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        methodCode: freezed == methodCode
            ? _value.methodCode
            : methodCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        methodTitle: freezed == methodTitle
            ? _value.methodTitle
            : methodTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingMethodImpl implements _ShippingMethod {
  const _$ShippingMethodImpl({
    required this.code,
    required this.title,
    required this.amount,
    required this.currency,
    this.carrierCode,
    this.carrierTitle,
    this.methodCode,
    this.methodTitle,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$ShippingMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingMethodImplFromJson(json);

  @override
  final String code;
  @override
  final String title;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String? carrierCode;
  @override
  final String? carrierTitle;
  @override
  final String? methodCode;
  @override
  final String? methodTitle;
  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ShippingMethod(code: $code, title: $title, amount: $amount, currency: $currency, carrierCode: $carrierCode, carrierTitle: $carrierTitle, methodCode: $methodCode, methodTitle: $methodTitle, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingMethodImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.carrierCode, carrierCode) ||
                other.carrierCode == carrierCode) &&
            (identical(other.carrierTitle, carrierTitle) ||
                other.carrierTitle == carrierTitle) &&
            (identical(other.methodCode, methodCode) ||
                other.methodCode == methodCode) &&
            (identical(other.methodTitle, methodTitle) ||
                other.methodTitle == methodTitle) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    title,
    amount,
    currency,
    carrierCode,
    carrierTitle,
    methodCode,
    methodTitle,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of ShippingMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingMethodImplCopyWith<_$ShippingMethodImpl> get copyWith =>
      __$$ShippingMethodImplCopyWithImpl<_$ShippingMethodImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingMethodImplToJson(this);
  }
}

abstract class _ShippingMethod implements ShippingMethod {
  const factory _ShippingMethod({
    required final String code,
    required final String title,
    required final double amount,
    required final String currency,
    final String? carrierCode,
    final String? carrierTitle,
    final String? methodCode,
    final String? methodTitle,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$ShippingMethodImpl;

  factory _ShippingMethod.fromJson(Map<String, dynamic> json) =
      _$ShippingMethodImpl.fromJson;

  @override
  String get code;
  @override
  String get title;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String? get carrierCode;
  @override
  String? get carrierTitle;
  @override
  String? get methodCode;
  @override
  String? get methodTitle;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of ShippingMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShippingMethodImplCopyWith<_$ShippingMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String get code => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get config => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
    PaymentMethod value,
    $Res Function(PaymentMethod) then,
  ) = _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call({
    String code,
    String title,
    String? description,
    Map<String, dynamic>? config,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? description = freezed,
    Object? config = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            config: freezed == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
    _$PaymentMethodImpl value,
    $Res Function(_$PaymentMethodImpl) then,
  ) = __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String title,
    String? description,
    Map<String, dynamic>? config,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
    _$PaymentMethodImpl _value,
    $Res Function(_$PaymentMethodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? description = freezed,
    Object? config = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$PaymentMethodImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        config: freezed == config
            ? _value._config
            : config // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl({
    required this.code,
    required this.title,
    this.description,
    final Map<String, dynamic>? config,
    final Map<String, dynamic>? extensionAttributes,
  }) : _config = config,
       _extensionAttributes = extensionAttributes;

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String code;
  @override
  final String title;
  @override
  final String? description;
  final Map<String, dynamic>? _config;
  @override
  Map<String, dynamic>? get config {
    final value = _config;
    if (value == null) return null;
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentMethod(code: $code, title: $title, description: $description, config: $config, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    title,
    description,
    const DeepCollectionEquality().hash(_config),
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(this);
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod({
    required final String code,
    required final String title,
    final String? description,
    final Map<String, dynamic>? config,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String get code;
  @override
  String get title;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get config;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of PaymentMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutValidationResult _$CheckoutValidationResultFromJson(
  Map<String, dynamic> json,
) {
  return _CheckoutValidationResult.fromJson(json);
}

/// @nodoc
mixin _$CheckoutValidationResult {
  bool get isValid => throw _privateConstructorUsedError;
  List<String>? get errors => throw _privateConstructorUsedError;
  List<String>? get warnings => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  /// Serializes this CheckoutValidationResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutValidationResultCopyWith<CheckoutValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutValidationResultCopyWith<$Res> {
  factory $CheckoutValidationResultCopyWith(
    CheckoutValidationResult value,
    $Res Function(CheckoutValidationResult) then,
  ) = _$CheckoutValidationResultCopyWithImpl<$Res, CheckoutValidationResult>;
  @useResult
  $Res call({
    bool isValid,
    List<String>? errors,
    List<String>? warnings,
    Map<String, dynamic>? additionalData,
  });
}

/// @nodoc
class _$CheckoutValidationResultCopyWithImpl<
  $Res,
  $Val extends CheckoutValidationResult
>
    implements $CheckoutValidationResultCopyWith<$Res> {
  _$CheckoutValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? errors = freezed,
    Object? warnings = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(
      _value.copyWith(
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            errors: freezed == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            warnings: freezed == warnings
                ? _value.warnings
                : warnings // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
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
abstract class _$$CheckoutValidationResultImplCopyWith<$Res>
    implements $CheckoutValidationResultCopyWith<$Res> {
  factory _$$CheckoutValidationResultImplCopyWith(
    _$CheckoutValidationResultImpl value,
    $Res Function(_$CheckoutValidationResultImpl) then,
  ) = __$$CheckoutValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isValid,
    List<String>? errors,
    List<String>? warnings,
    Map<String, dynamic>? additionalData,
  });
}

/// @nodoc
class __$$CheckoutValidationResultImplCopyWithImpl<$Res>
    extends
        _$CheckoutValidationResultCopyWithImpl<
          $Res,
          _$CheckoutValidationResultImpl
        >
    implements _$$CheckoutValidationResultImplCopyWith<$Res> {
  __$$CheckoutValidationResultImplCopyWithImpl(
    _$CheckoutValidationResultImpl _value,
    $Res Function(_$CheckoutValidationResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? errors = freezed,
    Object? warnings = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(
      _$CheckoutValidationResultImpl(
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        errors: freezed == errors
            ? _value._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        warnings: freezed == warnings
            ? _value._warnings
            : warnings // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
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
class _$CheckoutValidationResultImpl implements _CheckoutValidationResult {
  const _$CheckoutValidationResultImpl({
    required this.isValid,
    final List<String>? errors,
    final List<String>? warnings,
    final Map<String, dynamic>? additionalData,
  }) : _errors = errors,
       _warnings = warnings,
       _additionalData = additionalData;

  factory _$CheckoutValidationResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutValidationResultImplFromJson(json);

  @override
  final bool isValid;
  final List<String>? _errors;
  @override
  List<String>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _warnings;
  @override
  List<String>? get warnings {
    final value = _warnings;
    if (value == null) return null;
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
    return 'CheckoutValidationResult(isValid: $isValid, errors: $errors, warnings: $warnings, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutValidationResultImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings) &&
            const DeepCollectionEquality().equals(
              other._additionalData,
              _additionalData,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isValid,
    const DeepCollectionEquality().hash(_errors),
    const DeepCollectionEquality().hash(_warnings),
    const DeepCollectionEquality().hash(_additionalData),
  );

  /// Create a copy of CheckoutValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutValidationResultImplCopyWith<_$CheckoutValidationResultImpl>
  get copyWith =>
      __$$CheckoutValidationResultImplCopyWithImpl<
        _$CheckoutValidationResultImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutValidationResultImplToJson(this);
  }
}

abstract class _CheckoutValidationResult implements CheckoutValidationResult {
  const factory _CheckoutValidationResult({
    required final bool isValid,
    final List<String>? errors,
    final List<String>? warnings,
    final Map<String, dynamic>? additionalData,
  }) = _$CheckoutValidationResultImpl;

  factory _CheckoutValidationResult.fromJson(Map<String, dynamic> json) =
      _$CheckoutValidationResultImpl.fromJson;

  @override
  bool get isValid;
  @override
  List<String>? get errors;
  @override
  List<String>? get warnings;
  @override
  Map<String, dynamic>? get additionalData;

  /// Create a copy of CheckoutValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutValidationResultImplCopyWith<_$CheckoutValidationResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CheckoutTotals _$CheckoutTotalsFromJson(Map<String, dynamic> json) {
  return _CheckoutTotals.fromJson(json);
}

/// @nodoc
mixin _$CheckoutTotals {
  double get grandTotal => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get subtotalInclTax => throw _privateConstructorUsedError;
  double get shippingAmount => throw _privateConstructorUsedError;
  double get shippingInclTax => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  double get discountAmount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  List<CheckoutTotalItem>? get items => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CheckoutTotals to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutTotalsCopyWith<CheckoutTotals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutTotalsCopyWith<$Res> {
  factory $CheckoutTotalsCopyWith(
    CheckoutTotals value,
    $Res Function(CheckoutTotals) then,
  ) = _$CheckoutTotalsCopyWithImpl<$Res, CheckoutTotals>;
  @useResult
  $Res call({
    double grandTotal,
    double subtotal,
    double subtotalInclTax,
    double shippingAmount,
    double shippingInclTax,
    double taxAmount,
    double discountAmount,
    String currency,
    List<CheckoutTotalItem>? items,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CheckoutTotalsCopyWithImpl<$Res, $Val extends CheckoutTotals>
    implements $CheckoutTotalsCopyWith<$Res> {
  _$CheckoutTotalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grandTotal = null,
    Object? subtotal = null,
    Object? subtotalInclTax = null,
    Object? shippingAmount = null,
    Object? shippingInclTax = null,
    Object? taxAmount = null,
    Object? discountAmount = null,
    Object? currency = null,
    Object? items = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            grandTotal: null == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                      as double,
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            subtotalInclTax: null == subtotalInclTax
                ? _value.subtotalInclTax
                : subtotalInclTax // ignore: cast_nullable_to_non_nullable
                      as double,
            shippingAmount: null == shippingAmount
                ? _value.shippingAmount
                : shippingAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            shippingInclTax: null == shippingInclTax
                ? _value.shippingInclTax
                : shippingInclTax // ignore: cast_nullable_to_non_nullable
                      as double,
            taxAmount: null == taxAmount
                ? _value.taxAmount
                : taxAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            discountAmount: null == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            items: freezed == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<CheckoutTotalItem>?,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutTotalsImplCopyWith<$Res>
    implements $CheckoutTotalsCopyWith<$Res> {
  factory _$$CheckoutTotalsImplCopyWith(
    _$CheckoutTotalsImpl value,
    $Res Function(_$CheckoutTotalsImpl) then,
  ) = __$$CheckoutTotalsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double grandTotal,
    double subtotal,
    double subtotalInclTax,
    double shippingAmount,
    double shippingInclTax,
    double taxAmount,
    double discountAmount,
    String currency,
    List<CheckoutTotalItem>? items,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CheckoutTotalsImplCopyWithImpl<$Res>
    extends _$CheckoutTotalsCopyWithImpl<$Res, _$CheckoutTotalsImpl>
    implements _$$CheckoutTotalsImplCopyWith<$Res> {
  __$$CheckoutTotalsImplCopyWithImpl(
    _$CheckoutTotalsImpl _value,
    $Res Function(_$CheckoutTotalsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutTotals
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grandTotal = null,
    Object? subtotal = null,
    Object? subtotalInclTax = null,
    Object? shippingAmount = null,
    Object? shippingInclTax = null,
    Object? taxAmount = null,
    Object? discountAmount = null,
    Object? currency = null,
    Object? items = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CheckoutTotalsImpl(
        grandTotal: null == grandTotal
            ? _value.grandTotal
            : grandTotal // ignore: cast_nullable_to_non_nullable
                  as double,
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        subtotalInclTax: null == subtotalInclTax
            ? _value.subtotalInclTax
            : subtotalInclTax // ignore: cast_nullable_to_non_nullable
                  as double,
        shippingAmount: null == shippingAmount
            ? _value.shippingAmount
            : shippingAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        shippingInclTax: null == shippingInclTax
            ? _value.shippingInclTax
            : shippingInclTax // ignore: cast_nullable_to_non_nullable
                  as double,
        taxAmount: null == taxAmount
            ? _value.taxAmount
            : taxAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        discountAmount: null == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        items: freezed == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CheckoutTotalItem>?,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutTotalsImpl implements _CheckoutTotals {
  const _$CheckoutTotalsImpl({
    required this.grandTotal,
    required this.subtotal,
    required this.subtotalInclTax,
    required this.shippingAmount,
    required this.shippingInclTax,
    required this.taxAmount,
    required this.discountAmount,
    required this.currency,
    final List<CheckoutTotalItem>? items,
    final Map<String, dynamic>? extensionAttributes,
  }) : _items = items,
       _extensionAttributes = extensionAttributes;

  factory _$CheckoutTotalsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutTotalsImplFromJson(json);

  @override
  final double grandTotal;
  @override
  final double subtotal;
  @override
  final double subtotalInclTax;
  @override
  final double shippingAmount;
  @override
  final double shippingInclTax;
  @override
  final double taxAmount;
  @override
  final double discountAmount;
  @override
  final String currency;
  final List<CheckoutTotalItem>? _items;
  @override
  List<CheckoutTotalItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CheckoutTotals(grandTotal: $grandTotal, subtotal: $subtotal, subtotalInclTax: $subtotalInclTax, shippingAmount: $shippingAmount, shippingInclTax: $shippingInclTax, taxAmount: $taxAmount, discountAmount: $discountAmount, currency: $currency, items: $items, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutTotalsImpl &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.subtotalInclTax, subtotalInclTax) ||
                other.subtotalInclTax == subtotalInclTax) &&
            (identical(other.shippingAmount, shippingAmount) ||
                other.shippingAmount == shippingAmount) &&
            (identical(other.shippingInclTax, shippingInclTax) ||
                other.shippingInclTax == shippingInclTax) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    grandTotal,
    subtotal,
    subtotalInclTax,
    shippingAmount,
    shippingInclTax,
    taxAmount,
    discountAmount,
    currency,
    const DeepCollectionEquality().hash(_items),
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CheckoutTotals
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutTotalsImplCopyWith<_$CheckoutTotalsImpl> get copyWith =>
      __$$CheckoutTotalsImplCopyWithImpl<_$CheckoutTotalsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutTotalsImplToJson(this);
  }
}

abstract class _CheckoutTotals implements CheckoutTotals {
  const factory _CheckoutTotals({
    required final double grandTotal,
    required final double subtotal,
    required final double subtotalInclTax,
    required final double shippingAmount,
    required final double shippingInclTax,
    required final double taxAmount,
    required final double discountAmount,
    required final String currency,
    final List<CheckoutTotalItem>? items,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CheckoutTotalsImpl;

  factory _CheckoutTotals.fromJson(Map<String, dynamic> json) =
      _$CheckoutTotalsImpl.fromJson;

  @override
  double get grandTotal;
  @override
  double get subtotal;
  @override
  double get subtotalInclTax;
  @override
  double get shippingAmount;
  @override
  double get shippingInclTax;
  @override
  double get taxAmount;
  @override
  double get discountAmount;
  @override
  String get currency;
  @override
  List<CheckoutTotalItem>? get items;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CheckoutTotals
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutTotalsImplCopyWith<_$CheckoutTotalsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutTotalItem _$CheckoutTotalItemFromJson(Map<String, dynamic> json) {
  return _CheckoutTotalItem.fromJson(json);
}

/// @nodoc
mixin _$CheckoutTotalItem {
  String get code => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CheckoutTotalItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutTotalItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutTotalItemCopyWith<CheckoutTotalItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutTotalItemCopyWith<$Res> {
  factory $CheckoutTotalItemCopyWith(
    CheckoutTotalItem value,
    $Res Function(CheckoutTotalItem) then,
  ) = _$CheckoutTotalItemCopyWithImpl<$Res, CheckoutTotalItem>;
  @useResult
  $Res call({
    String code,
    String title,
    double value,
    String currency,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CheckoutTotalItemCopyWithImpl<$Res, $Val extends CheckoutTotalItem>
    implements $CheckoutTotalItemCopyWith<$Res> {
  _$CheckoutTotalItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutTotalItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? value = null,
    Object? currency = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutTotalItemImplCopyWith<$Res>
    implements $CheckoutTotalItemCopyWith<$Res> {
  factory _$$CheckoutTotalItemImplCopyWith(
    _$CheckoutTotalItemImpl value,
    $Res Function(_$CheckoutTotalItemImpl) then,
  ) = __$$CheckoutTotalItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String code,
    String title,
    double value,
    String currency,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CheckoutTotalItemImplCopyWithImpl<$Res>
    extends _$CheckoutTotalItemCopyWithImpl<$Res, _$CheckoutTotalItemImpl>
    implements _$$CheckoutTotalItemImplCopyWith<$Res> {
  __$$CheckoutTotalItemImplCopyWithImpl(
    _$CheckoutTotalItemImpl _value,
    $Res Function(_$CheckoutTotalItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutTotalItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? value = null,
    Object? currency = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CheckoutTotalItemImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutTotalItemImpl implements _CheckoutTotalItem {
  const _$CheckoutTotalItemImpl({
    required this.code,
    required this.title,
    required this.value,
    required this.currency,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CheckoutTotalItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutTotalItemImplFromJson(json);

  @override
  final String code;
  @override
  final String title;
  @override
  final double value;
  @override
  final String currency;
  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CheckoutTotalItem(code: $code, title: $title, value: $value, currency: $currency, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutTotalItemImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    title,
    value,
    currency,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CheckoutTotalItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutTotalItemImplCopyWith<_$CheckoutTotalItemImpl> get copyWith =>
      __$$CheckoutTotalItemImplCopyWithImpl<_$CheckoutTotalItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutTotalItemImplToJson(this);
  }
}

abstract class _CheckoutTotalItem implements CheckoutTotalItem {
  const factory _CheckoutTotalItem({
    required final String code,
    required final String title,
    required final double value,
    required final String currency,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CheckoutTotalItemImpl;

  factory _CheckoutTotalItem.fromJson(Map<String, dynamic> json) =
      _$CheckoutTotalItemImpl.fromJson;

  @override
  String get code;
  @override
  String get title;
  @override
  double get value;
  @override
  String get currency;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CheckoutTotalItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutTotalItemImplCopyWith<_$CheckoutTotalItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GuestCheckoutInfo _$GuestCheckoutInfoFromJson(Map<String, dynamic> json) {
  return _GuestCheckoutInfo.fromJson(json);
}

/// @nodoc
mixin _$GuestCheckoutInfo {
  String get cartId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  Map<String, dynamic>? get shippingAddress =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get billingAddress =>
      throw _privateConstructorUsedError;
  List<ShippingMethod>? get availableShippingMethods =>
      throw _privateConstructorUsedError;
  List<PaymentMethod>? get availablePaymentMethods =>
      throw _privateConstructorUsedError;
  CheckoutTotals? get totals => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this GuestCheckoutInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuestCheckoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestCheckoutInfoCopyWith<GuestCheckoutInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCheckoutInfoCopyWith<$Res> {
  factory $GuestCheckoutInfoCopyWith(
    GuestCheckoutInfo value,
    $Res Function(GuestCheckoutInfo) then,
  ) = _$GuestCheckoutInfoCopyWithImpl<$Res, GuestCheckoutInfo>;
  @useResult
  $Res call({
    String cartId,
    String? email,
    Map<String, dynamic>? shippingAddress,
    Map<String, dynamic>? billingAddress,
    List<ShippingMethod>? availableShippingMethods,
    List<PaymentMethod>? availablePaymentMethods,
    CheckoutTotals? totals,
    Map<String, dynamic>? extensionAttributes,
  });

  $CheckoutTotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class _$GuestCheckoutInfoCopyWithImpl<$Res, $Val extends GuestCheckoutInfo>
    implements $GuestCheckoutInfoCopyWith<$Res> {
  _$GuestCheckoutInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuestCheckoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? email = freezed,
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? availableShippingMethods = freezed,
    Object? availablePaymentMethods = freezed,
    Object? totals = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            cartId: null == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            shippingAddress: freezed == shippingAddress
                ? _value.shippingAddress
                : shippingAddress // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            billingAddress: freezed == billingAddress
                ? _value.billingAddress
                : billingAddress // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            availableShippingMethods: freezed == availableShippingMethods
                ? _value.availableShippingMethods
                : availableShippingMethods // ignore: cast_nullable_to_non_nullable
                      as List<ShippingMethod>?,
            availablePaymentMethods: freezed == availablePaymentMethods
                ? _value.availablePaymentMethods
                : availablePaymentMethods // ignore: cast_nullable_to_non_nullable
                      as List<PaymentMethod>?,
            totals: freezed == totals
                ? _value.totals
                : totals // ignore: cast_nullable_to_non_nullable
                      as CheckoutTotals?,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of GuestCheckoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutTotalsCopyWith<$Res>? get totals {
    if (_value.totals == null) {
      return null;
    }

    return $CheckoutTotalsCopyWith<$Res>(_value.totals!, (value) {
      return _then(_value.copyWith(totals: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GuestCheckoutInfoImplCopyWith<$Res>
    implements $GuestCheckoutInfoCopyWith<$Res> {
  factory _$$GuestCheckoutInfoImplCopyWith(
    _$GuestCheckoutInfoImpl value,
    $Res Function(_$GuestCheckoutInfoImpl) then,
  ) = __$$GuestCheckoutInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String cartId,
    String? email,
    Map<String, dynamic>? shippingAddress,
    Map<String, dynamic>? billingAddress,
    List<ShippingMethod>? availableShippingMethods,
    List<PaymentMethod>? availablePaymentMethods,
    CheckoutTotals? totals,
    Map<String, dynamic>? extensionAttributes,
  });

  @override
  $CheckoutTotalsCopyWith<$Res>? get totals;
}

/// @nodoc
class __$$GuestCheckoutInfoImplCopyWithImpl<$Res>
    extends _$GuestCheckoutInfoCopyWithImpl<$Res, _$GuestCheckoutInfoImpl>
    implements _$$GuestCheckoutInfoImplCopyWith<$Res> {
  __$$GuestCheckoutInfoImplCopyWithImpl(
    _$GuestCheckoutInfoImpl _value,
    $Res Function(_$GuestCheckoutInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuestCheckoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = null,
    Object? email = freezed,
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? availableShippingMethods = freezed,
    Object? availablePaymentMethods = freezed,
    Object? totals = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$GuestCheckoutInfoImpl(
        cartId: null == cartId
            ? _value.cartId
            : cartId // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        shippingAddress: freezed == shippingAddress
            ? _value._shippingAddress
            : shippingAddress // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        billingAddress: freezed == billingAddress
            ? _value._billingAddress
            : billingAddress // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        availableShippingMethods: freezed == availableShippingMethods
            ? _value._availableShippingMethods
            : availableShippingMethods // ignore: cast_nullable_to_non_nullable
                  as List<ShippingMethod>?,
        availablePaymentMethods: freezed == availablePaymentMethods
            ? _value._availablePaymentMethods
            : availablePaymentMethods // ignore: cast_nullable_to_non_nullable
                  as List<PaymentMethod>?,
        totals: freezed == totals
            ? _value.totals
            : totals // ignore: cast_nullable_to_non_nullable
                  as CheckoutTotals?,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuestCheckoutInfoImpl implements _GuestCheckoutInfo {
  const _$GuestCheckoutInfoImpl({
    required this.cartId,
    this.email,
    final Map<String, dynamic>? shippingAddress,
    final Map<String, dynamic>? billingAddress,
    final List<ShippingMethod>? availableShippingMethods,
    final List<PaymentMethod>? availablePaymentMethods,
    this.totals,
    final Map<String, dynamic>? extensionAttributes,
  }) : _shippingAddress = shippingAddress,
       _billingAddress = billingAddress,
       _availableShippingMethods = availableShippingMethods,
       _availablePaymentMethods = availablePaymentMethods,
       _extensionAttributes = extensionAttributes;

  factory _$GuestCheckoutInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuestCheckoutInfoImplFromJson(json);

  @override
  final String cartId;
  @override
  final String? email;
  final Map<String, dynamic>? _shippingAddress;
  @override
  Map<String, dynamic>? get shippingAddress {
    final value = _shippingAddress;
    if (value == null) return null;
    if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _billingAddress;
  @override
  Map<String, dynamic>? get billingAddress {
    final value = _billingAddress;
    if (value == null) return null;
    if (_billingAddress is EqualUnmodifiableMapView) return _billingAddress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<ShippingMethod>? _availableShippingMethods;
  @override
  List<ShippingMethod>? get availableShippingMethods {
    final value = _availableShippingMethods;
    if (value == null) return null;
    if (_availableShippingMethods is EqualUnmodifiableListView)
      return _availableShippingMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentMethod>? _availablePaymentMethods;
  @override
  List<PaymentMethod>? get availablePaymentMethods {
    final value = _availablePaymentMethods;
    if (value == null) return null;
    if (_availablePaymentMethods is EqualUnmodifiableListView)
      return _availablePaymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CheckoutTotals? totals;
  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GuestCheckoutInfo(cartId: $cartId, email: $email, shippingAddress: $shippingAddress, billingAddress: $billingAddress, availableShippingMethods: $availableShippingMethods, availablePaymentMethods: $availablePaymentMethods, totals: $totals, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestCheckoutInfoImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(
              other._shippingAddress,
              _shippingAddress,
            ) &&
            const DeepCollectionEquality().equals(
              other._billingAddress,
              _billingAddress,
            ) &&
            const DeepCollectionEquality().equals(
              other._availableShippingMethods,
              _availableShippingMethods,
            ) &&
            const DeepCollectionEquality().equals(
              other._availablePaymentMethods,
              _availablePaymentMethods,
            ) &&
            (identical(other.totals, totals) || other.totals == totals) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cartId,
    email,
    const DeepCollectionEquality().hash(_shippingAddress),
    const DeepCollectionEquality().hash(_billingAddress),
    const DeepCollectionEquality().hash(_availableShippingMethods),
    const DeepCollectionEquality().hash(_availablePaymentMethods),
    totals,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of GuestCheckoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestCheckoutInfoImplCopyWith<_$GuestCheckoutInfoImpl> get copyWith =>
      __$$GuestCheckoutInfoImplCopyWithImpl<_$GuestCheckoutInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GuestCheckoutInfoImplToJson(this);
  }
}

abstract class _GuestCheckoutInfo implements GuestCheckoutInfo {
  const factory _GuestCheckoutInfo({
    required final String cartId,
    final String? email,
    final Map<String, dynamic>? shippingAddress,
    final Map<String, dynamic>? billingAddress,
    final List<ShippingMethod>? availableShippingMethods,
    final List<PaymentMethod>? availablePaymentMethods,
    final CheckoutTotals? totals,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$GuestCheckoutInfoImpl;

  factory _GuestCheckoutInfo.fromJson(Map<String, dynamic> json) =
      _$GuestCheckoutInfoImpl.fromJson;

  @override
  String get cartId;
  @override
  String? get email;
  @override
  Map<String, dynamic>? get shippingAddress;
  @override
  Map<String, dynamic>? get billingAddress;
  @override
  List<ShippingMethod>? get availableShippingMethods;
  @override
  List<PaymentMethod>? get availablePaymentMethods;
  @override
  CheckoutTotals? get totals;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of GuestCheckoutInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestCheckoutInfoImplCopyWith<_$GuestCheckoutInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutAddress _$CheckoutAddressFromJson(Map<String, dynamic> json) {
  return _CheckoutAddress.fromJson(json);
}

/// @nodoc
mixin _$CheckoutAddress {
  String? get id => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get customerAddressId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  List<String>? get street => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get regionId => throw _privateConstructorUsedError;
  String? get regionCode => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  String? get countryId => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  String? get fax => throw _privateConstructorUsedError;
  bool? get sameAsBilling => throw _privateConstructorUsedError;
  bool? get saveInAddressBook => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customAttributes =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CheckoutAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutAddressCopyWith<CheckoutAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutAddressCopyWith<$Res> {
  factory $CheckoutAddressCopyWith(
    CheckoutAddress value,
    $Res Function(CheckoutAddress) then,
  ) = _$CheckoutAddressCopyWithImpl<$Res, CheckoutAddress>;
  @useResult
  $Res call({
    String? id,
    String? customerId,
    String? customerAddressId,
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
    String? prefix,
    String? suffix,
    String? company,
    List<String>? street,
    String? city,
    String? region,
    String? regionId,
    String? regionCode,
    String? postcode,
    String? countryId,
    String? telephone,
    String? fax,
    bool? sameAsBilling,
    bool? saveInAddressBook,
    Map<String, dynamic>? customAttributes,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CheckoutAddressCopyWithImpl<$Res, $Val extends CheckoutAddress>
    implements $CheckoutAddressCopyWith<$Res> {
  _$CheckoutAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? customerAddressId = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? company = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? telephone = freezed,
    Object? fax = freezed,
    Object? sameAsBilling = freezed,
    Object? saveInAddressBook = freezed,
    Object? customAttributes = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerId: freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerAddressId: freezed == customerAddressId
                ? _value.customerAddressId
                : customerAddressId // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstName: freezed == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            middleName: freezed == middleName
                ? _value.middleName
                : middleName // ignore: cast_nullable_to_non_nullable
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
            street: freezed == street
                ? _value.street
                : street // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            regionId: freezed == regionId
                ? _value.regionId
                : regionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            regionCode: freezed == regionCode
                ? _value.regionCode
                : regionCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            postcode: freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                      as String?,
            countryId: freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            telephone: freezed == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                      as String?,
            fax: freezed == fax
                ? _value.fax
                : fax // ignore: cast_nullable_to_non_nullable
                      as String?,
            sameAsBilling: freezed == sameAsBilling
                ? _value.sameAsBilling
                : sameAsBilling // ignore: cast_nullable_to_non_nullable
                      as bool?,
            saveInAddressBook: freezed == saveInAddressBook
                ? _value.saveInAddressBook
                : saveInAddressBook // ignore: cast_nullable_to_non_nullable
                      as bool?,
            customAttributes: freezed == customAttributes
                ? _value.customAttributes
                : customAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutAddressImplCopyWith<$Res>
    implements $CheckoutAddressCopyWith<$Res> {
  factory _$$CheckoutAddressImplCopyWith(
    _$CheckoutAddressImpl value,
    $Res Function(_$CheckoutAddressImpl) then,
  ) = __$$CheckoutAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    String? customerId,
    String? customerAddressId,
    String? email,
    String? firstName,
    String? lastName,
    String? middleName,
    String? prefix,
    String? suffix,
    String? company,
    List<String>? street,
    String? city,
    String? region,
    String? regionId,
    String? regionCode,
    String? postcode,
    String? countryId,
    String? telephone,
    String? fax,
    bool? sameAsBilling,
    bool? saveInAddressBook,
    Map<String, dynamic>? customAttributes,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CheckoutAddressImplCopyWithImpl<$Res>
    extends _$CheckoutAddressCopyWithImpl<$Res, _$CheckoutAddressImpl>
    implements _$$CheckoutAddressImplCopyWith<$Res> {
  __$$CheckoutAddressImplCopyWithImpl(
    _$CheckoutAddressImpl _value,
    $Res Function(_$CheckoutAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? customerAddressId = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? company = freezed,
    Object? street = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? postcode = freezed,
    Object? countryId = freezed,
    Object? telephone = freezed,
    Object? fax = freezed,
    Object? sameAsBilling = freezed,
    Object? saveInAddressBook = freezed,
    Object? customAttributes = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CheckoutAddressImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerId: freezed == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerAddressId: freezed == customerAddressId
            ? _value.customerAddressId
            : customerAddressId // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: freezed == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        middleName: freezed == middleName
            ? _value.middleName
            : middleName // ignore: cast_nullable_to_non_nullable
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
        street: freezed == street
            ? _value._street
            : street // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        regionId: freezed == regionId
            ? _value.regionId
            : regionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        regionCode: freezed == regionCode
            ? _value.regionCode
            : regionCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        postcode: freezed == postcode
            ? _value.postcode
            : postcode // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryId: freezed == countryId
            ? _value.countryId
            : countryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        telephone: freezed == telephone
            ? _value.telephone
            : telephone // ignore: cast_nullable_to_non_nullable
                  as String?,
        fax: freezed == fax
            ? _value.fax
            : fax // ignore: cast_nullable_to_non_nullable
                  as String?,
        sameAsBilling: freezed == sameAsBilling
            ? _value.sameAsBilling
            : sameAsBilling // ignore: cast_nullable_to_non_nullable
                  as bool?,
        saveInAddressBook: freezed == saveInAddressBook
            ? _value.saveInAddressBook
            : saveInAddressBook // ignore: cast_nullable_to_non_nullable
                  as bool?,
        customAttributes: freezed == customAttributes
            ? _value._customAttributes
            : customAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutAddressImpl implements _CheckoutAddress {
  const _$CheckoutAddressImpl({
    this.id,
    this.customerId,
    this.customerAddressId,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.prefix,
    this.suffix,
    this.company,
    final List<String>? street,
    this.city,
    this.region,
    this.regionId,
    this.regionCode,
    this.postcode,
    this.countryId,
    this.telephone,
    this.fax,
    this.sameAsBilling,
    this.saveInAddressBook,
    final Map<String, dynamic>? customAttributes,
    final Map<String, dynamic>? extensionAttributes,
  }) : _street = street,
       _customAttributes = customAttributes,
       _extensionAttributes = extensionAttributes;

  factory _$CheckoutAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutAddressImplFromJson(json);

  @override
  final String? id;
  @override
  final String? customerId;
  @override
  final String? customerAddressId;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? middleName;
  @override
  final String? prefix;
  @override
  final String? suffix;
  @override
  final String? company;
  final List<String>? _street;
  @override
  List<String>? get street {
    final value = _street;
    if (value == null) return null;
    if (_street is EqualUnmodifiableListView) return _street;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? regionId;
  @override
  final String? regionCode;
  @override
  final String? postcode;
  @override
  final String? countryId;
  @override
  final String? telephone;
  @override
  final String? fax;
  @override
  final bool? sameAsBilling;
  @override
  final bool? saveInAddressBook;
  final Map<String, dynamic>? _customAttributes;
  @override
  Map<String, dynamic>? get customAttributes {
    final value = _customAttributes;
    if (value == null) return null;
    if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CheckoutAddress(id: $id, customerId: $customerId, customerAddressId: $customerAddressId, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, regionCode: $regionCode, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, sameAsBilling: $sameAsBilling, saveInAddressBook: $saveInAddressBook, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerAddressId, customerAddressId) ||
                other.customerAddressId == customerAddressId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.company, company) || other.company == company) &&
            const DeepCollectionEquality().equals(other._street, _street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.sameAsBilling, sameAsBilling) ||
                other.sameAsBilling == sameAsBilling) &&
            (identical(other.saveInAddressBook, saveInAddressBook) ||
                other.saveInAddressBook == saveInAddressBook) &&
            const DeepCollectionEquality().equals(
              other._customAttributes,
              _customAttributes,
            ) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    customerId,
    customerAddressId,
    email,
    firstName,
    lastName,
    middleName,
    prefix,
    suffix,
    company,
    const DeepCollectionEquality().hash(_street),
    city,
    region,
    regionId,
    regionCode,
    postcode,
    countryId,
    telephone,
    fax,
    sameAsBilling,
    saveInAddressBook,
    const DeepCollectionEquality().hash(_customAttributes),
    const DeepCollectionEquality().hash(_extensionAttributes),
  ]);

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutAddressImplCopyWith<_$CheckoutAddressImpl> get copyWith =>
      __$$CheckoutAddressImplCopyWithImpl<_$CheckoutAddressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutAddressImplToJson(this);
  }
}

abstract class _CheckoutAddress implements CheckoutAddress {
  const factory _CheckoutAddress({
    final String? id,
    final String? customerId,
    final String? customerAddressId,
    final String? email,
    final String? firstName,
    final String? lastName,
    final String? middleName,
    final String? prefix,
    final String? suffix,
    final String? company,
    final List<String>? street,
    final String? city,
    final String? region,
    final String? regionId,
    final String? regionCode,
    final String? postcode,
    final String? countryId,
    final String? telephone,
    final String? fax,
    final bool? sameAsBilling,
    final bool? saveInAddressBook,
    final Map<String, dynamic>? customAttributes,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CheckoutAddressImpl;

  factory _CheckoutAddress.fromJson(Map<String, dynamic> json) =
      _$CheckoutAddressImpl.fromJson;

  @override
  String? get id;
  @override
  String? get customerId;
  @override
  String? get customerAddressId;
  @override
  String? get email;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get middleName;
  @override
  String? get prefix;
  @override
  String? get suffix;
  @override
  String? get company;
  @override
  List<String>? get street;
  @override
  String? get city;
  @override
  String? get region;
  @override
  String? get regionId;
  @override
  String? get regionCode;
  @override
  String? get postcode;
  @override
  String? get countryId;
  @override
  String? get telephone;
  @override
  String? get fax;
  @override
  bool? get sameAsBilling;
  @override
  bool? get saveInAddressBook;
  @override
  Map<String, dynamic>? get customAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CheckoutAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutAddressImplCopyWith<_$CheckoutAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutPaymentInfo _$CheckoutPaymentInfoFromJson(Map<String, dynamic> json) {
  return _CheckoutPaymentInfo.fromJson(json);
}

/// @nodoc
mixin _$CheckoutPaymentInfo {
  String get method => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CheckoutPaymentInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutPaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutPaymentInfoCopyWith<CheckoutPaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutPaymentInfoCopyWith<$Res> {
  factory $CheckoutPaymentInfoCopyWith(
    CheckoutPaymentInfo value,
    $Res Function(CheckoutPaymentInfo) then,
  ) = _$CheckoutPaymentInfoCopyWithImpl<$Res, CheckoutPaymentInfo>;
  @useResult
  $Res call({
    String method,
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CheckoutPaymentInfoCopyWithImpl<$Res, $Val extends CheckoutPaymentInfo>
    implements $CheckoutPaymentInfoCopyWith<$Res> {
  _$CheckoutPaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutPaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? additionalData = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as String,
            additionalData: freezed == additionalData
                ? _value.additionalData
                : additionalData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutPaymentInfoImplCopyWith<$Res>
    implements $CheckoutPaymentInfoCopyWith<$Res> {
  factory _$$CheckoutPaymentInfoImplCopyWith(
    _$CheckoutPaymentInfoImpl value,
    $Res Function(_$CheckoutPaymentInfoImpl) then,
  ) = __$$CheckoutPaymentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String method,
    Map<String, dynamic>? additionalData,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CheckoutPaymentInfoImplCopyWithImpl<$Res>
    extends _$CheckoutPaymentInfoCopyWithImpl<$Res, _$CheckoutPaymentInfoImpl>
    implements _$$CheckoutPaymentInfoImplCopyWith<$Res> {
  __$$CheckoutPaymentInfoImplCopyWithImpl(
    _$CheckoutPaymentInfoImpl _value,
    $Res Function(_$CheckoutPaymentInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutPaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? additionalData = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CheckoutPaymentInfoImpl(
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as String,
        additionalData: freezed == additionalData
            ? _value._additionalData
            : additionalData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutPaymentInfoImpl implements _CheckoutPaymentInfo {
  const _$CheckoutPaymentInfoImpl({
    required this.method,
    final Map<String, dynamic>? additionalData,
    final Map<String, dynamic>? extensionAttributes,
  }) : _additionalData = additionalData,
       _extensionAttributes = extensionAttributes;

  factory _$CheckoutPaymentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutPaymentInfoImplFromJson(json);

  @override
  final String method;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CheckoutPaymentInfo(method: $method, additionalData: $additionalData, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutPaymentInfoImpl &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(
              other._additionalData,
              _additionalData,
            ) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    method,
    const DeepCollectionEquality().hash(_additionalData),
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CheckoutPaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutPaymentInfoImplCopyWith<_$CheckoutPaymentInfoImpl> get copyWith =>
      __$$CheckoutPaymentInfoImplCopyWithImpl<_$CheckoutPaymentInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutPaymentInfoImplToJson(this);
  }
}

abstract class _CheckoutPaymentInfo implements CheckoutPaymentInfo {
  const factory _CheckoutPaymentInfo({
    required final String method,
    final Map<String, dynamic>? additionalData,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CheckoutPaymentInfoImpl;

  factory _CheckoutPaymentInfo.fromJson(Map<String, dynamic> json) =
      _$CheckoutPaymentInfoImpl.fromJson;

  @override
  String get method;
  @override
  Map<String, dynamic>? get additionalData;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CheckoutPaymentInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutPaymentInfoImplCopyWith<_$CheckoutPaymentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckoutShippingInfo _$CheckoutShippingInfoFromJson(Map<String, dynamic> json) {
  return _CheckoutShippingInfo.fromJson(json);
}

/// @nodoc
mixin _$CheckoutShippingInfo {
  String get method => throw _privateConstructorUsedError;
  CheckoutAddress? get address => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CheckoutShippingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutShippingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutShippingInfoCopyWith<CheckoutShippingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutShippingInfoCopyWith<$Res> {
  factory $CheckoutShippingInfoCopyWith(
    CheckoutShippingInfo value,
    $Res Function(CheckoutShippingInfo) then,
  ) = _$CheckoutShippingInfoCopyWithImpl<$Res, CheckoutShippingInfo>;
  @useResult
  $Res call({
    String method,
    CheckoutAddress? address,
    Map<String, dynamic>? extensionAttributes,
  });

  $CheckoutAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$CheckoutShippingInfoCopyWithImpl<
  $Res,
  $Val extends CheckoutShippingInfo
>
    implements $CheckoutShippingInfoCopyWith<$Res> {
  _$CheckoutShippingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutShippingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? address = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            method: null == method
                ? _value.method
                : method // ignore: cast_nullable_to_non_nullable
                      as String,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as CheckoutAddress?,
            extensionAttributes: freezed == extensionAttributes
                ? _value.extensionAttributes
                : extensionAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckoutShippingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckoutAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $CheckoutAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckoutShippingInfoImplCopyWith<$Res>
    implements $CheckoutShippingInfoCopyWith<$Res> {
  factory _$$CheckoutShippingInfoImplCopyWith(
    _$CheckoutShippingInfoImpl value,
    $Res Function(_$CheckoutShippingInfoImpl) then,
  ) = __$$CheckoutShippingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String method,
    CheckoutAddress? address,
    Map<String, dynamic>? extensionAttributes,
  });

  @override
  $CheckoutAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$CheckoutShippingInfoImplCopyWithImpl<$Res>
    extends _$CheckoutShippingInfoCopyWithImpl<$Res, _$CheckoutShippingInfoImpl>
    implements _$$CheckoutShippingInfoImplCopyWith<$Res> {
  __$$CheckoutShippingInfoImplCopyWithImpl(
    _$CheckoutShippingInfoImpl _value,
    $Res Function(_$CheckoutShippingInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutShippingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? address = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CheckoutShippingInfoImpl(
        method: null == method
            ? _value.method
            : method // ignore: cast_nullable_to_non_nullable
                  as String,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as CheckoutAddress?,
        extensionAttributes: freezed == extensionAttributes
            ? _value._extensionAttributes
            : extensionAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutShippingInfoImpl implements _CheckoutShippingInfo {
  const _$CheckoutShippingInfoImpl({
    required this.method,
    this.address,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CheckoutShippingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutShippingInfoImplFromJson(json);

  @override
  final String method;
  @override
  final CheckoutAddress? address;
  final Map<String, dynamic>? _extensionAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes {
    final value = _extensionAttributes;
    if (value == null) return null;
    if (_extensionAttributes is EqualUnmodifiableMapView)
      return _extensionAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CheckoutShippingInfo(method: $method, address: $address, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutShippingInfoImpl &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    method,
    address,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CheckoutShippingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutShippingInfoImplCopyWith<_$CheckoutShippingInfoImpl>
  get copyWith =>
      __$$CheckoutShippingInfoImplCopyWithImpl<_$CheckoutShippingInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutShippingInfoImplToJson(this);
  }
}

abstract class _CheckoutShippingInfo implements CheckoutShippingInfo {
  const factory _CheckoutShippingInfo({
    required final String method,
    final CheckoutAddress? address,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CheckoutShippingInfoImpl;

  factory _CheckoutShippingInfo.fromJson(Map<String, dynamic> json) =
      _$CheckoutShippingInfoImpl.fromJson;

  @override
  String get method;
  @override
  CheckoutAddress? get address;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CheckoutShippingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutShippingInfoImplCopyWith<_$CheckoutShippingInfoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
