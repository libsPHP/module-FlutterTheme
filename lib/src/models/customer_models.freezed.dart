// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CustomerAddress _$CustomerAddressFromJson(Map<String, dynamic> json) {
  return _CustomerAddress.fromJson(json);
}

/// @nodoc
mixin _$CustomerAddress {
  int get id => throw _privateConstructorUsedError;
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
  bool? get isDefaultShipping => throw _privateConstructorUsedError;
  bool? get isDefaultBilling => throw _privateConstructorUsedError;
  Map<String, dynamic>? get customAttributes =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerAddressCopyWith<CustomerAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAddressCopyWith<$Res> {
  factory $CustomerAddressCopyWith(
    CustomerAddress value,
    $Res Function(CustomerAddress) then,
  ) = _$CustomerAddressCopyWithImpl<$Res, CustomerAddress>;
  @useResult
  $Res call({
    int id,
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
    bool? isDefaultShipping,
    bool? isDefaultBilling,
    Map<String, dynamic>? customAttributes,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerAddressCopyWithImpl<$Res, $Val extends CustomerAddress>
    implements $CustomerAddressCopyWith<$Res> {
  _$CustomerAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? isDefaultShipping = freezed,
    Object? isDefaultBilling = freezed,
    Object? customAttributes = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
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
            isDefaultShipping: freezed == isDefaultShipping
                ? _value.isDefaultShipping
                : isDefaultShipping // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isDefaultBilling: freezed == isDefaultBilling
                ? _value.isDefaultBilling
                : isDefaultBilling // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerAddressImplCopyWith<$Res>
    implements $CustomerAddressCopyWith<$Res> {
  factory _$$CustomerAddressImplCopyWith(
    _$CustomerAddressImpl value,
    $Res Function(_$CustomerAddressImpl) then,
  ) = __$$CustomerAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
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
    bool? isDefaultShipping,
    bool? isDefaultBilling,
    Map<String, dynamic>? customAttributes,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerAddressImplCopyWithImpl<$Res>
    extends _$CustomerAddressCopyWithImpl<$Res, _$CustomerAddressImpl>
    implements _$$CustomerAddressImplCopyWith<$Res> {
  __$$CustomerAddressImplCopyWithImpl(
    _$CustomerAddressImpl _value,
    $Res Function(_$CustomerAddressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? isDefaultShipping = freezed,
    Object? isDefaultBilling = freezed,
    Object? customAttributes = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerAddressImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
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
        isDefaultShipping: freezed == isDefaultShipping
            ? _value.isDefaultShipping
            : isDefaultShipping // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isDefaultBilling: freezed == isDefaultBilling
            ? _value.isDefaultBilling
            : isDefaultBilling // ignore: cast_nullable_to_non_nullable
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
class _$CustomerAddressImpl implements _CustomerAddress {
  const _$CustomerAddressImpl({
    required this.id,
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
    this.isDefaultShipping,
    this.isDefaultBilling,
    final Map<String, dynamic>? customAttributes,
    final Map<String, dynamic>? extensionAttributes,
  }) : _street = street,
       _customAttributes = customAttributes,
       _extensionAttributes = extensionAttributes;

  factory _$CustomerAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerAddressImplFromJson(json);

  @override
  final int id;
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
  final bool? isDefaultShipping;
  @override
  final bool? isDefaultBilling;
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
    return 'CustomerAddress(id: $id, customerId: $customerId, customerAddressId: $customerAddressId, email: $email, firstName: $firstName, lastName: $lastName, middleName: $middleName, prefix: $prefix, suffix: $suffix, company: $company, street: $street, city: $city, region: $region, regionId: $regionId, regionCode: $regionCode, postcode: $postcode, countryId: $countryId, telephone: $telephone, fax: $fax, isDefaultShipping: $isDefaultShipping, isDefaultBilling: $isDefaultBilling, customAttributes: $customAttributes, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerAddressImpl &&
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
            (identical(other.isDefaultShipping, isDefaultShipping) ||
                other.isDefaultShipping == isDefaultShipping) &&
            (identical(other.isDefaultBilling, isDefaultBilling) ||
                other.isDefaultBilling == isDefaultBilling) &&
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
    isDefaultShipping,
    isDefaultBilling,
    const DeepCollectionEquality().hash(_customAttributes),
    const DeepCollectionEquality().hash(_extensionAttributes),
  ]);

  /// Create a copy of CustomerAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerAddressImplCopyWith<_$CustomerAddressImpl> get copyWith =>
      __$$CustomerAddressImplCopyWithImpl<_$CustomerAddressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerAddressImplToJson(this);
  }
}

abstract class _CustomerAddress implements CustomerAddress {
  const factory _CustomerAddress({
    required final int id,
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
    final bool? isDefaultShipping,
    final bool? isDefaultBilling,
    final Map<String, dynamic>? customAttributes,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerAddressImpl;

  factory _CustomerAddress.fromJson(Map<String, dynamic> json) =
      _$CustomerAddressImpl.fromJson;

  @override
  int get id;
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
  bool? get isDefaultShipping;
  @override
  bool? get isDefaultBilling;
  @override
  Map<String, dynamic>? get customAttributes;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerAddressImplCopyWith<_$CustomerAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerGroup _$CustomerGroupFromJson(Map<String, dynamic> json) {
  return _CustomerGroup.fromJson(json);
}

/// @nodoc
mixin _$CustomerGroup {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get taxClassName => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerGroupCopyWith<CustomerGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerGroupCopyWith<$Res> {
  factory $CustomerGroupCopyWith(
    CustomerGroup value,
    $Res Function(CustomerGroup) then,
  ) = _$CustomerGroupCopyWithImpl<$Res, CustomerGroup>;
  @useResult
  $Res call({
    int id,
    String code,
    String taxClassName,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerGroupCopyWithImpl<$Res, $Val extends CustomerGroup>
    implements $CustomerGroupCopyWith<$Res> {
  _$CustomerGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? taxClassName = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            taxClassName: null == taxClassName
                ? _value.taxClassName
                : taxClassName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerGroupImplCopyWith<$Res>
    implements $CustomerGroupCopyWith<$Res> {
  factory _$$CustomerGroupImplCopyWith(
    _$CustomerGroupImpl value,
    $Res Function(_$CustomerGroupImpl) then,
  ) = __$$CustomerGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String code,
    String taxClassName,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerGroupImplCopyWithImpl<$Res>
    extends _$CustomerGroupCopyWithImpl<$Res, _$CustomerGroupImpl>
    implements _$$CustomerGroupImplCopyWith<$Res> {
  __$$CustomerGroupImplCopyWithImpl(
    _$CustomerGroupImpl _value,
    $Res Function(_$CustomerGroupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? taxClassName = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerGroupImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        taxClassName: null == taxClassName
            ? _value.taxClassName
            : taxClassName // ignore: cast_nullable_to_non_nullable
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
class _$CustomerGroupImpl implements _CustomerGroup {
  const _$CustomerGroupImpl({
    required this.id,
    required this.code,
    required this.taxClassName,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CustomerGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerGroupImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  final String taxClassName;
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
    return 'CustomerGroup(id: $id, code: $code, taxClassName: $taxClassName, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.taxClassName, taxClassName) ||
                other.taxClassName == taxClassName) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    taxClassName,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerGroupImplCopyWith<_$CustomerGroupImpl> get copyWith =>
      __$$CustomerGroupImplCopyWithImpl<_$CustomerGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerGroupImplToJson(this);
  }
}

abstract class _CustomerGroup implements CustomerGroup {
  const factory _CustomerGroup({
    required final int id,
    required final String code,
    required final String taxClassName,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerGroupImpl;

  factory _CustomerGroup.fromJson(Map<String, dynamic> json) =
      _$CustomerGroupImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  String get taxClassName;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerGroupImplCopyWith<_$CustomerGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerAttribute _$CustomerAttributeFromJson(Map<String, dynamic> json) {
  return _CustomerAttribute.fromJson(json);
}

/// @nodoc
mixin _$CustomerAttribute {
  String get attributeCode => throw _privateConstructorUsedError;
  String get frontendInput => throw _privateConstructorUsedError;
  String get frontendLabel => throw _privateConstructorUsedError;
  bool get isRequired => throw _privateConstructorUsedError;
  bool get isUserDefined => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  bool get isSystem => throw _privateConstructorUsedError;
  int get sortOrder => throw _privateConstructorUsedError;
  String? get defaultValue => throw _privateConstructorUsedError;
  List<CustomerAttributeOption>? get options =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get validationRules =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerAttributeCopyWith<CustomerAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAttributeCopyWith<$Res> {
  factory $CustomerAttributeCopyWith(
    CustomerAttribute value,
    $Res Function(CustomerAttribute) then,
  ) = _$CustomerAttributeCopyWithImpl<$Res, CustomerAttribute>;
  @useResult
  $Res call({
    String attributeCode,
    String frontendInput,
    String frontendLabel,
    bool isRequired,
    bool isUserDefined,
    bool isVisible,
    bool isSystem,
    int sortOrder,
    String? defaultValue,
    List<CustomerAttributeOption>? options,
    Map<String, dynamic>? validationRules,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerAttributeCopyWithImpl<$Res, $Val extends CustomerAttribute>
    implements $CustomerAttributeCopyWith<$Res> {
  _$CustomerAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? frontendInput = null,
    Object? frontendLabel = null,
    Object? isRequired = null,
    Object? isUserDefined = null,
    Object? isVisible = null,
    Object? isSystem = null,
    Object? sortOrder = null,
    Object? defaultValue = freezed,
    Object? options = freezed,
    Object? validationRules = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            attributeCode: null == attributeCode
                ? _value.attributeCode
                : attributeCode // ignore: cast_nullable_to_non_nullable
                      as String,
            frontendInput: null == frontendInput
                ? _value.frontendInput
                : frontendInput // ignore: cast_nullable_to_non_nullable
                      as String,
            frontendLabel: null == frontendLabel
                ? _value.frontendLabel
                : frontendLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            isRequired: null == isRequired
                ? _value.isRequired
                : isRequired // ignore: cast_nullable_to_non_nullable
                      as bool,
            isUserDefined: null == isUserDefined
                ? _value.isUserDefined
                : isUserDefined // ignore: cast_nullable_to_non_nullable
                      as bool,
            isVisible: null == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSystem: null == isSystem
                ? _value.isSystem
                : isSystem // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            defaultValue: freezed == defaultValue
                ? _value.defaultValue
                : defaultValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            options: freezed == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<CustomerAttributeOption>?,
            validationRules: freezed == validationRules
                ? _value.validationRules
                : validationRules // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerAttributeImplCopyWith<$Res>
    implements $CustomerAttributeCopyWith<$Res> {
  factory _$$CustomerAttributeImplCopyWith(
    _$CustomerAttributeImpl value,
    $Res Function(_$CustomerAttributeImpl) then,
  ) = __$$CustomerAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String attributeCode,
    String frontendInput,
    String frontendLabel,
    bool isRequired,
    bool isUserDefined,
    bool isVisible,
    bool isSystem,
    int sortOrder,
    String? defaultValue,
    List<CustomerAttributeOption>? options,
    Map<String, dynamic>? validationRules,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerAttributeImplCopyWithImpl<$Res>
    extends _$CustomerAttributeCopyWithImpl<$Res, _$CustomerAttributeImpl>
    implements _$$CustomerAttributeImplCopyWith<$Res> {
  __$$CustomerAttributeImplCopyWithImpl(
    _$CustomerAttributeImpl _value,
    $Res Function(_$CustomerAttributeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? frontendInput = null,
    Object? frontendLabel = null,
    Object? isRequired = null,
    Object? isUserDefined = null,
    Object? isVisible = null,
    Object? isSystem = null,
    Object? sortOrder = null,
    Object? defaultValue = freezed,
    Object? options = freezed,
    Object? validationRules = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerAttributeImpl(
        attributeCode: null == attributeCode
            ? _value.attributeCode
            : attributeCode // ignore: cast_nullable_to_non_nullable
                  as String,
        frontendInput: null == frontendInput
            ? _value.frontendInput
            : frontendInput // ignore: cast_nullable_to_non_nullable
                  as String,
        frontendLabel: null == frontendLabel
            ? _value.frontendLabel
            : frontendLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        isRequired: null == isRequired
            ? _value.isRequired
            : isRequired // ignore: cast_nullable_to_non_nullable
                  as bool,
        isUserDefined: null == isUserDefined
            ? _value.isUserDefined
            : isUserDefined // ignore: cast_nullable_to_non_nullable
                  as bool,
        isVisible: null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSystem: null == isSystem
            ? _value.isSystem
            : isSystem // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        defaultValue: freezed == defaultValue
            ? _value.defaultValue
            : defaultValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        options: freezed == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<CustomerAttributeOption>?,
        validationRules: freezed == validationRules
            ? _value._validationRules
            : validationRules // ignore: cast_nullable_to_non_nullable
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
class _$CustomerAttributeImpl implements _CustomerAttribute {
  const _$CustomerAttributeImpl({
    required this.attributeCode,
    required this.frontendInput,
    required this.frontendLabel,
    required this.isRequired,
    required this.isUserDefined,
    required this.isVisible,
    required this.isSystem,
    required this.sortOrder,
    this.defaultValue,
    final List<CustomerAttributeOption>? options,
    final Map<String, dynamic>? validationRules,
    final Map<String, dynamic>? extensionAttributes,
  }) : _options = options,
       _validationRules = validationRules,
       _extensionAttributes = extensionAttributes;

  factory _$CustomerAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerAttributeImplFromJson(json);

  @override
  final String attributeCode;
  @override
  final String frontendInput;
  @override
  final String frontendLabel;
  @override
  final bool isRequired;
  @override
  final bool isUserDefined;
  @override
  final bool isVisible;
  @override
  final bool isSystem;
  @override
  final int sortOrder;
  @override
  final String? defaultValue;
  final List<CustomerAttributeOption>? _options;
  @override
  List<CustomerAttributeOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _validationRules;
  @override
  Map<String, dynamic>? get validationRules {
    final value = _validationRules;
    if (value == null) return null;
    if (_validationRules is EqualUnmodifiableMapView) return _validationRules;
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
    return 'CustomerAttribute(attributeCode: $attributeCode, frontendInput: $frontendInput, frontendLabel: $frontendLabel, isRequired: $isRequired, isUserDefined: $isUserDefined, isVisible: $isVisible, isSystem: $isSystem, sortOrder: $sortOrder, defaultValue: $defaultValue, options: $options, validationRules: $validationRules, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerAttributeImpl &&
            (identical(other.attributeCode, attributeCode) ||
                other.attributeCode == attributeCode) &&
            (identical(other.frontendInput, frontendInput) ||
                other.frontendInput == frontendInput) &&
            (identical(other.frontendLabel, frontendLabel) ||
                other.frontendLabel == frontendLabel) &&
            (identical(other.isRequired, isRequired) ||
                other.isRequired == isRequired) &&
            (identical(other.isUserDefined, isUserDefined) ||
                other.isUserDefined == isUserDefined) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.isSystem, isSystem) ||
                other.isSystem == isSystem) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality().equals(
              other._validationRules,
              _validationRules,
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
    attributeCode,
    frontendInput,
    frontendLabel,
    isRequired,
    isUserDefined,
    isVisible,
    isSystem,
    sortOrder,
    defaultValue,
    const DeepCollectionEquality().hash(_options),
    const DeepCollectionEquality().hash(_validationRules),
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerAttributeImplCopyWith<_$CustomerAttributeImpl> get copyWith =>
      __$$CustomerAttributeImplCopyWithImpl<_$CustomerAttributeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerAttributeImplToJson(this);
  }
}

abstract class _CustomerAttribute implements CustomerAttribute {
  const factory _CustomerAttribute({
    required final String attributeCode,
    required final String frontendInput,
    required final String frontendLabel,
    required final bool isRequired,
    required final bool isUserDefined,
    required final bool isVisible,
    required final bool isSystem,
    required final int sortOrder,
    final String? defaultValue,
    final List<CustomerAttributeOption>? options,
    final Map<String, dynamic>? validationRules,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerAttributeImpl;

  factory _CustomerAttribute.fromJson(Map<String, dynamic> json) =
      _$CustomerAttributeImpl.fromJson;

  @override
  String get attributeCode;
  @override
  String get frontendInput;
  @override
  String get frontendLabel;
  @override
  bool get isRequired;
  @override
  bool get isUserDefined;
  @override
  bool get isVisible;
  @override
  bool get isSystem;
  @override
  int get sortOrder;
  @override
  String? get defaultValue;
  @override
  List<CustomerAttributeOption>? get options;
  @override
  Map<String, dynamic>? get validationRules;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerAttributeImplCopyWith<_$CustomerAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerAttributeOption _$CustomerAttributeOptionFromJson(
  Map<String, dynamic> json,
) {
  return _CustomerAttributeOption.fromJson(json);
}

/// @nodoc
mixin _$CustomerAttributeOption {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerAttributeOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerAttributeOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerAttributeOptionCopyWith<CustomerAttributeOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAttributeOptionCopyWith<$Res> {
  factory $CustomerAttributeOptionCopyWith(
    CustomerAttributeOption value,
    $Res Function(CustomerAttributeOption) then,
  ) = _$CustomerAttributeOptionCopyWithImpl<$Res, CustomerAttributeOption>;
  @useResult
  $Res call({
    String value,
    String label,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerAttributeOptionCopyWithImpl<
  $Res,
  $Val extends CustomerAttributeOption
>
    implements $CustomerAttributeOptionCopyWith<$Res> {
  _$CustomerAttributeOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerAttributeOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerAttributeOptionImplCopyWith<$Res>
    implements $CustomerAttributeOptionCopyWith<$Res> {
  factory _$$CustomerAttributeOptionImplCopyWith(
    _$CustomerAttributeOptionImpl value,
    $Res Function(_$CustomerAttributeOptionImpl) then,
  ) = __$$CustomerAttributeOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String value,
    String label,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerAttributeOptionImplCopyWithImpl<$Res>
    extends
        _$CustomerAttributeOptionCopyWithImpl<
          $Res,
          _$CustomerAttributeOptionImpl
        >
    implements _$$CustomerAttributeOptionImplCopyWith<$Res> {
  __$$CustomerAttributeOptionImplCopyWithImpl(
    _$CustomerAttributeOptionImpl _value,
    $Res Function(_$CustomerAttributeOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerAttributeOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerAttributeOptionImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
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
class _$CustomerAttributeOptionImpl implements _CustomerAttributeOption {
  const _$CustomerAttributeOptionImpl({
    required this.value,
    required this.label,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CustomerAttributeOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerAttributeOptionImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
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
    return 'CustomerAttributeOption(value: $value, label: $label, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerAttributeOptionImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    value,
    label,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerAttributeOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerAttributeOptionImplCopyWith<_$CustomerAttributeOptionImpl>
  get copyWith =>
      __$$CustomerAttributeOptionImplCopyWithImpl<
        _$CustomerAttributeOptionImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerAttributeOptionImplToJson(this);
  }
}

abstract class _CustomerAttributeOption implements CustomerAttributeOption {
  const factory _CustomerAttributeOption({
    required final String value,
    required final String label,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerAttributeOptionImpl;

  factory _CustomerAttributeOption.fromJson(Map<String, dynamic> json) =
      _$CustomerAttributeOptionImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerAttributeOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerAttributeOptionImplCopyWith<_$CustomerAttributeOptionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CustomerPreferences _$CustomerPreferencesFromJson(Map<String, dynamic> json) {
  return _CustomerPreferences.fromJson(json);
}

/// @nodoc
mixin _$CustomerPreferences {
  String? get language => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get timezone => throw _privateConstructorUsedError;
  bool? get newsletterSubscription => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalPreferences =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerPreferencesCopyWith<CustomerPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPreferencesCopyWith<$Res> {
  factory $CustomerPreferencesCopyWith(
    CustomerPreferences value,
    $Res Function(CustomerPreferences) then,
  ) = _$CustomerPreferencesCopyWithImpl<$Res, CustomerPreferences>;
  @useResult
  $Res call({
    String? language,
    String? currency,
    String? timezone,
    bool? newsletterSubscription,
    Map<String, dynamic>? additionalPreferences,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerPreferencesCopyWithImpl<$Res, $Val extends CustomerPreferences>
    implements $CustomerPreferencesCopyWith<$Res> {
  _$CustomerPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
    Object? currency = freezed,
    Object? timezone = freezed,
    Object? newsletterSubscription = freezed,
    Object? additionalPreferences = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            language: freezed == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            timezone: freezed == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String?,
            newsletterSubscription: freezed == newsletterSubscription
                ? _value.newsletterSubscription
                : newsletterSubscription // ignore: cast_nullable_to_non_nullable
                      as bool?,
            additionalPreferences: freezed == additionalPreferences
                ? _value.additionalPreferences
                : additionalPreferences // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerPreferencesImplCopyWith<$Res>
    implements $CustomerPreferencesCopyWith<$Res> {
  factory _$$CustomerPreferencesImplCopyWith(
    _$CustomerPreferencesImpl value,
    $Res Function(_$CustomerPreferencesImpl) then,
  ) = __$$CustomerPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? language,
    String? currency,
    String? timezone,
    bool? newsletterSubscription,
    Map<String, dynamic>? additionalPreferences,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerPreferencesImplCopyWithImpl<$Res>
    extends _$CustomerPreferencesCopyWithImpl<$Res, _$CustomerPreferencesImpl>
    implements _$$CustomerPreferencesImplCopyWith<$Res> {
  __$$CustomerPreferencesImplCopyWithImpl(
    _$CustomerPreferencesImpl _value,
    $Res Function(_$CustomerPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = freezed,
    Object? currency = freezed,
    Object? timezone = freezed,
    Object? newsletterSubscription = freezed,
    Object? additionalPreferences = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerPreferencesImpl(
        language: freezed == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        timezone: freezed == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
        newsletterSubscription: freezed == newsletterSubscription
            ? _value.newsletterSubscription
            : newsletterSubscription // ignore: cast_nullable_to_non_nullable
                  as bool?,
        additionalPreferences: freezed == additionalPreferences
            ? _value._additionalPreferences
            : additionalPreferences // ignore: cast_nullable_to_non_nullable
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
class _$CustomerPreferencesImpl implements _CustomerPreferences {
  const _$CustomerPreferencesImpl({
    this.language,
    this.currency,
    this.timezone,
    this.newsletterSubscription,
    final Map<String, dynamic>? additionalPreferences,
    final Map<String, dynamic>? extensionAttributes,
  }) : _additionalPreferences = additionalPreferences,
       _extensionAttributes = extensionAttributes;

  factory _$CustomerPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPreferencesImplFromJson(json);

  @override
  final String? language;
  @override
  final String? currency;
  @override
  final String? timezone;
  @override
  final bool? newsletterSubscription;
  final Map<String, dynamic>? _additionalPreferences;
  @override
  Map<String, dynamic>? get additionalPreferences {
    final value = _additionalPreferences;
    if (value == null) return null;
    if (_additionalPreferences is EqualUnmodifiableMapView)
      return _additionalPreferences;
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
    return 'CustomerPreferences(language: $language, currency: $currency, timezone: $timezone, newsletterSubscription: $newsletterSubscription, additionalPreferences: $additionalPreferences, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPreferencesImpl &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.newsletterSubscription, newsletterSubscription) ||
                other.newsletterSubscription == newsletterSubscription) &&
            const DeepCollectionEquality().equals(
              other._additionalPreferences,
              _additionalPreferences,
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
    language,
    currency,
    timezone,
    newsletterSubscription,
    const DeepCollectionEquality().hash(_additionalPreferences),
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPreferencesImplCopyWith<_$CustomerPreferencesImpl> get copyWith =>
      __$$CustomerPreferencesImplCopyWithImpl<_$CustomerPreferencesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPreferencesImplToJson(this);
  }
}

abstract class _CustomerPreferences implements CustomerPreferences {
  const factory _CustomerPreferences({
    final String? language,
    final String? currency,
    final String? timezone,
    final bool? newsletterSubscription,
    final Map<String, dynamic>? additionalPreferences,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerPreferencesImpl;

  factory _CustomerPreferences.fromJson(Map<String, dynamic> json) =
      _$CustomerPreferencesImpl.fromJson;

  @override
  String? get language;
  @override
  String? get currency;
  @override
  String? get timezone;
  @override
  bool? get newsletterSubscription;
  @override
  Map<String, dynamic>? get additionalPreferences;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerPreferencesImplCopyWith<_$CustomerPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerActivity _$CustomerActivityFromJson(Map<String, dynamic> json) {
  return _CustomerActivity.fromJson(json);
}

/// @nodoc
mixin _$CustomerActivity {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerActivityCopyWith<CustomerActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerActivityCopyWith<$Res> {
  factory $CustomerActivityCopyWith(
    CustomerActivity value,
    $Res Function(CustomerActivity) then,
  ) = _$CustomerActivityCopyWithImpl<$Res, CustomerActivity>;
  @useResult
  $Res call({
    String id,
    String type,
    String description,
    DateTime timestamp,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerActivityCopyWithImpl<$Res, $Val extends CustomerActivity>
    implements $CustomerActivityCopyWith<$Res> {
  _$CustomerActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? metadata = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerActivityImplCopyWith<$Res>
    implements $CustomerActivityCopyWith<$Res> {
  factory _$$CustomerActivityImplCopyWith(
    _$CustomerActivityImpl value,
    $Res Function(_$CustomerActivityImpl) then,
  ) = __$$CustomerActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    String description,
    DateTime timestamp,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerActivityImplCopyWithImpl<$Res>
    extends _$CustomerActivityCopyWithImpl<$Res, _$CustomerActivityImpl>
    implements _$$CustomerActivityImplCopyWith<$Res> {
  __$$CustomerActivityImplCopyWithImpl(
    _$CustomerActivityImpl _value,
    $Res Function(_$CustomerActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? metadata = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerActivityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
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
class _$CustomerActivityImpl implements _CustomerActivity {
  const _$CustomerActivityImpl({
    required this.id,
    required this.type,
    required this.description,
    required this.timestamp,
    final Map<String, dynamic>? metadata,
    final Map<String, dynamic>? extensionAttributes,
  }) : _metadata = metadata,
       _extensionAttributes = extensionAttributes;

  factory _$CustomerActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String description;
  @override
  final DateTime timestamp;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
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
    return 'CustomerActivity(id: $id, type: $type, description: $description, timestamp: $timestamp, metadata: $metadata, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    description,
    timestamp,
    const DeepCollectionEquality().hash(_metadata),
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerActivityImplCopyWith<_$CustomerActivityImpl> get copyWith =>
      __$$CustomerActivityImplCopyWithImpl<_$CustomerActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerActivityImplToJson(this);
  }
}

abstract class _CustomerActivity implements CustomerActivity {
  const factory _CustomerActivity({
    required final String id,
    required final String type,
    required final String description,
    required final DateTime timestamp,
    final Map<String, dynamic>? metadata,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerActivityImpl;

  factory _CustomerActivity.fromJson(Map<String, dynamic> json) =
      _$CustomerActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get description;
  @override
  DateTime get timestamp;
  @override
  Map<String, dynamic>? get metadata;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerActivityImplCopyWith<_$CustomerActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerStatistics _$CustomerStatisticsFromJson(Map<String, dynamic> json) {
  return _CustomerStatistics.fromJson(json);
}

/// @nodoc
mixin _$CustomerStatistics {
  int get totalOrders => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  int get totalProductsPurchased => throw _privateConstructorUsedError;
  DateTime get firstOrderDate => throw _privateConstructorUsedError;
  DateTime? get lastOrderDate => throw _privateConstructorUsedError;
  double get averageOrderValue => throw _privateConstructorUsedError;
  int get wishlistItems => throw _privateConstructorUsedError;
  int get cartItems => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerStatisticsCopyWith<CustomerStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerStatisticsCopyWith<$Res> {
  factory $CustomerStatisticsCopyWith(
    CustomerStatistics value,
    $Res Function(CustomerStatistics) then,
  ) = _$CustomerStatisticsCopyWithImpl<$Res, CustomerStatistics>;
  @useResult
  $Res call({
    int totalOrders,
    double totalSpent,
    int totalProductsPurchased,
    DateTime firstOrderDate,
    DateTime? lastOrderDate,
    double averageOrderValue,
    int wishlistItems,
    int cartItems,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerStatisticsCopyWithImpl<$Res, $Val extends CustomerStatistics>
    implements $CustomerStatisticsCopyWith<$Res> {
  _$CustomerStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? totalProductsPurchased = null,
    Object? firstOrderDate = null,
    Object? lastOrderDate = freezed,
    Object? averageOrderValue = null,
    Object? wishlistItems = null,
    Object? cartItems = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalOrders: null == totalOrders
                ? _value.totalOrders
                : totalOrders // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSpent: null == totalSpent
                ? _value.totalSpent
                : totalSpent // ignore: cast_nullable_to_non_nullable
                      as double,
            totalProductsPurchased: null == totalProductsPurchased
                ? _value.totalProductsPurchased
                : totalProductsPurchased // ignore: cast_nullable_to_non_nullable
                      as int,
            firstOrderDate: null == firstOrderDate
                ? _value.firstOrderDate
                : firstOrderDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastOrderDate: freezed == lastOrderDate
                ? _value.lastOrderDate
                : lastOrderDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            averageOrderValue: null == averageOrderValue
                ? _value.averageOrderValue
                : averageOrderValue // ignore: cast_nullable_to_non_nullable
                      as double,
            wishlistItems: null == wishlistItems
                ? _value.wishlistItems
                : wishlistItems // ignore: cast_nullable_to_non_nullable
                      as int,
            cartItems: null == cartItems
                ? _value.cartItems
                : cartItems // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$CustomerStatisticsImplCopyWith<$Res>
    implements $CustomerStatisticsCopyWith<$Res> {
  factory _$$CustomerStatisticsImplCopyWith(
    _$CustomerStatisticsImpl value,
    $Res Function(_$CustomerStatisticsImpl) then,
  ) = __$$CustomerStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalOrders,
    double totalSpent,
    int totalProductsPurchased,
    DateTime firstOrderDate,
    DateTime? lastOrderDate,
    double averageOrderValue,
    int wishlistItems,
    int cartItems,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerStatisticsImplCopyWithImpl<$Res>
    extends _$CustomerStatisticsCopyWithImpl<$Res, _$CustomerStatisticsImpl>
    implements _$$CustomerStatisticsImplCopyWith<$Res> {
  __$$CustomerStatisticsImplCopyWithImpl(
    _$CustomerStatisticsImpl _value,
    $Res Function(_$CustomerStatisticsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOrders = null,
    Object? totalSpent = null,
    Object? totalProductsPurchased = null,
    Object? firstOrderDate = null,
    Object? lastOrderDate = freezed,
    Object? averageOrderValue = null,
    Object? wishlistItems = null,
    Object? cartItems = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerStatisticsImpl(
        totalOrders: null == totalOrders
            ? _value.totalOrders
            : totalOrders // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSpent: null == totalSpent
            ? _value.totalSpent
            : totalSpent // ignore: cast_nullable_to_non_nullable
                  as double,
        totalProductsPurchased: null == totalProductsPurchased
            ? _value.totalProductsPurchased
            : totalProductsPurchased // ignore: cast_nullable_to_non_nullable
                  as int,
        firstOrderDate: null == firstOrderDate
            ? _value.firstOrderDate
            : firstOrderDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastOrderDate: freezed == lastOrderDate
            ? _value.lastOrderDate
            : lastOrderDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        averageOrderValue: null == averageOrderValue
            ? _value.averageOrderValue
            : averageOrderValue // ignore: cast_nullable_to_non_nullable
                  as double,
        wishlistItems: null == wishlistItems
            ? _value.wishlistItems
            : wishlistItems // ignore: cast_nullable_to_non_nullable
                  as int,
        cartItems: null == cartItems
            ? _value.cartItems
            : cartItems // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$CustomerStatisticsImpl implements _CustomerStatistics {
  const _$CustomerStatisticsImpl({
    required this.totalOrders,
    required this.totalSpent,
    required this.totalProductsPurchased,
    required this.firstOrderDate,
    this.lastOrderDate,
    required this.averageOrderValue,
    required this.wishlistItems,
    required this.cartItems,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CustomerStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerStatisticsImplFromJson(json);

  @override
  final int totalOrders;
  @override
  final double totalSpent;
  @override
  final int totalProductsPurchased;
  @override
  final DateTime firstOrderDate;
  @override
  final DateTime? lastOrderDate;
  @override
  final double averageOrderValue;
  @override
  final int wishlistItems;
  @override
  final int cartItems;
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
    return 'CustomerStatistics(totalOrders: $totalOrders, totalSpent: $totalSpent, totalProductsPurchased: $totalProductsPurchased, firstOrderDate: $firstOrderDate, lastOrderDate: $lastOrderDate, averageOrderValue: $averageOrderValue, wishlistItems: $wishlistItems, cartItems: $cartItems, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerStatisticsImpl &&
            (identical(other.totalOrders, totalOrders) ||
                other.totalOrders == totalOrders) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.totalProductsPurchased, totalProductsPurchased) ||
                other.totalProductsPurchased == totalProductsPurchased) &&
            (identical(other.firstOrderDate, firstOrderDate) ||
                other.firstOrderDate == firstOrderDate) &&
            (identical(other.lastOrderDate, lastOrderDate) ||
                other.lastOrderDate == lastOrderDate) &&
            (identical(other.averageOrderValue, averageOrderValue) ||
                other.averageOrderValue == averageOrderValue) &&
            (identical(other.wishlistItems, wishlistItems) ||
                other.wishlistItems == wishlistItems) &&
            (identical(other.cartItems, cartItems) ||
                other.cartItems == cartItems) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalOrders,
    totalSpent,
    totalProductsPurchased,
    firstOrderDate,
    lastOrderDate,
    averageOrderValue,
    wishlistItems,
    cartItems,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerStatisticsImplCopyWith<_$CustomerStatisticsImpl> get copyWith =>
      __$$CustomerStatisticsImplCopyWithImpl<_$CustomerStatisticsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerStatisticsImplToJson(this);
  }
}

abstract class _CustomerStatistics implements CustomerStatistics {
  const factory _CustomerStatistics({
    required final int totalOrders,
    required final double totalSpent,
    required final int totalProductsPurchased,
    required final DateTime firstOrderDate,
    final DateTime? lastOrderDate,
    required final double averageOrderValue,
    required final int wishlistItems,
    required final int cartItems,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerStatisticsImpl;

  factory _CustomerStatistics.fromJson(Map<String, dynamic> json) =
      _$CustomerStatisticsImpl.fromJson;

  @override
  int get totalOrders;
  @override
  double get totalSpent;
  @override
  int get totalProductsPurchased;
  @override
  DateTime get firstOrderDate;
  @override
  DateTime? get lastOrderDate;
  @override
  double get averageOrderValue;
  @override
  int get wishlistItems;
  @override
  int get cartItems;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerStatisticsImplCopyWith<_$CustomerStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerNotificationPreferences _$CustomerNotificationPreferencesFromJson(
  Map<String, dynamic> json,
) {
  return _CustomerNotificationPreferences.fromJson(json);
}

/// @nodoc
mixin _$CustomerNotificationPreferences {
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get smsNotifications => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get orderUpdates => throw _privateConstructorUsedError;
  bool get promotionalOffers => throw _privateConstructorUsedError;
  bool get productRecommendations => throw _privateConstructorUsedError;
  bool get priceAlerts => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerNotificationPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerNotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerNotificationPreferencesCopyWith<CustomerNotificationPreferences>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerNotificationPreferencesCopyWith<$Res> {
  factory $CustomerNotificationPreferencesCopyWith(
    CustomerNotificationPreferences value,
    $Res Function(CustomerNotificationPreferences) then,
  ) =
      _$CustomerNotificationPreferencesCopyWithImpl<
        $Res,
        CustomerNotificationPreferences
      >;
  @useResult
  $Res call({
    bool emailNotifications,
    bool smsNotifications,
    bool pushNotifications,
    bool orderUpdates,
    bool promotionalOffers,
    bool productRecommendations,
    bool priceAlerts,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerNotificationPreferencesCopyWithImpl<
  $Res,
  $Val extends CustomerNotificationPreferences
>
    implements $CustomerNotificationPreferencesCopyWith<$Res> {
  _$CustomerNotificationPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerNotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailNotifications = null,
    Object? smsNotifications = null,
    Object? pushNotifications = null,
    Object? orderUpdates = null,
    Object? promotionalOffers = null,
    Object? productRecommendations = null,
    Object? priceAlerts = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            emailNotifications: null == emailNotifications
                ? _value.emailNotifications
                : emailNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            smsNotifications: null == smsNotifications
                ? _value.smsNotifications
                : smsNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            pushNotifications: null == pushNotifications
                ? _value.pushNotifications
                : pushNotifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            orderUpdates: null == orderUpdates
                ? _value.orderUpdates
                : orderUpdates // ignore: cast_nullable_to_non_nullable
                      as bool,
            promotionalOffers: null == promotionalOffers
                ? _value.promotionalOffers
                : promotionalOffers // ignore: cast_nullable_to_non_nullable
                      as bool,
            productRecommendations: null == productRecommendations
                ? _value.productRecommendations
                : productRecommendations // ignore: cast_nullable_to_non_nullable
                      as bool,
            priceAlerts: null == priceAlerts
                ? _value.priceAlerts
                : priceAlerts // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$CustomerNotificationPreferencesImplCopyWith<$Res>
    implements $CustomerNotificationPreferencesCopyWith<$Res> {
  factory _$$CustomerNotificationPreferencesImplCopyWith(
    _$CustomerNotificationPreferencesImpl value,
    $Res Function(_$CustomerNotificationPreferencesImpl) then,
  ) = __$$CustomerNotificationPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool emailNotifications,
    bool smsNotifications,
    bool pushNotifications,
    bool orderUpdates,
    bool promotionalOffers,
    bool productRecommendations,
    bool priceAlerts,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerNotificationPreferencesImplCopyWithImpl<$Res>
    extends
        _$CustomerNotificationPreferencesCopyWithImpl<
          $Res,
          _$CustomerNotificationPreferencesImpl
        >
    implements _$$CustomerNotificationPreferencesImplCopyWith<$Res> {
  __$$CustomerNotificationPreferencesImplCopyWithImpl(
    _$CustomerNotificationPreferencesImpl _value,
    $Res Function(_$CustomerNotificationPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerNotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailNotifications = null,
    Object? smsNotifications = null,
    Object? pushNotifications = null,
    Object? orderUpdates = null,
    Object? promotionalOffers = null,
    Object? productRecommendations = null,
    Object? priceAlerts = null,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerNotificationPreferencesImpl(
        emailNotifications: null == emailNotifications
            ? _value.emailNotifications
            : emailNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        smsNotifications: null == smsNotifications
            ? _value.smsNotifications
            : smsNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        pushNotifications: null == pushNotifications
            ? _value.pushNotifications
            : pushNotifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        orderUpdates: null == orderUpdates
            ? _value.orderUpdates
            : orderUpdates // ignore: cast_nullable_to_non_nullable
                  as bool,
        promotionalOffers: null == promotionalOffers
            ? _value.promotionalOffers
            : promotionalOffers // ignore: cast_nullable_to_non_nullable
                  as bool,
        productRecommendations: null == productRecommendations
            ? _value.productRecommendations
            : productRecommendations // ignore: cast_nullable_to_non_nullable
                  as bool,
        priceAlerts: null == priceAlerts
            ? _value.priceAlerts
            : priceAlerts // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$CustomerNotificationPreferencesImpl
    implements _CustomerNotificationPreferences {
  const _$CustomerNotificationPreferencesImpl({
    required this.emailNotifications,
    required this.smsNotifications,
    required this.pushNotifications,
    required this.orderUpdates,
    required this.promotionalOffers,
    required this.productRecommendations,
    required this.priceAlerts,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CustomerNotificationPreferencesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CustomerNotificationPreferencesImplFromJson(json);

  @override
  final bool emailNotifications;
  @override
  final bool smsNotifications;
  @override
  final bool pushNotifications;
  @override
  final bool orderUpdates;
  @override
  final bool promotionalOffers;
  @override
  final bool productRecommendations;
  @override
  final bool priceAlerts;
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
    return 'CustomerNotificationPreferences(emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, pushNotifications: $pushNotifications, orderUpdates: $orderUpdates, promotionalOffers: $promotionalOffers, productRecommendations: $productRecommendations, priceAlerts: $priceAlerts, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerNotificationPreferencesImpl &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.smsNotifications, smsNotifications) ||
                other.smsNotifications == smsNotifications) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.orderUpdates, orderUpdates) ||
                other.orderUpdates == orderUpdates) &&
            (identical(other.promotionalOffers, promotionalOffers) ||
                other.promotionalOffers == promotionalOffers) &&
            (identical(other.productRecommendations, productRecommendations) ||
                other.productRecommendations == productRecommendations) &&
            (identical(other.priceAlerts, priceAlerts) ||
                other.priceAlerts == priceAlerts) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    emailNotifications,
    smsNotifications,
    pushNotifications,
    orderUpdates,
    promotionalOffers,
    productRecommendations,
    priceAlerts,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerNotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerNotificationPreferencesImplCopyWith<
    _$CustomerNotificationPreferencesImpl
  >
  get copyWith =>
      __$$CustomerNotificationPreferencesImplCopyWithImpl<
        _$CustomerNotificationPreferencesImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerNotificationPreferencesImplToJson(this);
  }
}

abstract class _CustomerNotificationPreferences
    implements CustomerNotificationPreferences {
  const factory _CustomerNotificationPreferences({
    required final bool emailNotifications,
    required final bool smsNotifications,
    required final bool pushNotifications,
    required final bool orderUpdates,
    required final bool promotionalOffers,
    required final bool productRecommendations,
    required final bool priceAlerts,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerNotificationPreferencesImpl;

  factory _CustomerNotificationPreferences.fromJson(Map<String, dynamic> json) =
      _$CustomerNotificationPreferencesImpl.fromJson;

  @override
  bool get emailNotifications;
  @override
  bool get smsNotifications;
  @override
  bool get pushNotifications;
  @override
  bool get orderUpdates;
  @override
  bool get promotionalOffers;
  @override
  bool get productRecommendations;
  @override
  bool get priceAlerts;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerNotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerNotificationPreferencesImplCopyWith<
    _$CustomerNotificationPreferencesImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

CustomerLoyaltyPoints _$CustomerLoyaltyPointsFromJson(
  Map<String, dynamic> json,
) {
  return _CustomerLoyaltyPoints.fromJson(json);
}

/// @nodoc
mixin _$CustomerLoyaltyPoints {
  int get currentPoints => throw _privateConstructorUsedError;
  int get totalEarned => throw _privateConstructorUsedError;
  int get totalRedeemed => throw _privateConstructorUsedError;
  int get pointsToExpire => throw _privateConstructorUsedError;
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerLoyaltyPoints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerLoyaltyPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerLoyaltyPointsCopyWith<CustomerLoyaltyPoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerLoyaltyPointsCopyWith<$Res> {
  factory $CustomerLoyaltyPointsCopyWith(
    CustomerLoyaltyPoints value,
    $Res Function(CustomerLoyaltyPoints) then,
  ) = _$CustomerLoyaltyPointsCopyWithImpl<$Res, CustomerLoyaltyPoints>;
  @useResult
  $Res call({
    int currentPoints,
    int totalEarned,
    int totalRedeemed,
    int pointsToExpire,
    DateTime? expirationDate,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerLoyaltyPointsCopyWithImpl<
  $Res,
  $Val extends CustomerLoyaltyPoints
>
    implements $CustomerLoyaltyPointsCopyWith<$Res> {
  _$CustomerLoyaltyPointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerLoyaltyPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPoints = null,
    Object? totalEarned = null,
    Object? totalRedeemed = null,
    Object? pointsToExpire = null,
    Object? expirationDate = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentPoints: null == currentPoints
                ? _value.currentPoints
                : currentPoints // ignore: cast_nullable_to_non_nullable
                      as int,
            totalEarned: null == totalEarned
                ? _value.totalEarned
                : totalEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            totalRedeemed: null == totalRedeemed
                ? _value.totalRedeemed
                : totalRedeemed // ignore: cast_nullable_to_non_nullable
                      as int,
            pointsToExpire: null == pointsToExpire
                ? _value.pointsToExpire
                : pointsToExpire // ignore: cast_nullable_to_non_nullable
                      as int,
            expirationDate: freezed == expirationDate
                ? _value.expirationDate
                : expirationDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$CustomerLoyaltyPointsImplCopyWith<$Res>
    implements $CustomerLoyaltyPointsCopyWith<$Res> {
  factory _$$CustomerLoyaltyPointsImplCopyWith(
    _$CustomerLoyaltyPointsImpl value,
    $Res Function(_$CustomerLoyaltyPointsImpl) then,
  ) = __$$CustomerLoyaltyPointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentPoints,
    int totalEarned,
    int totalRedeemed,
    int pointsToExpire,
    DateTime? expirationDate,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerLoyaltyPointsImplCopyWithImpl<$Res>
    extends
        _$CustomerLoyaltyPointsCopyWithImpl<$Res, _$CustomerLoyaltyPointsImpl>
    implements _$$CustomerLoyaltyPointsImplCopyWith<$Res> {
  __$$CustomerLoyaltyPointsImplCopyWithImpl(
    _$CustomerLoyaltyPointsImpl _value,
    $Res Function(_$CustomerLoyaltyPointsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerLoyaltyPoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPoints = null,
    Object? totalEarned = null,
    Object? totalRedeemed = null,
    Object? pointsToExpire = null,
    Object? expirationDate = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerLoyaltyPointsImpl(
        currentPoints: null == currentPoints
            ? _value.currentPoints
            : currentPoints // ignore: cast_nullable_to_non_nullable
                  as int,
        totalEarned: null == totalEarned
            ? _value.totalEarned
            : totalEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        totalRedeemed: null == totalRedeemed
            ? _value.totalRedeemed
            : totalRedeemed // ignore: cast_nullable_to_non_nullable
                  as int,
        pointsToExpire: null == pointsToExpire
            ? _value.pointsToExpire
            : pointsToExpire // ignore: cast_nullable_to_non_nullable
                  as int,
        expirationDate: freezed == expirationDate
            ? _value.expirationDate
            : expirationDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$CustomerLoyaltyPointsImpl implements _CustomerLoyaltyPoints {
  const _$CustomerLoyaltyPointsImpl({
    required this.currentPoints,
    required this.totalEarned,
    required this.totalRedeemed,
    required this.pointsToExpire,
    this.expirationDate,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CustomerLoyaltyPointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerLoyaltyPointsImplFromJson(json);

  @override
  final int currentPoints;
  @override
  final int totalEarned;
  @override
  final int totalRedeemed;
  @override
  final int pointsToExpire;
  @override
  final DateTime? expirationDate;
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
    return 'CustomerLoyaltyPoints(currentPoints: $currentPoints, totalEarned: $totalEarned, totalRedeemed: $totalRedeemed, pointsToExpire: $pointsToExpire, expirationDate: $expirationDate, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerLoyaltyPointsImpl &&
            (identical(other.currentPoints, currentPoints) ||
                other.currentPoints == currentPoints) &&
            (identical(other.totalEarned, totalEarned) ||
                other.totalEarned == totalEarned) &&
            (identical(other.totalRedeemed, totalRedeemed) ||
                other.totalRedeemed == totalRedeemed) &&
            (identical(other.pointsToExpire, pointsToExpire) ||
                other.pointsToExpire == pointsToExpire) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentPoints,
    totalEarned,
    totalRedeemed,
    pointsToExpire,
    expirationDate,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerLoyaltyPoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerLoyaltyPointsImplCopyWith<_$CustomerLoyaltyPointsImpl>
  get copyWith =>
      __$$CustomerLoyaltyPointsImplCopyWithImpl<_$CustomerLoyaltyPointsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerLoyaltyPointsImplToJson(this);
  }
}

abstract class _CustomerLoyaltyPoints implements CustomerLoyaltyPoints {
  const factory _CustomerLoyaltyPoints({
    required final int currentPoints,
    required final int totalEarned,
    required final int totalRedeemed,
    required final int pointsToExpire,
    final DateTime? expirationDate,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerLoyaltyPointsImpl;

  factory _CustomerLoyaltyPoints.fromJson(Map<String, dynamic> json) =
      _$CustomerLoyaltyPointsImpl.fromJson;

  @override
  int get currentPoints;
  @override
  int get totalEarned;
  @override
  int get totalRedeemed;
  @override
  int get pointsToExpire;
  @override
  DateTime? get expirationDate;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerLoyaltyPoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerLoyaltyPointsImplCopyWith<_$CustomerLoyaltyPointsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CustomerSubscription _$CustomerSubscriptionFromJson(Map<String, dynamic> json) {
  return _CustomerSubscription.fromJson(json);
}

/// @nodoc
mixin _$CustomerSubscription {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerSubscription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerSubscriptionCopyWith<CustomerSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSubscriptionCopyWith<$Res> {
  factory $CustomerSubscriptionCopyWith(
    CustomerSubscription value,
    $Res Function(CustomerSubscription) then,
  ) = _$CustomerSubscriptionCopyWithImpl<$Res, CustomerSubscription>;
  @useResult
  $Res call({
    String id,
    String status,
    String type,
    DateTime startDate,
    DateTime? endDate,
    double amount,
    String currency,
    String? frequency,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerSubscriptionCopyWithImpl<
  $Res,
  $Val extends CustomerSubscription
>
    implements $CustomerSubscriptionCopyWith<$Res> {
  _$CustomerSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? type = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? frequency = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            frequency: freezed == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerSubscriptionImplCopyWith<$Res>
    implements $CustomerSubscriptionCopyWith<$Res> {
  factory _$$CustomerSubscriptionImplCopyWith(
    _$CustomerSubscriptionImpl value,
    $Res Function(_$CustomerSubscriptionImpl) then,
  ) = __$$CustomerSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String status,
    String type,
    DateTime startDate,
    DateTime? endDate,
    double amount,
    String currency,
    String? frequency,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerSubscriptionImplCopyWithImpl<$Res>
    extends _$CustomerSubscriptionCopyWithImpl<$Res, _$CustomerSubscriptionImpl>
    implements _$$CustomerSubscriptionImplCopyWith<$Res> {
  __$$CustomerSubscriptionImplCopyWithImpl(
    _$CustomerSubscriptionImpl _value,
    $Res Function(_$CustomerSubscriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? type = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? frequency = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerSubscriptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        frequency: freezed == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
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
class _$CustomerSubscriptionImpl implements _CustomerSubscription {
  const _$CustomerSubscriptionImpl({
    required this.id,
    required this.status,
    required this.type,
    required this.startDate,
    this.endDate,
    required this.amount,
    required this.currency,
    this.frequency,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CustomerSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSubscriptionImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final String type;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String? frequency;
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
    return 'CustomerSubscription(id: $id, status: $status, type: $type, startDate: $startDate, endDate: $endDate, amount: $amount, currency: $currency, frequency: $frequency, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    status,
    type,
    startDate,
    endDate,
    amount,
    currency,
    frequency,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSubscriptionImplCopyWith<_$CustomerSubscriptionImpl>
  get copyWith =>
      __$$CustomerSubscriptionImplCopyWithImpl<_$CustomerSubscriptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSubscriptionImplToJson(this);
  }
}

abstract class _CustomerSubscription implements CustomerSubscription {
  const factory _CustomerSubscription({
    required final String id,
    required final String status,
    required final String type,
    required final DateTime startDate,
    final DateTime? endDate,
    required final double amount,
    required final String currency,
    final String? frequency,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerSubscriptionImpl;

  factory _CustomerSubscription.fromJson(Map<String, dynamic> json) =
      _$CustomerSubscriptionImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get type;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String? get frequency;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerSubscriptionImplCopyWith<_$CustomerSubscriptionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) {
  return _CustomerReview.fromJson(json);
}

/// @nodoc
mixin _$CustomerReview {
  String get id => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  Map<String, dynamic>? get extensionAttributes =>
      throw _privateConstructorUsedError;

  /// Serializes this CustomerReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerReviewCopyWith<CustomerReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerReviewCopyWith<$Res> {
  factory $CustomerReviewCopyWith(
    CustomerReview value,
    $Res Function(CustomerReview) then,
  ) = _$CustomerReviewCopyWithImpl<$Res, CustomerReview>;
  @useResult
  $Res call({
    String id,
    String productId,
    String productName,
    String title,
    String detail,
    int rating,
    DateTime createdAt,
    DateTime? updatedAt,
    String? status,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class _$CustomerReviewCopyWithImpl<$Res, $Val extends CustomerReview>
    implements $CustomerReviewCopyWith<$Res> {
  _$CustomerReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? title = null,
    Object? detail = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as String,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            detail: null == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CustomerReviewImplCopyWith<$Res>
    implements $CustomerReviewCopyWith<$Res> {
  factory _$$CustomerReviewImplCopyWith(
    _$CustomerReviewImpl value,
    $Res Function(_$CustomerReviewImpl) then,
  ) = __$$CustomerReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String productId,
    String productName,
    String title,
    String detail,
    int rating,
    DateTime createdAt,
    DateTime? updatedAt,
    String? status,
    Map<String, dynamic>? extensionAttributes,
  });
}

/// @nodoc
class __$$CustomerReviewImplCopyWithImpl<$Res>
    extends _$CustomerReviewCopyWithImpl<$Res, _$CustomerReviewImpl>
    implements _$$CustomerReviewImplCopyWith<$Res> {
  __$$CustomerReviewImplCopyWithImpl(
    _$CustomerReviewImpl _value,
    $Res Function(_$CustomerReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? productId = null,
    Object? productName = null,
    Object? title = null,
    Object? detail = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? status = freezed,
    Object? extensionAttributes = freezed,
  }) {
    return _then(
      _$CustomerReviewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        detail: null == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
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
class _$CustomerReviewImpl implements _CustomerReview {
  const _$CustomerReviewImpl({
    required this.id,
    required this.productId,
    required this.productName,
    required this.title,
    required this.detail,
    required this.rating,
    required this.createdAt,
    this.updatedAt,
    this.status,
    final Map<String, dynamic>? extensionAttributes,
  }) : _extensionAttributes = extensionAttributes;

  factory _$CustomerReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerReviewImplFromJson(json);

  @override
  final String id;
  @override
  final String productId;
  @override
  final String productName;
  @override
  final String title;
  @override
  final String detail;
  @override
  final int rating;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? status;
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
    return 'CustomerReview(id: $id, productId: $productId, productName: $productName, title: $title, detail: $detail, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, status: $status, extensionAttributes: $extensionAttributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._extensionAttributes,
              _extensionAttributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    productId,
    productName,
    title,
    detail,
    rating,
    createdAt,
    updatedAt,
    status,
    const DeepCollectionEquality().hash(_extensionAttributes),
  );

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerReviewImplCopyWith<_$CustomerReviewImpl> get copyWith =>
      __$$CustomerReviewImplCopyWithImpl<_$CustomerReviewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerReviewImplToJson(this);
  }
}

abstract class _CustomerReview implements CustomerReview {
  const factory _CustomerReview({
    required final String id,
    required final String productId,
    required final String productName,
    required final String title,
    required final String detail,
    required final int rating,
    required final DateTime createdAt,
    final DateTime? updatedAt,
    final String? status,
    final Map<String, dynamic>? extensionAttributes,
  }) = _$CustomerReviewImpl;

  factory _CustomerReview.fromJson(Map<String, dynamic> json) =
      _$CustomerReviewImpl.fromJson;

  @override
  String get id;
  @override
  String get productId;
  @override
  String get productName;
  @override
  String get title;
  @override
  String get detail;
  @override
  int get rating;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get status;
  @override
  Map<String, dynamic>? get extensionAttributes;

  /// Create a copy of CustomerReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerReviewImplCopyWith<_$CustomerReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
