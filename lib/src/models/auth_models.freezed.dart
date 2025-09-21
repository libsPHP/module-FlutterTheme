// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
    AuthResponse value,
    $Res Function(AuthResponse) then,
  ) = _$AuthResponseCopyWithImpl<$Res, AuthResponse>;
  @useResult
  $Res call({
    String accessToken,
    String refreshToken,
    String tokenType,
    int expiresIn,
    Customer customer,
  });

  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res, $Val extends AuthResponse>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? customer = null,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenType: null == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresIn: null == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int,
            customer: null == customer
                ? _value.customer
                : customer // ignore: cast_nullable_to_non_nullable
                      as Customer,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResponseImplCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$$AuthResponseImplCopyWith(
    _$AuthResponseImpl value,
    $Res Function(_$AuthResponseImpl) then,
  ) = __$$AuthResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accessToken,
    String refreshToken,
    String tokenType,
    int expiresIn,
    Customer customer,
  });

  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$AuthResponseImplCopyWithImpl<$Res>
    extends _$AuthResponseCopyWithImpl<$Res, _$AuthResponseImpl>
    implements _$$AuthResponseImplCopyWith<$Res> {
  __$$AuthResponseImplCopyWithImpl(
    _$AuthResponseImpl _value,
    $Res Function(_$AuthResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
    Object? customer = null,
  }) {
    return _then(
      _$AuthResponseImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenType: null == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresIn: null == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int,
        customer: null == customer
            ? _value.customer
            : customer // ignore: cast_nullable_to_non_nullable
                  as Customer,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResponseImpl implements _AuthResponse {
  const _$AuthResponseImpl({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.customer,
  });

  factory _$AuthResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String tokenType;
  @override
  final int expiresIn;
  @override
  final Customer customer;

  @override
  String toString() {
    return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn, customer: $customer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accessToken,
    refreshToken,
    tokenType,
    expiresIn,
    customer,
  );

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      __$$AuthResponseImplCopyWithImpl<_$AuthResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResponseImplToJson(this);
  }
}

abstract class _AuthResponse implements AuthResponse {
  const factory _AuthResponse({
    required final String accessToken,
    required final String refreshToken,
    required final String tokenType,
    required final int expiresIn,
    required final Customer customer,
  }) = _$AuthResponseImpl;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$AuthResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  String get tokenType;
  @override
  int get expiresIn;
  @override
  Customer get customer;

  /// Create a copy of AuthResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResponseImplCopyWith<_$AuthResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String? get middlename => throw _privateConstructorUsedError;
  int? get groupId => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get taxvat => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  bool? get isSubscribed => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  String? get defaultBilling => throw _privateConstructorUsedError;
  String? get defaultShipping => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<Address>? get addresses => throw _privateConstructorUsedError;

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call({
    int id,
    String email,
    String firstname,
    String lastname,
    String? middlename,
    int? groupId,
    String? dob,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    String? prefix,
    String? suffix,
    String? defaultBilling,
    String? defaultShipping,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Address>? addresses,
  });
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? middlename = freezed,
    Object? groupId = freezed,
    Object? dob = freezed,
    Object? taxvat = freezed,
    Object? gender = freezed,
    Object? isSubscribed = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? defaultBilling = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? addresses = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
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
            groupId: freezed == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                      as int?,
            dob: freezed == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                      as String?,
            taxvat: freezed == taxvat
                ? _value.taxvat
                : taxvat // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSubscribed: freezed == isSubscribed
                ? _value.isSubscribed
                : isSubscribed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            prefix: freezed == prefix
                ? _value.prefix
                : prefix // ignore: cast_nullable_to_non_nullable
                      as String?,
            suffix: freezed == suffix
                ? _value.suffix
                : suffix // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultBilling: freezed == defaultBilling
                ? _value.defaultBilling
                : defaultBilling // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultShipping: freezed == defaultShipping
                ? _value.defaultShipping
                : defaultShipping // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            addresses: freezed == addresses
                ? _value.addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                      as List<Address>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
    _$CustomerImpl value,
    $Res Function(_$CustomerImpl) then,
  ) = __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String email,
    String firstname,
    String lastname,
    String? middlename,
    int? groupId,
    String? dob,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    String? prefix,
    String? suffix,
    String? defaultBilling,
    String? defaultShipping,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Address>? addresses,
  });
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
    _$CustomerImpl _value,
    $Res Function(_$CustomerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? middlename = freezed,
    Object? groupId = freezed,
    Object? dob = freezed,
    Object? taxvat = freezed,
    Object? gender = freezed,
    Object? isSubscribed = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? defaultBilling = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? addresses = freezed,
  }) {
    return _then(
      _$CustomerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
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
        groupId: freezed == groupId
            ? _value.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as int?,
        dob: freezed == dob
            ? _value.dob
            : dob // ignore: cast_nullable_to_non_nullable
                  as String?,
        taxvat: freezed == taxvat
            ? _value.taxvat
            : taxvat // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSubscribed: freezed == isSubscribed
            ? _value.isSubscribed
            : isSubscribed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        prefix: freezed == prefix
            ? _value.prefix
            : prefix // ignore: cast_nullable_to_non_nullable
                  as String?,
        suffix: freezed == suffix
            ? _value.suffix
            : suffix // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultBilling: freezed == defaultBilling
            ? _value.defaultBilling
            : defaultBilling // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultShipping: freezed == defaultShipping
            ? _value.defaultShipping
            : defaultShipping // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        addresses: freezed == addresses
            ? _value._addresses
            : addresses // ignore: cast_nullable_to_non_nullable
                  as List<Address>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl extends _Customer {
  const _$CustomerImpl({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    this.middlename,
    this.groupId,
    this.dob,
    this.taxvat,
    this.gender,
    this.isSubscribed,
    this.prefix,
    this.suffix,
    this.defaultBilling,
    this.defaultShipping,
    this.createdAt,
    this.updatedAt,
    final List<Address>? addresses,
  }) : _addresses = addresses,
       super._();

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String? middlename;
  @override
  final int? groupId;
  @override
  final String? dob;
  @override
  final String? taxvat;
  @override
  final String? gender;
  @override
  final bool? isSubscribed;
  @override
  final String? prefix;
  @override
  final String? suffix;
  @override
  final String? defaultBilling;
  @override
  final String? defaultShipping;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final List<Address>? _addresses;
  @override
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Customer(id: $id, email: $email, firstname: $firstname, lastname: $lastname, middlename: $middlename, groupId: $groupId, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, prefix: $prefix, suffix: $suffix, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, addresses: $addresses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.taxvat, taxvat) || other.taxvat == taxvat) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.defaultBilling, defaultBilling) ||
                other.defaultBilling == defaultBilling) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    firstname,
    lastname,
    middlename,
    groupId,
    dob,
    taxvat,
    gender,
    isSubscribed,
    prefix,
    suffix,
    defaultBilling,
    defaultShipping,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_addresses),
  );

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(this);
  }
}

