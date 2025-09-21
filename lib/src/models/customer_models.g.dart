// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerAddressImpl _$$CustomerAddressImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerAddressImpl(
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
  street: (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
  _$CustomerAddressImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  if (instance.customerId case final value?) 'customerId': value,
  if (instance.customerAddressId case final value?) 'customerAddressId': value,
  if (instance.email case final value?) 'email': value,
  if (instance.firstName case final value?) 'firstName': value,
  if (instance.lastName case final value?) 'lastName': value,
  if (instance.middleName case final value?) 'middleName': value,
  if (instance.prefix case final value?) 'prefix': value,
  if (instance.suffix case final value?) 'suffix': value,
  if (instance.company case final value?) 'company': value,
  if (instance.street case final value?) 'street': value,
  if (instance.city case final value?) 'city': value,
  if (instance.region case final value?) 'region': value,
  if (instance.regionId case final value?) 'regionId': value,
  if (instance.regionCode case final value?) 'regionCode': value,
  if (instance.postcode case final value?) 'postcode': value,
  if (instance.countryId case final value?) 'countryId': value,
  if (instance.telephone case final value?) 'telephone': value,
  if (instance.fax case final value?) 'fax': value,
  if (instance.isDefaultShipping case final value?) 'isDefaultShipping': value,
  if (instance.isDefaultBilling case final value?) 'isDefaultBilling': value,
  if (instance.customAttributes case final value?) 'customAttributes': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CustomerGroupImpl _$$CustomerGroupImplFromJson(Map<String, dynamic> json) =>
    _$CustomerGroupImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      taxClassName: json['taxClassName'] as String,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerGroupImplToJson(_$CustomerGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'taxClassName': instance.taxClassName,
      if (instance.extensionAttributes case final value?)
        'extensionAttributes': value,
    };

_$CustomerAttributeImpl _$$CustomerAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerAttributeImpl(
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
      ?.map((e) => CustomerAttributeOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  validationRules: json['validationRules'] as Map<String, dynamic>?,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CustomerAttributeImplToJson(
  _$CustomerAttributeImpl instance,
) => <String, dynamic>{
  'attributeCode': instance.attributeCode,
  'frontendInput': instance.frontendInput,
  'frontendLabel': instance.frontendLabel,
  'isRequired': instance.isRequired,
  'isUserDefined': instance.isUserDefined,
  'isVisible': instance.isVisible,
  'isSystem': instance.isSystem,
  'sortOrder': instance.sortOrder,
  if (instance.defaultValue case final value?) 'defaultValue': value,
  if (instance.options?.map((e) => e.toJson()).toList() case final value?)
    'options': value,
  if (instance.validationRules case final value?) 'validationRules': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CustomerAttributeOptionImpl _$$CustomerAttributeOptionImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerAttributeOptionImpl(
  value: json['value'] as String,
  label: json['label'] as String,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CustomerAttributeOptionImplToJson(
  _$CustomerAttributeOptionImpl instance,
) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CustomerPreferencesImpl _$$CustomerPreferencesImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerPreferencesImpl(
  language: json['language'] as String?,
  currency: json['currency'] as String?,
  timezone: json['timezone'] as String?,
  newsletterSubscription: json['newsletterSubscription'] as bool?,
  additionalPreferences: json['additionalPreferences'] as Map<String, dynamic>?,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CustomerPreferencesImplToJson(
  _$CustomerPreferencesImpl instance,
) => <String, dynamic>{
  if (instance.language case final value?) 'language': value,
  if (instance.currency case final value?) 'currency': value,
  if (instance.timezone case final value?) 'timezone': value,
  if (instance.newsletterSubscription case final value?)
    'newsletterSubscription': value,
  if (instance.additionalPreferences case final value?)
    'additionalPreferences': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CustomerActivityImpl _$$CustomerActivityImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerActivityImpl(
  id: json['id'] as String,
  type: json['type'] as String,
  description: json['description'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CustomerActivityImplToJson(
  _$CustomerActivityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'description': instance.description,
  'timestamp': instance.timestamp.toIso8601String(),
  if (instance.metadata case final value?) 'metadata': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CustomerStatisticsImpl _$$CustomerStatisticsImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerStatisticsImpl(
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
  _$CustomerStatisticsImpl instance,
) => <String, dynamic>{
  'totalOrders': instance.totalOrders,
  'totalSpent': instance.totalSpent,
  'totalProductsPurchased': instance.totalProductsPurchased,
  'firstOrderDate': instance.firstOrderDate.toIso8601String(),
  if (instance.lastOrderDate?.toIso8601String() case final value?)
    'lastOrderDate': value,
  'averageOrderValue': instance.averageOrderValue,
  'wishlistItems': instance.wishlistItems,
  'cartItems': instance.cartItems,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

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
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CustomerNotificationPreferencesImplToJson(
  _$CustomerNotificationPreferencesImpl instance,
) => <String, dynamic>{
  'emailNotifications': instance.emailNotifications,
  'smsNotifications': instance.smsNotifications,
  'pushNotifications': instance.pushNotifications,
  'orderUpdates': instance.orderUpdates,
  'promotionalOffers': instance.promotionalOffers,
  'productRecommendations': instance.productRecommendations,
  'priceAlerts': instance.priceAlerts,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CustomerLoyaltyPointsImpl _$$CustomerLoyaltyPointsImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerLoyaltyPointsImpl(
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
  _$CustomerLoyaltyPointsImpl instance,
) => <String, dynamic>{
  'currentPoints': instance.currentPoints,
  'totalEarned': instance.totalEarned,
  'totalRedeemed': instance.totalRedeemed,
  'pointsToExpire': instance.pointsToExpire,
  if (instance.expirationDate?.toIso8601String() case final value?)
    'expirationDate': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CustomerSubscriptionImpl _$$CustomerSubscriptionImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerSubscriptionImpl(
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
  _$CustomerSubscriptionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'type': instance.type,
  'startDate': instance.startDate.toIso8601String(),
  if (instance.endDate?.toIso8601String() case final value?) 'endDate': value,
  'amount': instance.amount,
  'currency': instance.currency,
  if (instance.frequency case final value?) 'frequency': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

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
  _$CustomerReviewImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'productName': instance.productName,
  'title': instance.title,
  'detail': instance.detail,
  'rating': instance.rating,
  'createdAt': instance.createdAt.toIso8601String(),
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
  if (instance.status case final value?) 'status': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};
