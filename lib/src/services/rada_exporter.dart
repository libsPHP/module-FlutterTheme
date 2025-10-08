import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/rada_models.dart';
import '../models/product_models.dart';
import '../api/product_api.dart';
import 'rada_service.dart';

/// Exporter for RADA format
class RadaExporter {
  final ProductApi productApi;
  final RadaService radaService;
  final String baseUrl;
  final Dio? dio;

  RadaExporter({
    required this.productApi,
    required this.baseUrl,
    RadaService? radaService,
    this.dio,
  }) : radaService = radaService ?? RadaService();

  /// Export category to RADA file
  Future<File> exportCategory(
    RadaExportOptions options,
    String outputPath,
  ) async {
    // Collect all data
    final categories = await _collectCategories(
      options.categoryId,
      options.includeSubcategories,
      options.maxDepth,
    );

    final products = options.includeProducts
        ? await _collectProducts(categories, options.maxProducts)
        : <Product>[];

    final reviews = options.includeReviews
        ? await _collectReviews(products)
        : <Review>[];

    final images = options.includeImages
        ? await _collectImages(categories, products, options)
        : <String, List<int>>{};

    final localizations = await _collectLocalizations(
      categories,
      products,
      options.locales,
    );

    // Find root category
    final rootCategory = categories.firstWhere(
      (c) => c.id == options.categoryId,
      orElse: () => categories.first,
    );

    // Create main data
    final data = RadaData(
      rootCategory: rootCategory,
      categories: categories,
      products: products,
      reviews: reviews,
    );

    // Create package
    var package = RadaPackage(
      manifest: RadaManifest(
        version: '1.0',
        format: 'rada',
        createdAt: DateTime.now(),
        createdBy: 'flutter_magento',
        source: RadaSource(
          storeUrl: baseUrl,
          categoryId: options.categoryId,
          categoryName: rootCategory.name,
        ),
        stats: RadaStats(
          categoriesCount: categories.length,
          productsCount: products.length,
          imagesCount: images.length,
          reviewsCount: reviews.length,
          localesCount: localizations.length,
        ),
        checksums: RadaChecksums(main: '', assets: '', l10n: ''),
      ),
      data: data,
      localizations: localizations,
      images: images,
    );

    // Calculate checksums
    final checksums = radaService.calculateChecksums(package);
    package = package.copyWith(
      manifest: package.manifest.copyWith(checksums: checksums),
    );

    // Create archive
    return radaService.createArchive(package, outputPath);
  }

  /// Collect categories recursively
  Future<List<Category>> _collectCategories(
    int rootCategoryId,
    bool includeSubcategories,
    int? maxDepth,
  ) async {
    final categories = <Category>[];
    final visited = <int>{};

    Future<void> collectRecursive(int categoryId, int depth) async {
      if (visited.contains(categoryId)) return;
      if (maxDepth != null && depth > maxDepth) return;

      visited.add(categoryId);

      try {
        // Get category (this is simplified - adjust to your actual API)
        // In real implementation, you'd call productApi to get category details
        // For now, this is a placeholder
        final category = await _getCategory(categoryId);
        categories.add(category);

        if (includeSubcategories && category.children != null) {
          for (final child in category.children!) {
            await collectRecursive(child.id, depth + 1);
          }
        }
      } catch (e) {
        print('Failed to fetch category $categoryId: $e');
      }
    }

    await collectRecursive(rootCategoryId, 0);
    return categories;
  }

  /// Get category by ID (placeholder - implement with your actual API)
  Future<Category> _getCategory(int categoryId) async {
    // This is a placeholder. In real implementation:
    // return await productApi.getCategory(categoryId);
    throw UnimplementedError('Implement category fetching from your API');
  }