abstract class _Customer extends Customer {
  const factory _Customer({
    required final int id,
    required final String email,
    required final String firstname,
    required final String lastname,
    final String? middlename,
    final int? groupId,
    final String? dob,
    final String? taxvat,
    final String? gender,
    final bool? isSubscribed,
    final String? prefix,
    final String? suffix,
    final String? defaultBilling,
    final String? defaultShipping,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final List<Address>? addresses,
  }) = _$CustomerImpl;
  const _Customer._() : super._();

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String? get middlename;
  @override
  int? get groupId;
  @override
  String? get dob;
  @override
  String? get taxvat;
  @override
  String? get gender;
  @override
  bool? get isSubscribed;
  @override
  String? get prefix;
  @override
  String? get suffix;
  @override
  String? get defaultBilling;
  @override
  String? get defaultShipping;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<Address>? get addresses;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  int? get id => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get regionId => throw _privateConstructorUsedError;
  String? get regionCode => throw _privateConstructorUsedError;
  String? get countryId => throw _privateConstructorUsedError;
  List<String>? get street => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  String? get fax => throw _privateConstructorUsedError;
  String? get postcode => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get middlename => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  String? get vatId => throw _privateConstructorUsedError;
  bool? get defaultShipping => throw _privateConstructorUsedError;
  bool? get defaultBilling => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call({
    int? id,
    String? customerId,
    String? region,
    String? regionId,
    String? regionCode,
    String? countryId,
    List<String>? street,
    String? company,
    String? telephone,
    String? fax,
    String? postcode,
    String? city,
    String? firstname,
    String? lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? vatId,
    bool? defaultShipping,
    bool? defaultBilling,
  });
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? company = freezed,
    Object? telephone = freezed,
    Object? fax = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? vatId = freezed,
    Object? defaultShipping = freezed,
    Object? defaultBilling = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            customerId: freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
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
            countryId: freezed == countryId
                ? _value.countryId
                : countryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            street: freezed == street
                ? _value.street
                : street // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String?,
            telephone: freezed == telephone
                ? _value.telephone
                : telephone // ignore: cast_nullable_to_non_nullable
                      as String?,
            fax: freezed == fax
                ? _value.fax
                : fax // ignore: cast_nullable_to_non_nullable
                      as String?,
            postcode: freezed == postcode
                ? _value.postcode
                : postcode // ignore: cast_nullable_to_non_nullable
                      as String?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstname: freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastname: freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            vatId: freezed == vatId
                ? _value.vatId
                : vatId // ignore: cast_nullable_to_non_nullable
                      as String?,
            defaultShipping: freezed == defaultShipping
                ? _value.defaultShipping
                : defaultShipping // ignore: cast_nullable_to_non_nullable
                      as bool?,
            defaultBilling: freezed == defaultBilling
                ? _value.defaultBilling
                : defaultBilling // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
    _$AddressImpl value,
    $Res Function(_$AddressImpl) then,
  ) = __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? customerId,
    String? region,
    String? regionId,
    String? regionCode,
    String? countryId,
    List<String>? street,
    String? company,
    String? telephone,
    String? fax,
    String? postcode,
    String? city,
    String? firstname,
    String? lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? vatId,
    bool? defaultShipping,
    bool? defaultBilling,
  });
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
    _$AddressImpl _value,
    $Res Function(_$AddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? region = freezed,
    Object? regionId = freezed,
    Object? regionCode = freezed,
    Object? countryId = freezed,
    Object? street = freezed,
    Object? company = freezed,
    Object? telephone = freezed,
    Object? fax = freezed,
    Object? postcode = freezed,
    Object? city = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? vatId = freezed,
    Object? defaultShipping = freezed,
    Object? defaultBilling = freezed,
  }) {
    return _then(
      _$AddressImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        customerId: freezed == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
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
        countryId: freezed == countryId
            ? _value.countryId
            : countryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        street: freezed == street
            ? _value._street
            : street // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String?,
        telephone: freezed == telephone
            ? _value.telephone
            : telephone // ignore: cast_nullable_to_non_nullable
                  as String?,
        fax: freezed == fax
            ? _value.fax
            : fax // ignore: cast_nullable_to_non_nullable
                  as String?,
        postcode: freezed == postcode
            ? _value.postcode
            : postcode // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstname: freezed == firstname
            ? _value.firstname
            : firstname // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastname: freezed == lastname
            ? _value.lastname
            : lastname // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        vatId: freezed == vatId
            ? _value.vatId
            : vatId // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultShipping: freezed == defaultShipping
            ? _value.defaultShipping
            : defaultShipping // ignore: cast_nullable_to_non_nullable
                  as bool?,
        defaultBilling: freezed == defaultBilling
            ? _value.defaultBilling
            : defaultBilling // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl({
    this.id,
    this.customerId,
    this.region,
    this.regionId,
    this.regionCode,
    this.countryId,
    final List<String>? street,
    this.company,
    this.telephone,
    this.fax,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.middlename,
    this.prefix,
    this.suffix,
    this.vatId,
    this.defaultShipping,
    this.defaultBilling,
  }) : _street = street;

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final int? id;
  @override
  final String? customerId;
  @override
  final String? region;
  @override
  final String? regionId;
  @override
  final String? regionCode;
  @override
  final String? countryId;
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
  final String? company;
  @override
  final String? telephone;
  @override
  final String? fax;
  @override
  final String? postcode;
  @override
  final String? city;
  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? middlename;
  @override
  final String? prefix;
  @override
  final String? suffix;
  @override
  final String? vatId;
  @override
  final bool? defaultShipping;
  @override
  final bool? defaultBilling;

  @override
  String toString() {
    return 'Address(id: $id, customerId: $customerId, region: $region, regionId: $regionId, regionCode: $regionCode, countryId: $countryId, street: $street, company: $company, telephone: $telephone, fax: $fax, postcode: $postcode, city: $city, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, vatId: $vatId, defaultShipping: $defaultShipping, defaultBilling: $defaultBilling)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.regionId, regionId) ||
                other.regionId == regionId) &&
            (identical(other.regionCode, regionCode) ||
                other.regionCode == regionCode) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            const DeepCollectionEquality().equals(other._street, _street) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.vatId, vatId) || other.vatId == vatId) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.defaultBilling, defaultBilling) ||
                other.defaultBilling == defaultBilling));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    customerId,
    region,
    regionId,
    regionCode,
    countryId,
    const DeepCollectionEquality().hash(_street),
    company,
    telephone,
    fax,
    postcode,
    city,
    firstname,
    lastname,
    middlename,
    prefix,
    suffix,
    vatId,
    defaultShipping,
    defaultBilling,
  ]);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(this);
  }
}

