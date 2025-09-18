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
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('gender', instance.gender);
  writeNotNull('dateOfBirth', instance.dateOfBirth);
  writeNotNull('taxvat', instance.taxvat);
  writeNotNull('isSubscribed', instance.isSubscribed);
  writeNotNull('groupId', instance.groupId);
  writeNotNull('defaultBilling', instance.defaultBilling);
  writeNotNull('defaultShipping', instance.defaultShipping);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('customAttributes', instance.customAttributes);
  writeNotNull(
      'addresses', instance.addresses?.map((e) => e.toJson()).toList());
  return val;
}

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

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
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
  writeNotNull('company', instance.company);
  val['street'] = instance.street;
  val['city'] = instance.city;
  val['region'] = instance.region;
  val['postcode'] = instance.postcode;
  val['countryId'] = instance.countryId;
  writeNotNull('telephone', instance.telephone);
  writeNotNull('fax', instance.fax);
  writeNotNull('vatId', instance.vatId);
  writeNotNull('isDefaultBilling', instance.isDefaultBilling);
  writeNotNull('isDefaultShipping', instance.isDefaultShipping);
  writeNotNull('customAttributes', instance.customAttributes);
  return val;
}
