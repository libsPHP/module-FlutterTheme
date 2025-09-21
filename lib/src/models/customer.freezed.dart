// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

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
  String? get prefix => throw _privateConstructorUsedError;
  String? get suffix => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get taxvat => throw _privateConstructorUsedError;
  bool? get isSubscribed => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  String? get defaultBilling => throw _privateConstructorUsedError;
  String? get defaultShipping => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customAttributes =>
      throw _privateConstructorUsedError;
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
    String? prefix,
    String? suffix,
    String? gender,
    String? dateOfBirth,
    String? taxvat,
    bool? isSubscribed,
    String? groupId,
    String? defaultBilling,
    String? defaultShipping,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? customAttributes,
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
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? taxvat = freezed,
    Object? isSubscribed = freezed,
    Object? groupId = freezed,
    Object? defaultBilling = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? customAttributes = freezed,
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
            prefix: freezed == prefix
                ? _value.prefix
                : prefix // ignore: cast_nullable_to_non_nullable
                      as String?,
            suffix: freezed == suffix
                ? _value.suffix
                : suffix // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            taxvat: freezed == taxvat
                ? _value.taxvat
                : taxvat // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSubscribed: freezed == isSubscribed
                ? _value.isSubscribed
                : isSubscribed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            groupId: freezed == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
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
            customAttributes: freezed == customAttributes
                ? _value.customAttributes
                : customAttributes // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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
    String? prefix,
    String? suffix,
    String? gender,
    String? dateOfBirth,
    String? taxvat,
    bool? isSubscribed,
    String? groupId,
    String? defaultBilling,
    String? defaultShipping,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? customAttributes,
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
    Object? prefix = freezed,
    Object? suffix = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? taxvat = freezed,
    Object? isSubscribed = freezed,
    Object? groupId = freezed,
    Object? defaultBilling = freezed,
    Object? defaultShipping = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? customAttributes = freezed,
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
        prefix: freezed == prefix
            ? _value.prefix
            : prefix // ignore: cast_nullable_to_non_nullable
                  as String?,
        suffix: freezed == suffix
            ? _value.suffix
            : suffix // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        taxvat: freezed == taxvat
            ? _value.taxvat
            : taxvat // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSubscribed: freezed == isSubscribed
            ? _value.isSubscribed
            : isSubscribed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        groupId: freezed == groupId
            ? _value.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
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
        customAttributes: freezed == customAttributes
            ? _value._customAttributes
            : customAttributes // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
class _$CustomerImpl implements _Customer {
  const _$CustomerImpl({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    this.middlename,
    this.prefix,
    this.suffix,
    this.gender,
    this.dateOfBirth,
    this.taxvat,
    this.isSubscribed,
    this.groupId,
    this.defaultBilling,
    this.defaultShipping,
    this.createdAt,
    this.updatedAt,
    final Map<String, dynamic>? customAttributes,
    final List<Address>? addresses,
  }) : _customAttributes = customAttributes,
       _addresses = addresses;

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
  final String? prefix;
  @override
  final String? suffix;
  @override
  final String? gender;
  @override
  final String? dateOfBirth;
  @override
  final String? taxvat;
  @override
  final bool? isSubscribed;
  @override
  final String? groupId;
  @override
  final String? defaultBilling;
  @override
  final String? defaultShipping;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  final Map<String, dynamic>? _customAttributes;
  @override
  Map<String, dynamic>? get customAttributes {
    final value = _customAttributes;
    if (value == null) return null;
    if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
    return 'Customer(id: $id, email: $email, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, gender: $gender, dateOfBirth: $dateOfBirth, taxvat: $taxvat, isSubscribed: $isSubscribed, groupId: $groupId, defaultBilling: $defaultBilling, defaultShipping: $defaultShipping, createdAt: $createdAt, updatedAt: $updatedAt, customAttributes: $customAttributes, addresses: $addresses)';
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
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.taxvat, taxvat) || other.taxvat == taxvat) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.defaultBilling, defaultBilling) ||
                other.defaultBilling == defaultBilling) &&
            (identical(other.defaultShipping, defaultShipping) ||
                other.defaultShipping == defaultShipping) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(
              other._customAttributes,
              _customAttributes,
            ) &&
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
    prefix,
    suffix,
    gender,
    dateOfBirth,
    taxvat,
    isSubscribed,
    groupId,
    defaultBilling,
    defaultShipping,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_customAttributes),
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

