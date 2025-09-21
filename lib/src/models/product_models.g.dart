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

Map<String, dynamic> _$$ProductImplToJson(
  _$ProductImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'name': instance.name,
  'typeId': instance.typeId,
  'price': instance.price,
  if (instance.specialPrice case final value?) 'specialPrice': value,
  'status': instance.status,
  'visibility': instance.visibility,
  'stockStatus': instance.stockStatus,
  if (instance.stockQuantity case final value?) 'stockQuantity': value,
  if (instance.description case final value?) 'description': value,
  if (instance.shortDescription case final value?) 'shortDescription': value,
  if (instance.metaTitle case final value?) 'metaTitle': value,
  if (instance.metaDescription case final value?) 'metaDescription': value,
  if (instance.metaKeyword case final value?) 'metaKeyword': value,
  if (instance.categories case final value?) 'categories': value,
  if (instance.websites case final value?) 'websites': value,
  if (instance.customAttributes?.map((e) => e.toJson()).toList()
      case final value?)
    'customAttributes': value,
  if (instance.mediaGalleryEntries?.map((e) => e.toJson()).toList()
      case final value?)
    'mediaGalleryEntries': value,
  if (instance.options?.map((e) => e.toJson()).toList() case final value?)
    'options': value,
  if (instance.productLinks?.map((e) => e.toJson()).toList() case final value?)
    'productLinks': value,
  if (instance.tierPrices?.map((e) => e.toJson()).toList() case final value?)
    'tierPrices': value,
  if (instance.reviews?.map((e) => e.toJson()).toList() case final value?)
    'reviews': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
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
  if (instance.aggregations?.map((e) => e.toJson()).toList() case final value?)
    'aggregations': value,
  if (instance.sortOptions?.map((e) => e.toJson()).toList() case final value?)
    'sortOptions': value,
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

Map<String, dynamic> _$$CategoryImplToJson(
  _$CategoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  if (instance.description case final value?) 'description': value,
  if (instance.image case final value?) 'image': value,
  if (instance.parentId case final value?) 'parentId': value,
  'level': instance.level,
  'position': instance.position,
  'isActive': instance.isActive,
  'childrenCount': instance.childrenCount,
  if (instance.children?.map((e) => e.toJson()).toList() case final value?)
    'children': value,
  if (instance.attributes?.map((e) => e.toJson()).toList() case final value?)
    'attributes': value,
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
  if (instance.page case final value?) 'page': value,
  if (instance.pageSize case final value?) 'pageSize': value,
  if (instance.searchQuery case final value?) 'searchQuery': value,
  if (instance.categoryId case final value?) 'categoryId': value,
  if (instance.sortBy case final value?) 'sortBy': value,
  if (instance.sortOrder case final value?) 'sortOrder': value,
  if (instance.filters case final value?) 'filters': value,
  if (instance.minPrice case final value?) 'minPrice': value,
  if (instance.maxPrice case final value?) 'maxPrice': value,
  if (instance.attributes case final value?) 'attributes': value,
  if (instance.inStock case final value?) 'inStock': value,
  if (instance.brand case final value?) 'brand': value,
  if (instance.tags case final value?) 'tags': value,
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
  if (instance.label case final value?) 'label': value,
  if (instance.type case final value?) 'type': value,
  if (instance.options case final value?) 'options': value,
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
  if (instance.types case final value?) 'types': value,
  'file': instance.file,
  if (instance.thumbnail case final value?) 'thumbnail': value,
  if (instance.smallImage case final value?) 'smallImage': value,
  if (instance.baseImage case final value?) 'baseImage': value,
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
      if (instance.values?.map((e) => e.toJson()).toList() case final value?)
        'values': value,
      if (instance.defaultValue case final value?) 'defaultValue': value,
      if (instance.maxCharacters case final value?) 'maxCharacters': value,
      if (instance.fileExtension case final value?) 'fileExtension': value,
      if (instance.imageSizeX case final value?) 'imageSizeX': value,
      if (instance.imageSizeY case final value?) 'imageSizeY': value,
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
  if (instance.price case final value?) 'price': value,
  if (instance.priceType case final value?) 'priceType': value,
  if (instance.sku case final value?) 'sku': value,
  if (instance.sortOrder case final value?) 'sortOrder': value,
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
      if (instance.position case final value?) 'position': value,
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
      if (instance.websiteId case final value?) 'websiteId': value,
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
      if (instance.status case final value?) 'status': value,
      if (instance.ratings?.map((e) => e.toJson()).toList() case final value?)
        'ratings': value,
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
  if (instance.isSelected case final value?) 'isSelected': value,
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
      if (instance.isSelected case final value?) 'isSelected': value,
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
  if (instance.label case final value?) 'label': value,
};
