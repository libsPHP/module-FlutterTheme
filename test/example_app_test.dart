import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../example/lib/providers/app_provider.dart';

/// Tests for the example app functionality
/// This covers the core functionality demonstrated in the example app
void main() {
  group('Example App Tests', () {
    late AppProvider appProvider;

    setUp(() {
      appProvider = AppProvider();
    });

    tearDown(() {
      appProvider.dispose();
    });

    group('Initialization', () {
      test('should start with uninitialized state', () {
        expect(appProvider.isInitialized, isFalse);
        expect(appProvider.baseUrl, isNull);
        expect(appProvider.error, isNull);
        expect(appProvider.isLoading, isFalse);
      });

      test('should initialize Magento successfully', () async {
        const testUrl = 'https://demo.magento.com';
        
        final result = await appProvider.initializeMagento(testUrl);
        
        expect(result, isTrue);
        expect(appProvider.isInitialized, isTrue);
        expect(appProvider.baseUrl, equals(testUrl));
        expect(appProvider.error, isNull);
      });

      test('should handle initialization errors', () async {
        // Test with invalid URL
        final result = await appProvider.initializeMagento('');
        
        expect(result, isFalse);
        expect(appProvider.isInitialized, isFalse);
        expect(appProvider.error, isNotNull);
      });
    });

    group('Authentication', () {
      setUp(() async {
        await appProvider.initializeMagento('https://demo.magento.com');
      });

      test('should start with unauthenticated state', () {
        expect(appProvider.isAuthenticated, isFalse);
        expect(appProvider.currentCustomer, isNull);
      });

      test('should login successfully with valid credentials', () async {
        final result = await appProvider.login('test@example.com', 'password123');
        
        expect(result, isTrue);
        expect(appProvider.isAuthenticated, isTrue);
        expect(appProvider.currentCustomer, isNotNull);
        expect(appProvider.currentCustomer!.email, equals('test@example.com'));
        expect(appProvider.currentCustomer!.firstName, equals('Demo'));
        expect(appProvider.currentCustomer!.lastName, equals('User'));
      });

      test('should fail login with empty credentials', () async {
        final result = await appProvider.login('', '');
        
        expect(result, isFalse);
        expect(appProvider.isAuthenticated, isFalse);
        expect(appProvider.error, contains('Invalid credentials'));
      });

      test('should register successfully', () async {
        final result = await appProvider.register(
          email: 'newuser@example.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
        );
        
        expect(result, isTrue);
        expect(appProvider.isAuthenticated, isTrue);
        expect(appProvider.currentCustomer, isNotNull);
        expect(appProvider.currentCustomer!.email, equals('newuser@example.com'));
        expect(appProvider.currentCustomer!.firstName, equals('John'));
        expect(appProvider.currentCustomer!.lastName, equals('Doe'));
      });

      test('should logout successfully', () async {
        // First login
        await appProvider.login('test@example.com', 'password123');
        expect(appProvider.isAuthenticated, isTrue);
        
        // Then logout
        await appProvider.logout();
        
        expect(appProvider.isAuthenticated, isFalse);
        expect(appProvider.currentCustomer, isNull);
        expect(appProvider.currentCart.items, isEmpty);
      });
    });

    group('Product Management', () {
      setUp(() async {
        await appProvider.initializeMagento('https://demo.magento.com');
      });

      test('should load demo products', () async {
        await appProvider.loadProducts();
        
        expect(appProvider.products, isNotEmpty);
        expect(appProvider.products.length, equals(6)); // 6 demo products
        
        // Check first product
        final firstProduct = appProvider.products.first;
        expect(firstProduct.id, equals('1'));
        expect(firstProduct.name, equals('iPhone 15 Pro'));
        expect(firstProduct.sku, equals('IPHONE-15-PRO'));
        expect(firstProduct.price, equals(999.99));
        expect(firstProduct.inStock, isTrue);
      });

      test('should search products successfully', () async {
        await appProvider.loadProducts();
        
        await appProvider.searchProducts('iPhone');
        
        expect(appProvider.searchResults, isNotEmpty);
        expect(appProvider.searchResults.length, equals(1));
        expect(appProvider.searchResults.first.name, equals('iPhone 15 Pro'));
      });

      test('should search products case-insensitively', () async {
        await appProvider.loadProducts();
        
        await appProvider.searchProducts('macbook');
        
        expect(appProvider.searchResults, isNotEmpty);
        expect(appProvider.searchResults.first.name, equals('MacBook Air M3'));
      });

      test('should return empty results for non-matching search', () async {
        await appProvider.loadProducts();
        
        await appProvider.searchProducts('nonexistent');
        
        expect(appProvider.searchResults, isEmpty);
      });

      test('should clear search results for empty query', () async {
        await appProvider.loadProducts();
        await appProvider.searchProducts('iPhone');
        expect(appProvider.searchResults, isNotEmpty);
        
        await appProvider.searchProducts('');
        expect(appProvider.searchResults, isEmpty);
      });
    });

    group('Cart Management', () {
      setUp(() async {
        await appProvider.initializeMagento('https://demo.magento.com');
        await appProvider.login('test@example.com', 'password123');
        await appProvider.loadProducts();
      });

      test('should start with empty cart', () {
        expect(appProvider.currentCart.items, isEmpty);
        expect(appProvider.currentCart.itemsCount, equals(0));
        expect(appProvider.currentCart.grandTotal, equals(0.0));
      });

      test('should add product to cart successfully', () async {
        final product = appProvider.products.first;
        
        await appProvider.addToCart(product.sku, 1);
        
        expect(appProvider.currentCart.items, isNotEmpty);
        expect(appProvider.currentCart.itemsCount, equals(1));
        expect(appProvider.currentCart.items.first.productId, equals(product.id));
        expect(appProvider.currentCart.items.first.quantity, equals(1));
      });

      test('should update quantity when adding existing product', () async {
        final product = appProvider.products.first;
        
        await appProvider.addToCart(product.sku, 1);
        await appProvider.addToCart(product.sku, 2);
        
        expect(appProvider.currentCart.items.length, equals(1));
        expect(appProvider.currentCart.items.first.quantity, equals(3));
      });

      test('should add multiple different products', () async {
        final product1 = appProvider.products[0];
        final product2 = appProvider.products[1];
        
        await appProvider.addToCart(product1.sku, 1);
        await appProvider.addToCart(product2.sku, 2);
        
        expect(appProvider.currentCart.items.length, equals(2));
        expect(appProvider.currentCart.itemsCount, equals(2));
      });

      test('should calculate cart totals correctly', () async {
        final product1 = appProvider.products[0]; // iPhone 15 Pro - $999.99
        final product2 = appProvider.products[1]; // MacBook Air M3 - $1299.99
        
        await appProvider.addToCart(product1.sku, 1);
        await appProvider.addToCart(product2.sku, 2);
        
        final expectedTotal = 999.99 + (1299.99 * 2);
        expect(appProvider.currentCart.grandTotal, closeTo(expectedTotal, 0.01));
      });

      test('should fail to add to cart when not authenticated', () async {
        await appProvider.logout();
        final product = appProvider.products.first;
        
        await appProvider.addToCart(product.sku, 1);
        
        expect(appProvider.currentCart.items, isEmpty);
        expect(appProvider.error, contains('Please login first'));
      });

      test('should load cart successfully', () async {
        final product = appProvider.products.first;
        await appProvider.addToCart(product.sku, 1);
        
        await appProvider.loadCart();
        
        expect(appProvider.currentCart.items, isNotEmpty);
      });
    });

    group('Loading States', () {
      test('should show loading state during initialization', () async {
        expect(appProvider.isLoading, isFalse);
        
        final future = appProvider.initializeMagento('https://demo.magento.com');
        
        // Allow some time for loading state to be set
        await Future.delayed(const Duration(milliseconds: 10));
        
        expect(appProvider.isLoading, isTrue);
        
        await future;
        expect(appProvider.isLoading, isFalse);
      });

      test('should show loading state during login', () async {
        await appProvider.initializeMagento('https://demo.magento.com');
        
        expect(appProvider.isLoading, isFalse);
        
        final future = appProvider.login('test@example.com', 'password123');
        
        // Allow some time for loading state to be set
        await Future.delayed(const Duration(milliseconds: 10));
        
        expect(appProvider.isLoading, isTrue);
        
        await future;
        expect(appProvider.isLoading, isFalse);
      });

      test('should show loading state during product loading', () async {
        await appProvider.initializeMagento('https://demo.magento.com');
        
        expect(appProvider.isLoading, isFalse);
        
        final future = appProvider.loadProducts();
        
        // Allow some time for loading state to be set
        await Future.delayed(const Duration(milliseconds: 10));
        
        expect(appProvider.isLoading, isTrue);
        
        await future;
        expect(appProvider.isLoading, isFalse);
      });
    });

    group('Error Handling', () {
      test('should handle and clear errors', () async {
        // Trigger an error
        await appProvider.initializeMagento('');
        expect(appProvider.error, isNotNull);
        
        // Clear error by successful operation
        await appProvider.initializeMagento('https://demo.magento.com');
        expect(appProvider.error, isNull);
      });

      test('should set error for failed operations', () async {
        await appProvider.initializeMagento('https://demo.magento.com');
        
        // Try to add to cart without being authenticated
        await appProvider.addToCart('invalid-sku', 1);
        
        expect(appProvider.error, isNotNull);
      });
    });

    group('Demo Data', () {
      setUp(() async {
        await appProvider.initializeMagento('https://demo.magento.com');
        await appProvider.loadProducts();
      });

      test('should have correct demo products', () {
        expect(appProvider.products.length, equals(6));
        
        final productNames = appProvider.products.map((p) => p.name).toList();
        expect(productNames, contains('iPhone 15 Pro'));
        expect(productNames, contains('MacBook Air M3'));
        expect(productNames, contains('iPad Pro 12.9"'));
        expect(productNames, contains('Apple Watch Series 9'));
        expect(productNames, contains('AirPods Pro'));
        expect(productNames, contains('Magic Keyboard'));
      });

      test('should have correct product details', () {
        final iphone = appProvider.products.firstWhere((p) => p.name == 'iPhone 15 Pro');
        expect(iphone.id, equals('1'));
        expect(iphone.sku, equals('IPHONE-15-PRO'));
        expect(iphone.price, equals(999.99));
        expect(iphone.inStock, isTrue);
        
        final watch = appProvider.products.firstWhere((p) => p.name == 'Apple Watch Series 9');
        expect(watch.inStock, isFalse);
      });
    });

    group('State Notifications', () {
      test('should notify listeners on state changes', () {
        var notificationCount = 0;
        appProvider.addListener(() {
          notificationCount++;
        });
        
        // Trigger state changes
        appProvider.initializeMagento('https://demo.magento.com');
        
        // Allow time for notifications
        return Future.delayed(const Duration(milliseconds: 100), () {
          expect(notificationCount, greaterThan(0));
        });
      });
    });
  });
}
