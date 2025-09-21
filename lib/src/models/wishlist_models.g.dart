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

Map<String, dynamic> _$WishlistToJson(Wishlist instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'customerId': ?instance.customerId,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
  'isDefault': ?instance.isDefault,
};

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

Map<String, dynamic> _$WishlistItemToJson(WishlistItem instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'wishlistId': ?instance.wishlistId,
      'productId': ?instance.productId,
      'sku': ?instance.sku,
      'name': ?instance.name,
      'description': ?instance.description,
      'price': ?instance.price,
      'imageUrl': ?instance.imageUrl,
      'options': ?instance.options,
      'addedAt': ?instance.addedAt?.toIso8601String(),
    };

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
      'mostWishedProducts': instance.mostWishedProducts
          .map((e) => e.toJson())
          .toList(),
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
  Map<String, dynamic> json,
) => WishlistCreateRequest(
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$WishlistCreateRequestToJson(
  WishlistCreateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': ?instance.description,
};

WishlistUpdateRequest _$WishlistUpdateRequestFromJson(
  Map<String, dynamic> json,
) => WishlistUpdateRequest(
  name: json['name'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$WishlistUpdateRequestToJson(
  WishlistUpdateRequest instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'description': ?instance.description,
};

WishlistItemUpdateRequest _$WishlistItemUpdateRequestFromJson(
  Map<String, dynamic> json,
) => WishlistItemUpdateRequest(
  description: json['description'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$WishlistItemUpdateRequestToJson(
  WishlistItemUpdateRequest instance,
) => <String, dynamic>{
  'description': ?instance.description,
  'options': ?instance.options,
};

WishlistSharing _$WishlistSharingFromJson(Map<String, dynamic> json) =>
    WishlistSharing(
      wishlistId: json['wishlistId'] as String,
      email: json['email'] as String,
      message: json['message'] as String?,
      sharedAt: json['sharedAt'] == null
          ? null
          : DateTime.parse(json['sharedAt'] as String),
    );

Map<String, dynamic> _$WishlistSharingToJson(WishlistSharing instance) =>
    <String, dynamic>{
      'wishlistId': instance.wishlistId,
      'email': instance.email,
      'message': ?instance.message,
      'sharedAt': ?instance.sharedAt?.toIso8601String(),
    };

SharedWishlistAccess _$SharedWishlistAccessFromJson(
  Map<String, dynamic> json,
) => SharedWishlistAccess(
  shareCode: json['shareCode'] as String,
  wishlistId: json['wishlistId'] as String,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
  isActive: json['isActive'] as bool?,
);

Map<String, dynamic> _$SharedWishlistAccessToJson(
  SharedWishlistAccess instance,
) => <String, dynamic>{
  'shareCode': instance.shareCode,
  'wishlistId': instance.wishlistId,
  'expiresAt': ?instance.expiresAt?.toIso8601String(),
  'isActive': ?instance.isActive,
};
