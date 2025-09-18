// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'customer': instance.customer.toJson(),
    };

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      middlename: json['middlename'] as String?,
      groupId: (json['groupId'] as num?)?.toInt(),
      dob: json['dob'] as String?,
      taxvat: json['taxvat'] as String?,
      gender: json['gender'] as String?,
      isSubscribed: json['isSubscribed'] as bool?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      defaultBilling: json['defaultBilling'] as String?,
      defaultShipping: json['defaultShipping'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'email': instance.email,
    'firstname': instance.firstname,
    'lastname': instance.lastname,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('middlename', instance.middlename);
  writeNotNull('groupId', instance.groupId);
  writeNotNull('dob', instance.dob);
  writeNotNull('taxvat', instance.taxvat);
  writeNotNull('gender', instance.gender);
  writeNotNull('isSubscribed', instance.isSubscribed);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('defaultBilling', instance.defaultBilling);
  writeNotNull('defaultShipping', instance.defaultShipping);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull(
      'addresses', instance.addresses?.map((e) => e.toJson()).toList());
  return val;
}

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      region: json['region'] as String?,
      regionId: json['regionId'] as String?,
      regionCode: json['regionCode'] as String?,
      countryId: json['countryId'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      vatId: json['vatId'] as String?,
      defaultShipping: json['defaultShipping'] as bool?,
      defaultBilling: json['defaultBilling'] as bool?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('region', instance.region);
  writeNotNull('regionId', instance.regionId);
  writeNotNull('regionCode', instance.regionCode);
  writeNotNull('countryId', instance.countryId);
  writeNotNull('street', instance.street);
  writeNotNull('company', instance.company);
  writeNotNull('telephone', instance.telephone);
  writeNotNull('fax', instance.fax);
  writeNotNull('postcode', instance.postcode);
  writeNotNull('city', instance.city);
  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('middlename', instance.middlename);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('vatId', instance.vatId);
  writeNotNull('defaultShipping', instance.defaultShipping);
  writeNotNull('defaultBilling', instance.defaultBilling);
  return val;
}

_$CustomerCreateRequestImpl _$$CustomerCreateRequestImplFromJson(
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
      isSubscribed: json['isSubscribed'] as bool?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomerCreateRequestImplToJson(
    _$CustomerCreateRequestImpl instance) {
  final val = <String, dynamic>{
    'email': instance.email,
    'password': instance.password,
    'firstname': instance.firstname,
    'lastname': instance.lastname,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('middlename', instance.middlename);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('dob', instance.dob);
  writeNotNull('taxvat', instance.taxvat);
  writeNotNull('gender', instance.gender);
  writeNotNull('isSubscribed', instance.isSubscribed);
  writeNotNull(
      'addresses', instance.addresses?.map((e) => e.toJson()).toList());
  return val;
}

_$CustomerUpdateRequestImpl _$$CustomerUpdateRequestImplFromJson(
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
      isSubscribed: json['isSubscribed'] as bool?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomerUpdateRequestImplToJson(
    _$CustomerUpdateRequestImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('middlename', instance.middlename);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('dob', instance.dob);
  writeNotNull('taxvat', instance.taxvat);
  writeNotNull('gender', instance.gender);
  writeNotNull('isSubscribed', instance.isSubscribed);
  writeNotNull(
      'addresses', instance.addresses?.map((e) => e.toJson()).toList());
  return val;
}

_$PasswordChangeRequestImpl _$$PasswordChangeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordChangeRequestImpl(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$$PasswordChangeRequestImplToJson(
        _$PasswordChangeRequestImpl instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };

_$PasswordResetRequestImpl _$$PasswordResetRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PasswordResetRequestImpl(
      email: json['email'] as String,
    );

Map<String, dynamic> _$$PasswordResetRequestImplToJson(
        _$PasswordResetRequestImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

_$SocialLoginRequestImpl _$$SocialLoginRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialLoginRequestImpl(
      provider: json['provider'] as String,
      token: json['token'] as String,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$$SocialLoginRequestImplToJson(
    _$SocialLoginRequestImpl instance) {
  final val = <String, dynamic>{
    'provider': instance.provider,
    'token': instance.token,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  return val;
}

_$TokenRefreshRequestImpl _$$TokenRefreshRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenRefreshRequestImpl(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$TokenRefreshRequestImplToJson(
        _$TokenRefreshRequestImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

_$SessionInfoImpl _$$SessionInfoImplFromJson(Map<String, dynamic> json) =>
    _$SessionInfoImpl(
      sessionId: json['sessionId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      isValid: json['isValid'] as bool,
      customerId: json['customerId'] as String?,
      cartId: json['cartId'] as String?,
    );

Map<String, dynamic> _$$SessionInfoImplToJson(_$SessionInfoImpl instance) {
  final val = <String, dynamic>{
    'sessionId': instance.sessionId,
    'createdAt': instance.createdAt.toIso8601String(),
    'expiresAt': instance.expiresAt.toIso8601String(),
    'isValid': instance.isValid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customerId', instance.customerId);
  writeNotNull('cartId', instance.cartId);
  return val;
}
