// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_models.dart';

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
      status: (json['status'] as num).toInt(),
      visibility: (json['visibility'] as num).toInt(),
      stockStatus: (json['stockStatus'] as num).toInt(),
      stockQuantity: (json['stockQuantity'] as num?)?.toInt(),
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      metaTitle: json['metaTitle'] as String?,
      metaDescription: json['metaDescription'] as String?,
      metaKeyword: json['metaKeyword'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      websites: (json['websites'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      customAttributes: (json['customAttributes'] as List<dynamic>?)
          ?.map((e) => CustomAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaGalleryEntries: (json['mediaGalleryEntries'] as List<dynamic>?)
          ?.map((e) => MediaGalleryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => ProductOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      productLinks: (json['productLinks'] as List<dynamic>?)
          ?.map((e) => ProductLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      tierPrices: (json['tierPrices'] as List<dynamic>?)
          ?.map((e) => TierPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'status': instance.status,
      'visibility': instance.visibility,
      'stockStatus': instance.stockStatus,
      'stockQuantity': ?instance.stockQuantity,
      'description': ?instance.description,
      'shortDescription': ?instance.shortDescription,
      'metaTitle': ?instance.metaTitle,
      'metaDescription': ?instance.metaDescription,
      'metaKeyword': ?instance.metaKeyword,
      'categories': ?instance.categories,
      'websites': ?instance.websites,
      'customAttributes': ?instance.customAttributes
          ?.map((e) => e.toJson())
          .toList(),
      'mediaGalleryEntries': ?instance.mediaGalleryEntries
          ?.map((e) => e.toJson())
          .toList(),
      'options': ?instance.options?.map((e) => e.toJson()).toList(),
      'productLinks': ?instance.productLinks?.map((e) => e.toJson()).toList(),
      'tierPrices': ?instance.tierPrices?.map((e) => e.toJson()).toList(),
      'reviews': ?instance.reviews?.map((e) => e.toJson()).toList(),
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'updatedAt': ?instance.updatedAt?.toIso8601String(),
    };

_$ProductListResponseImpl _$$ProductListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ProductListResponseImpl(
  items: (json['items'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['totalCount'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  currentPage: (json['currentPage'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  aggregations: (json['aggregations'] as List<dynamic>?)
      ?.map((e) => Aggregation.fromJson(e as Map<String, dynamic>))
      .toList(),
  sortOptions: (json['sortOptions'] as List<dynamic>?)
      ?.map((e) => SortOption.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ProductListResponseImplToJson(
  _$ProductListResponseImpl instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'totalCount': instance.totalCount,
  'pageSize': instance.pageSize,
  'currentPage': instance.currentPage,
  'totalPages': instance.totalPages,
  'aggregations': ?instance.aggregations?.map((e) => e.toJson()).toList(),
  'sortOptions': ?instance.sortOptions?.map((e) => e.toJson()).toList(),
};

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      parentId: (json['parentId'] as num?)?.toInt(),
      level: (json['level'] as num).toInt(),
      position: (json['position'] as num).toInt(),
      isActive: json['isActive'] as bool,
      childrenCount: (json['childrenCount'] as num).toInt(),
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => CategoryAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': ?instance.description,
      'image': ?instance.image,
      'parentId': ?instance.parentId,
      'level': instance.level,
      'position': instance.position,
      'isActive': instance.isActive,
      'childrenCount': instance.childrenCount,
      'children': ?instance.children?.map((e) => e.toJson()).toList(),
      'attributes': ?instance.attributes?.map((e) => e.toJson()).toList(),
    };

_$CategoryTreeImpl _$$CategoryTreeImplFromJson(Map<String, dynamic> json) =>
    _$CategoryTreeImpl(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryTreeImplToJson(_$CategoryTreeImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
      'totalCount': instance.totalCount,
    };

_$ProductFilterParamsImpl _$$ProductFilterParamsImplFromJson(
  Map<String, dynamic> json,
) => _$ProductFilterParamsImpl(
  page: (json['page'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  searchQuery: json['searchQuery'] as String?,
  categoryId: json['categoryId'] as String?,
  sortBy: json['sortBy'] as String?,
  sortOrder: json['sortOrder'] as String?,
  filters: json['filters'] as Map<String, dynamic>?,
  minPrice: (json['minPrice'] as num?)?.toDouble(),
  maxPrice: (json['maxPrice'] as num?)?.toDouble(),
  attributes: (json['attributes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  inStock: json['inStock'] as bool?,
  brand: json['brand'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$$ProductFilterParamsImplToJson(
  _$ProductFilterParamsImpl instance,
) => <String, dynamic>{
  'page': ?instance.page,
  'pageSize': ?instance.pageSize,
  'searchQuery': ?instance.searchQuery,
  'categoryId': ?instance.categoryId,
  'sortBy': ?instance.sortBy,
  'sortOrder': ?instance.sortOrder,
  'filters': ?instance.filters,
  'minPrice': ?instance.minPrice,
  'maxPrice': ?instance.maxPrice,
  'attributes': ?instance.attributes,
  'inStock': ?instance.inStock,
  'brand': ?instance.brand,
  'tags': ?instance.tags,
};

_$CustomAttributeImpl _$$CustomAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$CustomAttributeImpl(
  attributeCode: json['attributeCode'] as String,
  value: json['value'] as String,
  label: json['label'] as String?,
  type: json['type'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$CustomAttributeImplToJson(
  _$CustomAttributeImpl instance,
) => <String, dynamic>{
  'attributeCode': instance.attributeCode,
  'value': instance.value,
  'label': ?instance.label,
  'type': ?instance.type,
  'options': ?instance.options,
};

_$MediaGalleryEntryImpl _$$MediaGalleryEntryImplFromJson(
  Map<String, dynamic> json,
) => _$MediaGalleryEntryImpl(
  id: (json['id'] as num).toInt(),
  mediaType: json['mediaType'] as String,
  label: json['label'] as String,
  position: (json['position'] as num).toInt(),
  disabled: json['disabled'] as bool,
  types: (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
  file: json['file'] as String,
  thumbnail: json['thumbnail'] as String?,
  smallImage: json['smallImage'] as String?,
  baseImage: json['baseImage'] as String?,
);

Map<String, dynamic> _$$MediaGalleryEntryImplToJson(
  _$MediaGalleryEntryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'mediaType': instance.mediaType,
  'label': instance.label,
  'position': instance.position,
  'disabled': instance.disabled,
  'types': ?instance.types,
  'file': instance.file,
  'thumbnail': ?instance.thumbnail,
  'smallImage': ?instance.smallImage,
  'baseImage': ?instance.baseImage,
};

_$ProductOptionImpl _$$ProductOptionImplFromJson(Map<String, dynamic> json) =>
    _$ProductOptionImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      type: json['type'] as String,
      required: json['required'] as bool,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => ProductOptionValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultValue: json['defaultValue'] as String?,
      maxCharacters: (json['maxCharacters'] as num?)?.toInt(),
      fileExtension: json['fileExtension'] as String?,
      imageSizeX: json['imageSizeX'] as String?,
      imageSizeY: json['imageSizeY'] as String?,
    );

Map<String, dynamic> _$$ProductOptionImplToJson(_$ProductOptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'required': instance.required,
      'values': ?instance.values?.map((e) => e.toJson()).toList(),
      'defaultValue': ?instance.defaultValue,
      'maxCharacters': ?instance.maxCharacters,
      'fileExtension': ?instance.fileExtension,
      'imageSizeX': ?instance.imageSizeX,
      'imageSizeY': ?instance.imageSizeY,
    };

_$ProductOptionValueImpl _$$ProductOptionValueImplFromJson(
  Map<String, dynamic> json,
) => _$ProductOptionValueImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  price: (json['price'] as num?)?.toDouble(),
  priceType: json['priceType'] as String?,
  sku: json['sku'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ProductOptionValueImplToJson(
  _$ProductOptionValueImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'price': ?instance.price,
  'priceType': ?instance.priceType,
  'sku': ?instance.sku,
  'sortOrder': ?instance.sortOrder,
};

_$ProductLinkImpl _$$ProductLinkImplFromJson(Map<String, dynamic> json) =>
    _$ProductLinkImpl(
      id: (json['id'] as num).toInt(),
      linkType: json['linkType'] as String,
      linkedProduct: Product.fromJson(
        json['linkedProduct'] as Map<String, dynamic>,
      ),
      position: (json['position'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductLinkImplToJson(_$ProductLinkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'linkType': instance.linkType,
      'linkedProduct': instance.linkedProduct.toJson(),
      'position': ?instance.position,
    };

_$TierPriceImpl _$$TierPriceImplFromJson(Map<String, dynamic> json) =>
    _$TierPriceImpl(
      id: (json['id'] as num).toInt(),
      customerGroupId: (json['customerGroupId'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      qty: (json['qty'] as num).toInt(),
      websiteId: json['websiteId'] as String?,
    );

Map<String, dynamic> _$$TierPriceImplToJson(_$TierPriceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerGroupId': instance.customerGroupId,
      'price': instance.price,
      'qty': instance.qty,
      'websiteId': ?instance.websiteId,
    };

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  detail: json['detail'] as String,
  nickname: json['nickname'] as String,
  customerId: (json['customerId'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  status: json['status'] as String?,
  ratings: (json['ratings'] as List<dynamic>?)
      ?.map((e) => ReviewRating.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'detail': instance.detail,
      'nickname': instance.nickname,
      'customerId': instance.customerId,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': ?instance.status,
      'ratings': ?instance.ratings?.map((e) => e.toJson()).toList(),
    };

_$ReviewRatingImpl _$$ReviewRatingImplFromJson(Map<String, dynamic> json) =>
    _$ReviewRatingImpl(
      id: (json['id'] as num).toInt(),
      ratingName: json['ratingName'] as String,
      rating: (json['rating'] as num).toDouble(),
      ratingId: (json['ratingId'] as num).toInt(),
    );

Map<String, dynamic> _$$ReviewRatingImplToJson(_$ReviewRatingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ratingName': instance.ratingName,
      'rating': instance.rating,
      'ratingId': instance.ratingId,
    };

_$AggregationImpl _$$AggregationImplFromJson(Map<String, dynamic> json) =>
    _$AggregationImpl(
      attributeCode: json['attributeCode'] as String,
      label: json['label'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => AggregationOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$AggregationImplToJson(_$AggregationImpl instance) =>
    <String, dynamic>{
      'attributeCode': instance.attributeCode,
      'label': instance.label,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };

_$AggregationOptionImpl _$$AggregationOptionImplFromJson(
  Map<String, dynamic> json,
) => _$AggregationOptionImpl(
  value: json['value'] as String,
  label: json['label'] as String,
  count: (json['count'] as num).toInt(),
  isSelected: json['isSelected'] as bool?,
);

Map<String, dynamic> _$$AggregationOptionImplToJson(
  _$AggregationOptionImpl instance,
) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label,
  'count': instance.count,
  'isSelected': ?instance.isSelected,
};

_$SortOptionImpl _$$SortOptionImplFromJson(Map<String, dynamic> json) =>
    _$SortOptionImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$$SortOptionImplToJson(_$SortOptionImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'isSelected': ?instance.isSelected,
    };

_$CategoryAttributeImpl _$$CategoryAttributeImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryAttributeImpl(
  attributeCode: json['attributeCode'] as String,
  value: json['value'] as String,
  label: json['label'] as String?,
);

Map<String, dynamic> _$$CategoryAttributeImplToJson(
  _$CategoryAttributeImpl instance,
) => <String, dynamic>{
  'attributeCode': instance.attributeCode,
  'value': instance.value,
  'label': ?instance.label,
};