abstract class _Address implements Address {
  const factory _Address({
    final int? id,
    final String? customerId,
    final String? region,
    final String? regionId,
    final String? regionCode,
    final String? countryId,
    final List<String>? street,
    final String? company,
    final String? telephone,
    final String? fax,
    final String? postcode,
    final String? city,
    final String? firstname,
    final String? lastname,
    final String? middlename,
    final String? prefix,
    final String? suffix,
    final String? vatId,
    final bool? defaultShipping,
    final bool? defaultBilling,
  }) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  int? get id;
  @override
  String? get customerId;
  @override
  String? get region;
  @override
  String? get regionId;
  @override
  String? get regionCode;
  @override
  String? get countryId;
  @override
  List<String>? get street;
  @override
  String? get company;
  @override
  String? get telephone;
  @override
  String? get fax;
  @override
  String? get postcode;
  @override
  String? get city;
  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get middlename;
  @override
  String? get prefix;
  @override
  String? get suffix;
  @override
  String? get vatId;
  @override
  bool? get defaultShipping;
  @override
  bool? get defaultBilling;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerCreateRequest _$CustomerCreateRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CustomerCreateRequest.fromJson(json);
}

/// @nodoc
mixin _$CustomerCreateRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String? get middlename => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get taxvat => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  bool? get isSubscribed => throw _privateConstructorUsedError;
  List<Address>? get addresses => throw _privateConstructorUsedError;

  /// Serializes this CustomerCreateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCreateRequestCopyWith<CustomerCreateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCreateRequestCopyWith<$Res> {
  factory $CustomerCreateRequestCopyWith(
    CustomerCreateRequest value,
    $Res Function(CustomerCreateRequest) then,
  ) = _$CustomerCreateRequestCopyWithImpl<$Res, CustomerCreateRequest>;
  @useResult
  $Res call({
    String email,
    String password,
    String firstname,
    String lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? dob,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    List<Address>? addresses,
  });
}

/// @nodoc
class _$CustomerCreateRequestCopyWithImpl<
  $Res,
  $Val extends CustomerCreateRequest
