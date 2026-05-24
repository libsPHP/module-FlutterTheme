// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  middleName: json['middleName'] as String?,
  prefix: json['prefix'] as String?,
  suffix: json['suffix'] as String?,
  groupId: (json['groupId'] as num?)?.toInt(),
  defaultBilling: (json['defaultBilling'] as num?)?.toInt(),
  defaultShipping: (json['defaultShipping'] as num?)?.toInt(),
  taxvat: json['taxvat'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  websiteId: (json['websiteId'] as num?)?.toInt(),
  isSubscribed: json['isSubscribed'] as bool?,
  gender: (json['gender'] as num?)?.toInt(),
  addresses: (json['addresses'] as List<dynamic>?)
      ?.map((e) => CustomerAddress.fromJson(e as Map<String, dynamic>))
      .toList(),
  customAttributes: json['customAttributes'] as Map<String, dynamic>?,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'firstName': ?instance.firstName,
  'lastName': ?instance.lastName,
  'middleName': ?instance.middleName,
  'prefix': ?instance.prefix,
  'suffix': ?instance.suffix,
  'groupId': ?instance.groupId,
  'defaultBilling': ?instance.defaultBilling,
  'defaultShipping': ?instance.defaultShipping,
  'taxvat': ?instance.taxvat,
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
  'websiteId': ?instance.websiteId,
  'isSubscribed': ?instance.isSubscribed,
  'gender': ?instance.gender,
  'addresses': ?instance.addresses?.map((e) => e.toJson()).toList(),
  'customAttributes': ?instance.customAttributes,
  'extensionAttributes': ?instance.extensionAttributes,
};

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  id: (json['id'] as num?)?.toInt(),
  customerId: json['customerId'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  company: json['company'] as String?,
  street: (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
  city: json['city'] as String?,
  region: json['region'] as String?,
  regionId: json['regionId'] as String?,
  postcode: json['postcode'] as String?,
  countryId: json['countryId'] as String?,
  telephone: json['telephone'] as String?,
  fax: json['fax'] as String?,
  defaultShipping: json['defaultShipping'] as bool?,
  defaultBilling: json['defaultBilling'] as bool?,
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'id': ?instance.id,
  'customerId': ?instance.customerId,
  'firstName': ?instance.firstName,
  'lastName': ?instance.lastName,
  'company': ?instance.company,
  'street': ?instance.street,
  'city': ?instance.city,
  'region': ?instance.region,
  'regionId': ?instance.regionId,
  'postcode': ?instance.postcode,
  'countryId': ?instance.countryId,
  'telephone': ?instance.telephone,
  'fax': ?instance.fax,
  'defaultShipping': ?instance.defaultShipping,
  'defaultBilling': ?instance.defaultBilling,
};

_CustomerAddress _$CustomerAddressFromJson(Map<String, dynamic> json) =>
    _CustomerAddress(
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
      street: (json['street'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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

Map<String, dynamic> _$CustomerAddressToJson(_CustomerAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': ?instance.customerId,
      'customerAddressId': ?instance.customerAddressId,
      'email': ?instance.email,
      'firstName': ?instance.firstName,
      'lastName': ?instance.lastName,
      'middleName': ?instance.middleName,
      'prefix': ?instance.prefix,
      'suffix': ?instance.suffix,
      'company': ?instance.company,
      'street': ?instance.street,
      'city': ?instance.city,
      'region': ?instance.region,
      'regionId': ?instance.regionId,
      'regionCode': ?instance.regionCode,
      'postcode': ?instance.postcode,
      'countryId': ?instance.countryId,
      'telephone': ?instance.telephone,
      'fax': ?instance.fax,
      'isDefaultShipping': ?instance.isDefaultShipping,
      'isDefaultBilling': ?instance.isDefaultBilling,
      'customAttributes': ?instance.customAttributes,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CustomerGroup _$CustomerGroupFromJson(Map<String, dynamic> json) =>
    _CustomerGroup(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      taxClassName: json['taxClassName'] as String,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CustomerGroupToJson(_CustomerGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'taxClassName': instance.taxClassName,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CustomerAttribute _$CustomerAttributeFromJson(Map<String, dynamic> json) =>
    _CustomerAttribute(
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
          ?.map(
            (e) => CustomerAttributeOption.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      validationRules: json['validationRules'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CustomerAttributeToJson(_CustomerAttribute instance) =>
    <String, dynamic>{
      'attributeCode': instance.attributeCode,
      'frontendInput': instance.frontendInput,
      'frontendLabel': instance.frontendLabel,
      'isRequired': instance.isRequired,
      'isUserDefined': instance.isUserDefined,
      'isVisible': instance.isVisible,
      'isSystem': instance.isSystem,
      'sortOrder': instance.sortOrder,
      'defaultValue': ?instance.defaultValue,
      'options': ?instance.options?.map((e) => e.toJson()).toList(),
      'validationRules': ?instance.validationRules,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CustomerAttributeOption _$CustomerAttributeOptionFromJson(
  Map<String, dynamic> json,
) => _CustomerAttributeOption(
  value: json['value'] as String,
  label: json['label'] as String,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CustomerAttributeOptionToJson(
  _CustomerAttributeOption instance,
) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label,
  'extensionAttributes': ?instance.extensionAttributes,
};

_CustomerPreferences _$CustomerPreferencesFromJson(Map<String, dynamic> json) =>
    _CustomerPreferences(
      language: json['language'] as String?,
      currency: json['currency'] as String?,
      timezone: json['timezone'] as String?,
      newsletterSubscription: json['newsletterSubscription'] as bool?,
      additionalPreferences:
          json['additionalPreferences'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CustomerPreferencesToJson(
  _CustomerPreferences instance,
) => <String, dynamic>{
  'language': ?instance.language,
  'currency': ?instance.currency,
  'timezone': ?instance.timezone,
  'newsletterSubscription': ?instance.newsletterSubscription,
  'additionalPreferences': ?instance.additionalPreferences,
  'extensionAttributes': ?instance.extensionAttributes,
};

_CustomerActivity _$CustomerActivityFromJson(Map<String, dynamic> json) =>
    _CustomerActivity(
      id: json['id'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CustomerActivityToJson(_CustomerActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'metadata': ?instance.metadata,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CustomerStatistics _$CustomerStatisticsFromJson(Map<String, dynamic> json) =>
    _CustomerStatistics(
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

Map<String, dynamic> _$CustomerStatisticsToJson(_CustomerStatistics instance) =>
    <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'totalSpent': instance.totalSpent,
      'totalProductsPurchased': instance.totalProductsPurchased,
      'firstOrderDate': instance.firstOrderDate.toIso8601String(),
      'lastOrderDate': ?instance.lastOrderDate?.toIso8601String(),
      'averageOrderValue': instance.averageOrderValue,
      'wishlistItems': instance.wishlistItems,
      'cartItems': instance.cartItems,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CustomerNotificationPreferences _$CustomerNotificationPreferencesFromJson(
  Map<String, dynamic> json,
) => _CustomerNotificationPreferences(
  emailNotifications: json['emailNotifications'] as bool,
  smsNotifications: json['smsNotifications'] as bool,
  pushNotifications: json['pushNotifications'] as bool,
  orderUpdates: json['orderUpdates'] as bool,
  promotionalOffers: json['promotionalOffers'] as bool,
  productRecommendations: json['productRecommendations'] as bool,
  priceAlerts: json['priceAlerts'] as bool,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CustomerNotificationPreferencesToJson(
  _CustomerNotificationPreferences instance,
) => <String, dynamic>{
  'emailNotifications': instance.emailNotifications,
  'smsNotifications': instance.smsNotifications,
  'pushNotifications': instance.pushNotifications,
  'orderUpdates': instance.orderUpdates,
  'promotionalOffers': instance.promotionalOffers,
  'productRecommendations': instance.productRecommendations,
  'priceAlerts': instance.priceAlerts,
  'extensionAttributes': ?instance.extensionAttributes,
};

_CustomerLoyaltyPoints _$CustomerLoyaltyPointsFromJson(
  Map<String, dynamic> json,
) => _CustomerLoyaltyPoints(
  currentPoints: (json['currentPoints'] as num).toInt(),
  totalEarned: (json['totalEarned'] as num).toInt(),
  totalRedeemed: (json['totalRedeemed'] as num).toInt(),
  pointsToExpire: (json['pointsToExpire'] as num).toInt(),
  expirationDate: json['expirationDate'] == null
      ? null
      : DateTime.parse(json['expirationDate'] as String),
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CustomerLoyaltyPointsToJson(
  _CustomerLoyaltyPoints instance,
) => <String, dynamic>{
  'currentPoints': instance.currentPoints,
  'totalEarned': instance.totalEarned,
  'totalRedeemed': instance.totalRedeemed,
  'pointsToExpire': instance.pointsToExpire,
  'expirationDate': ?instance.expirationDate?.toIso8601String(),
  'extensionAttributes': ?instance.extensionAttributes,
};

_CustomerSubscription _$CustomerSubscriptionFromJson(
  Map<String, dynamic> json,
) => _CustomerSubscription(
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

Map<String, dynamic> _$CustomerSubscriptionToJson(
  _CustomerSubscription instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'type': instance.type,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': ?instance.endDate?.toIso8601String(),
  'amount': instance.amount,
  'currency': instance.currency,
  'frequency': ?instance.frequency,
  'extensionAttributes': ?instance.extensionAttributes,
};

_CustomerReview _$CustomerReviewFromJson(Map<String, dynamic> json) =>
    _CustomerReview(
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

Map<String, dynamic> _$CustomerReviewToJson(_CustomerReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'productName': instance.productName,
      'title': instance.title,
      'detail': instance.detail,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
      'status': ?instance.status,
      'extensionAttributes': ?instance.extensionAttributes,
    };
