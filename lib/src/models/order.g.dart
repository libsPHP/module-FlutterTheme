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
  billingAddress: OrderAddress.fromJson(
    json['billingAddress'] as Map<String, dynamic>,
  ),
  shippingAddress: OrderAddress.fromJson(
    json['shippingAddress'] as Map<String, dynamic>,
  ),
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

Map<String, dynamic> _$$OrderImplToJson(
  _$OrderImpl instance,
) => <String, dynamic>{
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
  if (instance.shipping?.toJson() case final value?) 'shipping': value,
  if (instance.comments?.map((e) => e.toJson()).toList() case final value?)
    'comments': value,
  if (instance.customerEmail case final value?) 'customerEmail': value,
  if (instance.customerFirstname case final value?) 'customerFirstname': value,
  if (instance.customerLastname case final value?) 'customerLastname': value,
  if (instance.couponCode case final value?) 'couponCode': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
};

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

Map<String, dynamic> _$$OrderItemImplToJson(
  _$OrderItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'name': instance.name,
  'price': instance.price,
  'quantity': instance.quantity,
  if (instance.rowTotal case final value?) 'rowTotal': value,
  if (instance.image case final value?) 'image': value,
  if (instance.options?.map((e) => e.toJson()).toList() case final value?)
    'options': value,
  if (instance.customAttributes case final value?) 'customAttributes': value,
};

_$OrderItemOptionImpl _$$OrderItemOptionImplFromJson(
  Map<String, dynamic> json,
) => _$OrderItemOptionImpl(
  code: json['code'] as String,
  label: json['label'] as String,
  value: json['value'] as String,
  price: (json['price'] as num?)?.toDouble(),
  priceType: json['priceType'] as String?,
);

Map<String, dynamic> _$$OrderItemOptionImplToJson(
  _$OrderItemOptionImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'label': instance.label,
  'value': instance.value,
  if (instance.price case final value?) 'price': value,
  if (instance.priceType case final value?) 'priceType': value,
};

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

Map<String, dynamic> _$$OrderAddressImplToJson(_$OrderAddressImpl instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      if (instance.middlename case final value?) 'middlename': value,
      if (instance.prefix case final value?) 'prefix': value,
      if (instance.suffix case final value?) 'suffix': value,
      if (instance.company case final value?) 'company': value,
      'street': instance.street,
      'city': instance.city,
      'region': instance.region,
      'postcode': instance.postcode,
      'countryId': instance.countryId,
      if (instance.telephone case final value?) 'telephone': value,
      if (instance.fax case final value?) 'fax': value,
      if (instance.vatId case final value?) 'vatId': value,
    };

_$OrderPaymentImpl _$$OrderPaymentImplFromJson(Map<String, dynamic> json) =>
    _$OrderPaymentImpl(
      method: json['method'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionId: json['transactionId'] as String?,
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$OrderPaymentImplToJson(_$OrderPaymentImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'title': instance.title,
      'amount': instance.amount,
      if (instance.transactionId case final value?) 'transactionId': value,
      if (instance.additionalData case final value?) 'additionalData': value,
    };

_$OrderShippingImpl _$$OrderShippingImplFromJson(Map<String, dynamic> json) =>
    _$OrderShippingImpl(
      method: json['method'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      additionalData: json['additionalData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$OrderShippingImplToJson(_$OrderShippingImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'title': instance.title,
      'amount': instance.amount,
      if (instance.additionalData case final value?) 'additionalData': value,
    };

_$OrderCommentImpl _$$OrderCommentImplFromJson(Map<String, dynamic> json) =>
    _$OrderCommentImpl(
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isVisibleOnFront: json['isVisibleOnFront'] as bool?,
    );

Map<String, dynamic> _$$OrderCommentImplToJson(
  _$OrderCommentImpl instance,
) => <String, dynamic>{
  'comment': instance.comment,
  'createdAt': instance.createdAt.toIso8601String(),
  if (instance.isVisibleOnFront case final value?) 'isVisibleOnFront': value,
};
