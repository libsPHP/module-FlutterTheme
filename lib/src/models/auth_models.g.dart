// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'customer': instance.customer,
    };

_$CustomerImpl _$CustomerFromJson(Map<String, dynamic> json) => _$CustomerImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      middlename: json['middlename'] as String?,
      groupId: (json['group_id'] as num?)?.toInt(),
      dob: json['dob'] as String?,
      taxvat: json['taxvat'] as String?,
      gender: json['gender'] as String?,
      isSubscribed: json['is_subscribed'] as bool?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      defaultBilling: json['default_billing'] as String?,
      defaultShipping: json['default_shipping'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'middlename': instance.middlename,
      'group_id': instance.groupId,
      'dob': instance.dob,
      'taxvat': instance.taxvat,
      'gender': instance.gender,
      'is_subscribed': instance.isSubscribed,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'default_billing': instance.defaultBilling,
      'default_shipping': instance.defaultShipping,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'addresses': instance.addresses,
    };

_$AddressImpl _$AddressFromJson(Map<String, dynamic> json) => _$AddressImpl(
      id: (json['id'] as num?)?.toInt(),
      customerId: json['customer_id'] as String?,
      region: json['region'] as String?,
      regionId: json['region_id'] as String?,
      regionCode: json['region_code'] as String?,
      countryId: json['country_id'] as String?,
      street: (json['street'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      company: json['company'] as String?,
      telephone: json['telephone'] as String?,
      fax: json['fax'] as String?,
      postcode: json['postcode'] as String?,
      city: json['city'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      middlename: json['middlename'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      vatId: json['vat_id'] as String?,
      defaultShipping: json['default_shipping'] as bool?,
      defaultBilling: json['default_billing'] as bool?,
    );

Map<String, dynamic> _$AddressToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'region': instance.region,
      'region_id': instance.regionId,
      'region_code': instance.regionCode,
      'country_id': instance.countryId,
      'street': instance.street,
      'company': instance.company,
      'telephone': instance.telephone,
      'fax': instance.fax,
      'postcode': instance.postcode,
      'city': instance.city,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'middlename': instance.middlename,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'vat_id': instance.vatId,
      'default_shipping': instance.defaultShipping,
      'default_billing': instance.defaultBilling,
    };

_$CustomerCreateRequestImpl _$CustomerCreateRequestFromJson(
        Map<String, dynamic> json) =>
    _$CustomerCreateRequestImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      middlename: json['middlename'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      dob: json['dob'] as String?,
      taxvat: json['taxvat'] as String?,
      gender: json['gender'] as String?,
      isSubscribed: json['is_subscribed'] as bool?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerCreateRequestToJson(
        _$CustomerCreateRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'middlename': instance.middlename,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'dob': instance.dob,
      'taxvat': instance.taxvat,
      'gender': instance.gender,
      'is_subscribed': instance.isSubscribed,
      'addresses': instance.addresses,
    };

_$CustomerUpdateRequestImpl _$CustomerUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    _$CustomerUpdateRequestImpl(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      middlename: json['middlename'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      dob: json['dob'] as String?,
      taxvat: json['taxvat'] as String?,
      gender: json['gender'] as String?,
      isSubscribed: json['is_subscribed'] as bool?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerUpdateRequestToJson(
        _$CustomerUpdateRequestImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'middlename': instance.middlename,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'dob': instance.dob,
      'taxvat': instance.taxvat,
      'gender': instance.gender,
      'is_subscribed': instance.isSubscribed,
      'addresses': instance.addresses,
    };

_$PasswordChangeRequestImpl _$PasswordChangeRequestFromJson(
        Map<String, dynamic> json) =>
    _$PasswordChangeRequestImpl(
      currentPassword: json['current_password'] as String,
      newPassword: json['new_password'] as String,
    );

Map<String, dynamic> _$PasswordChangeRequestToJson(
        _$PasswordChangeRequestImpl instance) =>
    <String, dynamic>{
      'current_password': instance.currentPassword,
      'new_password': instance.newPassword,
    };

_$PasswordResetRequestImpl _$PasswordResetRequestFromJson(
        Map<String, dynamic> json) =>
    _$PasswordResetRequestImpl(
      email: json['email'] as String,
    );

Map<String, dynamic> _$PasswordResetRequestToJson(
        _$PasswordResetRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

_$SocialLoginRequestImpl _$SocialLoginRequestFromJson(
        Map<String, dynamic> json) =>
    _$SocialLoginRequestImpl(
      provider: json['provider'] as String,
      token: json['token'] as String,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$SocialLoginRequestToJson(
        _$SocialLoginRequestImpl instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'token': instance.token,
      'email': instance.email,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

_$TokenRefreshRequestImpl _$TokenRefreshRequestFromJson(
        Map<String, dynamic> json) =>
    _$TokenRefreshRequestImpl(
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$TokenRefreshRequestToJson(
        _$TokenRefreshRequestImpl instance) =>
    <String, dynamic>{
      'refresh_token': instance.refreshToken,
    };

_$SessionInfoImpl _$SessionInfoFromJson(Map<String, dynamic> json) =>
    _$SessionInfoImpl(
      sessionId: json['session_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      isValid: json['is_valid'] as bool,
      customerId: json['customer_id'] as String?,
      cartId: json['cart_id'] as String?,
    );

Map<String, dynamic> _$SessionInfoToJson(_$SessionInfoImpl instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'created_at': instance.createdAt.toIso8601String(),
      'expires_at': instance.expiresAt.toIso8601String(),
      'is_valid': instance.isValid,
      'customer_id': instance.customerId,
      'cart_id': instance.cartId,
    };