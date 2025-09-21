// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      middlename: json['middlename'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      taxvat: json['taxvat'] as String?,
      isSubscribed: json['isSubscribed'] as bool?,
      groupId: json['groupId'] as String?,
      defaultBilling: json['defaultBilling'] as String?,
      defaultShipping: json['defaultShipping'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      customAttributes: json['customAttributes'] as Map<String, dynamic>?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CustomerImplToJson(
  _$CustomerImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  if (instance.middlename case final value?) 'middlename': value,
  if (instance.prefix case final value?) 'prefix': value,
  if (instance.suffix case final value?) 'suffix': value,
  if (instance.gender case final value?) 'gender': value,
  if (instance.dateOfBirth case final value?) 'dateOfBirth': value,
  if (instance.taxvat case final value?) 'taxvat': value,
  if (instance.isSubscribed case final value?) 'isSubscribed': value,
  if (instance.groupId case final value?) 'groupId': value,
  if (instance.defaultBilling case final value?) 'defaultBilling': value,
  if (instance.defaultShipping case final value?) 'defaultShipping': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
  if (instance.customAttributes case final value?) 'customAttributes': value,
  if (instance.addresses?.map((e) => e.toJson()).toList() case final value?)
    'addresses': value,
};

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num).toInt(),
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      middlename: json['middlename'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      company: json['company'] as String?,
      street: json['street'] as String,
      city: json['city'] as String,
      region: json['region'] as String,
      postcode: json['postcode'] as String,
      countryId: json['countryId'] as String,
      telephone: json['telephone'] as String?,
      fax: json['fax'] as String?,
      vatId: json['vatId'] as String?,
      isDefaultBilling: json['isDefaultBilling'] as bool?,
      isDefaultShipping: json['isDefaultShipping'] as bool?,
      customAttributes: json['customAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AddressImplToJson(
  _$AddressImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  if (instance.middlename case final value?) 'middlename': value,
  if (instance.prefix case final value?) 'prefix': value,
  if (instance.suffix case final value?) 'suffix': value,
  if (instance.company case final value?) 'company': value,
  'street': instance.street,
  'city': instance.city,
  'region': instance.region,
  'postcode': instance.postcode,
  'countryId': instance.countryId,
  if (instance.telephone case final value?) 'telephone': value,
  if (instance.fax case final value?) 'fax': value,
  if (instance.vatId case final value?) 'vatId': value,
  if (instance.isDefaultBilling case final value?) 'isDefaultBilling': value,
  if (instance.isDefaultShipping case final value?) 'isDefaultShipping': value,
  if (instance.customAttributes case final value?) 'customAttributes': value,
};
