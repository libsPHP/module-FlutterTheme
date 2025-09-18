// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wishlist _$WishlistFromJson(Map<String, dynamic> json) => Wishlist(
      id: json['id'] as String?,
      name: json['name'] as String?,
      customerId: (json['customerId'] as num?)?.toInt(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => WishlistItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isDefault: json['isDefault'] as bool?,
    );

Map<String, dynamic> _$WishlistToJson(Wishlist instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('isDefault', instance.isDefault);
  return val;
}

WishlistItem _$WishlistItemFromJson(Map<String, dynamic> json) => WishlistItem(
      id: (json['id'] as num?)?.toInt(),
      wishlistId: (json['wishlistId'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      addedAt: json['addedAt'] == null
          ? null
          : DateTime.parse(json['addedAt'] as String),
    );

Map<String, dynamic> _$WishlistItemToJson(WishlistItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('wishlistId', instance.wishlistId);
  writeNotNull('productId', instance.productId);
  writeNotNull('sku', instance.sku);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('price', instance.price);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('options', instance.options);
  writeNotNull('addedAt', instance.addedAt?.toIso8601String());
  return val;
}

WishlistAnalytics _$WishlistAnalyticsFromJson(Map<String, dynamic> json) =>
    WishlistAnalytics(
      totalItems: (json['totalItems'] as num).toInt(),
      totalWishlists: (json['totalWishlists'] as num).toInt(),
      mostWishedProducts: (json['mostWishedProducts'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      wishlistGrowth: (json['wishlistGrowth'] as num).toDouble(),
    );

Map<String, dynamic> _$WishlistAnalyticsToJson(WishlistAnalytics instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'totalWishlists': instance.totalWishlists,
      'mostWishedProducts':
          instance.mostWishedProducts.map((e) => e.toJson()).toList(),
      'wishlistGrowth': instance.wishlistGrowth,
    };

WishlistTrend _$WishlistTrendFromJson(Map<String, dynamic> json) =>
    WishlistTrend(
      period: json['period'] as String,
      itemCount: (json['itemCount'] as num).toInt(),
      growthRate: (json['growthRate'] as num).toDouble(),
    );

Map<String, dynamic> _$WishlistTrendToJson(WishlistTrend instance) =>
    <String, dynamic>{
      'period': instance.period,
      'itemCount': instance.itemCount,
      'growthRate': instance.growthRate,
    };

WishlistCreateRequest _$WishlistCreateRequestFromJson(
        Map<String, dynamic> json) =>
    WishlistCreateRequest(
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$WishlistCreateRequestToJson(
    WishlistCreateRequest instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}

WishlistUpdateRequest _$WishlistUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    WishlistUpdateRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$WishlistUpdateRequestToJson(
    WishlistUpdateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  return val;
}

WishlistItemUpdateRequest _$WishlistItemUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    WishlistItemUpdateRequest(
      description: json['description'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$WishlistItemUpdateRequestToJson(
    WishlistItemUpdateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('options', instance.options);
  return val;
}

WishlistSharing _$WishlistSharingFromJson(Map<String, dynamic> json) =>
    WishlistSharing(
      wishlistId: json['wishlistId'] as String,
      email: json['email'] as String,
      message: json['message'] as String?,
      sharedAt: json['sharedAt'] == null
          ? null
          : DateTime.parse(json['sharedAt'] as String),
    );

Map<String, dynamic> _$WishlistSharingToJson(WishlistSharing instance) {
  final val = <String, dynamic>{
    'wishlistId': instance.wishlistId,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('sharedAt', instance.sharedAt?.toIso8601String());
  return val;
}

SharedWishlistAccess _$SharedWishlistAccessFromJson(
        Map<String, dynamic> json) =>
    SharedWishlistAccess(
      shareCode: json['shareCode'] as String,
      wishlistId: json['wishlistId'] as String,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$SharedWishlistAccessToJson(
    SharedWishlistAccess instance) {
  final val = <String, dynamic>{
    'shareCode': instance.shareCode,
    'wishlistId': instance.wishlistId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expiresAt', instance.expiresAt?.toIso8601String());
  writeNotNull('isActive', instance.isActive);
  return val;
}
