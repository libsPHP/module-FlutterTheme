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

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'customerId': instance.customerId,
    'items': instance.items.map((e) => e.toJson()).toList(),
    'subtotal': instance.subtotal,
    'grandTotal': instance.grandTotal,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shippingAmount', instance.shippingAmount);
  writeNotNull('taxAmount', instance.taxAmount);
  writeNotNull('discountAmount', instance.discountAmount);
  writeNotNull('couponCode', instance.couponCode);
  writeNotNull(
      'discounts', instance.discounts?.map((e) => e.toJson()).toList());
  writeNotNull('totals', instance.totals?.toJson());
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

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

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) {
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

_$CartItemOptionImpl _$$CartItemOptionImplFromJson(Map<String, dynamic> json) =>
    _$CartItemOptionImpl(
      code: json['code'] as String,
      label: json['label'] as String,
      value: json['value'] as String,
      price: (json['price'] as num?)?.toDouble(),
      priceType: json['priceType'] as String?,
    );

Map<String, dynamic> _$$CartItemOptionImplToJson(
    _$CartItemOptionImpl instance) {
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

_$CartDiscountImpl _$$CartDiscountImplFromJson(Map<String, dynamic> json) =>
    _$CartDiscountImpl(
      code: json['code'] as String,
      label: json['label'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$CartDiscountImplToJson(_$CartDiscountImpl instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'label': instance.label,
    'amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  return val;
}

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

Map<String, dynamic> _$$CartTotalsImplToJson(_$CartTotalsImpl instance) {
  final val = <String, dynamic>{
    'subtotal': instance.subtotal,
    'grandTotal': instance.grandTotal,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('shippingAmount', instance.shippingAmount);
  writeNotNull('taxAmount', instance.taxAmount);
  writeNotNull('discountAmount', instance.discountAmount);
  writeNotNull('subtotalInclTax', instance.subtotalInclTax);
  writeNotNull('shippingInclTax', instance.shippingInclTax);
  writeNotNull('taxBreakdown', instance.taxBreakdown);
  return val;
}
