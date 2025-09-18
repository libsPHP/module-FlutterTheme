// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckoutSessionImpl _$$CheckoutSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutSessionImpl(
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
    _$CheckoutSessionImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'cartId': instance.cartId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('shippingAddress', instance.shippingAddress);
  writeNotNull('billingAddress', instance.billingAddress);
  writeNotNull('shippingMethod', instance.shippingMethod);
  writeNotNull('paymentMethod', instance.paymentMethod);
  writeNotNull('additionalData', instance.additionalData);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

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
    _$ShippingMethodImpl instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'title': instance.title,
    'amount': instance.amount,
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('carrierCode', instance.carrierCode);
  writeNotNull('carrierTitle', instance.carrierTitle);
  writeNotNull('methodCode', instance.methodCode);
  writeNotNull('methodTitle', instance.methodTitle);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      code: json['code'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      config: json['config'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('config', instance.config);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CheckoutValidationResultImpl _$$CheckoutValidationResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutValidationResultImpl(
      isValid: json['isValid'] as bool,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      warnings: (json['warnings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CheckoutValidationResultImplToJson(
    _$CheckoutValidationResultImpl instance) {
  final val = <String, dynamic>{
    'isValid': instance.isValid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errors', instance.errors);
  writeNotNull('warnings', instance.warnings);
  writeNotNull('additionalData', instance.additionalData);
  return val;
}

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
    _$CheckoutTotalsImpl instance) {
  final val = <String, dynamic>{
    'grandTotal': instance.grandTotal,
    'subtotal': instance.subtotal,
    'subtotalInclTax': instance.subtotalInclTax,
    'shippingAmount': instance.shippingAmount,
    'shippingInclTax': instance.shippingInclTax,
    'taxAmount': instance.taxAmount,
    'discountAmount': instance.discountAmount,
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CheckoutTotalItemImpl _$$CheckoutTotalItemImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutTotalItemImpl(
      code: json['code'] as String,
      title: json['title'] as String,
      value: (json['value'] as num).toDouble(),
      currency: json['currency'] as String,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CheckoutTotalItemImplToJson(
    _$CheckoutTotalItemImpl instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'title': instance.title,
    'value': instance.value,
    'currency': instance.currency,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$GuestCheckoutInfoImpl _$$GuestCheckoutInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestCheckoutInfoImpl(
      cartId: json['cartId'] as String,
      email: json['email'] as String?,
      shippingAddress: json['shippingAddress'] as Map<String, dynamic>?,
      billingAddress: json['billingAddress'] as Map<String, dynamic>?,
      availableShippingMethods:
          (json['availableShippingMethods'] as List<dynamic>?)
              ?.map((e) => ShippingMethod.fromJson(e as Map<String, dynamic>))
              .toList(),
      availablePaymentMethods:
          (json['availablePaymentMethods'] as List<dynamic>?)
              ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
              .toList(),
      totals: json['totals'] == null
          ? null
          : CheckoutTotals.fromJson(json['totals'] as Map<String, dynamic>),
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GuestCheckoutInfoImplToJson(
    _$GuestCheckoutInfoImpl instance) {
  final val = <String, dynamic>{
    'cartId': instance.cartId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email', instance.email);
  writeNotNull('shippingAddress', instance.shippingAddress);
  writeNotNull('billingAddress', instance.billingAddress);
  writeNotNull('availableShippingMethods',
      instance.availableShippingMethods?.map((e) => e.toJson()).toList());
  writeNotNull('availablePaymentMethods',
      instance.availablePaymentMethods?.map((e) => e.toJson()).toList());
  writeNotNull('totals', instance.totals?.toJson());
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CheckoutAddressImpl _$$CheckoutAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutAddressImpl(
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
      sameAsBilling: json['sameAsBilling'] as bool?,
      saveInAddressBook: json['saveInAddressBook'] as bool?,
      customAttributes: json['customAttributes'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CheckoutAddressImplToJson(
    _$CheckoutAddressImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
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
  writeNotNull('sameAsBilling', instance.sameAsBilling);
  writeNotNull('saveInAddressBook', instance.saveInAddressBook);
  writeNotNull('customAttributes', instance.customAttributes);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CheckoutPaymentInfoImpl _$$CheckoutPaymentInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutPaymentInfoImpl(
      method: json['method'] as String,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CheckoutPaymentInfoImplToJson(
    _$CheckoutPaymentInfoImpl instance) {
  final val = <String, dynamic>{
    'method': instance.method,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalData', instance.additionalData);
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}

_$CheckoutShippingInfoImpl _$$CheckoutShippingInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutShippingInfoImpl(
      method: json['method'] as String,
      address: json['address'] == null
          ? null
          : CheckoutAddress.fromJson(json['address'] as Map<String, dynamic>),
      extensionAttributes: json['extensionAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CheckoutShippingInfoImplToJson(
    _$CheckoutShippingInfoImpl instance) {
  final val = <String, dynamic>{
    'method': instance.method,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address?.toJson());
  writeNotNull('extensionAttributes', instance.extensionAttributes);
  return val;
}
