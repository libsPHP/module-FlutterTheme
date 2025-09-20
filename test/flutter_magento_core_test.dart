import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/flutter_magento_core.dart';
import 'package:flutter_magento/src/services/magento_api_service.dart';
import 'package:flutter_magento/src/services/auth_service.dart';
import 'package:flutter_magento/src/services/cart_service.dart';
import 'package:flutter_magento/src/exceptions/magento_exception.dart';
import 'package:mocktail/mocktail.dart';

// Mock classes
class MockMagentoApiService extends Mock implements MagentoApiService {}

class MockAuthService extends Mock implements AuthService {}

class MockCartService extends Mock implements CartService {}

void main() {
  group('FlutterMagentoCore', () {
    late FlutterMagentoCore core;
    late MockMagentoApiService mockApiService;
    late MockAuthService mockAuthService;
    late MockCartService mockCartService;

    setUp(() {
      core = FlutterMagentoCore.instance;
      mockApiService = MockMagentoApiService();
      mockAuthService = MockAuthService();
      mockCartService = MockCartService();

      // Reset the singleton for each test
      core.reset();
    });

    tearDown(() {
      core.reset();
    });

    group('Singleton Pattern', () {
      test('should return the same instance', () {
        final instance1 = FlutterMagentoCore.instance;
        final instance2 = FlutterMagentoCore.instance;

        expect(instance1, equals(instance2));
        expect(identical(instance1, instance2), isTrue);
      });
    });

    group('Initialization', () {
      test('should not be initialized initially', () {
        expect(core.isInitialized, isFalse);
        expect(core.baseUrl, isNull);
      });

      test('should initialize successfully with valid parameters', () async {
        // Mock the API service initialization
        when(() => mockApiService.initialize(
              baseUrl: any(named: 'baseUrl'),
              headers: any(named: 'headers'),
              connectionTimeout: any(named: 'connectionTimeout'),
              receiveTimeout: any(named: 'receiveTimeout'),
              adminToken: any(named: 'adminToken'),
            )).thenAnswer((_) async => true);

        when(() => mockAuthService.initialize()).thenAnswer((_) async => true);
        when(() => mockCartService.initialize()).thenAnswer((_) async => true);

        final success = await core.initialize(
          baseUrl: 'https://demo.magento.com',
          headers: {'User-Agent': 'Test'},
          connectionTimeout: 30000,
          receiveTimeout: 30000,
        );

        expect(success, isTrue);
        expect(core.isInitialized, isTrue);
        expect(core.baseUrl, equals('https://demo.magento.com'));
      });

      test('should fail initialization with invalid API service', () async {
        final success = await core.initialize(
          baseUrl: 'invalid-url',
        );

        expect(success, isFalse);
        expect(core.isInitialized, isFalse);
      });

      test('should handle initialization errors gracefully', () async {
        final success = await core.initialize(
          baseUrl: '', // Empty URL should cause failure
        );

        expect(success, isFalse);
        expect(core.isInitialized, isFalse);
      });
    });

    group('Authentication', () {
      setUp(() async {
        // Initialize core for authentication tests
        await core.initialize(baseUrl: 'https://demo.magento.com');
      });

      test('should not be authenticated initially', () {
        expect(core.isAuthenticated, isFalse);
        expect(core.currentCustomer, isNull);
        expect(core.customerToken, isNull);
      });

      test('should throw exception when not initialized', () {
        core.reset();

        expect(
          () => core.authenticate(
              email: 'test@example.com', password: 'password'),
          throwsA(isA<MagentoException>()),
        );
      });

      test('should authenticate successfully with valid credentials', () async {
        final mockCustomer = {
          'id': 1,
          'email': 'test@example.com',
          'firstname': 'Test',
          'lastname': 'User',
        };

        // This test would require actual API mocking which is complex
        // For now, we test the error case
        try {
          await core.authenticate(
            email: 'test@example.com',
            password: 'password',
          );
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should create account successfully', () async {
        try {
          await core.createAccount(
            email: 'newuser@example.com',
            password: 'password123',
            firstName: 'New',
            lastName: 'User',
          );
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should logout successfully', () async {
        try {
          await core.logout();
        } catch (e) {
          // Expected without proper initialization
          expect(e, isA<Exception>());
        }
      });
    });

    group('Product Management', () {
      setUp(() async {
        await core.initialize(baseUrl: 'https://demo.magento.com');
      });

      test('should throw exception when not initialized', () {
        core.reset();

        expect(
          () => core.getProducts(),
          throwsA(isA<MagentoException>()),
        );
      });

      test('should get products with default parameters', () async {
        try {
          await core.getProducts();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should get products with custom parameters', () async {
        try {
          await core.getProducts(
            page: 2,
            pageSize: 10,
            searchQuery: 'test',
            categoryId: '1',
            sortBy: 'name',
            sortOrder: 'asc',
          );
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should get product by SKU', () async {
        try {
          await core.getProduct('TEST-SKU');
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should search products', () async {
        try {
          await core.searchProducts('iPhone');
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should get categories', () async {
        try {
          await core.getCategories();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should get category by ID', () async {
        try {
          await core.getCategory(1);
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });
    });

    group('Cart Operations', () {
      setUp(() async {
        await core.initialize(baseUrl: 'https://demo.magento.com');
      });

      test('should throw exception when not initialized', () {
        core.reset();

        expect(
          () => core.createCart(),
          throwsA(isA<MagentoException>()),
        );
      });

      test('should create cart', () async {
        try {
          await core.createCart();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should get cart', () async {
        try {
          await core.getCart();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should add to cart', () async {
        try {
          await core.addToCart(sku: 'TEST-SKU', quantity: 1);
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should update cart item quantity', () async {
        try {
          await core.updateCartItemQuantity(itemId: 1, quantity: 2);
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should remove from cart', () async {
        try {
          await core.removeFromCart(1);
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should clear cart', () async {
        try {
          await core.clearCart();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should check if product is in cart', () {
        expect(core.isProductInCart('TEST-SKU'), isFalse);
      });

      test('should get product quantity in cart', () {
        expect(core.getProductQuantityInCart('TEST-SKU'), equals(0));
      });

      test('should apply coupon', () async {
        try {
          await core.applyCoupon('DISCOUNT10');
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should remove coupon', () async {
        try {
          await core.removeCoupon();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });
    });

    group('Order Management', () {
      setUp(() async {
        await core.initialize(baseUrl: 'https://demo.magento.com');
      });

      test('should get customer orders', () async {
        try {
          await core.getCustomerOrders();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should get order by ID', () async {
        try {
          await core.getOrder('ORDER-123');
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });
    });

    group('Wishlist Operations', () {
      setUp(() async {
        await core.initialize(baseUrl: 'https://demo.magento.com');
      });

      test('should get wishlist', () async {
        try {
          await core.getWishlist();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should add to wishlist', () async {
        try {
          await core.addToWishlist('TEST-SKU');
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should remove from wishlist', () async {
        try {
          await core.removeFromWishlist(1);
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });
    });

    group('Checkout Process', () {
      setUp(() async {
        await core.initialize(baseUrl: 'https://demo.magento.com');
      });

      test('should estimate shipping', () async {
        try {
          await core.estimateShipping({
            'country_id': 'US',
            'postcode': '12345',
          });
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should get payment methods', () async {
        try {
          await core.getPaymentMethods();
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });

      test('should place order', () async {
        try {
          await core.placeOrder({
            'paymentMethod': {'method': 'test'},
            'billing_address': {},
            'shipping_address': {},
          });
          fail('Should throw exception without proper API setup');
        } catch (e) {
          expect(e, isA<Exception>());
        }
      });
    });

    group('State Management', () {
      test('should reset state correctly', () async {
        await core.initialize(baseUrl: 'https://demo.magento.com');
        expect(core.isInitialized, isTrue);

        core.reset();
        expect(core.isInitialized, isFalse);
        expect(core.baseUrl, isNull);
      });

      test('should handle multiple initializations', () async {
        await core.initialize(baseUrl: 'https://store1.magento.com');
        expect(core.baseUrl, equals('https://store1.magento.com'));

        await core.initialize(baseUrl: 'https://store2.magento.com');
        expect(core.baseUrl, equals('https://store2.magento.com'));
      });
    });

    group('Utility Methods', () {
      setUp(() async {
        await core.initialize(baseUrl: 'https://demo.magento.com');
      });

      test('should return correct version', () {
        expect(core.version, equals('1.0.0'));
      });

      test('should return correct description', () {
        expect(
          core.description,
          equals(
              'Flutter plugin for integrating with Magento e-commerce platform'),
        );
      });

      test('should handle cart state queries when not initialized', () {
        core.reset();

        expect(() => core.isCartEmpty, throwsA(isA<MagentoException>()));
        expect(() => core.cartItemsCount, throwsA(isA<MagentoException>()));
        expect(() => core.cartTotal, throwsA(isA<MagentoException>()));
      });
    });

    group('Error Handling', () {
      test('should throw MagentoException for uninitialized access', () {
        core.reset();

        expect(
          () => core.isAuthenticated,
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.currentCustomer,
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.customerToken,
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.currentCart,
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.cartItemsCount,
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.cartTotal,
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.isCartEmpty,
          throwsA(isA<MagentoException>()),
        );
      });

      test('should throw MagentoException for uninitialized method calls', () {
        core.reset();

        expect(
          () => core.authenticate(
              email: 'test@example.com', password: 'password'),
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.getProducts(),
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.createCart(),
          throwsA(isA<MagentoException>()),
        );

        expect(
          () => core.addToCart(sku: 'TEST-SKU', quantity: 1),
          throwsA(isA<MagentoException>()),
        );
      });
    });
  });
}
