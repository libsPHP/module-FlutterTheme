// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num).toInt(),
  sku: json['sku'] as String,
  name: json['name'] as String,
  typeId: json['typeId'] as String,
  price: (json['price'] as num).toDouble(),
  specialPrice: (json['specialPrice'] as num?)?.toDouble(),
  description: json['description'] as String?,
  shortDescription: json['shortDescription'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
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

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
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

_ProductAttribute _$ProductAttributeFromJson(Map<String, dynamic> json) =>
    _ProductAttribute(
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

Map<String, dynamic> _$ProductAttributeToJson(_ProductAttribute instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
      'type': ?instance.type,
      'isRequired': ?instance.isRequired,
      'isVisible': ?instance.isVisible,
      'options': ?instance.options,
    };

_ProductOption _$ProductOptionFromJson(Map<String, dynamic> json) =>
    _ProductOption(
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

Map<String, dynamic> _$ProductOptionToJson(_ProductOption instance) =>
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

_ProductVariation _$ProductVariationFromJson(Map<String, dynamic> json) =>
    _ProductVariation(
      id: (json['id'] as num).toInt(),
      sku: json['sku'] as String,
      price: (json['price'] as num).toDouble(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attributes: (json['attributes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      isInStock: json['isInStock'] as bool?,
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductVariationToJson(_ProductVariation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'price': instance.price,
      'images': ?instance.images,
      'attributes': ?instance.attributes,
      'isInStock': ?instance.isInStock,
      'stockQuantity': ?instance.stockQuantity,
    };