  /// Collect products from categories
  Future<List<Product>> _collectProducts(
    List<Category> categories,
    int? maxProducts,
  ) async {
    final products = <Product>[];
    final skus = <String>{};

    for (final category in categories) {
      if (maxProducts != null && products.length >= maxProducts) break;

      try {
        // Get products for category
        final result = await productApi.getProducts(
          page: 1,
          pageSize: maxProducts != null
              ? (maxProducts - products.length).clamp(1, 100)
              : 100,
          categoryId: category.id.toString(),
        );

        for (final product in result.items) {
          if (!skus.contains(product.sku)) {
            skus.add(product.sku);
            products.add(product);
          }
        }
      } catch (e) {
        print('Failed to fetch products for category ${category.id}: $e');
      }
    }

    return products;
  }

  /// Collect reviews from products
  Future<List<Review>> _collectReviews(List<Product> products) async {
    final reviews = <Review>[];

    for (final product in products) {
      if (product.reviews != null && product.reviews!.isNotEmpty) {
        reviews.addAll(product.reviews!);
      }
    }

    return reviews;
  }

  /// Collect images (categories and products)
  Future<Map<String, List<int>>> _collectImages(
    List<Category> categories,
    List<Product> products,
    RadaExportOptions options,
  ) async {
    final images = <String, List<int>>{};

    // Download category images
    for (final category in categories) {
      if (category.image != null && category.image!.isNotEmpty) {
        try {
          final imageData = await _downloadImage(category.image!);
          if (imageData != null) {
            final extension = _getImageExtension(category.image!);
            final path = radaService.getCategoryImagePath(
              category.id,
              extension,
            );
            images[path] = imageData;
          }
        } catch (e) {
          print('Failed to download category image: $e');
        }
      }
    }

    // Download product images
    for (final product in products) {
      if (product.mediaGalleryEntries != null) {
        for (final media in product.mediaGalleryEntries!) {
          try {
            final imageUrl = _buildImageUrl(media.file);
            final imageData = await _downloadImage(imageUrl);
            if (imageData != null) {
              final filename = media.file.split('/').last;
              final path = radaService.getProductImagePath(
                product.sku,
                filename,
              );
              images[path] = imageData;
            }
          } catch (e) {
            print('Failed to download product image: $e');
          }
        }
      }
    }

    return images;
  }

  /// Download image from URL
  Future<List<int>?> _downloadImage(String url) async {
    try {
      final fullUrl = url.startsWith('http') ? url : '$baseUrl$url';
      final response = await http.get(Uri.parse(fullUrl));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      }
    } catch (e) {
      print('Error downloading image: $e');
    }
    return null;
  }

  /// Build image URL
  String _buildImageUrl(String path) {
    if (path.startsWith('http')) return path;
    return '$baseUrl/pub/media/catalog/product$path';
  }

  /// Get image extension from URL
  String _getImageExtension(String url) {
    final parts = url.split('.');
    if (parts.length > 1) {
      return parts.last.toLowerCase();
    }
    return 'jpg';
  }

  /// Collect localizations
  Future<Map<String, RadaLocalization>> _collectLocalizations(
    List<Category> categories,
    List<Product> products,
    List<String> locales,
  ) async {
    final localizations = <String, RadaLocalization>{};

    for (final locale in locales) {
      final categoryTranslations = <String, RadaCategoryTranslation>{};
      final productTranslations = <String, RadaProductTranslation>{};
      final attributeTranslations = <String, String>{};

      // Category translations (simplified - would need actual API calls)
      for (final category in categories) {
        categoryTranslations[category.id.toString()] = RadaCategoryTranslation(
          name: category.name,
          description: category.description,
        );
      }

      // Product translations
      for (final product in products) {
        productTranslations[product.sku] = RadaProductTranslation(
          name: product.name,
          description: product.description,
          shortDescription: product.shortDescription,
          metaTitle: product.metaTitle,
          metaDescription: product.metaDescription,
        );
      }

      localizations[locale] = RadaLocalization(
        locale: locale,
        categories: categoryTranslations,
        products: productTranslations,
        attributes: attributeTranslations,
      );
    }

    return localizations;
  }
}
