// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num).toInt(),
      incrementId: json['incrementId'] as String,
      status: json['status'] as String,
      state: json['state'] as String,
      grandTotal: (json['grandTotal'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      shippingAmount: (json['shippingAmount'] as num).toDouble(),
      taxAmount: (json['taxAmount'] as num).toDouble(),
      discountAmount: (json['discountAmount'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      billingAddress:
          OrderAddress.fromJson(json['billingAddress'] as Map<String, dynamic>),
      shippingAddress: OrderAddress.fromJson(
          json['shippingAddress'] as Map<String, dynamic>),
      payment: OrderPayment.fromJson(json['payment'] as Map<String, dynamic>),
      shipping: json['shipping'] == null
          ? null
          : OrderShipping.fromJson(json['shipping'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => OrderComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerEmail: json['customerEmail'] as String?,
      customerFirstname: json['customerFirstname'] as String?,
      customerLastname: json['customerLastname'] as String?,
      couponCode: json['couponCode'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'incrementId': instance.incrementId,
    'status': instance.status,
    'state': instance.state,
    'grandTotal': instance.grandTotal,
    'subtotal': instance.subtotal,
    'shippingAmount': instance.shippingAmount,
    'taxAmount': instance.taxAmount,
    'discountAmount': instance.discountAmount,
    'items': instance.items.map((e) => e.toJson()).toList(),
    'billingAddress': instance.billingAddress.toJson(),
    'shippingAddress': instance.shippingAddress.toJson(),
    'payment': instance.payment.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shipping', instance.shipping?.toJson());
  writeNotNull('comments', instance.comments?.map((e) => e.toJson()).toList());
  writeNotNull('customerEmail', instance.customerEmail);
  writeNotNull('customerFirstname', instance.customerFirstname);
  writeNotNull('customerLastname', instance.customerLastname);
  writeNotNull('couponCode', instance.couponCode);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

_$OrderItemImpl _$$OrderItemImplFromJson(Map<String, dynamic> json) =>
    _$OrderItemImpl(
      id: (json['id'] as num).toInt(),
      sku: json['sku'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      rowTotal: (json['rowTotal'] as num?)?.toDouble(),
      image: json['image'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OrderItemOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAttributes: json['customAttributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$OrderItemImplToJson(_$OrderItemImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'sku': instance.sku,
    'name': instance.name,
    'price': instance.price,
    'quantity': instance.quantity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rowTotal', instance.rowTotal);
  writeNotNull('image', instance.image);
  writeNotNull('options', instance.options?.map((e) => e.toJson()).toList());
  writeNotNull('customAttributes', instance.customAttributes);
  return val;
}

_$OrderItemOptionImpl _$$OrderItemOptionImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderItemOptionImpl(
      code: json['code'] as String,
      label: json['label'] as String,
      value: json['value'] as String,
      price: (json['price'] as num?)?.toDouble(),
      priceType: json['priceType'] as String?,
    );

Map<String, dynamic> _$$OrderItemOptionImplToJson(
    _$OrderItemOptionImpl instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'label': instance.label,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('price', instance.price);
  writeNotNull('priceType', instance.priceType);
  return val;
}

_$OrderAddressImpl _$$OrderAddressImplFromJson(Map<String, dynamic> json) =>
    _$OrderAddressImpl(
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
    );

Map<String, dynamic> _$$OrderAddressImplToJson(_$OrderAddressImpl instance) {
  final val = <String, dynamic>{
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
  return val;
}

_$OrderPaymentImpl _$$OrderPaymentImplFromJson(Map<String, dynamic> json) =>
    _$OrderPaymentImpl(
      method: json['method'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionId: json['transactionId'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$OrderPaymentImplToJson(_$OrderPaymentImpl instance) {
  final val = <String, dynamic>{
    'method': instance.method,
    'title': instance.title,
    'amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('additionalData', instance.additionalData);
  return val;
}

_$OrderShippingImpl _$$OrderShippingImplFromJson(Map<String, dynamic> json) =>
    _$OrderShippingImpl(
      method: json['method'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$OrderShippingImplToJson(_$OrderShippingImpl instance) {
  final val = <String, dynamic>{
    'method': instance.method,
    'title': instance.title,
    'amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalData', instance.additionalData);
  return val;
}

_$OrderCommentImpl _$$OrderCommentImplFromJson(Map<String, dynamic> json) =>
    _$OrderCommentImpl(
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isVisibleOnFront: json['isVisibleOnFront'] as bool?,
    );

Map<String, dynamic> _$$OrderCommentImplToJson(_$OrderCommentImpl instance) {
  final val = <String, dynamic>{
    'comment': instance.comment,
    'createdAt': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isVisibleOnFront', instance.isVisibleOnFront);
  return val;
}
