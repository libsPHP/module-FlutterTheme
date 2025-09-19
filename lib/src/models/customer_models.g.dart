// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerAddressImpl _$$CustomerAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerAddressImpl(
      id: (json['id'] as num).toInt(),
      customerId: json['customerId'] as String?,
      customerAddressId: json['customerAddressId'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      company: json['company'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
      city: json['city'] as String?,
      region: json['region'] as String?,
      regionId: json['regionId'] as String?,
      regionCode: json['regionCode'] as String?,
      postcode: json['postcode'] as String?,
      countryId: json['countryId'] as String?,
      telephone: json['telephone'] as String?,
      fax: json['fax'] as String?,
      isDefaultShipping: json['isDefaultShipping'] as bool?,
      isDefaultBilling: json['isDefaultBilling'] as bool?,
      customAttributes: json['customAttributes'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerAddressImplToJson(
    _$CustomerAddressImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customerId', instance.customerId);
  writeNotNull('customerAddressId', instance.customerAddressId);
  writeNotNull('email', instance.email);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('middleName', instance.middleName);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('company', instance.company);
  writeNotNull('street', instance.street);
  writeNotNull('city', instance.city);
  writeNotNull('region', instance.region);
  writeNotNull('regionId', instance.regionId);
  writeNotNull('regionCode', instance.regionCode);
  writeNotNull('postcode', instance.postcode);
  writeNotNull('countryId', instance.countryId);
  writeNotNull('telephone', instance.telephone);
  writeNotNull('fax', instance.fax);
  writeNotNull('isDefaultShipping', instance.isDefaultShipping);
  writeNotNull('isDefaultBilling', instance.isDefaultBilling);
  writeNotNull('customAttributes', instance.customAttributes);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerGroupImpl _$$CustomerGroupImplFromJson(Map<String, dynamic> json) =>
    _$CustomerGroupImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      taxClassName: json['taxClassName'] as String,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerGroupImplToJson(_$CustomerGroupImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'code': instance.code,
    'taxClassName': instance.taxClassName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerAttributeImpl _$$CustomerAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerAttributeImpl(
      attributeCode: json['attributeCode'] as String,
      frontendInput: json['frontendInput'] as String,
      frontendLabel: json['frontendLabel'] as String,
      isRequired: json['isRequired'] as bool,
      isUserDefined: json['isUserDefined'] as bool,
      isVisible: json['isVisible'] as bool,
      isSystem: json['isSystem'] as bool,
      sortOrder: (json['sortOrder'] as num).toInt(),
      defaultValue: json['defaultValue'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) =>
              CustomerAttributeOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      validationRules: json['validationRules'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerAttributeImplToJson(
    _$CustomerAttributeImpl instance) {
  final val = <String, dynamic>{
    'attributeCode': instance.attributeCode,
    'frontendInput': instance.frontendInput,
    'frontendLabel': instance.frontendLabel,
    'isRequired': instance.isRequired,
    'isUserDefined': instance.isUserDefined,
    'isVisible': instance.isVisible,
    'isSystem': instance.isSystem,
    'sortOrder': instance.sortOrder,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('defaultValue', instance.defaultValue);
  writeNotNull('options', instance.options?.map((e) => e.toJson()).toList());
  writeNotNull('validationRules', instance.validationRules);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerAttributeOptionImpl _$$CustomerAttributeOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerAttributeOptionImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerAttributeOptionImplToJson(
    _$CustomerAttributeOptionImpl instance) {
  final val = <String, dynamic>{
    'value': instance.value,
    'label': instance.label,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerPreferencesImpl _$$CustomerPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerPreferencesImpl(
      language: json['language'] as String?,
      currency: json['currency'] as String?,
      timezone: json['timezone'] as String?,
      newsletterSubscription: json['newsletterSubscription'] as bool?,
      additionalPreferences:
          json['additionalPreferences'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerPreferencesImplToJson(
    _$CustomerPreferencesImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  writeNotNull('currency', instance.currency);
  writeNotNull('timezone', instance.timezone);
  writeNotNull('newsletterSubscription', instance.newsletterSubscription);
  writeNotNull('additionalPreferences', instance.additionalPreferences);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerActivityImpl _$$CustomerActivityImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerActivityImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerActivityImplToJson(
    _$CustomerActivityImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': instance.type,
    'description': instance.description,
    'timestamp': instance.timestamp.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerStatisticsImpl _$$CustomerStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerStatisticsImpl(
      totalOrders: (json['totalOrders'] as num).toInt(),
      totalSpent: (json['totalSpent'] as num).toDouble(),
      totalProductsPurchased: (json['totalProductsPurchased'] as num).toInt(),
      firstOrderDate: DateTime.parse(json['firstOrderDate'] as String),
      lastOrderDate: json['lastOrderDate'] == null
          ? null
          : DateTime.parse(json['lastOrderDate'] as String),
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      wishlistItems: (json['wishlistItems'] as num).toInt(),
      cartItems: (json['cartItems'] as num).toInt(),
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerStatisticsImplToJson(
    _$CustomerStatisticsImpl instance) {
  final val = <String, dynamic>{
    'totalOrders': instance.totalOrders,
    'totalSpent': instance.totalSpent,
    'totalProductsPurchased': instance.totalProductsPurchased,
    'firstOrderDate': instance.firstOrderDate.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('lastOrderDate', instance.lastOrderDate?.toIso8601String());
  val['averageOrderValue'] = instance.averageOrderValue;
  val['wishlistItems'] = instance.wishlistItems;
  val['cartItems'] = instance.cartItems;
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerNotificationPreferencesImpl
    _$$CustomerNotificationPreferencesImplFromJson(Map<String, dynamic> json) =>
        _$CustomerNotificationPreferencesImpl(
          emailNotifications: json['emailNotifications'] as bool,
          smsNotifications: json['smsNotifications'] as bool,
          pushNotifications: json['pushNotifications'] as bool,
          orderUpdates: json['orderUpdates'] as bool,
          promotionalOffers: json['promotionalOffers'] as bool,
          productRecommendations: json['productRecommendations'] as bool,
          priceAlerts: json['priceAlerts'] as bool,
          extensionAttributes:
              json['extensionAttributes'] as Map<String, dynamic>?,
        );

Map<String, dynamic> _$$CustomerNotificationPreferencesImplToJson(
    _$CustomerNotificationPreferencesImpl instance) {
  final val = <String, dynamic>{
    'emailNotifications': instance.emailNotifications,
    'smsNotifications': instance.smsNotifications,
    'pushNotifications': instance.pushNotifications,
    'orderUpdates': instance.orderUpdates,
    'promotionalOffers': instance.promotionalOffers,
    'productRecommendations': instance.productRecommendations,
    'priceAlerts': instance.priceAlerts,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerLoyaltyPointsImpl _$$CustomerLoyaltyPointsImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerLoyaltyPointsImpl(
      currentPoints: (json['currentPoints'] as num).toInt(),
      totalEarned: (json['totalEarned'] as num).toInt(),
      totalRedeemed: (json['totalRedeemed'] as num).toInt(),
      pointsToExpire: (json['pointsToExpire'] as num).toInt(),
      expirationDate: json['expirationDate'] == null
          ? null
          : DateTime.parse(json['expirationDate'] as String),
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerLoyaltyPointsImplToJson(
    _$CustomerLoyaltyPointsImpl instance) {
  final val = <String, dynamic>{
    'currentPoints': instance.currentPoints,
    'totalEarned': instance.totalEarned,
    'totalRedeemed': instance.totalRedeemed,
    'pointsToExpire': instance.pointsToExpire,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expirationDate', instance.expirationDate?.toIso8601String());
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerSubscriptionImpl _$$CustomerSubscriptionImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerSubscriptionImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      frequency: json['frequency'] as String?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerSubscriptionImplToJson(
    _$CustomerSubscriptionImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': instance.status,
    'type': instance.type,
    'startDate': instance.startDate.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('endDate', instance.endDate?.toIso8601String());
  val['amount'] = instance.amount;
  val['currency'] = instance.currency;
  writeNotNull('frequency', instance.frequency);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CustomerReviewImpl _$$CustomerReviewImplFromJson(Map<String, dynamic> json) =>
    _$CustomerReviewImpl(
      id: json['id'] as String,
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      title: json['title'] as String,
      detail: json['detail'] as String,
      rating: (json['rating'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      status: json['status'] as String?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerReviewImplToJson(
    _$CustomerReviewImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'productId': instance.productId,
    'productName': instance.productName,
    'title': instance.title,
    'detail': instance.detail,
    'rating': instance.rating,
    'createdAt': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('status', instance.status);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}
