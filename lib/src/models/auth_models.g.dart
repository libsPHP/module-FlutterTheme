// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'customer': instance.customer.toJson(),
    };

_CustomerCreateRequest _$CustomerCreateRequestFromJson(
  Map<String, dynamic> json,
) => _CustomerCreateRequest(
  email: json['email'] as String,
  password: json['password'] as String,
  firstname: json['firstname'] as String,
  lastname: json['lastname'] as String,
  middlename: json['middlename'] as String?,
  prefix: json['prefix'] as String?,
  suffix: json['suffix'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  taxvat: json['taxvat'] as String?,
  gender: json['gender'] as String?,
  isSubscribed: json['isSubscribed'] as bool?,
  addresses: (json['addresses'] as List<dynamic>?)
      ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CustomerCreateRequestToJson(
  _CustomerCreateRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'middlename': ?instance.middlename,
  'prefix': ?instance.prefix,
  'suffix': ?instance.suffix,
  'dateOfBirth': ?instance.dateOfBirth,
  'taxvat': ?instance.taxvat,
  'gender': ?instance.gender,
  'isSubscribed': ?instance.isSubscribed,
  'addresses': ?instance.addresses?.map((e) => e.toJson()).toList(),
};

_CustomerUpdateRequest _$CustomerUpdateRequestFromJson(
  Map<String, dynamic> json,
) => _CustomerUpdateRequest(
  firstname: json['firstname'] as String?,
  lastname: json['lastname'] as String?,
  middlename: json['middlename'] as String?,
  prefix: json['prefix'] as String?,
  suffix: json['suffix'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  taxvat: json['taxvat'] as String?,
  gender: json['gender'] as String?,
  isSubscribed: json['isSubscribed'] as bool?,
  addresses: (json['addresses'] as List<dynamic>?)
      ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CustomerUpdateRequestToJson(
  _CustomerUpdateRequest instance,
) => <String, dynamic>{
  'firstname': ?instance.firstname,
  'lastname': ?instance.lastname,
  'middlename': ?instance.middlename,
  'prefix': ?instance.prefix,
  'suffix': ?instance.suffix,
  'dateOfBirth': ?instance.dateOfBirth,
  'taxvat': ?instance.taxvat,
  'gender': ?instance.gender,
  'isSubscribed': ?instance.isSubscribed,
  'addresses': ?instance.addresses?.map((e) => e.toJson()).toList(),
};

_PasswordChangeRequest _$PasswordChangeRequestFromJson(
  Map<String, dynamic> json,
) => _PasswordChangeRequest(
  currentPassword: json['currentPassword'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$PasswordChangeRequestToJson(
  _PasswordChangeRequest instance,
) => <String, dynamic>{
  'currentPassword': instance.currentPassword,
  'newPassword': instance.newPassword,
};

_PasswordResetRequest _$PasswordResetRequestFromJson(
  Map<String, dynamic> json,
) => _PasswordResetRequest(email: json['email'] as String);

Map<String, dynamic> _$PasswordResetRequestToJson(
  _PasswordResetRequest instance,
) => <String, dynamic>{'email': instance.email};

_SocialLoginRequest _$SocialLoginRequestFromJson(Map<String, dynamic> json) =>
    _SocialLoginRequest(
      provider: json['provider'] as String,
      token: json['token'] as String,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );

Map<String, dynamic> _$SocialLoginRequestToJson(_SocialLoginRequest instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'token': instance.token,
      'email': ?instance.email,
      'firstname': ?instance.firstname,
      'lastname': ?instance.lastname,
    };

_TokenRefreshRequest _$TokenRefreshRequestFromJson(Map<String, dynamic> json) =>
    _TokenRefreshRequest(refreshToken: json['refreshToken'] as String);

Map<String, dynamic> _$TokenRefreshRequestToJson(
  _TokenRefreshRequest instance,
) => <String, dynamic>{'refreshToken': instance.refreshToken};

_SessionInfo _$SessionInfoFromJson(Map<String, dynamic> json) => _SessionInfo(
  sessionId: json['sessionId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  isValid: json['isValid'] as bool,
  customerId: json['customerId'] as String?,
  cartId: json['cartId'] as String?,
);

Map<String, dynamic> _$SessionInfoToJson(_SessionInfo instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'isValid': instance.isValid,
      'customerId': ?instance.customerId,
      'cartId': ?instance.cartId,
    };
