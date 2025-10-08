import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_models.dart';

part 'rada_models.freezed.dart';
part 'rada_models.g.dart';

/// RADA format manifest
@freezed
class RadaManifest with _$RadaManifest {
  const factory RadaManifest({
    required String version,
    required String format,
    required DateTime createdAt,
    required String createdBy,
    required RadaSource source,
    required RadaStats stats,
    required RadaChecksums checksums,
  }) = _RadaManifest;

  factory RadaManifest.fromJson(Map<String, dynamic> json) =>
      _$RadaManifestFromJson(json);
}

/// Source information
@freezed
class RadaSource with _$RadaSource {
  const factory RadaSource({
    required String storeUrl,
    required int categoryId,
    required String categoryName,
    String? storeCode,
    String? storeView,
  }) = _RadaSource;

  factory RadaSource.fromJson(Map<String, dynamic> json) =>
      _$RadaSourceFromJson(json);
}

/// Statistics
@freezed
class RadaStats with _$RadaStats {
  const factory RadaStats({
    required int categoriesCount,
    required int productsCount,
    required int imagesCount,
    required int reviewsCount,
    required int localesCount,
    int? totalSize,
  }) = _RadaStats;

  factory RadaStats.fromJson(Map<String, dynamic> json) =>
      _$RadaStatsFromJson(json);
}

/// Checksums for validation
@freezed
class RadaChecksums with _$RadaChecksums {
  const factory RadaChecksums({
    required String main,
    required String assets,
    required String l10n,
  }) = _RadaChecksums;

  factory RadaChecksums.fromJson(Map<String, dynamic> json) =>
      _$RadaChecksumsFromJson(json);
}

/// Main RADA data
@freezed
class RadaData with _$RadaData {
  const factory RadaData({
    required Category rootCategory,
    required List<Category> categories,
    required List<Product> products,
    required List<Review> reviews,
    Map<String, dynamic>? metadata,
  }) = _RadaData;

  factory RadaData.fromJson(Map<String, dynamic> json) =>
      _$RadaDataFromJson(json);
}

/// Localization data
@freezed
class RadaLocalization with _$RadaLocalization {
  const factory RadaLocalization({
    required String locale,
    required Map<String, RadaCategoryTranslation> categories,
    required Map<String, RadaProductTranslation> products,
    required Map<String, String> attributes,
  }) = _RadaLocalization;

  factory RadaLocalization.fromJson(Map<String, dynamic> json) =>
      _$RadaLocalizationFromJson(json);
}

/// Category translation
@freezed
class RadaCategoryTranslation with _$RadaCategoryTranslation {
  const factory RadaCategoryTranslation({
    required String name,
    String? description,
    String? metaTitle,
    String? metaDescription,
  }) = _RadaCategoryTranslation;

  factory RadaCategoryTranslation.fromJson(Map<String, dynamic> json) =>
      _$RadaCategoryTranslationFromJson(json);
}

/// Product translation
@freezed
class RadaProductTranslation with _$RadaProductTranslation {
  const factory RadaProductTranslation({
    required String name,
    String? description,
    String? shortDescription,
    String? metaTitle,
    String? metaDescription,
  }) = _RadaProductTranslation;

  factory RadaProductTranslation.fromJson(Map<String, dynamic> json) =>
      _$RadaProductTranslationFromJson(json);
}

/// Complete RADA package
@freezed
class RadaPackage with _$RadaPackage {
  const factory RadaPackage({
    required RadaManifest manifest,
    required RadaData data,
    required Map<String, RadaLocalization> localizations,
    required Map<String, List<int>> images,
  }) = _RadaPackage;

  const RadaPackage._();

  /// Get image data by path
  List<int>? getImage(String path) => images[path];

  /// Get localization for specific locale
  RadaLocalization? getLocalization(String locale) => localizations[locale];

  /// Get all available locales
  List<String> get availableLocales => localizations.keys.toList();
}

/// Export options
@freezed
class RadaExportOptions with _$RadaExportOptions {
  const factory RadaExportOptions({
    required int categoryId,
    @Default(true) bool includeSubcategories,
    @Default(true) bool includeProducts,
    @Default(true) bool includeReviews,
    @Default(true) bool includeImages,
    @Default(['en']) List<String> locales,
    @Default(1024) int maxImageWidth,
    @Default(1024) int maxImageHeight,
    @Default(80) int imageQuality,
    int? maxProducts,
    int? maxDepth,
  }) = _RadaExportOptions;

  factory RadaExportOptions.fromJson(Map<String, dynamic> json) =>
      _$RadaExportOptionsFromJson(json);
}

/// Import result
@freezed
class RadaImportResult with _$RadaImportResult {
  const factory RadaImportResult({
    required bool success,
    required RadaPackage? package,
    String? error,
    required int categoriesImported,
    required int productsImported,
    required int imagesImported,
    required int reviewsImported,
    required DateTime importedAt,
  }) = _RadaImportResult;

  const RadaImportResult._();

  bool get hasError => error != null;
}
