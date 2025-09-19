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

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'sku': instance.sku,
    'name': instance.name,
    'typeId': instance.typeId,
    'price': instance.price,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('specialPrice', instance.specialPrice);
  val['status'] = instance.status;
  val['visibility'] = instance.visibility;
  val['stockStatus'] = instance.stockStatus;
  writeNotNull('stockQuantity', instance.stockQuantity);
  writeNotNull('description', instance.description);
  writeNotNull('shortDescription', instance.shortDescription);
  writeNotNull('metaTitle', instance.metaTitle);
  writeNotNull('metaDescription', instance.metaDescription);
  writeNotNull('metaKeyword', instance.metaKeyword);
  writeNotNull('categories', instance.categories);
  writeNotNull('websites', instance.websites);
  writeNotNull('customAttributes',
      instance.customAttributes?.map((e) => e.toJson()).toList());
  writeNotNull('mediaGalleryEntries',
      instance.mediaGalleryEntries?.map((e) => e.toJson()).toList());
  writeNotNull('options', instance.options?.map((e) => e.toJson()).toList());
  writeNotNull(
      'productLinks', instance.productLinks?.map((e) => e.toJson()).toList());
  writeNotNull(
      'tierPrices', instance.tierPrices?.map((e) => e.toJson()).toList());
  writeNotNull('reviews', instance.reviews?.map((e) => e.toJson()).toList());
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

_$ProductListResponseImpl _$$ProductListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductListResponseImpl(
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
    _$ProductListResponseImpl instance) {
  final val = <String, dynamic>{
    'items': instance.items.map((e) => e.toJson()).toList(),
    'totalCount': instance.totalCount,
    'pageSize': instance.pageSize,
    'currentPage': instance.currentPage,
    'totalPages': instance.totalPages,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'aggregations', instance.aggregations?.map((e) => e.toJson()).toList());
  writeNotNull(
      'sortOptions', instance.sortOptions?.map((e) => e.toJson()).toList());
  return val;
}

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

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('image', instance.image);
  writeNotNull('parentId', instance.parentId);
  val['level'] = instance.level;
  val['position'] = instance.position;
  val['isActive'] = instance.isActive;
  val['childrenCount'] = instance.childrenCount;
  writeNotNull('children', instance.children?.map((e) => e.toJson()).toList());
  writeNotNull(
      'attributes', instance.attributes?.map((e) => e.toJson()).toList());
  return val;
}

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
        Map<String, dynamic> json) =>
    _$ProductFilterParamsImpl(
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
    _$ProductFilterParamsImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page', instance.page);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('searchQuery', instance.searchQuery);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('sortBy', instance.sortBy);
  writeNotNull('sortOrder', instance.sortOrder);
  writeNotNull('filters', instance.filters);
  writeNotNull('minPrice', instance.minPrice);
  writeNotNull('maxPrice', instance.maxPrice);
  writeNotNull('attributes', instance.attributes);
  writeNotNull('inStock', instance.inStock);
  writeNotNull('brand', instance.brand);
  writeNotNull('tags', instance.tags);
  return val;
}

