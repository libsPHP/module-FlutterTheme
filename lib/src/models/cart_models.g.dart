// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
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
  isActive: json['isActive'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.customerId case final value?) 'customerId': value,
  if (instance.customerEmail case final value?) 'customerEmail': value,
  if (instance.items?.map((e) => e.toJson()).toList() case final value?)
    'items': value,
  if (instance.totals?.toJson() case final value?) 'totals': value,
  if (instance.appliedCoupons?.map((e) => e.toJson()).toList()
      case final value?)
    'appliedCoupons': value,
  if (instance.appliedGiftCards?.map((e) => e.toJson()).toList()
      case final value?)
    'appliedGiftCards': value,
  if (instance.currencyCode case final value?) 'currencyCode': value,
  if (instance.isActive case final value?) 'isActive': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
};

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
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

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
  if (instance.itemId case final value?) 'itemId': value,
  if (instance.sku case final value?) 'sku': value,
  if (instance.name case final value?) 'name': value,
  if (instance.qty case final value?) 'qty': value,
  if (instance.price case final value?) 'price': value,
  if (instance.rowTotal case final value?) 'rowTotal': value,
  if (instance.taxAmount case final value?) 'taxAmount': value,
  if (instance.discountAmount case final value?) 'discountAmount': value,
  if (instance.productType case final value?) 'productType': value,
  if (instance.productOptions case final value?) 'productOptions': value,
  if (instance.options?.map((e) => e.toJson()).toList() case final value?)
    'options': value,
  if (instance.isVirtual case final value?) 'isVirtual': value,
  if (instance.imageUrl case final value?) 'imageUrl': value,
  if (instance.thumbnailUrl case final value?) 'thumbnailUrl': value,
};

CartItemOption _$CartItemOptionFromJson(Map<String, dynamic> json) =>
    CartItemOption(
      optionId: json['optionId'] as String?,
      optionValue: json['optionValue'] as String?,
      optionLabel: json['optionLabel'] as String?,
      optionCode: json['optionCode'] as String?,
    );

Map<String, dynamic> _$CartItemOptionToJson(CartItemOption instance) =>
    <String, dynamic>{
      if (instance.optionId case final value?) 'optionId': value,
      if (instance.optionValue case final value?) 'optionValue': value,
      if (instance.optionLabel case final value?) 'optionLabel': value,
      if (instance.optionCode case final value?) 'optionCode': value,
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

Map<String, dynamic> _$CartTotalsToJson(
  CartTotals instance,
) => <String, dynamic>{
  if (instance.grandTotal case final value?) 'grandTotal': value,
  if (instance.subtotal case final value?) 'subtotal': value,
  if (instance.subtotalInclTax case final value?) 'subtotalInclTax': value,
  if (instance.taxAmount case final value?) 'taxAmount': value,
  if (instance.discountAmount case final value?) 'discountAmount': value,
  if (instance.shippingAmount case final value?) 'shippingAmount': value,
  if (instance.shippingInclTax case final value?) 'shippingInclTax': value,
  if (instance.totalSegments?.map((e) => e.toJson()).toList() case final value?)
    'totalSegments': value,
  if (instance.currencyCode case final value?) 'currencyCode': value,
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
      if (instance.code case final value?) 'code': value,
      if (instance.title case final value?) 'title': value,
      if (instance.value case final value?) 'value': value,
      if (instance.area case final value?) 'area': value,
    };

CartCoupon _$CartCouponFromJson(Map<String, dynamic> json) => CartCoupon(
  code: json['code'] as String?,
  description: json['description'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  type: json['type'] as String?,
);

Map<String, dynamic> _$CartCouponToJson(CartCoupon instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.description case final value?) 'description': value,
      if (instance.amount case final value?) 'amount': value,
      if (instance.type case final value?) 'type': value,
    };

CartGiftCard _$CartGiftCardFromJson(Map<String, dynamic> json) => CartGiftCard(
  code: json['code'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  currencyCode: json['currencyCode'] as String?,
);

Map<String, dynamic> _$CartGiftCardToJson(CartGiftCard instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.amount case final value?) 'amount': value,
      if (instance.currencyCode case final value?) 'currencyCode': value,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
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

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.customerId case final value?) 'customerId': value,
  if (instance.regionId case final value?) 'regionId': value,
  if (instance.regionCode case final value?) 'regionCode': value,
  if (instance.region case final value?) 'region': value,
  if (instance.countryId case final value?) 'countryId': value,
  if (instance.street case final value?) 'street': value,
  if (instance.company case final value?) 'company': value,
  if (instance.telephone case final value?) 'telephone': value,
  if (instance.fax case final value?) 'fax': value,
  if (instance.postcode case final value?) 'postcode': value,
  if (instance.city case final value?) 'city': value,
  if (instance.firstname case final value?) 'firstname': value,
  if (instance.lastname case final value?) 'lastname': value,
  if (instance.middlename case final value?) 'middlename': value,
  if (instance.prefix case final value?) 'prefix': value,
  if (instance.suffix case final value?) 'suffix': value,
  if (instance.vatId case final value?) 'vatId': value,
  if (instance.isDefaultShipping case final value?) 'isDefaultShipping': value,
  if (instance.isDefaultBilling case final value?) 'isDefaultBilling': value,
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
      if (instance.methodCode case final value?) 'methodCode': value,
      if (instance.carrierCode case final value?) 'carrierCode': value,
      if (instance.methodTitle case final value?) 'methodTitle': value,
      if (instance.carrierTitle case final value?) 'carrierTitle': value,
      if (instance.amount case final value?) 'amount': value,
      if (instance.currencyCode case final value?) 'currencyCode': value,
      if (instance.available case final value?) 'available': value,
      if (instance.errorMessage case final value?) 'errorMessage': value,
      if (instance.priceExclTax case final value?) 'priceExclTax': value,
      if (instance.priceInclTax case final value?) 'priceInclTax': value,
    };

