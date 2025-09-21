import 'package:flutter_test/flutter_test.dart';
import '../example/lib/providers/app_provider.dart';

/// Comprehensive tests for the example app's AppProvider
/// This covers all the functionality demonstrated in the example app
void main() {
  group('Example App Provider Tests', () {
    late AppProvider provider;

    setUp(() {
      provider = AppProvider();
    });

    tearDown(() {
      provider.dispose();
    });

    group('Initial State', () {
      test('should have correct initial state', () {
        expect(provider.isInitialized, isFalse);
        expect(provider.isLoading, isFalse);
        expect(provider.error, isNull);
        expect(provider.baseUrl, isNull);
        expect(provider.isAuthenticated, isFalse);
        expect(provider.currentCustomer, isNull);
        expect(provider.currentCart.items, isEmpty);
        expect(provider.products, isEmpty);
        expect(provider.searchResults, isEmpty);
      });
    });

    group('Magento Initialization', () {
      test('should initialize successfully with valid URL', () async {
        const testUrl = 'https://demo.magento.com';
        
        final result = await provider.initializeMagento(testUrl);
        
        expect(result, isTrue);
        expect(provider.isInitialized, isTrue);
        expect(provider.baseUrl, equals(testUrl));
        expect(provider.error, isNull);
        expect(provider.products, isNotEmpty);
      });

      test('should fail initialization with empty URL', () async {
        final result = await provider.initializeMagento('');
        
        expect(result, isFalse);
        expect(provider.isInitialized, isFalse);
        expect(provider.error, isNotNull);
      });

      test('should load demo products after initialization', () async {
        await provider.initializeMagento('https://demo.magento.com');
        
        expect(provider.products, isNotEmpty);
        expect(provider.products.length, equals(6));
        
        // Verify demo products
        final productNames = provider.products.map((p) => p.name).toList();
        expect(productNames, contains('iPhone 15 Pro'));
        expect(productNames, contains('MacBook Air M3'));
        expect(productNames, contains('iPad Pro 12.9"'));
        expect(productNames, contains('Apple Watch Series 9'));
        expect(productNames, contains('AirPods Pro'));
        expect(productNames, contains('Magic Keyboard'));
      });
    });

    group('Authentication Flow', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
      });

      test('should login with valid credentials', () async {
        final result = await provider.login('user@example.com', 'password123');
        
        expect(result, isTrue);
        expect(provider.isAuthenticated, isTrue);
        expect(provider.currentCustomer, isNotNull);
        expect(provider.currentCustomer!.email, equals('user@example.com'));
        expect(provider.currentCustomer!.firstName, equals('Demo'));
        expect(provider.currentCustomer!.lastName, equals('User'));
      });

      test('should fail login with empty credentials', () async {
        final result = await provider.login('', '');
        
        expect(result, isFalse);
        expect(provider.isAuthenticated, isFalse);
        expect(provider.error, contains('Invalid credentials'));
      });

      test('should register new user', () async {
        final result = await provider.register(
          email: 'newuser@example.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
        );
        
        expect(result, isTrue);
        expect(provider.isAuthenticated, isTrue);
        expect(provider.currentCustomer!.email, equals('newuser@example.com'));
        expect(provider.currentCustomer!.firstName, equals('John'));
        expect(provider.currentCustomer!.lastName, equals('Doe'));
      });

      test('should logout successfully', () async {
        // First login
        await provider.login('user@example.com', 'password123');
        expect(provider.isAuthenticated, isTrue);
        
        // Add some items to cart
        await provider.addToCart('IPHONE-15-PRO', 1);
        expect(provider.currentCart.items, isNotEmpty);
        
        // Logout
        await provider.logout();
        
        expect(provider.isAuthenticated, isFalse);
        expect(provider.currentCustomer, isNull);
        expect(provider.currentCart.items, isEmpty);
      });

      test('should fail authentication when not initialized', () async {
        // Create new provider without initialization
        final uninitializedProvider = AppProvider();
        
        final result = await uninitializedProvider.login('user@example.com', 'password123');
        
        expect(result, isFalse);
        expect(uninitializedProvider.error, contains('Magento not initialized'));
        
        uninitializedProvider.dispose();
      });
    });

    group('Product Management', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
      });

      test('should load products successfully', () async {
        await provider.loadProducts();
        
        expect(provider.products, isNotEmpty);
        expect(provider.products.length, equals(6));
        expect(provider.error, isNull);
      });

      test('should search products by name', () async {
        await provider.loadProducts();
        
        await provider.searchProducts('iPhone');
        
        expect(provider.searchResults, isNotEmpty);
        expect(provider.searchResults.length, equals(1));
        expect(provider.searchResults.first.name, equals('iPhone 15 Pro'));
      });

      test('should search products case-insensitively', () async {
        await provider.loadProducts();
        
        await provider.searchProducts('macbook');
        
        expect(provider.searchResults, isNotEmpty);
        expect(provider.searchResults.first.name, equals('MacBook Air M3'));
      });

      test('should return empty results for non-matching search', () async {
        await provider.loadProducts();
        
        await provider.searchProducts('nonexistent product');
        
        expect(provider.searchResults, isEmpty);
      });

      test('should clear search results for empty query', () async {
        await provider.loadProducts();
        await provider.searchProducts('iPhone');
        expect(provider.searchResults, isNotEmpty);
        
        await provider.searchProducts('');
        expect(provider.searchResults, isEmpty);
      });

      test('should fail to load products when not initialized', () async {
        final uninitializedProvider = AppProvider();
        
        await uninitializedProvider.loadProducts();
        
        expect(uninitializedProvider.error, contains('Magento not initialized'));
        
        uninitializedProvider.dispose();
      });
    });

    group('Cart Operations', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
        await provider.login('user@example.com', 'password123');
        await provider.loadProducts();
      });

      test('should add single product to cart', () async {
        final product = provider.products.first;
        
        await provider.addToCart(product.sku, 1);
        
        expect(provider.currentCart.items, isNotEmpty);
        expect(provider.currentCart.items.length, equals(1));
        expect(provider.currentCart.items.first.productId, equals(product.id));
        expect(provider.currentCart.items.first.quantity, equals(1));
      });

      test('should update quantity when adding existing product', () async {
        final product = provider.products.first;
        
        await provider.addToCart(product.sku, 1);
        await provider.addToCart(product.sku, 2);
        
        expect(provider.currentCart.items.length, equals(1));
        expect(provider.currentCart.items.first.quantity, equals(3));
      });

      test('should add multiple different products', () async {
        final product1 = provider.products[0];
        final product2 = provider.products[1];
        
        await provider.addToCart(product1.sku, 1);
        await provider.addToCart(product2.sku, 2);
        
        expect(provider.currentCart.items.length, equals(2));
        expect(provider.currentCart.itemsCount, equals(2));
      });

      test('should calculate cart totals correctly', () async {
        final product1 = provider.products[0]; // iPhone 15 Pro - $999.99
        final product2 = provider.products[1]; // MacBook Air M3 - $1299.99
        
        await provider.addToCart(product1.sku, 1);
        await provider.addToCart(product2.sku, 2);
        
        final expectedTotal = 999.99 + (1299.99 * 2);
        expect(provider.currentCart.grandTotal, closeTo(expectedTotal, 0.01));
      });

      test('should fail to add to cart when not authenticated', () async {
        await provider.logout();
        final product = provider.products.first;
        
        await provider.addToCart(product.sku, 1);
        
        expect(provider.currentCart.items, isEmpty);
        expect(provider.error, contains('Please login first'));
      });

      test('should fail to add to cart when not initialized', () async {
        final uninitializedProvider = AppProvider();
        
        await uninitializedProvider.addToCart('SKU123', 1);
        
        expect(uninitializedProvider.error, contains('Magento not initialized'));
        
        uninitializedProvider.dispose();
      });

      test('should load cart successfully', () async {
        final product = provider.products.first;
        await provider.addToCart(product.sku, 1);
        
        await provider.loadCart();
        
        expect(provider.currentCart.items, isNotEmpty);
      });
    });

    group('Loading States', () {
      test('should show loading during initialization', () async {
        expect(provider.isLoading, isFalse);
        
        final future = provider.initializeMagento('https://demo.magento.com');
        
        // Allow time for loading state
        await Future.delayed(const Duration(milliseconds: 10));
        expect(provider.isLoading, isTrue);
        
        await future;
        expect(provider.isLoading, isFalse);
      });

      test('should show loading during login', () async {
        await provider.initializeMagento('https://demo.magento.com');
        
        final future = provider.login('user@example.com', 'password123');
        
        // Allow time for loading state
        await Future.delayed(const Duration(milliseconds: 10));
        expect(provider.isLoading, isTrue);
        
        await future;
        expect(provider.isLoading, isFalse);
      });

      test('should show loading during product loading', () async {
        await provider.initializeMagento('https://demo.magento.com');
        
        final future = provider.loadProducts();
        
        // Allow time for loading state
        await Future.delayed(const Duration(milliseconds: 10));
        expect(provider.isLoading, isTrue);
        
        await future;
        expect(provider.isLoading, isFalse);
      });
    });

    group('Error Handling', () {
      test('should handle initialization errors', () async {
        await provider.initializeMagento('');
        
        expect(provider.error, isNotNull);
        expect(provider.isInitialized, isFalse);
      });

      test('should clear errors on successful operations', () async {
        // Trigger error
        await provider.initializeMagento('');
        expect(provider.error, isNotNull);
        
        // Clear error with successful operation
        await provider.initializeMagento('https://demo.magento.com');
        expect(provider.error, isNull);
      });

      test('should handle authentication errors', () async {
        await provider.initializeMagento('https://demo.magento.com');
        
        await provider.login('', '');
        
        expect(provider.error, contains('Invalid credentials'));
        expect(provider.isAuthenticated, isFalse);
      });
    });

    group('State Management', () {
      test('should notify listeners on state changes', () {
        var notificationCount = 0;
        provider.addListener(() {
          notificationCount++;
        });
        
        // Trigger state changes
        provider.initializeMagento('https://demo.magento.com');
        
        // Allow time for notifications
        return Future.delayed(const Duration(milliseconds: 100), () {
          expect(notificationCount, greaterThan(0));
        });
      });

      test('should maintain state consistency', () async {
        await provider.initializeMagento('https://demo.magento.com');
        await provider.login('user@example.com', 'password123');
        await provider.loadProducts();
        await provider.addToCart('IPHONE-15-PRO', 1);
        
        // Verify all states are consistent
        expect(provider.isInitialized, isTrue);
        expect(provider.isAuthenticated, isTrue);
        expect(provider.currentCustomer, isNotNull);
        expect(provider.products, isNotEmpty);
        expect(provider.currentCart.items, isNotEmpty);
      });
    });

    group('Demo Data Validation', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
        await provider.loadProducts();
      });

      test('should have correct product structure', () {
        for (final product in provider.products) {
          expect(product.id, isNotEmpty);
          expect(product.name, isNotEmpty);
          expect(product.sku, isNotEmpty);
          expect(product.price, greaterThan(0));
          expect(product.inStock, isA<bool>());
        }
      });

      test('should have specific demo products', () {
        final iphone = provider.products.firstWhere((p) => p.name == 'iPhone 15 Pro');
        expect(iphone.sku, equals('IPHONE-15-PRO'));
        expect(iphone.price, equals(999.99));
        expect(iphone.inStock, isTrue);
        
        final watch = provider.products.firstWhere((p) => p.name == 'Apple Watch Series 9');
        expect(watch.inStock, isFalse);
      });

      test('should handle product search correctly', () async {
        await provider.searchProducts('Apple');
        
        final results = provider.searchResults;
        expect(results.length, equals(2)); // iPhone and Apple Watch
        expect(results.any((p) => p.name.contains('iPhone')), isTrue);
        expect(results.any((p) => p.name.contains('Apple Watch')), isTrue);
      });
    });
  });
}
