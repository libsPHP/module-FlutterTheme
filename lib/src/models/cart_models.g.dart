// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemOption _$CartItemOptionFromJson(Map<String, dynamic> json) =>
    CartItemOption(
      optionId: json['optionId'] as String?,
      optionValue: json['optionValue'] as String?,
      optionLabel: json['optionLabel'] as String?,
      optionCode: json['optionCode'] as String?,
    );

Map<String, dynamic> _$CartItemOptionToJson(CartItemOption instance) =>
    <String, dynamic>{
      'optionId': ?instance.optionId,
      'optionValue': ?instance.optionValue,
      'optionLabel': ?instance.optionLabel,
      'optionCode': ?instance.optionCode,
    };

CartTotals _$CartTotalsFromJson(Map<String, dynamic> json) => CartTotals(
  grandTotal: (json['grandTotal'] as num?)?.toDouble(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  subtotalInclTax: (json['subtotalInclTax'] as num?)?.toDouble(),
  taxAmount: (json['taxAmount'] as num?)?.toDouble(),
  discountAmount: (json['discountAmount'] as num?)?.toDouble(),
  shippingAmount: (json['shippingAmount'] as num?)?.toDouble(),
  shippingInclTax: (json['shippingInclTax'] as num?)?.toDouble(),
  totalSegments: (json['totalSegments'] as List<dynamic>?)
      ?.map((e) => CartTotalSegment.fromJson(e as Map<String, dynamic>))
      .toList(),
  currencyCode: json['currencyCode'] as String?,
);

Map<String, dynamic> _$CartTotalsToJson(CartTotals instance) =>
    <String, dynamic>{
      'grandTotal': ?instance.grandTotal,
      'subtotal': ?instance.subtotal,
      'subtotalInclTax': ?instance.subtotalInclTax,
      'taxAmount': ?instance.taxAmount,
      'discountAmount': ?instance.discountAmount,
      'shippingAmount': ?instance.shippingAmount,
      'shippingInclTax': ?instance.shippingInclTax,
      'totalSegments': ?instance.totalSegments?.map((e) => e.toJson()).toList(),
      'currencyCode': ?instance.currencyCode,
    };

CartTotalSegment _$CartTotalSegmentFromJson(Map<String, dynamic> json) =>
    CartTotalSegment(
      code: json['code'] as String?,
      title: json['title'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      area: json['area'] as String?,
    );

Map<String, dynamic> _$CartTotalSegmentToJson(CartTotalSegment instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'title': ?instance.title,
      'value': ?instance.value,
      'area': ?instance.area,
    };

CartCoupon _$CartCouponFromJson(Map<String, dynamic> json) => CartCoupon(
  code: json['code'] as String?,
  description: json['description'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  type: json['type'] as String?,
);

Map<String, dynamic> _$CartCouponToJson(CartCoupon instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'description': ?instance.description,
      'amount': ?instance.amount,
      'type': ?instance.type,
    };

CartGiftCard _$CartGiftCardFromJson(Map<String, dynamic> json) => CartGiftCard(
  code: json['code'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String?,
);

Map<String, dynamic> _$CartGiftCardToJson(CartGiftCard instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'amount': ?instance.amount,
      'currencyCode': ?instance.currencyCode,
    };

CartAddress _$CartAddressFromJson(Map<String, dynamic> json) => CartAddress(
  id: (json['id'] as num?)?.toInt(),
  customerId: json['customerId'] as String?,
  regionId: json['regionId'] as String?,
  regionCode: json['regionCode'] as String?,
  region: json['region'] as String?,
  countryId: json['countryId'] as String?,
  street: (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
  isDefaultShipping: json['isDefaultShipping'] as bool?,
  isDefaultBilling: json['isDefaultBilling'] as bool?,
);

Map<String, dynamic> _$CartAddressToJson(CartAddress instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'customerId': ?instance.customerId,
      'regionId': ?instance.regionId,
      'regionCode': ?instance.regionCode,
      'region': ?instance.region,
      'countryId': ?instance.countryId,
      'street': ?instance.street,
      'company': ?instance.company,
      'telephone': ?instance.telephone,
      'fax': ?instance.fax,
      'postcode': ?instance.postcode,
      'city': ?instance.city,
      'firstname': ?instance.firstname,
      'lastname': ?instance.lastname,
      'middlename': ?instance.middlename,
      'prefix': ?instance.prefix,
      'suffix': ?instance.suffix,
      'vatId': ?instance.vatId,
      'isDefaultShipping': ?instance.isDefaultShipping,
      'isDefaultBilling': ?instance.isDefaultBilling,
    };

ShippingMethod _$ShippingMethodFromJson(Map<String, dynamic> json) =>
    ShippingMethod(
      methodCode: json['methodCode'] as String?,
      carrierCode: json['carrierCode'] as String?,
      methodTitle: json['methodTitle'] as String?,
      carrierTitle: json['carrierTitle'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
      available: json['available'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      priceExclTax: (json['priceExclTax'] as num?)?.toDouble(),
      priceInclTax: (json['priceInclTax'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) =>
    <String, dynamic>{
      'methodCode': ?instance.methodCode,
      'carrierCode': ?instance.carrierCode,
      'methodTitle': ?instance.methodTitle,
      'carrierTitle': ?instance.carrierTitle,
      'amount': ?instance.amount,
      'currencyCode': ?instance.currencyCode,
      'available': ?instance.available,
      'errorMessage': ?instance.errorMessage,
      'priceExclTax': ?instance.priceExclTax,
      'priceInclTax': ?instance.priceInclTax,
    };

CartCreateRequest _$CartCreateRequestFromJson(Map<String, dynamic> json) =>
    CartCreateRequest(
      customerId: (json['customerId'] as num?)?.toInt(),
      customerEmail: json['customerEmail'] as String?,
      storeId: json['storeId'] as String?,
    );

Map<String, dynamic> _$CartCreateRequestToJson(CartCreateRequest instance) =>
    <String, dynamic>{
      'customerId': ?instance.customerId,
      'customerEmail': ?instance.customerEmail,
      'storeId': ?instance.storeId,
    };

CartItemRequest _$CartItemRequestFromJson(Map<String, dynamic> json) =>
    CartItemRequest(
      sku: json['sku'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      quoteId: json['quoteId'] as String?,
      productOptions: json['productOptions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CartItemRequestToJson(CartItemRequest instance) =>
    <String, dynamic>{
      'sku': ?instance.sku,
      'qty': ?instance.qty,
      'quoteId': ?instance.quoteId,
      'productOptions': ?instance.productOptions,
    };

CartItemUpdateRequest _$CartItemUpdateRequestFromJson(
  Map<String, dynamic> json,
) => CartItemUpdateRequest(
  qty: (json['qty'] as num?)?.toInt(),
  quoteId: json['quoteId'] as String?,
  productOptions: json['productOptions'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CartItemUpdateRequestToJson(
  CartItemUpdateRequest instance,
) => <String, dynamic>{
  'qty': ?instance.qty,
  'quoteId': ?instance.quoteId,
  'productOptions': ?instance.productOptions,
};

ShippingInformationRequest _$ShippingInformationRequestFromJson(
  Map<String, dynamic> json,
) => ShippingInformationRequest(
  shippingAddress: json['shippingAddress'] == null
      ? null
      : CartAddress.fromJson(json['shippingAddress'] as Map<String, dynamic>),
  billingAddress: json['billingAddress'] == null
      ? null
      : CartAddress.fromJson(json['billingAddress'] as Map<String, dynamic>),
  shippingMethodCode: json['shippingMethodCode'] as String?,
  shippingCarrierCode: json['shippingCarrierCode'] as String?,
  customAttributes: json['customAttributes'] as String?,
);

Map<String, dynamic> _$ShippingInformationRequestToJson(
  ShippingInformationRequest instance,
) => <String, dynamic>{
  'shippingAddress': ?instance.shippingAddress?.toJson(),
  'billingAddress': ?instance.billingAddress?.toJson(),
  'shippingMethodCode': ?instance.shippingMethodCode,
  'shippingCarrierCode': ?instance.shippingCarrierCode,
  'customAttributes': ?instance.customAttributes,
};

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      code: json['code'] as String?,
      title: json['title'] as String?,
      available: json['available'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'title': ?instance.title,
      'available': ?instance.available,
      'errorMessage': ?instance.errorMessage,
      'additionalData': ?instance.additionalData,
    };

CartValidationResult _$CartValidationResultFromJson(
  Map<String, dynamic> json,
) => CartValidationResult(
  isValid: json['isValid'] as bool?,
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  warnings: (json['warnings'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  additionalData: json['additionalData'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CartValidationResultToJson(
  CartValidationResult instance,
) => <String, dynamic>{
  'isValid': ?instance.isValid,
  'errors': ?instance.errors,
  'warnings': ?instance.warnings,
  'additionalData': ?instance.additionalData,
};

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  id: json['id'] as String?,
  customerId: (json['customerId'] as num?)?.toInt(),
  customerEmail: json['customerEmail'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totals: json['totals'] == null
      ? null
      : CartTotals.fromJson(json['totals'] as Map<String, dynamic>),
  appliedCoupons: (json['appliedCoupons'] as List<dynamic>?)
      ?.map((e) => CartCoupon.fromJson(e as Map<String, dynamic>))
      .toList(),
  appliedGiftCards: (json['appliedGiftCards'] as List<dynamic>?)
      ?.map((e) => CartGiftCard.fromJson(e as Map<String, dynamic>))
      .toList(),
  currencyCode: json['currencyCode'] as String?,
  couponCode: json['couponCode'] as String?,
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'id': ?instance.id,
  'customerId': ?instance.customerId,
  'customerEmail': ?instance.customerEmail,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
  'totals': ?instance.totals?.toJson(),
  'appliedCoupons': ?instance.appliedCoupons?.map((e) => e.toJson()).toList(),
  'appliedGiftCards': ?instance.appliedGiftCards
      ?.map((e) => e.toJson())
      .toList(),
  'currencyCode': ?instance.currencyCode,
  'couponCode': ?instance.couponCode,
  'isActive': ?instance.isActive,
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  itemId: (json['itemId'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  name: json['name'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  rowTotal: (json['rowTotal'] as num?)?.toDouble(),
  taxAmount: (json['taxAmount'] as num?)?.toDouble(),
  discountAmount: (json['discountAmount'] as num?)?.toDouble(),
  productType: json['productType'] as String?,
  productOptions: json['productOptions'] as Map<String, dynamic>?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => CartItemOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  isVirtual: json['isVirtual'] as bool?,
  imageUrl: json['imageUrl'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'itemId': ?instance.itemId,
  'sku': ?instance.sku,
  'name': ?instance.name,
  'qty': ?instance.qty,
  'price': ?instance.price,
  'rowTotal': ?instance.rowTotal,
  'taxAmount': ?instance.taxAmount,
  'discountAmount': ?instance.discountAmount,
  'productType': ?instance.productType,
  'productOptions': ?instance.productOptions,
  'options': ?instance.options?.map((e) => e.toJson()).toList(),
  'isVirtual': ?instance.isVirtual,
  'imageUrl': ?instance.imageUrl,
  'thumbnailUrl': ?instance.thumbnailUrl,
};