CartCreateRequest _$CartCreateRequestFromJson(Map<String, dynamic> json) =>
    CartCreateRequest(
      customerId: (json['customerId'] as num?)?.toInt(),
      customerEmail: json['customerEmail'] as String?,
      storeId: json['storeId'] as String?,
    );

Map<String, dynamic> _$CartCreateRequestToJson(CartCreateRequest instance) =>
    <String, dynamic>{
      if (instance.customerId case final value?) 'customerId': value,
      if (instance.customerEmail case final value?) 'customerEmail': value,
      if (instance.storeId case final value?) 'storeId': value,
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
      if (instance.sku case final value?) 'sku': value,
      if (instance.qty case final value?) 'qty': value,
      if (instance.quoteId case final value?) 'quoteId': value,
      if (instance.productOptions case final value?) 'productOptions': value,
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
  if (instance.qty case final value?) 'qty': value,
  if (instance.quoteId case final value?) 'quoteId': value,
  if (instance.productOptions case final value?) 'productOptions': value,
};

ShippingInformationRequest _$ShippingInformationRequestFromJson(
  Map<String, dynamic> json,
) => ShippingInformationRequest(
  shippingAddress: json['shippingAddress'] == null
      ? null
      : Address.fromJson(json['shippingAddress'] as Map<String, dynamic>),
  billingAddress: json['billingAddress'] == null
      ? null
      : Address.fromJson(json['billingAddress'] as Map<String, dynamic>),
  shippingMethodCode: json['shippingMethodCode'] as String?,
  shippingCarrierCode: json['shippingCarrierCode'] as String?,
  customAttributes: json['customAttributes'] as String?,
);

Map<String, dynamic> _$ShippingInformationRequestToJson(
  ShippingInformationRequest instance,
) => <String, dynamic>{
  if (instance.shippingAddress?.toJson() case final value?)
    'shippingAddress': value,
  if (instance.billingAddress?.toJson() case final value?)
    'billingAddress': value,
  if (instance.shippingMethodCode case final value?)
    'shippingMethodCode': value,
  if (instance.shippingCarrierCode case final value?)
    'shippingCarrierCode': value,
  if (instance.customAttributes case final value?) 'customAttributes': value,
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
      if (instance.code case final value?) 'code': value,
      if (instance.title case final value?) 'title': value,
      if (instance.available case final value?) 'available': value,
      if (instance.errorMessage case final value?) 'errorMessage': value,
      if (instance.additionalData case final value?) 'additionalData': value,
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
  if (instance.isValid case final value?) 'isValid': value,
  if (instance.errors case final value?) 'errors': value,
  if (instance.warnings case final value?) 'warnings': value,
  if (instance.additionalData case final value?) 'additionalData': value,
};
