// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckoutSessionImpl _$$CheckoutSessionImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutSessionImpl(
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

Map<String, dynamic> _$$CheckoutSessionImplToJson(
  _$CheckoutSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'cartId': instance.cartId,
  if (instance.email case final value?) 'email': value,
  if (instance.shippingAddress case final value?) 'shippingAddress': value,
  if (instance.billingAddress case final value?) 'billingAddress': value,
  if (instance.shippingMethod case final value?) 'shippingMethod': value,
  if (instance.paymentMethod case final value?) 'paymentMethod': value,
  if (instance.additionalData case final value?) 'additionalData': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
};

_$ShippingMethodImpl _$$ShippingMethodImplFromJson(Map<String, dynamic> json) =>
    _$ShippingMethodImpl(
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

Map<String, dynamic> _$$ShippingMethodImplToJson(
  _$ShippingMethodImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'title': instance.title,
  'amount': instance.amount,
  'currency': instance.currency,
  if (instance.carrierCode case final value?) 'carrierCode': value,
  if (instance.carrierTitle case final value?) 'carrierTitle': value,
  if (instance.methodCode case final value?) 'methodCode': value,
  if (instance.methodTitle case final value?) 'methodTitle': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      config: json['config'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'title': instance.title,
      if (instance.description case final value?) 'description': value,
      if (instance.config case final value?) 'config': value,
      if (instance.extensionAttributes case final value?)
        'extensionAttributes': value,
    };

_$CheckoutValidationResultImpl _$$CheckoutValidationResultImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutValidationResultImpl(
  isValid: json['isValid'] as bool,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  warnings: (json['warnings'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  additionalData: json['additionalData'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CheckoutValidationResultImplToJson(
  _$CheckoutValidationResultImpl instance,
) => <String, dynamic>{
  'isValid': instance.isValid,
  if (instance.errors case final value?) 'errors': value,
  if (instance.warnings case final value?) 'warnings': value,
  if (instance.additionalData case final value?) 'additionalData': value,
};

_$CheckoutTotalsImpl _$$CheckoutTotalsImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutTotalsImpl(
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

Map<String, dynamic> _$$CheckoutTotalsImplToJson(
  _$CheckoutTotalsImpl instance,
) => <String, dynamic>{
  'grandTotal': instance.grandTotal,
  'subtotal': instance.subtotal,
  'subtotalInclTax': instance.subtotalInclTax,
  'shippingAmount': instance.shippingAmount,
  'shippingInclTax': instance.shippingInclTax,
  'taxAmount': instance.taxAmount,
  'discountAmount': instance.discountAmount,
  'currency': instance.currency,
  if (instance.items?.map((e) => e.toJson()).toList() case final value?)
    'items': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CheckoutTotalItemImpl _$$CheckoutTotalItemImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutTotalItemImpl(
  code: json['code'] as String,
  title: json['title'] as String,
  value: (json['value'] as num).toDouble(),
  currency: json['currency'] as String,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CheckoutTotalItemImplToJson(
  _$CheckoutTotalItemImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'title': instance.title,
  'value': instance.value,
  'currency': instance.currency,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$GuestCheckoutInfoImpl _$$GuestCheckoutInfoImplFromJson(
  Map<String, dynamic> json,
) => _$GuestCheckoutInfoImpl(
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

Map<String, dynamic> _$$GuestCheckoutInfoImplToJson(
  _$GuestCheckoutInfoImpl instance,
) => <String, dynamic>{
  'cartId': instance.cartId,
  if (instance.email case final value?) 'email': value,
  if (instance.shippingAddress case final value?) 'shippingAddress': value,
  if (instance.billingAddress case final value?) 'billingAddress': value,
  if (instance.availableShippingMethods?.map((e) => e.toJson()).toList()
      case final value?)
    'availableShippingMethods': value,
  if (instance.availablePaymentMethods?.map((e) => e.toJson()).toList()
      case final value?)
    'availablePaymentMethods': value,
  if (instance.totals?.toJson() case final value?) 'totals': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CheckoutAddressImpl _$$CheckoutAddressImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutAddressImpl(
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
  street: (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
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

Map<String, dynamic> _$$CheckoutAddressImplToJson(
  _$CheckoutAddressImpl instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
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
  if (instance.sameAsBilling case final value?) 'sameAsBilling': value,
  if (instance.saveInAddressBook case final value?) 'saveInAddressBook': value,
  if (instance.customAttributes case final value?) 'customAttributes': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CheckoutPaymentInfoImpl _$$CheckoutPaymentInfoImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutPaymentInfoImpl(
  method: json['method'] as String,
  additionalData: json['additionalData'] as Map<String, dynamic>?,
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CheckoutPaymentInfoImplToJson(
  _$CheckoutPaymentInfoImpl instance,
) => <String, dynamic>{
  'method': instance.method,
  if (instance.additionalData case final value?) 'additionalData': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};

_$CheckoutShippingInfoImpl _$$CheckoutShippingInfoImplFromJson(
  Map<String, dynamic> json,
) => _$CheckoutShippingInfoImpl(
  method: json['method'] as String,
  address: json['address'] == null
      ? null
      : CheckoutAddress.fromJson(json['address'] as Map<String, dynamic>),
  extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$CheckoutShippingInfoImplToJson(
  _$CheckoutShippingInfoImpl instance,
) => <String, dynamic>{
  'method': instance.method,
  if (instance.address?.toJson() case final value?) 'address': value,
  if (instance.extensionAttributes case final value?)
    'extensionAttributes': value,
};
