// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      sku: json['sku'] as String,
      name: json['name'] as String,
      typeId: json['typeId'] as String,
      price: (json['price'] as num).toDouble(),
      specialPrice: (json['specialPrice'] as num?)?.toDouble(),
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      isInStock: json['isInStock'] as bool?,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
      weight: json['weight'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => ProductAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => ProductOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) => ProductVariation.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAttributes: json['customAttributes'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProductImplToJson(
  _$ProductImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'name': instance.name,
  'typeId': instance.typeId,
  'price': instance.price,
  if (instance.specialPrice case final value?) 'specialPrice': value,
  if (instance.description case final value?) 'description': value,
  if (instance.shortDescription case final value?) 'shortDescription': value,
  if (instance.images case final value?) 'images': value,
  if (instance.thumbnail case final value?) 'thumbnail': value,
  if (instance.isInStock case final value?) 'isInStock': value,
  if (instance.stockQuantity case final value?) 'stockQuantity': value,
  if (instance.weight case final value?) 'weight': value,
  if (instance.categories case final value?) 'categories': value,
  if (instance.attributes?.map((e) => e.toJson()).toList() case final value?)
    'attributes': value,
  if (instance.options?.map((e) => e.toJson()).toList() case final value?)
    'options': value,
  if (instance.variations?.map((e) => e.toJson()).toList() case final value?)
    'variations': value,
  if (instance.customAttributes case final value?) 'customAttributes': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
};

_$ProductAttributeImpl _$$ProductAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$ProductAttributeImpl(
  code: json['code'] as String,
  label: json['label'] as String,
  value: json['value'] as String,
  type: json['type'] as String?,
  isRequired: json['isRequired'] as bool?,
  isVisible: json['isVisible'] as bool?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$ProductAttributeImplToJson(
  _$ProductAttributeImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'label': instance.label,
  'value': instance.value,
  if (instance.type case final value?) 'type': value,
  if (instance.isRequired case final value?) 'isRequired': value,
  if (instance.isVisible case final value?) 'isVisible': value,
  if (instance.options case final value?) 'options': value,
};

_$ProductOptionImpl _$$ProductOptionImplFromJson(Map<String, dynamic> json) =>
    _$ProductOptionImpl(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      type: json['type'] as String,
      isRequired: json['isRequired'] as bool?,
      price: (json['price'] as num?)?.toDouble(),
      priceType: json['priceType'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductOptionImplToJson(_$ProductOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      if (instance.isRequired case final value?) 'isRequired': value,
      if (instance.price case final value?) 'price': value,
      if (instance.priceType case final value?) 'priceType': value,
      if (instance.values case final value?) 'values': value,
      if (instance.sortOrder case final value?) 'sortOrder': value,
    };

_$ProductVariationImpl _$$ProductVariationImplFromJson(
  Map<String, dynamic> json,
) => _$ProductVariationImpl(
  id: (json['id'] as num).toInt(),
  sku: json['sku'] as String,
  price: (json['price'] as num).toDouble(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  isInStock: json['isInStock'] as bool?,
  stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ProductVariationImplToJson(
  _$ProductVariationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'price': instance.price,
  if (instance.images case final value?) 'images': value,
  if (instance.attributes case final value?) 'attributes': value,
  if (instance.isInStock case final value?) 'isInStock': value,
  if (instance.stockQuantity case final value?) 'stockQuantity': value,
};
