// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
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

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'subtotal': instance.subtotal,
      'grandTotal': instance.grandTotal,
      if (instance.shippingAmount case final value?) 'shippingAmount': value,
      if (instance.taxAmount case final value?) 'taxAmount': value,
      if (instance.discountAmount case final value?) 'discountAmount': value,
      if (instance.couponCode case final value?) 'couponCode': value,
      if (instance.discounts?.map((e) => e.toJson()).toList() case final value?)
        'discounts': value,
      if (instance.totals?.toJson() case final value?) 'totals': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
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

Map<String, dynamic> _$$CartItemImplToJson(
  _$CartItemImpl instance,
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

_$CartItemOptionImpl _$$CartItemOptionImplFromJson(Map<String, dynamic> json) =>
    _$CartItemOptionImpl(
      code: json['code'] as String,
      label: json['label'] as String,
      value: json['value'] as String,
      price: (json['price'] as num?)?.toDouble(),
      priceType: json['priceType'] as String?,
    );

Map<String, dynamic> _$$CartItemOptionImplToJson(
  _$CartItemOptionImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'label': instance.label,
  'value': instance.value,
  if (instance.price case final value?) 'price': value,
  if (instance.priceType case final value?) 'priceType': value,
};

_$CartDiscountImpl _$$CartDiscountImplFromJson(Map<String, dynamic> json) =>
    _$CartDiscountImpl(
      code: json['code'] as String,
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$CartDiscountImplToJson(_$CartDiscountImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'amount': instance.amount,
      if (instance.type case final value?) 'type': value,
    };

_$CartTotalsImpl _$$CartTotalsImplFromJson(Map<String, dynamic> json) =>
    _$CartTotalsImpl(
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

Map<String, dynamic> _$$CartTotalsImplToJson(_$CartTotalsImpl instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'grandTotal': instance.grandTotal,
      if (instance.shippingAmount case final value?) 'shippingAmount': value,
      if (instance.taxAmount case final value?) 'taxAmount': value,
      if (instance.discountAmount case final value?) 'discountAmount': value,
      if (instance.subtotalInclTax case final value?) 'subtotalInclTax': value,
      if (instance.shippingInclTax case final value?) 'shippingInclTax': value,
      if (instance.taxBreakdown case final value?) 'taxBreakdown': value,
    };