>
    implements $CustomerCreateRequestCopyWith<$Res> {
  _$CustomerCreateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? dob = freezed,
    Object? taxvat = freezed,
    Object? gender = freezed,
    Object? isSubscribed = freezed,
    Object? addresses = freezed,
  }) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
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
            dob: freezed == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                      as String?,
            taxvat: freezed == taxvat
                ? _value.taxvat
                : taxvat // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSubscribed: freezed == isSubscribed
                ? _value.isSubscribed
                : isSubscribed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            addresses: freezed == addresses
                ? _value.addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                      as List<Address>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerCreateRequestImplCopyWith<$Res>
    implements $CustomerCreateRequestCopyWith<$Res> {
  factory _$$CustomerCreateRequestImplCopyWith(
    _$CustomerCreateRequestImpl value,
    $Res Function(_$CustomerCreateRequestImpl) then,
  ) = __$$CustomerCreateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String password,
    String firstname,
    String lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? dob,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    List<Address>? addresses,
  });
}

/// @nodoc
class __$$CustomerCreateRequestImplCopyWithImpl<$Res>
    extends
        _$CustomerCreateRequestCopyWithImpl<$Res, _$CustomerCreateRequestImpl>
    implements _$$CustomerCreateRequestImplCopyWith<$Res> {
  __$$CustomerCreateRequestImplCopyWithImpl(
    _$CustomerCreateRequestImpl _value,
    $Res Function(_$CustomerCreateRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstname = null,
    Object? lastname = null,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? dob = freezed,
    Object? taxvat = freezed,
    Object? gender = freezed,
    Object? isSubscribed = freezed,
    Object? addresses = freezed,
  }) {
    return _then(
      _$CustomerCreateRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
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
        dob: freezed == dob
            ? _value.dob
            : dob // ignore: cast_nullable_to_non_nullable
                  as String?,
        taxvat: freezed == taxvat
            ? _value.taxvat
            : taxvat // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSubscribed: freezed == isSubscribed
            ? _value.isSubscribed
            : isSubscribed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        addresses: freezed == addresses
            ? _value._addresses
            : addresses // ignore: cast_nullable_to_non_nullable
                  as List<Address>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerCreateRequestImpl implements _CustomerCreateRequest {
  const _$CustomerCreateRequestImpl({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    this.middlename,
    this.prefix,
    this.suffix,
    this.dob,
    this.taxvat,
    this.gender,
    this.isSubscribed,
    final List<Address>? addresses,
  }) : _addresses = addresses;

  factory _$CustomerCreateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerCreateRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;
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
  final String? dob;
  @override
  final String? taxvat;
  @override
  final String? gender;
  @override
  final bool? isSubscribed;
  final List<Address>? _addresses;
  @override
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomerCreateRequest(email: $email, password: $password, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCreateRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.taxvat, taxvat) || other.taxvat == taxvat) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    password,
    firstname,
    lastname,
    middlename,
    prefix,
    suffix,
    dob,
    taxvat,
    gender,
    isSubscribed,
    const DeepCollectionEquality().hash(_addresses),
  );

  /// Create a copy of CustomerCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCreateRequestImplCopyWith<_$CustomerCreateRequestImpl>
  get copyWith =>
      __$$CustomerCreateRequestImplCopyWithImpl<_$CustomerCreateRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerCreateRequestImplToJson(this);
  }
}

abstract class _CustomerCreateRequest implements CustomerCreateRequest {
  const factory _CustomerCreateRequest({
    required final String email,
    required final String password,
    required final String firstname,
    required final String lastname,
    final String? middlename,
    final String? prefix,
    final String? suffix,
    final String? dob,
    final String? taxvat,
    final String? gender,
    final bool? isSubscribed,
    final List<Address>? addresses,
  }) = _$CustomerCreateRequestImpl;

  factory _CustomerCreateRequest.fromJson(Map<String, dynamic> json) =
      _$CustomerCreateRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;
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
  String? get dob;
  @override
  String? get taxvat;
  @override
  String? get gender;
  @override
  bool? get isSubscribed;
  @override
  List<Address>? get addresses;

  /// Create a copy of CustomerCreateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerCreateRequestImplCopyWith<_$CustomerCreateRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CustomerUpdateRequest _$CustomerUpdateRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CustomerUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$CustomerUpdateRequest {
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get middlename => throw _privateConstructorUsedError;
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  String? get dob => throw _privateConstructorUsedError;
  String? get taxvat => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  bool? get isSubscribed => throw _privateConstructorUsedError;
  List<Address>? get addresses => throw _privateConstructorUsedError;

  /// Serializes this CustomerUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerUpdateRequestCopyWith<CustomerUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerUpdateRequestCopyWith<$Res> {
  factory $CustomerUpdateRequestCopyWith(
    CustomerUpdateRequest value,
    $Res Function(CustomerUpdateRequest) then,
  ) = _$CustomerUpdateRequestCopyWithImpl<$Res, CustomerUpdateRequest>;
  @useResult
  $Res call({
    String? firstname,
    String? lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? dob,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    List<Address>? addresses,
  });
}

/// @nodoc
class _$CustomerUpdateRequestCopyWithImpl<
  $Res,
  $Val extends CustomerUpdateRequest
