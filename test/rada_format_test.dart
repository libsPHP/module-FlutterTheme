import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  group('RADA Format Tests', () {
    late RadaService radaService;

    setUp(() {
      radaService = RadaService();
    });

    test('RadaManifest should be created with correct version', () {
      final manifest = RadaManifest(
        version: '1.0',
        format: 'rada',
        createdAt: DateTime.now(),
        createdBy: 'test',
        source: RadaSource(
          storeUrl: 'https://test.com',
          categoryId: 1,
          categoryName: 'Test Category',
        ),
        stats: RadaStats(
          categoriesCount: 5,
          productsCount: 10,
          imagesCount: 20,
          reviewsCount: 3,
          localesCount: 2,
        ),
        checksums: RadaChecksums(
          main: 'test-main',
          assets: 'test-assets',
          l10n: 'test-l10n',
        ),
      );

      expect(manifest.version, '1.0');
      expect(manifest.format, 'rada');
      expect(manifest.source.categoryName, 'Test Category');
    });

    test('RadaExportOptions should have default values', () {
      final options = RadaExportOptions(categoryId: 123);

      expect(options.categoryId, 123);
      expect(options.includeSubcategories, true);
      expect(options.includeProducts, true);
      expect(options.includeReviews, true);
      expect(options.includeImages, true);
      expect(options.locales, ['en']);
      expect(options.maxImageWidth, 1024);
      expect(options.imageQuality, 80);
    });

    test('RadaPackage should provide helper methods', () {
      final package = RadaPackage(
        manifest: RadaManifest(
          version: '1.0',
          format: 'rada',
          createdAt: DateTime.now(),
          createdBy: 'test',
          source: RadaSource(
            storeUrl: 'https://test.com',
            categoryId: 1,
            categoryName: 'Test',
          ),
          stats: RadaStats(
            categoriesCount: 0,
            productsCount: 0,
            imagesCount: 0,
            reviewsCount: 0,
            localesCount: 2,
          ),
          checksums: RadaChecksums(main: '', assets: '', l10n: ''),
        ),
        data: RadaData(
          rootCategory: Category(
            id: 1,
            name: 'Root',
            level: 1,
            position: 1,
            isActive: true,
            childrenCount: 0,
          ),
          categories: [],
          products: [],
          reviews: [],
        ),
        localizations: {
          'en': RadaLocalization(
            locale: 'en',
            categories: {},
            products: {},
            attributes: {},
          ),
          'ru': RadaLocalization(
            locale: 'ru',
            categories: {},
            products: {},
            attributes: {},
          ),
        },
        images: {},
      );

      expect(package.availableLocales, ['en', 'ru']);
      expect(package.getLocalization('en'), isNotNull);
      expect(package.getLocalization('fr'), isNull);
    });

    test('RadaService should generate correct asset paths', () {
      final categoryPath = radaService.getCategoryImagePath(123, 'jpg');
      expect(categoryPath, 'assets/categories/123.jpg');

      final productPath = radaService.getProductImagePath(
        'SKU-001',
        'image.png',
      );
      expect(productPath, 'assets/products/SKU-001/image.png');
    });

    test('RadaImportResult should indicate success or failure', () {
      final successResult = RadaImportResult(
        success: true,
        package: null,
        categoriesImported: 5,
        productsImported: 10,
        imagesImported: 15,
        reviewsImported: 2,
        importedAt: DateTime.now(),
      );

      expect(successResult.success, true);
      expect(successResult.hasError, false);

      final failResult = RadaImportResult(
        success: false,
        package: null,
        error: 'Test error',
        categoriesImported: 0,
        productsImported: 0,
        imagesImported: 0,
        reviewsImported: 0,
        importedAt: DateTime.now(),
      );

      expect(failResult.success, false);
      expect(failResult.hasError, true);
      expect(failResult.error, 'Test error');
    });
  });

  group('RADA Preload Tests', () {
    late RadaPreloadService preloadService;

    setUp(() {
      preloadService = RadaPreloadService();
    });

    test('RadaPreloadService should initialize without preload data', () {
      expect(preloadService.hasPreloadData, false);
      expect(preloadService.preloadedPackage, isNull);
    });

    test('RadaPreloadService should clear preload data', () {
      preloadService.clearPreload();
      expect(preloadService.hasPreloadData, false);
    });
  });
}
