// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rada_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadaManifest _$RadaManifestFromJson(Map<String, dynamic> json) =>
    _RadaManifest(
      version: json['version'] as String,
      format: json['format'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      source: RadaSource.fromJson(json['source'] as Map<String, dynamic>),
      stats: RadaStats.fromJson(json['stats'] as Map<String, dynamic>),
      checksums: RadaChecksums.fromJson(
        json['checksums'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RadaManifestToJson(_RadaManifest instance) =>
    <String, dynamic>{
      'version': instance.version,
      'format': instance.format,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'source': instance.source.toJson(),
      'stats': instance.stats.toJson(),
      'checksums': instance.checksums.toJson(),
    };

_RadaSource _$RadaSourceFromJson(Map<String, dynamic> json) => _RadaSource(
  storeUrl: json['storeUrl'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  categoryName: json['categoryName'] as String,
  storeCode: json['storeCode'] as String?,
  storeView: json['storeView'] as String?,
);

Map<String, dynamic> _$RadaSourceToJson(_RadaSource instance) =>
    <String, dynamic>{
      'storeUrl': instance.storeUrl,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'storeCode': ?instance.storeCode,
      'storeView': ?instance.storeView,
    };

_RadaStats _$RadaStatsFromJson(Map<String, dynamic> json) => _RadaStats(
  categoriesCount: (json['categoriesCount'] as num).toInt(),
  productsCount: (json['productsCount'] as num).toInt(),
  imagesCount: (json['imagesCount'] as num).toInt(),
  reviewsCount: (json['reviewsCount'] as num).toInt(),
  localesCount: (json['localesCount'] as num).toInt(),
  totalSize: (json['totalSize'] as num?)?.toInt(),
);

Map<String, dynamic> _$RadaStatsToJson(_RadaStats instance) =>
    <String, dynamic>{
      'categoriesCount': instance.categoriesCount,
      'productsCount': instance.productsCount,
      'imagesCount': instance.imagesCount,
      'reviewsCount': instance.reviewsCount,
      'localesCount': instance.localesCount,
      'totalSize': ?instance.totalSize,
    };

_RadaChecksums _$RadaChecksumsFromJson(Map<String, dynamic> json) =>
    _RadaChecksums(
      main: json['main'] as String,
      assets: json['assets'] as String,
      l10n: json['l10n'] as String,
    );

Map<String, dynamic> _$RadaChecksumsToJson(_RadaChecksums instance) =>
    <String, dynamic>{
      'main': instance.main,
      'assets': instance.assets,
      'l10n': instance.l10n,
    };

_RadaData _$RadaDataFromJson(Map<String, dynamic> json) => _RadaData(
  rootCategory: Category.fromJson(json['rootCategory'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList(),
  products: (json['products'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
  reviews: (json['reviews'] as List<dynamic>)
      .map((e) => Review.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$RadaDataToJson(_RadaData instance) => <String, dynamic>{
  'rootCategory': instance.rootCategory.toJson(),
  'categories': instance.categories.map((e) => e.toJson()).toList(),
  'products': instance.products.map((e) => e.toJson()).toList(),
  'reviews': instance.reviews.map((e) => e.toJson()).toList(),
  'metadata': ?instance.metadata,
};

_RadaLocalization _$RadaLocalizationFromJson(Map<String, dynamic> json) =>
    _RadaLocalization(
      locale: json['locale'] as String,
      categories: (json['categories'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          RadaCategoryTranslation.fromJson(e as Map<String, dynamic>),
        ),
      ),
      products: (json['products'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          RadaProductTranslation.fromJson(e as Map<String, dynamic>),
        ),
      ),
      attributes: Map<String, String>.from(json['attributes'] as Map),
    );

Map<String, dynamic> _$RadaLocalizationToJson(_RadaLocalization instance) =>
    <String, dynamic>{
      'locale': instance.locale,
      'categories': instance.categories.map((k, e) => MapEntry(k, e.toJson())),
      'products': instance.products.map((k, e) => MapEntry(k, e.toJson())),
      'attributes': instance.attributes,
    };

_RadaCategoryTranslation _$RadaCategoryTranslationFromJson(
  Map<String, dynamic> json,
) => _RadaCategoryTranslation(
  name: json['name'] as String,
  description: json['description'] as String?,
  metaTitle: json['metaTitle'] as String?,
  metaDescription: json['metaDescription'] as String?,
);

Map<String, dynamic> _$RadaCategoryTranslationToJson(
  _RadaCategoryTranslation instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': ?instance.description,
  'metaTitle': ?instance.metaTitle,
  'metaDescription': ?instance.metaDescription,
};

_RadaProductTranslation _$RadaProductTranslationFromJson(
  Map<String, dynamic> json,
) => _RadaProductTranslation(
  name: json['name'] as String,
  description: json['description'] as String?,
  shortDescription: json['shortDescription'] as String?,
  metaTitle: json['metaTitle'] as String?,
  metaDescription: json['metaDescription'] as String?,
);

Map<String, dynamic> _$RadaProductTranslationToJson(
  _RadaProductTranslation instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': ?instance.description,
  'shortDescription': ?instance.shortDescription,
  'metaTitle': ?instance.metaTitle,
  'metaDescription': ?instance.metaDescription,
};

_RadaExportOptions _$RadaExportOptionsFromJson(Map<String, dynamic> json) =>
    _RadaExportOptions(
      categoryId: (json['categoryId'] as num).toInt(),
      includeSubcategories: json['includeSubcategories'] as bool? ?? true,
      includeProducts: json['includeProducts'] as bool? ?? true,
      includeReviews: json['includeReviews'] as bool? ?? true,
      includeImages: json['includeImages'] as bool? ?? true,
      locales:
          (json['locales'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['en'],
      maxImageWidth: (json['maxImageWidth'] as num?)?.toInt() ?? 1024,
      maxImageHeight: (json['maxImageHeight'] as num?)?.toInt() ?? 1024,
      imageQuality: (json['imageQuality'] as num?)?.toInt() ?? 80,
      maxProducts: (json['maxProducts'] as num?)?.toInt(),
      maxDepth: (json['maxDepth'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RadaExportOptionsToJson(_RadaExportOptions instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'includeSubcategories': instance.includeSubcategories,
      'includeProducts': instance.includeProducts,
      'includeReviews': instance.includeReviews,
      'includeImages': instance.includeImages,
      'locales': instance.locales,
      'maxImageWidth': instance.maxImageWidth,
      'maxImageHeight': instance.maxImageHeight,
      'imageQuality': instance.imageQuality,
      'maxProducts': ?instance.maxProducts,
      'maxDepth': ?instance.maxDepth,
    };