abstract class _Customer implements Customer {
  const factory _Customer({
    required final int id,
    required final String email,
    required final String firstname,
    required final String lastname,
    final String? middlename,
    final String? prefix,
    final String? suffix,
    final String? gender,
    final String? dateOfBirth,
    final String? taxvat,
    final bool? isSubscribed,
    final String? groupId,
    final String? defaultBilling,
    final String? defaultShipping,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final Map<String, dynamic>? customAttributes,
    final List<Address>? addresses,
  }) = _$CustomerImpl;

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
  String? get prefix;
  @override
  String? get suffix;
  @override
  String? get gender;
  @override
  String? get dateOfBirth;
  @override
  String? get taxvat;
  @override
  bool? get isSubscribed;
  @override
  String? get groupId;
  @override
  String? get defaultBilling;
  @override
  String? get defaultShipping;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  Map<String, dynamic>? get customAttributes;
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
  int get id => throw _privateConstructorUsedError;
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
  bool? get isDefaultBilling => throw _privateConstructorUsedError;
  bool? get isDefaultShipping => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customAttributes =>
      throw _privateConstructorUsedError;

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
    int id,
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
    bool? isDefaultBilling,
    bool? isDefaultShipping,
    Map<String, dynamic>? customAttributes,
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
    Object? id = null,
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
    Object? isDefaultBilling = freezed,
    Object? isDefaultShipping = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
            isDefaultBilling: freezed == isDefaultBilling
                ? _value.isDefaultBilling
                : isDefaultBilling // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isDefaultShipping: freezed == isDefaultShipping
                ? _value.isDefaultShipping
                : isDefaultShipping // ignore: cast_nullable_to_non_nullable
                      as bool?,
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
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
    _$AddressImpl value,
    $Res Function(_$AddressImpl) then,
  ) = __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
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
    bool? isDefaultBilling,
    bool? isDefaultShipping,
    Map<String, dynamic>? customAttributes,
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
    Object? id = null,
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
    Object? isDefaultBilling = freezed,
    Object? isDefaultShipping = freezed,
    Object? customAttributes = freezed,
  }) {
    return _then(
      _$AddressImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
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
        isDefaultBilling: freezed == isDefaultBilling
            ? _value.isDefaultBilling
            : isDefaultBilling // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isDefaultShipping: freezed == isDefaultShipping
            ? _value.isDefaultShipping
            : isDefaultShipping // ignore: cast_nullable_to_non_nullable
                  as bool?,
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
class _$AddressImpl implements _Address {
  const _$AddressImpl({
    required this.id,
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
    this.isDefaultBilling,
    this.isDefaultShipping,
    final Map<String, dynamic>? customAttributes,
  }) : _customAttributes = customAttributes;

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final int id;
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
  final bool? isDefaultBilling;
  @override
  final bool? isDefaultShipping;
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
    return 'Address(id: $id, firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, vatId: $vatId, isDefaultBilling: $isDefaultBilling, isDefaultShipping: $isDefaultShipping, customAttributes: $customAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.vatId, vatId) || other.vatId == vatId) &&
            (identical(other.isDefaultBilling, isDefaultBilling) ||
                other.isDefaultBilling == isDefaultBilling) &&
            (identical(other.isDefaultShipping, isDefaultShipping) ||
                other.isDefaultShipping == isDefaultShipping) &&
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
    isDefaultBilling,
    isDefaultShipping,
    const DeepCollectionEquality().hash(_customAttributes),
  );

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
    required final int id,
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
    final bool? isDefaultBilling,
    final bool? isDefaultShipping,
    final Map<String, dynamic>? customAttributes,
  }) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  int get id;
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
  @override
  bool? get isDefaultBilling;
  @override
  bool? get isDefaultShipping;
  @override
  Map<String, dynamic>? get customAttributes;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
