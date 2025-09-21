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

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'typeId': instance.typeId,
      'price': instance.price,
      'specialPrice': ?instance.specialPrice,
      'description': ?instance.description,
      'shortDescription': ?instance.shortDescription,
      'images': ?instance.images,
      'thumbnail': ?instance.thumbnail,
      'isInStock': ?instance.isInStock,
      'stockQuantity': ?instance.stockQuantity,
      'weight': ?instance.weight,
      'categories': ?instance.categories,
      'attributes': ?instance.attributes?.map((e) => e.toJson()).toList(),
      'options': ?instance.options?.map((e) => e.toJson()).toList(),
      'variations': ?instance.variations?.map((e) => e.toJson()).toList(),
      'customAttributes': ?instance.customAttributes,
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
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
  'type': ?instance.type,
  'isRequired': ?instance.isRequired,
  'isVisible': ?instance.isVisible,
  'options': ?instance.options,
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
      'isRequired': ?instance.isRequired,
      'price': ?instance.price,
      'priceType': ?instance.priceType,
      'values': ?instance.values,
      'sortOrder': ?instance.sortOrder,
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
  'images': ?instance.images,
  'attributes': ?instance.attributes,
  'isInStock': ?instance.isInStock,
  'stockQuantity': ?instance.stockQuantity,
};
