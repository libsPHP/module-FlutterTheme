// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
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

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'middlename': ?instance.middlename,
  'prefix': ?instance.prefix,
  'suffix': ?instance.suffix,
  'gender': ?instance.gender,
  'dateOfBirth': ?instance.dateOfBirth,
  'taxvat': ?instance.taxvat,
  'isSubscribed': ?instance.isSubscribed,
  'groupId': ?instance.groupId,
  'defaultBilling': ?instance.defaultBilling,
  'defaultShipping': ?instance.defaultShipping,
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
  'customAttributes': ?instance.customAttributes,
  'addresses': ?instance.addresses?.map((e) => e.toJson()).toList(),
};

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
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

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'id': instance.id,
  'firstname': instance.firstname,
  'lastname': instance.lastname,
  'middlename': ?instance.middlename,
  'prefix': ?instance.prefix,
  'suffix': ?instance.suffix,
  'company': ?instance.company,
  'street': instance.street,
  'city': instance.city,
  'region': instance.region,
  'postcode': instance.postcode,
  'countryId': instance.countryId,
  'telephone': ?instance.telephone,
  'fax': ?instance.fax,
  'vatId': ?instance.vatId,
  'isDefaultBilling': ?instance.isDefaultBilling,
  'isDefaultShipping': ?instance.isDefaultShipping,
  'customAttributes': ?instance.customAttributes,
};
