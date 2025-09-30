// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  id: json['id'] as String,
  customerId: (json['customerId'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num).toDouble(),
  grandTotal: (json['grandTotal'] as num).toDouble(),
  shippingAmount: (json['shippingAmount'] as num?)?.toDouble(),
  taxAmount: (json['taxAmount'] as num?)?.toDouble(),
  discountAmount: (json['discountAmount'] as num?)?.toDouble(),
  couponCode: json['couponCode'] as String?,
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map((e) => CartDiscount.fromJson(e as Map<String, dynamic>))
      .toList(),
  totals: json['totals'] == null
      ? null
      : CartTotals.fromJson(json['totals'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'id': instance.id,
  'customerId': instance.customerId,
  'items': instance.items.map((e) => e.toJson()).toList(),
  'subtotal': instance.subtotal,
  'grandTotal': instance.grandTotal,
  'shippingAmount': ?instance.shippingAmount,
  'taxAmount': ?instance.taxAmount,
  'discountAmount': ?instance.discountAmount,
  'couponCode': ?instance.couponCode,
  'discounts': ?instance.discounts?.map((e) => e.toJson()).toList(),
  'totals': ?instance.totals?.toJson(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: (json['id'] as num).toInt(),
  sku: json['sku'] as String,
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  rowTotal: (json['rowTotal'] as num?)?.toDouble(),
  image: json['image'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => CartItemOption.fromJson(e as Map<String, dynamic>))
      .toList(),
  customAttributes: json['customAttributes'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'name': instance.name,
  'price': instance.price,
  'quantity': instance.quantity,
  'rowTotal': ?instance.rowTotal,
  'image': ?instance.image,
  'options': ?instance.options?.map((e) => e.toJson()).toList(),
  'customAttributes': ?instance.customAttributes,
};

_CartItemOption _$CartItemOptionFromJson(Map<String, dynamic> json) =>
    _CartItemOption(
      code: json['code'] as String,
      label: json['label'] as String,
      value: json['value'] as String,
      price: (json['price'] as num?)?.toDouble(),
      priceType: json['priceType'] as String?,
    );

Map<String, dynamic> _$CartItemOptionToJson(_CartItemOption instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
      'price': ?instance.price,
      'priceType': ?instance.priceType,
    };

_CartDiscount _$CartDiscountFromJson(Map<String, dynamic> json) =>
    _CartDiscount(
      code: json['code'] as String,
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CartDiscountToJson(_CartDiscount instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'amount': instance.amount,
      'type': ?instance.type,
    };

_CartTotals _$CartTotalsFromJson(Map<String, dynamic> json) => _CartTotals(
  subtotal: (json['subtotal'] as num).toDouble(),
  grandTotal: (json['grandTotal'] as num).toDouble(),
  shippingAmount: (json['shippingAmount'] as num?)?.toDouble(),
  taxAmount: (json['taxAmount'] as num?)?.toDouble(),
  discountAmount: (json['discountAmount'] as num?)?.toDouble(),
  subtotalInclTax: (json['subtotalInclTax'] as num?)?.toDouble(),
  shippingInclTax: (json['shippingInclTax'] as num?)?.toDouble(),
  taxBreakdown: (json['taxBreakdown'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$CartTotalsToJson(_CartTotals instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'grandTotal': instance.grandTotal,
      'shippingAmount': ?instance.shippingAmount,
      'taxAmount': ?instance.taxAmount,
      'discountAmount': ?instance.discountAmount,
      'subtotalInclTax': ?instance.subtotalInclTax,
      'shippingInclTax': ?instance.shippingInclTax,
      'taxBreakdown': ?instance.taxBreakdown,
    };