>
    implements $CustomerUpdateRequestCopyWith<$Res> {
  _$CustomerUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? dob = freezed,
    Object? taxvat = freezed,
    Object? gender = freezed,
    Object? isSubscribed = freezed,
    Object? addresses = freezed,
  }) {
    return _then(
      _value.copyWith(
            firstname: freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastname: freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            dob: freezed == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                      as String?,
            taxvat: freezed == taxvat
                ? _value.taxvat
                : taxvat // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSubscribed: freezed == isSubscribed
                ? _value.isSubscribed
                : isSubscribed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            addresses: freezed == addresses
                ? _value.addresses
                : addresses // ignore: cast_nullable_to_non_nullable
                      as List<Address>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerUpdateRequestImplCopyWith<$Res>
    implements $CustomerUpdateRequestCopyWith<$Res> {
  factory _$$CustomerUpdateRequestImplCopyWith(
    _$CustomerUpdateRequestImpl value,
    $Res Function(_$CustomerUpdateRequestImpl) then,
  ) = __$$CustomerUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? firstname,
    String? lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? dob,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    List<Address>? addresses,
  });
}

/// @nodoc
class __$$CustomerUpdateRequestImplCopyWithImpl<$Res>
    extends
        _$CustomerUpdateRequestCopyWithImpl<$Res, _$CustomerUpdateRequestImpl>
    implements _$$CustomerUpdateRequestImplCopyWith<$Res> {
  __$$CustomerUpdateRequestImplCopyWithImpl(
    _$CustomerUpdateRequestImpl _value,
    $Res Function(_$CustomerUpdateRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? middlename = freezed,
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? dob = freezed,
    Object? taxvat = freezed,
    Object? gender = freezed,
    Object? isSubscribed = freezed,
    Object? addresses = freezed,
  }) {
    return _then(
      _$CustomerUpdateRequestImpl(
        firstname: freezed == firstname
            ? _value.firstname
            : firstname // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastname: freezed == lastname
            ? _value.lastname
            : lastname // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        dob: freezed == dob
            ? _value.dob
            : dob // ignore: cast_nullable_to_non_nullable
                  as String?,
        taxvat: freezed == taxvat
            ? _value.taxvat
            : taxvat // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSubscribed: freezed == isSubscribed
            ? _value.isSubscribed
            : isSubscribed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        addresses: freezed == addresses
            ? _value._addresses
            : addresses // ignore: cast_nullable_to_non_nullable
                  as List<Address>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerUpdateRequestImpl implements _CustomerUpdateRequest {
  const _$CustomerUpdateRequestImpl({
    this.firstname,
    this.lastname,
    this.middlename,
    this.prefix,
    this.suffix,
    this.dob,
    this.taxvat,
    this.gender,
    this.isSubscribed,
    final List<Address>? addresses,
  }) : _addresses = addresses;

  factory _$CustomerUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerUpdateRequestImplFromJson(json);

  @override
  final String? firstname;
  @override
  final String? lastname;
  @override
  final String? middlename;
  @override
  final String? prefix;
  @override
  final String? suffix;
  @override
  final String? dob;
  @override
  final String? taxvat;
  @override
  final String? gender;
  @override
  final bool? isSubscribed;
  final List<Address>? _addresses;
  @override
  List<Address>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomerUpdateRequest(firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dob: $dob, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerUpdateRequestImpl &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.middlename, middlename) ||
                other.middlename == middlename) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.taxvat, taxvat) || other.taxvat == taxvat) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            const DeepCollectionEquality().equals(
              other._addresses,
              _addresses,
            ));
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
    dob,
    taxvat,
    gender,
    isSubscribed,
    const DeepCollectionEquality().hash(_addresses),
  );

  /// Create a copy of CustomerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerUpdateRequestImplCopyWith<_$CustomerUpdateRequestImpl>
  get copyWith =>
      __$$CustomerUpdateRequestImplCopyWithImpl<_$CustomerUpdateRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerUpdateRequestImplToJson(this);
  }
}

abstract class _CustomerUpdateRequest implements CustomerUpdateRequest {
  const factory _CustomerUpdateRequest({
    final String? firstname,
    final String? lastname,
    final String? middlename,
    final String? prefix,
    final String? suffix,
    final String? dob,
    final String? taxvat,
    final String? gender,
    final bool? isSubscribed,
    final List<Address>? addresses,
  }) = _$CustomerUpdateRequestImpl;

  factory _CustomerUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$CustomerUpdateRequestImpl.fromJson;

  @override
  String? get firstname;
  @override
  String? get lastname;
  @override
  String? get middlename;
  @override
  String? get prefix;
  @override
  String? get suffix;
  @override
  String? get dob;
  @override
  String? get taxvat;
  @override
  String? get gender;
  @override
  bool? get isSubscribed;
  @override
  List<Address>? get addresses;

  /// Create a copy of CustomerUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerUpdateRequestImplCopyWith<_$CustomerUpdateRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PasswordChangeRequest _$PasswordChangeRequestFromJson(
  Map<String, dynamic> json,
) {
  return _PasswordChangeRequest.fromJson(json);
}

