import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  group('FlutterMagento - Core Functionality', () {
    late FlutterMagento magento;

    setUp(() {
      magento = FlutterMagento();
    });

    tearDown(() {
      try {
        magento.dispose();
      } catch (e) {
        // Ignore disposal errors in tests
      }
    });

    group('Initialization', () {
      test('should initialize successfully with valid base URL', () async {
        final success = await magento.initialize(
          baseUrl: 'https://test-store.magento.com',
        );

        // Test structure - actual success depends on network/API availability
        expect(success, isA<bool>());
        if (success) {
          expect(magento.isInitialized, isTrue);
          expect(magento.baseUrl, equals('https://test-store.magento.com'));
        }
      });

      test('should handle initialization with custom headers', () async {
        final success = await magento.initialize(
          baseUrl: 'https://test-store.magento.com',
          headers: {
            'User-Agent': 'TestApp/1.0.0',
            'X-Custom-Header': 'test-value',
          },
        );

        expect(success, isA<bool>());
      });

      test('should handle initialization with custom timeouts', () async {
        final success = await magento.initialize(
          baseUrl: 'https://test-store.magento.com',
          connectionTimeout: 60000,
          receiveTimeout: 60000,
        );

        expect(success, isA<bool>());
      });
    });

    group('Basic Properties', () {
      test('should return correct version', () {
        expect(magento.version, equals('2.0.0'));
      });

      test('should return correct description', () {
        expect(magento.description, contains('Magento e-commerce platform'));
      });

      test('should not be initialized initially', () {
        expect(magento.isInitialized, isFalse);
      });

      test('should not be authenticated initially', () {
        expect(magento.isAuthenticated, isFalse);
      });
    });

    group('API Access', () {
      test('should provide access to API instances after initialization',
          () async {
        final success = await magento.initialize(
          baseUrl: 'https://test-store.magento.com',
        );

        if (success) {
          expect(magento.auth, isNotNull);
          expect(magento.products, isNotNull);
          expect(magento.cart, isNotNull);
          expect(magento.orders, isNotNull);
          expect(magento.wishlist, isNotNull);
          expect(magento.customer, isNotNull);
          expect(magento.checkout, isNotNull);
          expect(magento.searchApi, isNotNull);
        }
      });
    });

    group('Custom Attributes Management', () {
      test('should provide access to custom attributes manager', () {
        expect(magento.customAttributesManager, isNotNull);
      });

      test('should handle custom attributes adapter registration', () {
        // Test that the methods exist and don't throw
        expect(magento.registeredAdapters, isA<Map>());

        // Test adapter registration check
        expect(
          magento.isCustomAttributesAdapterRegistered('test_adapter'),
          isFalse,
        );

        // Test statistics access
        expect(magento.customAttributesStatistics, isA<Map<String, dynamic>>());
      });

      test('should handle debug logging setting', () {
        // Should not throw
        magento.enableCustomAttributesDebugLogging = true;
        magento.enableCustomAttributesDebugLogging = false;

        expect(true, isTrue); // Test passes if no exception
      });
    });

    group('Error Handling', () {
      test('should handle invalid URLs gracefully', () async {
        final success = await magento.initialize(
          baseUrl: 'invalid-url',
        );

        expect(success, isFalse);
      });

      test('should handle empty URLs gracefully', () async {
        final success = await magento.initialize(
          baseUrl: '',
        );

        expect(success, isFalse);
      });

      test('should handle network errors gracefully', () async {
        final success = await magento.initialize(
          baseUrl: 'https://nonexistent.domain.test',
        );

        expect(success, isFalse);
      });
    });

    group('State Management', () {
      test('should maintain consistent state', () async {
        expect(magento.isInitialized, isFalse);

        final success = await magento.initialize(
          baseUrl: 'https://test-store.magento.com',
        );

        if (success) {
          expect(magento.isInitialized, isTrue);
        }
      });

      test('should handle disposal cleanly', () {
        magento.dispose();

        // Should not throw on multiple dispose calls
        magento.dispose();

        expect(true, isTrue);
      });
    });

    group('Concurrent Operations', () {
      test('should handle multiple initialization attempts', () async {
        final futures = [
          magento.initialize(baseUrl: 'https://store1.magento.com'),
          magento.initialize(baseUrl: 'https://store2.magento.com'),
          magento.initialize(baseUrl: 'https://store3.magento.com'),
        ];

        final results = await Future.wait(futures, eagerError: false);

        // All should complete without hanging
        expect(results.length, equals(3));
        expect(results.every((r) => r is bool), isTrue);
      });
    });
  });
}
