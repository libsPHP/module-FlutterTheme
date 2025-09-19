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

Map<String, dynamic> _$CartToJson(Cart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('customerEmail', instance.customerEmail);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('totals', instance.totals?.toJson());
  writeNotNull('appliedCoupons',
      instance.appliedCoupons?.map((e) => e.toJson()).toList());
  writeNotNull('appliedGiftCards',
      instance.appliedGiftCards?.map((e) => e.toJson()).toList());
  writeNotNull('currencyCode', instance.currencyCode);
  writeNotNull('isActive', instance.isActive);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

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

Map<String, dynamic> _$CartItemToJson(CartItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('itemId', instance.itemId);
  writeNotNull('sku', instance.sku);
  writeNotNull('name', instance.name);
  writeNotNull('qty', instance.qty);
  writeNotNull('price', instance.price);
  writeNotNull('rowTotal', instance.rowTotal);
  writeNotNull('taxAmount', instance.taxAmount);
  writeNotNull('discountAmount', instance.discountAmount);
  writeNotNull('productType', instance.productType);
  writeNotNull('productOptions', instance.productOptions);
  writeNotNull('options', instance.options?.map((e) => e.toJson()).toList());
  writeNotNull('isVirtual', instance.isVirtual);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('thumbnailUrl', instance.thumbnailUrl);
  return val;
}

CartItemOption _$CartItemOptionFromJson(Map<String, dynamic> json) =>
    CartItemOption(
      optionId: json['optionId'] as String?,
      optionValue: json['optionValue'] as String?,
      optionLabel: json['optionLabel'] as String?,
      optionCode: json['optionCode'] as String?,
    );

Map<String, dynamic> _$CartItemOptionToJson(CartItemOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('optionId', instance.optionId);
  writeNotNull('optionValue', instance.optionValue);
  writeNotNull('optionLabel', instance.optionLabel);
  writeNotNull('optionCode', instance.optionCode);
  return val;
}

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

Map<String, dynamic> _$CartTotalsToJson(CartTotals instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grandTotal', instance.grandTotal);
  writeNotNull('subtotal', instance.subtotal);
  writeNotNull('subtotalInclTax', instance.subtotalInclTax);
  writeNotNull('taxAmount', instance.taxAmount);
  writeNotNull('discountAmount', instance.discountAmount);
  writeNotNull('shippingAmount', instance.shippingAmount);
  writeNotNull('shippingInclTax', instance.shippingInclTax);
  writeNotNull(
      'totalSegments', instance.totalSegments?.map((e) => e.toJson()).toList());
  writeNotNull('currencyCode', instance.currencyCode);
  return val;
}

CartTotalSegment _$CartTotalSegmentFromJson(Map<String, dynamic> json) =>
    CartTotalSegment(
      code: json['code'] as String?,
      title: json['title'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      area: json['area'] as String?,
    );

Map<String, dynamic> _$CartTotalSegmentToJson(CartTotalSegment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('title', instance.title);
  writeNotNull('value', instance.value);
  writeNotNull('area', instance.area);
  return val;
}

CartCoupon _$CartCouponFromJson(Map<String, dynamic> json) => CartCoupon(
      code: json['code'] as String?,
      description: json['description'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CartCouponToJson(CartCoupon instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('description', instance.description);
  writeNotNull('amount', instance.amount);
  writeNotNull('type', instance.type);
  return val;
}

CartGiftCard _$CartGiftCardFromJson(Map<String, dynamic> json) => CartGiftCard(
      code: json['code'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$CartGiftCardToJson(CartGiftCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('amount', instance.amount);
  writeNotNull('currencyCode', instance.currencyCode);
  return val;
}

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      regionId: json['regionId'] as String?,
      regionCode: json['regionCode'] as String?,
      region: json['region'] as String?,
      countryId: json['countryId'] as String?,
      street:
          (json['street'] as List<dynamic>?)?.map((e) => e as String).toList(),
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

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('regionId', instance.regionId);
  writeNotNull('regionCode', instance.regionCode);
  writeNotNull('region', instance.region);
  writeNotNull('countryId', instance.countryId);
  writeNotNull('street', instance.street);
  writeNotNull('company', instance.company);
  writeNotNull('telephone', instance.telephone);
  writeNotNull('fax', instance.fax);
  writeNotNull('postcode', instance.postcode);
  writeNotNull('city', instance.city);
  writeNotNull('firstname', instance.firstname);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('middlename', instance.middlename);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('vatId', instance.vatId);
  writeNotNull('isDefaultShipping', instance.isDefaultShipping);
  writeNotNull('isDefaultBilling', instance.isDefaultBilling);
  return val;
}

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

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('methodCode', instance.methodCode);
  writeNotNull('carrierCode', instance.carrierCode);
  writeNotNull('methodTitle', instance.methodTitle);
  writeNotNull('carrierTitle', instance.carrierTitle);
  writeNotNull('amount', instance.amount);
  writeNotNull('currencyCode', instance.currencyCode);
  writeNotNull('available', instance.available);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('priceExclTax', instance.priceExclTax);
  writeNotNull('priceInclTax', instance.priceInclTax);
  return val;
}

CartCreateRequest _$CartCreateRequestFromJson(Map<String, dynamic> json) =>
    CartCreateRequest(
      customerId: (json['customerId'] as num?)?.toInt(),
      customerEmail: json['customerEmail'] as String?,
      storeId: json['storeId'] as String?,
    );

Map<String, dynamic> _$CartCreateRequestToJson(CartCreateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customerId', instance.customerId);
  writeNotNull('customerEmail', instance.customerEmail);
  writeNotNull('storeId', instance.storeId);
  return val;
}

CartItemRequest _$CartItemRequestFromJson(Map<String, dynamic> json) =>
    CartItemRequest(
      sku: json['sku'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      quoteId: json['quoteId'] as String?,
      productOptions: json['productOptions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CartItemRequestToJson(CartItemRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sku', instance.sku);
  writeNotNull('qty', instance.qty);
  writeNotNull('quoteId', instance.quoteId);
  writeNotNull('productOptions', instance.productOptions);
  return val;
}

CartItemUpdateRequest _$CartItemUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    CartItemUpdateRequest(
      qty: (json['qty'] as num?)?.toInt(),
      quoteId: json['quoteId'] as String?,
      productOptions: json['productOptions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CartItemUpdateRequestToJson(
    CartItemUpdateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('qty', instance.qty);
  writeNotNull('quoteId', instance.quoteId);
  writeNotNull('productOptions', instance.productOptions);
  return val;
}

ShippingInformationRequest _$ShippingInformationRequestFromJson(
        Map<String, dynamic> json) =>
    ShippingInformationRequest(
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
    ShippingInformationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shippingAddress', instance.shippingAddress?.toJson());
  writeNotNull('billingAddress', instance.billingAddress?.toJson());
  writeNotNull('shippingMethodCode', instance.shippingMethodCode);
  writeNotNull('shippingCarrierCode', instance.shippingCarrierCode);
  writeNotNull('customAttributes', instance.customAttributes);
  return val;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      code: json['code'] as String?,
      title: json['title'] as String?,
      available: json['available'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('title', instance.title);
  writeNotNull('available', instance.available);
  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('additionalData', instance.additionalData);
  return val;
}

CartValidationResult _$CartValidationResultFromJson(
        Map<String, dynamic> json) =>
    CartValidationResult(
      isValid: json['isValid'] as bool?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      warnings: (json['warnings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CartValidationResultToJson(
    CartValidationResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isValid', instance.isValid);
  writeNotNull('errors', instance.errors);
  writeNotNull('warnings', instance.warnings);
  writeNotNull('additionalData', instance.additionalData);
  return val;
}