/// @nodoc
mixin _$PasswordChangeRequest {
  String get currentPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this PasswordChangeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasswordChangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordChangeRequestCopyWith<PasswordChangeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordChangeRequestCopyWith<$Res> {
  factory $PasswordChangeRequestCopyWith(
    PasswordChangeRequest value,
    $Res Function(PasswordChangeRequest) then,
  ) = _$PasswordChangeRequestCopyWithImpl<$Res, PasswordChangeRequest>;
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class _$PasswordChangeRequestCopyWithImpl<
  $Res,
  $Val extends PasswordChangeRequest
>
    implements $PasswordChangeRequestCopyWith<$Res> {
  _$PasswordChangeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordChangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentPassword = null, Object? newPassword = null}) {
    return _then(
      _value.copyWith(
            currentPassword: null == currentPassword
                ? _value.currentPassword
                : currentPassword // ignore: cast_nullable_to_non_nullable
                      as String,
            newPassword: null == newPassword
                ? _value.newPassword
                : newPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasswordChangeRequestImplCopyWith<$Res>
    implements $PasswordChangeRequestCopyWith<$Res> {
  factory _$$PasswordChangeRequestImplCopyWith(
    _$PasswordChangeRequestImpl value,
    $Res Function(_$PasswordChangeRequestImpl) then,
  ) = __$$PasswordChangeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class __$$PasswordChangeRequestImplCopyWithImpl<$Res>
    extends
        _$PasswordChangeRequestCopyWithImpl<$Res, _$PasswordChangeRequestImpl>
    implements _$$PasswordChangeRequestImplCopyWith<$Res> {
  __$$PasswordChangeRequestImplCopyWithImpl(
    _$PasswordChangeRequestImpl _value,
    $Res Function(_$PasswordChangeRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordChangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentPassword = null, Object? newPassword = null}) {
    return _then(
      _$PasswordChangeRequestImpl(
        currentPassword: null == currentPassword
            ? _value.currentPassword
            : currentPassword // ignore: cast_nullable_to_non_nullable
                  as String,
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordChangeRequestImpl implements _PasswordChangeRequest {
  const _$PasswordChangeRequestImpl({
    required this.currentPassword,
    required this.newPassword,
  });

  factory _$PasswordChangeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordChangeRequestImplFromJson(json);

  @override
  final String currentPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'PasswordChangeRequest(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangeRequestImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  /// Create a copy of PasswordChangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangeRequestImplCopyWith<_$PasswordChangeRequestImpl>
  get copyWith =>
      __$$PasswordChangeRequestImplCopyWithImpl<_$PasswordChangeRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordChangeRequestImplToJson(this);
  }
}

abstract class _PasswordChangeRequest implements PasswordChangeRequest {
  const factory _PasswordChangeRequest({
    required final String currentPassword,
    required final String newPassword,
  }) = _$PasswordChangeRequestImpl;

  factory _PasswordChangeRequest.fromJson(Map<String, dynamic> json) =
      _$PasswordChangeRequestImpl.fromJson;

  @override
  String get currentPassword;
  @override
  String get newPassword;

  /// Create a copy of PasswordChangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangeRequestImplCopyWith<_$PasswordChangeRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PasswordResetRequest _$PasswordResetRequestFromJson(Map<String, dynamic> json) {
  return _PasswordResetRequest.fromJson(json);
}

/// @nodoc
mixin _$PasswordResetRequest {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this PasswordResetRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PasswordResetRequestCopyWith<PasswordResetRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordResetRequestCopyWith<$Res> {
  factory $PasswordResetRequestCopyWith(
    PasswordResetRequest value,
    $Res Function(PasswordResetRequest) then,
  ) = _$PasswordResetRequestCopyWithImpl<$Res, PasswordResetRequest>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$PasswordResetRequestCopyWithImpl<
  $Res,
  $Val extends PasswordResetRequest
>
    implements $PasswordResetRequestCopyWith<$Res> {
  _$PasswordResetRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PasswordResetRequestImplCopyWith<$Res>
    implements $PasswordResetRequestCopyWith<$Res> {
  factory _$$PasswordResetRequestImplCopyWith(
    _$PasswordResetRequestImpl value,
    $Res Function(_$PasswordResetRequestImpl) then,
  ) = __$$PasswordResetRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$PasswordResetRequestImplCopyWithImpl<$Res>
    extends _$PasswordResetRequestCopyWithImpl<$Res, _$PasswordResetRequestImpl>
    implements _$$PasswordResetRequestImplCopyWith<$Res> {
  __$$PasswordResetRequestImplCopyWithImpl(
    _$PasswordResetRequestImpl _value,
    $Res Function(_$PasswordResetRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$PasswordResetRequestImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PasswordResetRequestImpl implements _PasswordResetRequest {
  const _$PasswordResetRequestImpl({required this.email});

  factory _$PasswordResetRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PasswordResetRequestImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'PasswordResetRequest(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetRequestImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordResetRequestImplCopyWith<_$PasswordResetRequestImpl>
  get copyWith =>
      __$$PasswordResetRequestImplCopyWithImpl<_$PasswordResetRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PasswordResetRequestImplToJson(this);
  }
}

abstract class _PasswordResetRequest implements PasswordResetRequest {
  const factory _PasswordResetRequest({required final String email}) =
      _$PasswordResetRequestImpl;

  factory _PasswordResetRequest.fromJson(Map<String, dynamic> json) =
      _$PasswordResetRequestImpl.fromJson;

  @override
  String get email;

  /// Create a copy of PasswordResetRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordResetRequestImplCopyWith<_$PasswordResetRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SocialLoginRequest _$SocialLoginRequestFromJson(Map<String, dynamic> json) {
  return _SocialLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$SocialLoginRequest {
  String get provider => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get firstname => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;

  /// Serializes this SocialLoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialLoginRequestCopyWith<SocialLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialLoginRequestCopyWith<$Res> {
  factory $SocialLoginRequestCopyWith(
    SocialLoginRequest value,
    $Res Function(SocialLoginRequest) then,
  ) = _$SocialLoginRequestCopyWithImpl<$Res, SocialLoginRequest>;
  @useResult
  $Res call({
    String provider,
    String token,
    String? email,
    String? firstname,
    String? lastname,
  });
}

/// @nodoc
class _$SocialLoginRequestCopyWithImpl<$Res, $Val extends SocialLoginRequest>
    implements $SocialLoginRequestCopyWith<$Res> {
  _$SocialLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? token = null,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
  }) {
    return _then(
      _value.copyWith(
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            firstname: freezed == firstname
                ? _value.firstname
                : firstname // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastname: freezed == lastname
                ? _value.lastname
                : lastname // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocialLoginRequestImplCopyWith<$Res>
    implements $SocialLoginRequestCopyWith<$Res> {
  factory _$$SocialLoginRequestImplCopyWith(
    _$SocialLoginRequestImpl value,
    $Res Function(_$SocialLoginRequestImpl) then,
  ) = __$$SocialLoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String provider,
    String token,
    String? email,
    String? firstname,
    String? lastname,
  });
}

/// @nodoc
class __$$SocialLoginRequestImplCopyWithImpl<$Res>
    extends _$SocialLoginRequestCopyWithImpl<$Res, _$SocialLoginRequestImpl>
    implements _$$SocialLoginRequestImplCopyWith<$Res> {
  __$$SocialLoginRequestImplCopyWithImpl(
    _$SocialLoginRequestImpl _value,
    $Res Function(_$SocialLoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? token = null,
    Object? email = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
  }) {
    return _then(
      _$SocialLoginRequestImpl(
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstname: freezed == firstname
            ? _value.firstname
            : firstname // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastname: freezed == lastname
            ? _value.lastname
            : lastname // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialLoginRequestImpl implements _SocialLoginRequest {
  const _$SocialLoginRequestImpl({
    required this.provider,
    required this.token,
    this.email,
    this.firstname,
    this.lastname,
  });

  factory _$SocialLoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialLoginRequestImplFromJson(json);

  @override
  final String provider;
  @override
  final String token;
  @override
  final String? email;
  @override
  final String? firstname;
  @override
  final String? lastname;

  @override
  String toString() {
    return 'SocialLoginRequest(provider: $provider, token: $token, email: $email, firstname: $firstname, lastname: $lastname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialLoginRequestImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, provider, token, email, firstname, lastname);

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialLoginRequestImplCopyWith<_$SocialLoginRequestImpl> get copyWith =>
      __$$SocialLoginRequestImplCopyWithImpl<_$SocialLoginRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialLoginRequestImplToJson(this);
  }
}

abstract class _SocialLoginRequest implements SocialLoginRequest {
  const factory _SocialLoginRequest({
    required final String provider,
    required final String token,
    final String? email,
    final String? firstname,
    final String? lastname,
  }) = _$SocialLoginRequestImpl;

  factory _SocialLoginRequest.fromJson(Map<String, dynamic> json) =
      _$SocialLoginRequestImpl.fromJson;

  @override
  String get provider;
  @override
  String get token;
  @override
  String? get email;
  @override
  String? get firstname;
  @override
  String? get lastname;

  /// Create a copy of SocialLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialLoginRequestImplCopyWith<_$SocialLoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenRefreshRequest _$TokenRefreshRequestFromJson(Map<String, dynamic> json) {
  return _TokenRefreshRequest.fromJson(json);
}

/// @nodoc
mixin _$TokenRefreshRequest {
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this TokenRefreshRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenRefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenRefreshRequestCopyWith<TokenRefreshRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRefreshRequestCopyWith<$Res> {
  factory $TokenRefreshRequestCopyWith(
    TokenRefreshRequest value,
    $Res Function(TokenRefreshRequest) then,
  ) = _$TokenRefreshRequestCopyWithImpl<$Res, TokenRefreshRequest>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$TokenRefreshRequestCopyWithImpl<$Res, $Val extends TokenRefreshRequest>
    implements $TokenRefreshRequestCopyWith<$Res> {
  _$TokenRefreshRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenRefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? refreshToken = null}) {
    return _then(
      _value.copyWith(
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TokenRefreshRequestImplCopyWith<$Res>
    implements $TokenRefreshRequestCopyWith<$Res> {
  factory _$$TokenRefreshRequestImplCopyWith(
    _$TokenRefreshRequestImpl value,
    $Res Function(_$TokenRefreshRequestImpl) then,
  ) = __$$TokenRefreshRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$TokenRefreshRequestImplCopyWithImpl<$Res>
    extends _$TokenRefreshRequestCopyWithImpl<$Res, _$TokenRefreshRequestImpl>
    implements _$$TokenRefreshRequestImplCopyWith<$Res> {
  __$$TokenRefreshRequestImplCopyWithImpl(
    _$TokenRefreshRequestImpl _value,
    $Res Function(_$TokenRefreshRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TokenRefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? refreshToken = null}) {
    return _then(
      _$TokenRefreshRequestImpl(
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenRefreshRequestImpl implements _TokenRefreshRequest {
  const _$TokenRefreshRequestImpl({required this.refreshToken});

  factory _$TokenRefreshRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenRefreshRequestImplFromJson(json);

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'TokenRefreshRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenRefreshRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of TokenRefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenRefreshRequestImplCopyWith<_$TokenRefreshRequestImpl> get copyWith =>
      __$$TokenRefreshRequestImplCopyWithImpl<_$TokenRefreshRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenRefreshRequestImplToJson(this);
  }
}

abstract class _TokenRefreshRequest implements TokenRefreshRequest {
  const factory _TokenRefreshRequest({required final String refreshToken}) =
      _$TokenRefreshRequestImpl;

  factory _TokenRefreshRequest.fromJson(Map<String, dynamic> json) =
      _$TokenRefreshRequestImpl.fromJson;

  @override
  String get refreshToken;

  /// Create a copy of TokenRefreshRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenRefreshRequestImplCopyWith<_$TokenRefreshRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SessionInfo _$SessionInfoFromJson(Map<String, dynamic> json) {
  return _SessionInfo.fromJson(json);
}

/// @nodoc
mixin _$SessionInfo {
  String get sessionId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get cartId => throw _privateConstructorUsedError;

  /// Serializes this SessionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionInfoCopyWith<SessionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionInfoCopyWith<$Res> {
  factory $SessionInfoCopyWith(
    SessionInfo value,
    $Res Function(SessionInfo) then,
  ) = _$SessionInfoCopyWithImpl<$Res, SessionInfo>;
  @useResult
  $Res call({
    String sessionId,
    DateTime createdAt,
    DateTime expiresAt,
    bool isValid,
    String? customerId,
    String? cartId,
  });
}

/// @nodoc
class _$SessionInfoCopyWithImpl<$Res, $Val extends SessionInfo>
    implements $SessionInfoCopyWith<$Res> {
  _$SessionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? isValid = null,
    Object? customerId = freezed,
    Object? cartId = freezed,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isValid: null == isValid
                ? _value.isValid
                : isValid // ignore: cast_nullable_to_non_nullable
                      as bool,
            customerId: freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            cartId: freezed == cartId
                ? _value.cartId
                : cartId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SessionInfoImplCopyWith<$Res>
    implements $SessionInfoCopyWith<$Res> {
  factory _$$SessionInfoImplCopyWith(
    _$SessionInfoImpl value,
    $Res Function(_$SessionInfoImpl) then,
  ) = __$$SessionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sessionId,
    DateTime createdAt,
    DateTime expiresAt,
    bool isValid,
    String? customerId,
    String? cartId,
  });
}

/// @nodoc
class __$$SessionInfoImplCopyWithImpl<$Res>
    extends _$SessionInfoCopyWithImpl<$Res, _$SessionInfoImpl>
    implements _$$SessionInfoImplCopyWith<$Res> {
  __$$SessionInfoImplCopyWithImpl(
    _$SessionInfoImpl _value,
    $Res Function(_$SessionInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? isValid = null,
    Object? customerId = freezed,
    Object? cartId = freezed,
  }) {
    return _then(
      _$SessionInfoImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isValid: null == isValid
            ? _value.isValid
            : isValid // ignore: cast_nullable_to_non_nullable
                  as bool,
        customerId: freezed == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        cartId: freezed == cartId
            ? _value.cartId
            : cartId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionInfoImpl implements _SessionInfo {
  const _$SessionInfoImpl({
    required this.sessionId,
    required this.createdAt,
    required this.expiresAt,
    required this.isValid,
    this.customerId,
    this.cartId,
  });

  factory _$SessionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionInfoImplFromJson(json);

  @override
  final String sessionId;
  @override
  final DateTime createdAt;
  @override
  final DateTime expiresAt;
  @override
  final bool isValid;
  @override
  final String? customerId;
  @override
  final String? cartId;

  @override
  String toString() {
    return 'SessionInfo(sessionId: $sessionId, createdAt: $createdAt, expiresAt: $expiresAt, isValid: $isValid, customerId: $customerId, cartId: $cartId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionInfoImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    createdAt,
    expiresAt,
    isValid,
    customerId,
    cartId,
  );

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionInfoImplCopyWith<_$SessionInfoImpl> get copyWith =>
      __$$SessionInfoImplCopyWithImpl<_$SessionInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionInfoImplToJson(this);
  }
}

abstract class _SessionInfo implements SessionInfo {
  const factory _SessionInfo({
    required final String sessionId,
    required final DateTime createdAt,
    required final DateTime expiresAt,
    required final bool isValid,
    final String? customerId,
    final String? cartId,
  }) = _$SessionInfoImpl;

  factory _SessionInfo.fromJson(Map<String, dynamic> json) =
      _$SessionInfoImpl.fromJson;

  @override
  String get sessionId;
  @override
  DateTime get createdAt;
  @override
  DateTime get expiresAt;
  @override
  bool get isValid;
  @override
  String? get customerId;
  @override
  String? get cartId;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionInfoImplCopyWith<_$SessionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
