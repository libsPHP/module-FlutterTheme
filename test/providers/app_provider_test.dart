import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Import the example app provider for testing
// Since it's in the example folder, we need to import it directly
import '../../example/lib/providers/app_provider.dart';

void main() {
  group('AppProvider', () {
    late AppProvider provider;

    setUp(() {
      // Mock SharedPreferences
      SharedPreferences.setMockInitialValues({});
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
        expect(provider.products.isEmpty, isTrue);
        expect(provider.searchResults.isEmpty, isTrue);
        expect(provider.currentCart.items.isEmpty, isTrue);
      });

      test('should load configuration on initialization', () async {
        // Wait a bit for the constructor to complete async work
        await Future.delayed(Duration(milliseconds: 100));

        // Initially should not be initialized without base URL
        expect(provider.isInitialized, isFalse);
      });
    });

    group('Magento Initialization', () {
      test('should initialize successfully with valid URL', () async {
        final success =
            await provider.initializeMagento('https://demo.magento.com');

        expect(success, isTrue);
        expect(provider.isInitialized, isTrue);
        expect(provider.baseUrl, equals('https://demo.magento.com'));
        expect(provider.products.isNotEmpty,
            isTrue); // Demo products should be loaded
      });

      test('should handle initialization with invalid URL', () async {
        final success = await provider.initializeMagento('');

        expect(success, isFalse);
        expect(provider.isInitialized, isFalse);
      });

      test('should save configuration to SharedPreferences', () async {
        await provider.initializeMagento('https://test.magento.com');

        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getString('magento_base_url'),
            equals('https://test.magento.com'));
      });

      test('should load demo products after initialization', () async {
        await provider.initializeMagento('https://demo.magento.com');

        expect(provider.products.length, equals(6)); // Based on demo products
        expect(provider.products.first.name, equals('iPhone 15 Pro'));
        expect(provider.products.first.sku, equals('IPHONE-15-PRO'));
        expect(provider.products.first.price, equals(999.99));
      });
    });

    group('Authentication', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
      });

      test('should login with valid credentials', () async {
        final success = await provider.login('test@example.com', 'password123');

        expect(success, isTrue);
        expect(provider.isAuthenticated, isTrue);
        expect(provider.currentCustomer, isNotNull);
        expect(provider.currentCustomer!.email, equals('test@example.com'));
        expect(provider.currentCustomer!.firstName, equals('Demo'));
        expect(provider.currentCustomer!.lastName, equals('User'));
      });

      test('should fail login with empty credentials', () async {
        final success = await provider.login('', '');

        expect(success, isFalse);
        expect(provider.isAuthenticated, isFalse);
        expect(provider.error, isNotNull);
        expect(provider.error, contains('Invalid credentials'));
      });

      test('should register new user successfully', () async {
        final success = await provider.register(
          email: 'newuser@example.com',
          password: 'password123',
          firstName: 'New',
          lastName: 'User',
        );

        expect(success, isTrue);
        expect(provider.isAuthenticated, isTrue);
        expect(provider.currentCustomer, isNotNull);
        expect(provider.currentCustomer!.email, equals('newuser@example.com'));
        expect(provider.currentCustomer!.firstName, equals('New'));
        expect(provider.currentCustomer!.lastName, equals('User'));
      });

      test('should logout successfully', () async {
        // Login first
        await provider.login('test@example.com', 'password123');
        expect(provider.isAuthenticated, isTrue);

        // Then logout
        await provider.logout();

        expect(provider.isAuthenticated, isFalse);
        expect(provider.currentCustomer, isNull);
        expect(provider.currentCart.items.isEmpty, isTrue);
      });

      test('should fail authentication when not initialized', () async {
        provider = AppProvider(); // New instance, not initialized

        final success = await provider.login('test@example.com', 'password123');

        expect(success, isFalse);
        expect(provider.error, contains('not initialized'));
      });
    });

    group('Product Management', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
      });

      test('should load products successfully', () async {
        await provider.loadProducts();

        expect(provider.products.isNotEmpty, isTrue);
        expect(provider.products.length, equals(6));
      });

      test('should search products successfully', () async {
        await provider.searchProducts('iPhone');

        expect(provider.searchResults.isNotEmpty, isTrue);
        expect(provider.searchResults.first.name.toLowerCase(),
            contains('iphone'));
      });

      test('should search products case-insensitively', () async {
        await provider.searchProducts('IPHONE');

        expect(provider.searchResults.isNotEmpty, isTrue);
        expect(provider.searchResults.first.name.toLowerCase(),
            contains('iphone'));
      });

      test('should return empty results for non-matching search', () async {
        await provider.searchProducts('NonExistentProduct');

        expect(provider.searchResults.isEmpty, isTrue);
      });

      test('should clear search results for empty query', () async {
        // First search for something
        await provider.searchProducts('iPhone');
        expect(provider.searchResults.isNotEmpty, isTrue);

        // Then search with empty query
        await provider.searchProducts('');
        expect(provider.searchResults.isEmpty, isTrue);
      });

      test('should fail to load products when not initialized', () async {
        provider = AppProvider(); // New instance, not initialized

        await provider.loadProducts();

        expect(provider.error, contains('not initialized'));
      });
    });

    group('Cart Management', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
        await provider.login('test@example.com', 'password123');
      });

      test('should add product to cart successfully', () async {
        expect(provider.currentCart.items.isEmpty, isTrue);

        await provider.addToCart('IPHONE-15-PRO', 1);

        expect(provider.currentCart.items.isNotEmpty, isTrue);
        expect(provider.currentCart.items.first.name, equals('iPhone 15 Pro'));
        expect(provider.currentCart.items.first.quantity, equals(1));
        expect(provider.currentCart.grandTotal, equals(999.99));
      });

      test('should update quantity when adding existing product', () async {
        // Add product first time
        await provider.addToCart('IPHONE-15-PRO', 1);
        expect(provider.currentCart.items.first.quantity, equals(1));

        // Add same product again
        await provider.addToCart('IPHONE-15-PRO', 2);
        expect(provider.currentCart.items.first.quantity, equals(3));
        expect(provider.currentCart.grandTotal, equals(2999.97));
      });

      test('should add multiple different products', () async {
        await provider.addToCart('IPHONE-15-PRO', 1);
        await provider.addToCart('MACBOOK-AIR-M3', 1);

        expect(provider.currentCart.items.length, equals(2));
        expect(provider.currentCart.grandTotal, equals(2299.98));
      });

      test('should fail to add to cart when not authenticated', () async {
        await provider.logout();

        await provider.addToCart('IPHONE-15-PRO', 1);

        expect(provider.error, contains('Please login first'));
        expect(provider.currentCart.items.isEmpty, isTrue);
      });

      test('should fail to add to cart when not initialized', () async {
        provider = AppProvider(); // New instance, not initialized

        await provider.addToCart('IPHONE-15-PRO', 1);

        expect(provider.error, contains('not initialized'));
      });

      test('should load cart successfully', () async {
        await provider.addToCart('IPHONE-15-PRO', 1);

        await provider.loadCart();

        // Cart should remain the same since it's stored in memory
        expect(provider.currentCart.items.isNotEmpty, isTrue);
      });

      test('should calculate cart totals correctly', () {
        expect(provider.currentCart.itemsCount, equals(0));
        expect(provider.currentCart.grandTotal, equals(0.0));
      });
    });

    group('Loading States', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
      });

      test('should show loading state during initialization', () async {
        provider = AppProvider();
        expect(provider.isLoading, isFalse);

        // Start initialization
        final future = provider.initializeMagento('https://demo.magento.com');

        // Should be loading during initialization
        expect(provider.isLoading, isTrue);

        await future;

        // Should not be loading after completion
        expect(provider.isLoading, isFalse);
      });

      test('should show loading state during login', () async {
        expect(provider.isLoading, isFalse);

        final future = provider.login('test@example.com', 'password123');

        expect(provider.isLoading, isTrue);

        await future;

        expect(provider.isLoading, isFalse);
      });

      test('should show loading state during product loading', () async {
        expect(provider.isLoading, isFalse);

        final future = provider.loadProducts();

        expect(provider.isLoading, isTrue);

        await future;

        expect(provider.isLoading, isFalse);
      });
    });

    group('Error Handling', () {
      test('should handle and clear errors', () async {
        // Cause an error
        await provider.login('', '');
        expect(provider.error, isNotNull);

        // Successful operation should clear error
        await provider.initializeMagento('https://demo.magento.com');
        expect(provider.error, isNull);
      });

      test('should set error for failed operations', () async {
        provider = AppProvider(); // Not initialized

        await provider.login('test@example.com', 'password123');

        expect(provider.error, isNotNull);
        expect(provider.error, contains('not initialized'));
      });
    });

    group('Demo Data', () {
      setUp(() async {
        await provider.initializeMagento('https://demo.magento.com');
      });

      test('should have correct demo products', () {
        final products = provider.products;

        expect(products.length, equals(6));

        // Check specific products
        final iphone = products.firstWhere((p) => p.sku == 'IPHONE-15-PRO');
        expect(iphone.name, equals('iPhone 15 Pro'));
        expect(iphone.price, equals(999.99));
        expect(iphone.inStock, isTrue);

        final watch = products.firstWhere((p) => p.sku == 'WATCH-S9');
        expect(watch.name, equals('Apple Watch Series 9'));
        expect(watch.price, equals(399.99));
        expect(watch.inStock, isFalse);
      });

      test('should filter out-of-stock products in search', () async {
        await provider.searchProducts('watch');

        // Should find the watch but it's out of stock
        expect(provider.searchResults.isNotEmpty, isTrue);
        expect(provider.searchResults.first.inStock, isFalse);
      });
    });

    group('State Notifications', () {
      test('should notify listeners on state changes', () {
        int notificationCount = 0;

        provider.addListener(() {
          notificationCount++;
        });

        // These operations should trigger notifications
        provider.initializeMagento('https://demo.magento.com');

        expect(notificationCount, greaterThan(0));
      });
    });
  });
}
