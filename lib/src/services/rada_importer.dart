import 'dart:io';
import '../models/rada_models.dart';
import '../models/product_models.dart';
import 'rada_service.dart';
import 'image_cache_service.dart';

/// Importer for RADA format
class RadaImporter {
  final RadaService radaService;
  final ImageCacheService? imageCacheService;

  RadaImporter({RadaService? radaService, this.imageCacheService})
    : radaService = radaService ?? RadaService();

  /// Import RADA file
  Future<RadaImportResult> importFromFile(String filePath) async {
    try {
      // Validate archive
      final isValid = await radaService.validateArchive(filePath);
      if (!isValid) {
        return RadaImportResult(
          success: false,
          package: null,
          error: 'Invalid RADA archive or checksum mismatch',
          categoriesImported: 0,
          productsImported: 0,
          imagesImported: 0,
          reviewsImported: 0,
          importedAt: DateTime.now(),
        );
      }

      // Extract package
      final package = await radaService.extractArchive(filePath);

      // Cache images if service available
      var imagesCached = 0;
      if (imageCacheService != null) {
        imagesCached = await _cacheImages(package);
      }

      return RadaImportResult(
        success: true,
        package: package,
        error: null,
        categoriesImported: package.data.categories.length,
        productsImported: package.data.products.length,
        imagesImported: imagesCached,
        reviewsImported: package.data.reviews.length,
        importedAt: DateTime.now(),
      );
    } catch (e) {
      return RadaImportResult(
        success: false,
        package: null,
        error: e.toString(),
        categoriesImported: 0,
        productsImported: 0,
        imagesImported: 0,
        reviewsImported: 0,
        importedAt: DateTime.now(),
      );
    }
  }

  /// Import from asset bundle
  Future<RadaImportResult> importFromAsset(String assetPath) async {
    // This would be implemented to load from Flutter assets
    // For now, throw unimplemented
    throw UnimplementedError('Asset import not yet implemented');
  }

  /// Get archive info without importing
  Future<RadaManifest> getArchiveInfo(String filePath) async {
    return radaService.getArchiveInfo(filePath);
  }

  /// Validate archive
  Future<bool> validateArchive(String filePath) async {
    return radaService.validateArchive(filePath);
  }

  /// Cache images from package
  Future<int> _cacheImages(RadaPackage package) async {
    if (imageCacheService == null) return 0;

    var cached = 0;
    for (final entry in package.images.entries) {
      try {
        final path = entry.key;
        final data = entry.value;

        // Extract SKU or category ID from path
        if (path.contains('products/')) {
          final sku = path.split('products/')[1].split('/')[0];
          await imageCacheService!.cacheImageData(
            sku,
            data,
            path.split('/').last,
          );
          cached++;
        } else if (path.contains('categories/')) {
          final categoryId = path.split('categories/')[1].split('.')[0];
          await imageCacheService!.cacheImageData(
            'category_$categoryId',
            data,
            path.split('/').last,
          );
          cached++;
        }
      } catch (e) {
        print('Failed to cache image ${entry.key}: $e');
      }
    }

    return cached;
  }

  /// Load preload data for quick start
  Future<RadaPackage?> loadPreloadData(String preloadPath) async {
    try {
      final file = File(preloadPath);
      if (!await file.exists()) {
        print('Preload file not found: $preloadPath');
        return null;
      }

      final package = await radaService.extractArchive(preloadPath);
      return package;
    } catch (e) {
      print('Failed to load preload data: $e');
      return null;
    }
  }

  /// Extract specific category from package
  List<Category> extractCategories(
    RadaPackage package, {
    int? rootCategoryId,
    bool flatList = false,
  }) {
    if (flatList) {
      return package.data.categories;
    }

    if (rootCategoryId != null) {
      final root = package.data.categories.firstWhere(
        (c) => c.id == rootCategoryId,
        orElse: () => package.data.rootCategory,
      );
      return _buildCategoryTree(root, package.data.categories);
    }

    return _buildCategoryTree(
      package.data.rootCategory,
      package.data.categories,
    );
  }

  /// Extract products from package
  List<Product> extractProducts(
    RadaPackage package, {
    int? categoryId,
    List<String>? skus,
  }) {
    var products = package.data.products;

    if (categoryId != null) {
      products = products.where((p) {
        return p.categories?.contains(categoryId.toString()) ?? false;
      }).toList();
    }

    if (skus != null && skus.isNotEmpty) {
      products = products.where((p) => skus.contains(p.sku)).toList();
    }

    return products;
  }

  /// Extract reviews from package
  List<Review> extractReviews(RadaPackage package, {int? productId}) {
    var reviews = package.data.reviews;

    if (productId != null) {
      reviews = reviews.where((r) => r.customerId == productId).toList();
    }

    return reviews;
  }

  /// Get localized data
  Map<String, dynamic> getLocalizedData(RadaPackage package, String locale) {
    final localization = package.getLocalization(locale);
    if (localization == null) {
      return {};
    }

    return {
      'categories': localization.categories,
      'products': localization.products,
      'attributes': localization.attributes,
    };
  }

  /// Build category tree from flat list
  List<Category> _buildCategoryTree(
    Category root,
    List<Category> allCategories,
  ) {
    final children = allCategories
        .where((c) => c.parentId == root.id)
        .map((c) => c.copyWith(children: _buildCategoryTree(c, allCategories)))
        .toList();

    return [root.copyWith(children: children)];
  }
}

/// Extension for image cache service
extension RadaImageCacheExtension on ImageCacheService {
  Future<void> cacheImageData(
    String key,
    List<int> data,
    String filename,
  ) async {
    // Implementation depends on your image cache structure
    // This is a placeholder
  }
}
