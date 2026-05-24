import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:mockito/mockito.dart';

// Import the examples
import '../../example/lib/examples/product_examples.dart';
import 'auth_examples_test.mocks.dart';

void main() {
  group('Product Examples Tests', () {
    late MockFlutterMagentoCore mockMagento;
    late ProductExamples productExamples;

    setUp(() {
      mockMagento = MockFlutterMagentoCore();
      productExamples = ProductExamples(mockMagento);
    });

    test('Example 1: Get Products - should return list of products', () async {
      // Arrange
      final expectedProducts = [
        MagentoProduct(
          id: 1,
          sku: 'TEST-SKU-1',
          name: 'Test Product 1',
          price: 99.99,
          typeId: 'simple',
          status: 1,
          visibility: 4,
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
        ),
        MagentoProduct(
          id: 2,
          sku: 'TEST-SKU-2',
          name: 'Test Product 2',
          price: 149.99,
          typeId: 'simple',
          status: 1,
          visibility: 4,
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
        ),
      ];

      when(
        mockMagento.getProducts(page: 1, pageSize: 20),
      ).thenAnswer((_) async => expectedProducts);

      // Act
      final result = await productExamples.getProducts(page: 1, pageSize: 20);

      // Assert
      expect(result, hasLength(2));
      expect(result[0].name, equals('Test Product 1'));
      expect(result[1].name, equals('Test Product 2'));
      verify(mockMagento.getProducts(page: 1, pageSize: 20)).called(1);
    });

    test('Example 2: Search Products - should return search results', () async {
      // Arrange
      final searchResults = [
        MagentoProduct(
          id: 1,
          sku: 'BAG-001',
          name: 'Leather Bag',
          price: 79.99,
          typeId: 'simple',
          status: 1,
          visibility: 4,
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
        ),
      ];

      when(
        mockMagento.searchProducts('bag', page: 1, pageSize: 20),
      ).thenAnswer((_) async => searchResults);

      // Act
      final result = await productExamples.searchProducts('bag');

      // Assert
      expect(result, hasLength(1));
      expect(result[0].name, contains('Bag'));
      verify(
        mockMagento.searchProducts('bag', page: 1, pageSize: 20),
      ).called(1);
    });

    test(
      'Example 3: Get Product by SKU - should return single product',
      () async {
        // Arrange
        final expectedProduct = MagentoProduct(
          id: 1,
          sku: 'TEST-SKU',
          name: 'Test Product',
          price: 99.99,
          typeId: 'simple',
          status: 1,
          visibility: 4,
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
        );

        when(
          mockMagento.getProduct('TEST-SKU'),
        ).thenAnswer((_) async => expectedProduct);

        // Act
        final result = await productExamples.getProduct('TEST-SKU');

        // Assert
        expect(result.sku, equals('TEST-SKU'));
        expect(result.name, equals('Test Product'));
        expect(result.price, equals(99.99));
        verify(mockMagento.getProduct('TEST-SKU')).called(1);
      },
    );

    test('Example 4: Get Filtered Products - should apply filters', () async {
      // Arrange
      final filteredProducts = [
        MagentoProduct(
          id: 1,
          sku: 'PROD-1',
          name: 'Product 1',
          price: 29.99,
          typeId: 'simple',
          status: 1,
          visibility: 4,
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
        ),
        MagentoProduct(
          id: 2,
          sku: 'PROD-2',
          name: 'Product 2',
          price: 39.99,
          typeId: 'simple',
          status: 1,
          visibility: 4,
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
        ),
      ];

      when(
        mockMagento.getProducts(
          categoryId: '5',
          sortBy: 'price',
          sortOrder: 'asc',
          page: 1,
          pageSize: 20,
        ),
      ).thenAnswer((_) async => filteredProducts);

      // Act
      final result = await productExamples.getFilteredProducts(
        categoryId: '5',
        sortBy: 'price',
        sortOrder: 'asc',
      );

      // Assert
      expect(result, hasLength(2));
      expect(result[0].price, lessThanOrEqualTo(result[1].price!));
      verify(
        mockMagento.getProducts(
          categoryId: '5',
          sortBy: 'price',
          sortOrder: 'asc',
          page: 1,
          pageSize: 20,
        ),
      ).called(1);
    });

    test('Get Products - should handle empty results', () async {
      // Arrange
      when(
        mockMagento.getProducts(page: 1, pageSize: 20),
      ).thenAnswer((_) async => []);

      // Act
      final result = await productExamples.getProducts();

      // Assert
      expect(result, isEmpty);
    });

    test('Search Products - should handle no results', () async {
      // Arrange
      when(
        mockMagento.searchProducts('nonexistent', page: 1, pageSize: 20),
      ).thenAnswer((_) async => []);

      // Act
      final result = await productExamples.searchProducts('nonexistent');

      // Assert
      expect(result, isEmpty);
    });

    test('Get Product - should throw error for invalid SKU', () async {
      // Arrange
      when(
        mockMagento.getProduct('INVALID-SKU'),
      ).thenThrow(Exception('Product not found'));

      // Act & Assert
      expect(() => productExamples.getProduct('INVALID-SKU'), throwsException);
    });
  });

  group('Product Examples Integration Tests', () {
    test(
      'Real API: Get products from Luma demo',
      () async {
        // Skip in CI environment
        const skipInCI = bool.fromEnvironment('CI', defaultValue: false);
        if (skipInCI) {
          return;
        }

        final magento = FlutterMagentoCore.instance;
        await magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');

        final productExamples = ProductExamples(magento);

        // Get products
        final products = await productExamples.getProducts(
          page: 1,
          pageSize: 5,
        );

        expect(products, isNotEmpty);
        expect(products.first.sku, isNotEmpty);
        expect(products.first.name, isNotEmpty);
      },
      skip: 'Integration test - requires network',
      tags: ['integration'],
    );

    test(
      'Real API: Search for products',
      () async {
        // Skip in CI environment
        const skipInCI = bool.fromEnvironment('CI', defaultValue: false);
        if (skipInCI) {
          return;
        }

        final magento = FlutterMagentoCore.instance;
        await magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');

        final productExamples = ProductExamples(magento);

        // Search products
        final results = await productExamples.searchProducts('bag');

        expect(results, isNotEmpty);
      },
      skip: 'Integration test - requires network',
      tags: ['integration'],
    );
  });
}