_$CustomAttributeImpl _$$CustomAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomAttributeImpl(
      attributeCode: json['attributeCode'] as String,
      value: json['value'] as String,
      label: json['label'] as String?,
      type: json['type'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CustomAttributeImplToJson(
    _$CustomAttributeImpl instance) {
  final val = <String, dynamic>{
    'attributeCode': instance.attributeCode,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  writeNotNull('type', instance.type);
  writeNotNull('options', instance.options);
  return val;
}

_$MediaGalleryEntryImpl _$$MediaGalleryEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaGalleryEntryImpl(
      id: (json['id'] as num).toInt(),
      mediaType: json['mediaType'] as String,
      label: json['label'] as String,
      position: (json['position'] as num).toInt(),
      disabled: json['disabled'] as bool,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      file: json['file'] as String,
      thumbnail: json['thumbnail'] as String?,
      smallImage: json['smallImage'] as String?,
      baseImage: json['baseImage'] as String?,
    );

Map<String, dynamic> _$$MediaGalleryEntryImplToJson(
    _$MediaGalleryEntryImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'mediaType': instance.mediaType,
    'label': instance.label,
    'position': instance.position,
    'disabled': instance.disabled,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('types', instance.types);
  val['file'] = instance.file;
  writeNotNull('thumbnail', instance.thumbnail);
  writeNotNull('smallImage', instance.smallImage);
  writeNotNull('baseImage', instance.baseImage);
  return val;
}

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

Map<String, dynamic> _$$ProductOptionImplToJson(_$ProductOptionImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'type': instance.type,
    'required': instance.required,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('values', instance.values?.map((e) => e.toJson()).toList());
  writeNotNull('defaultValue', instance.defaultValue);
  writeNotNull('maxCharacters', instance.maxCharacters);
  writeNotNull('fileExtension', instance.fileExtension);
  writeNotNull('imageSizeX', instance.imageSizeX);
  writeNotNull('imageSizeY', instance.imageSizeY);
  return val;
}

_$ProductOptionValueImpl _$$ProductOptionValueImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductOptionValueImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num?)?.toDouble(),
      priceType: json['priceType'] as String?,
      sku: json['sku'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductOptionValueImplToJson(
    _$ProductOptionValueImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('price', instance.price);
  writeNotNull('priceType', instance.priceType);
  writeNotNull('sku', instance.sku);
  writeNotNull('sortOrder', instance.sortOrder);
  return val;
}

_$ProductLinkImpl _$$ProductLinkImplFromJson(Map<String, dynamic> json) =>
    _$ProductLinkImpl(
      id: (json['id'] as num).toInt(),
      linkType: json['linkType'] as String,
      linkedProduct:
          Product.fromJson(json['linkedProduct'] as Map<String, dynamic>),
      position: (json['position'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductLinkImplToJson(_$ProductLinkImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'linkType': instance.linkType,
    'linkedProduct': instance.linkedProduct.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('position', instance.position);
  return val;
}

_$TierPriceImpl _$$TierPriceImplFromJson(Map<String, dynamic> json) =>
    _$TierPriceImpl(
      id: (json['id'] as num).toInt(),
      customerGroupId: (json['customerGroupId'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      qty: (json['qty'] as num).toInt(),
      websiteId: json['websiteId'] as String?,
    );

Map<String, dynamic> _$$TierPriceImplToJson(_$TierPriceImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'customerGroupId': instance.customerGroupId,
    'price': instance.price,
    'qty': instance.qty,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('websiteId', instance.websiteId);
  return val;
}

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

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'detail': instance.detail,
    'nickname': instance.nickname,
    'customerId': instance.customerId,
    'rating': instance.rating,
    'createdAt': instance.createdAt.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('ratings', instance.ratings?.map((e) => e.toJson()).toList());
  return val;
}

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
        Map<String, dynamic> json) =>
    _$AggregationOptionImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      count: (json['count'] as num).toInt(),
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$$AggregationOptionImplToJson(
    _$AggregationOptionImpl instance) {
  final val = <String, dynamic>{
    'value': instance.value,
    'label': instance.label,
    'count': instance.count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isSelected', instance.isSelected);
  return val;
}

_$SortOptionImpl _$$SortOptionImplFromJson(Map<String, dynamic> json) =>
    _$SortOptionImpl(
      value: json['value'] as String,
      label: json['label'] as String,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$$SortOptionImplToJson(_$SortOptionImpl instance) {
  final val = <String, dynamic>{
    'value': instance.value,
    'label': instance.label,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isSelected', instance.isSelected);
  return val;
}

_$CategoryAttributeImpl _$$CategoryAttributeImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryAttributeImpl(
      attributeCode: json['attributeCode'] as String,
      value: json['value'] as String,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$CategoryAttributeImplToJson(
    _$CategoryAttributeImpl instance) {
  final val = <String, dynamic>{
    'attributeCode': instance.attributeCode,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  return val;
}
