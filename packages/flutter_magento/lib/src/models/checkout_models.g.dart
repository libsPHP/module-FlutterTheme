// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutSession _$CheckoutSessionFromJson(Map<String, dynamic> json) =>
    _CheckoutSession(
      id: json['id'] as String,
      cartId: json['cartId'] as String,
      email: json['email'] as String?,
      shippingAddress: json['shippingAddress'] as Map<String, dynamic>?,
      billingAddress: json['billingAddress'] as Map<String, dynamic>?,
      shippingMethod: json['shippingMethod'] as String?,
      paymentMethod: json['paymentMethod'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CheckoutSessionToJson(_CheckoutSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cartId': instance.cartId,
      'email': ?instance.email,
      'shippingAddress': ?instance.shippingAddress,
      'billingAddress': ?instance.billingAddress,
      'shippingMethod': ?instance.shippingMethod,
      'paymentMethod': ?instance.paymentMethod,
      'additionalData': ?instance.additionalData,
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };

_ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) =>
    _ShippingMethod(
      code: json['code'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      carrierCode: json['carrierCode'] as String?,
      carrierTitle: json['carrierTitle'] as String?,
      methodCode: json['methodCode'] as String?,
      methodTitle: json['methodTitle'] as String?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ShippingMethodToJson(_ShippingMethod instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'amount': instance.amount,
      'currency': instance.currency,
      'carrierCode': ?instance.carrierCode,
      'carrierTitle': ?instance.carrierTitle,
      'methodCode': ?instance.methodCode,
      'methodTitle': ?instance.methodTitle,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    _PaymentMethod(
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      config: json['config'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PaymentMethodToJson(_PaymentMethod instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'description': ?instance.description,
      'config': ?instance.config,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CheckoutValidationResult _$CheckoutValidationResultFromJson(
  Map<String, dynamic> json,
) => _CheckoutValidationResult(
  isValid: json['isValid'] as bool,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  warnings: (json['warnings'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  additionalData: json['additionalData'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CheckoutValidationResultToJson(
  _CheckoutValidationResult instance,
) => <String, dynamic>{
  'isValid': instance.isValid,
  'errors': ?instance.errors,
  'warnings': ?instance.warnings,
  'additionalData': ?instance.additionalData,
};

_CheckoutTotals _$CheckoutTotalsFromJson(Map<String, dynamic> json) =>
    _CheckoutTotals(
      grandTotal: (json['grandTotal'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      subtotalInclTax: (json['subtotalInclTax'] as num).toDouble(),
      shippingAmount: (json['shippingAmount'] as num).toDouble(),
      shippingInclTax: (json['shippingInclTax'] as num).toDouble(),
      taxAmount: (json['taxAmount'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      currency: json['currency'] as String,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CheckoutTotalItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CheckoutTotalsToJson(_CheckoutTotals instance) =>
    <String, dynamic>{
      'grandTotal': instance.grandTotal,
      'subtotal': instance.subtotal,
      'subtotalInclTax': instance.subtotalInclTax,
      'shippingAmount': instance.shippingAmount,
      'shippingInclTax': instance.shippingInclTax,
      'taxAmount': instance.taxAmount,
      'discountAmount': instance.discountAmount,
      'currency': instance.currency,
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CheckoutTotalItem _$CheckoutTotalItemFromJson(Map<String, dynamic> json) =>
    _CheckoutTotalItem(
      code: json['code'] as String,
      title: json['title'] as String,
      value: (json['value'] as num).toDouble(),
      currency: json['currency'] as String,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CheckoutTotalItemToJson(_CheckoutTotalItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      'value': instance.value,
      'currency': instance.currency,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_GuestCheckoutInfo _$GuestCheckoutInfoFromJson(
  Map<String, dynamic> json,
) => _GuestCheckoutInfo(
  cartId: json['cartId'] as String,
  email: json['email'] as String?,
  shippingAddress: json['shippingAddress'] as Map<String, dynamic>?,
  billingAddress: json['billingAddress'] as Map<String, dynamic>?,
  availableShippingMethods: (json['availableShippingMethods'] as List<dynamic>?)
      ?.map((e) => ShippingMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
  availablePaymentMethods: (json['availablePaymentMethods'] as List<dynamic>?)
      ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
  totals: json['totals'] == null
      ? null
      : CheckoutTotals.fromJson(json['totals'] as Map<String, dynamic>),
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$GuestCheckoutInfoToJson(_GuestCheckoutInfo instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'email': ?instance.email,
      'shippingAddress': ?instance.shippingAddress,
      'billingAddress': ?instance.billingAddress,
      'availableShippingMethods': ?instance.availableShippingMethods
          ?.map((e) => e.toJson())
          .toList(),
      'availablePaymentMethods': ?instance.availablePaymentMethods
          ?.map((e) => e.toJson())
          .toList(),
      'totals': ?instance.totals?.toJson(),
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CheckoutAddress _$CheckoutAddressFromJson(Map<String, dynamic> json) =>
    _CheckoutAddress(
      id: json['id'] as String?,
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
      sameAsBilling: json['sameAsBilling'] as bool?,
      saveInAddressBook: json['saveInAddressBook'] as bool?,
      customAttributes: json['customAttributes'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CheckoutAddressToJson(_CheckoutAddress instance) =>
    <String, dynamic>{
      'id': ?instance.id,
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
      'sameAsBilling': ?instance.sameAsBilling,
      'saveInAddressBook': ?instance.saveInAddressBook,
      'customAttributes': ?instance.customAttributes,
      'extensionAttributes': ?instance.extensionAttributes,
    };

_CheckoutPaymentInfo _$CheckoutPaymentInfoFromJson(Map<String, dynamic> json) =>
    _CheckoutPaymentInfo(
      method: json['method'] as String,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CheckoutPaymentInfoToJson(
  _CheckoutPaymentInfo instance,
) => <String, dynamic>{
  'method': instance.method,
  'additionalData': ?instance.additionalData,
  'extensionAttributes': ?instance.extensionAttributes,
};

_CheckoutShippingInfo _$CheckoutShippingInfoFromJson(
  Map<String, dynamic> json,
) => _CheckoutShippingInfo(
  method: json['method'] as String,
  address: json['address'] == null
      ? null
      : CheckoutAddress.fromJson(json['address'] as Map<String, dynamic>),
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CheckoutShippingInfoToJson(
  _CheckoutShippingInfo instance,
) => <String, dynamic>{
  'method': instance.method,
  'address': ?instance.address?.toJson(),
  'extensionAttributes': ?instance.extensionAttributes,
};
