import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:mockito/mockito.dart';

// Import the examples
import '../../example/lib/examples/cart_examples.dart';
import 'auth_examples_test.mocks.dart';

void main() {
  group('Cart Examples Tests', () {
    late MockFlutterMagentoCore mockMagento;
    late CartExamples cartExamples;

    setUp(() {
      mockMagento = MockFlutterMagentoCore();
      cartExamples = CartExamples(mockMagento);
    });

    test('Example 1: Create Guest Cart - should return cart with ID', () async {
      // Arrange
      final expectedCart = Cart(
        id: 'test-cart-123',
        itemsCount: 0,
        isActive: true,
        currency: CartCurrency(
          baseCurrencyCode: 'USD',
          quoteCurrencyCode: 'USD',
        ),
      );

      when(mockMagento.createGuestCart()).thenAnswer((_) async => expectedCart);

      // Act
      final result = await cartExamples.createGuestCart();

      // Assert
      expect(result.id, equals('test-cart-123'));
      expect(result.itemsCount, equals(0));
      expect(result.isActive, isTrue);
      verify(mockMagento.createGuestCart()).called(1);
    });

    test(
      'Example 2: Add Item to Cart - should add product successfully',
      () async {
        // Arrange
        final cartWithItem = Cart(
          id: 'test-cart-123',
          itemsCount: 1,
          isActive: true,
          items: [
            CartItem(
              itemId: 1,
              sku: 'TEST-SKU',
              name: 'Test Product',
              qty: 1,
              price: 99.99,
            ),
          ],
        );

        when(
          mockMagento.addToGuestCart(
            cartId: 'test-cart-123',
            sku: 'TEST-SKU',
            quantity: 1,
          ),
        ).thenAnswer((_) async => cartWithItem);

        // Act
        final result = await cartExamples.addToCart(
          cartId: 'test-cart-123',
          sku: 'TEST-SKU',
          quantity: 1,
        );

        // Assert
        expect(result.itemsCount, equals(1));
        expect(result.items, isNotEmpty);
        expect(result.items!.first.sku, equals('TEST-SKU'));
        verify(
          mockMagento.addToGuestCart(
            cartId: 'test-cart-123',
            sku: 'TEST-SKU',
            quantity: 1,
          ),
        ).called(1);
      },
    );

    test('Example 3: Get Cart Totals - should return cart totals', () async {
      // Arrange
      final expectedTotals = CartTotals(
        grandTotal: 199.98,
        subtotal: 199.98,
        itemsQty: 2,
        baseCurrencyCode: 'USD',
        quoteCurrencyCode: 'USD',
      );

      when(
        mockMagento.getGuestCartTotals('test-cart-123'),
      ).thenAnswer((_) async => expectedTotals);

      // Act
      final result = await cartExamples.getCartTotals('test-cart-123');

      // Assert
      expect(result.grandTotal, equals(199.98));
      expect(result.subtotal, equals(199.98));
      expect(result.itemsQty, equals(2));
      verify(mockMagento.getGuestCartTotals('test-cart-123')).called(1);
    });

    test('Example 4: Get Cart Items - should return cart with items', () async {
      // Arrange
      final cartWithItems = Cart(
        id: 'test-cart-123',
        itemsCount: 2,
        isActive: true,
        items: [
          CartItem(
            itemId: 1,
            sku: 'SKU-1',
            name: 'Product 1',
            qty: 1,
            price: 99.99,
          ),
          CartItem(
            itemId: 2,
            sku: 'SKU-2',
            name: 'Product 2',
            qty: 1,
            price: 149.99,
          ),
        ],
      );

      when(
        mockMagento.getGuestCart('test-cart-123'),
      ).thenAnswer((_) async => cartWithItems);

      // Act
      final result = await cartExamples.getCart('test-cart-123');

      // Assert
      expect(result.items, hasLength(2));
      expect(result.items![0].name, equals('Product 1'));
      expect(result.items![1].name, equals('Product 2'));
      verify(mockMagento.getGuestCart('test-cart-123')).called(1);
    });

    test('Add Item - should handle invalid SKU error', () async {
      // Arrange
      when(
        mockMagento.addToGuestCart(
          cartId: 'test-cart-123',
          sku: 'INVALID-SKU',
          quantity: 1,
        ),
      ).thenThrow(Exception('Product not found'));

      // Act & Assert
      expect(
        () =>
            cartExamples.addToCart(cartId: 'test-cart-123', sku: 'INVALID-SKU'),
        throwsException,
      );
    });

    test('Get Cart - should handle empty cart', () async {
      // Arrange
      final emptyCart = Cart(
        id: 'test-cart-123',
        itemsCount: 0,
        isActive: true,
        items: [],
      );

      when(
        mockMagento.getGuestCart('test-cart-123'),
      ).thenAnswer((_) async => emptyCart);

      // Act
      final result = await cartExamples.getCart('test-cart-123');

      // Assert
      expect(result.items, isEmpty);
      expect(result.itemsCount, equals(0));
    });

    test(
      'Add Multiple Quantities - should add item with correct quantity',
      () async {
        // Arrange
        final cart = Cart(
          id: 'test-cart-123',
          itemsCount: 5,
          isActive: true,
          items: [
            CartItem(
              itemId: 1,
              sku: 'TEST-SKU',
              name: 'Test Product',
              qty: 5,
              price: 99.99,
            ),
          ],
        );

        when(
          mockMagento.addToGuestCart(
            cartId: 'test-cart-123',
            sku: 'TEST-SKU',
            quantity: 5,
          ),
        ).thenAnswer((_) async => cart);

        // Act
        final result = await cartExamples.addToCart(
          cartId: 'test-cart-123',
          sku: 'TEST-SKU',
          quantity: 5,
        );

        // Assert
        expect(result.items!.first.qty, equals(5));
        expect(result.itemsCount, equals(5));
      },
    );
  });

  group('Cart Examples Integration Tests', () {
    test(
      'Real API: Create cart and add item',
      () async {
        // Skip in CI environment
        const skipInCI = bool.fromEnvironment('CI', defaultValue: false);
        if (skipInCI) {
          return;
        }

        final magento = FlutterMagentoCore.instance;
        await magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');

        final cartExamples = CartExamples(magento);

        // Create cart
        final cart = await cartExamples.createGuestCart();
        expect(cart.id, isNotEmpty);

        // Get products to add
        final products = await magento.getProducts(page: 1, pageSize: 1);
        if (products.isNotEmpty) {
          // Add item to cart
          final updatedCart = await cartExamples.addToCart(
            cartId: cart.id!,
            sku: products.first.sku,
          );
          expect(updatedCart.itemsCount, greaterThan(0));
        }
      },
      skip: 'Integration test - requires network',
      tags: ['integration'],
    );

    test(
      'Real API: Get cart totals',
      () async {
        // Skip in CI environment
        const skipInCI = bool.fromEnvironment('CI', defaultValue: false);
        if (skipInCI) {
          return;
        }

        final magento = FlutterMagentoCore.instance;
        await magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');

        final cartExamples = CartExamples(magento);

        // Create cart
        final cart = await cartExamples.createGuestCart();

        // Get totals (even for empty cart)
        final totals = await cartExamples.getCartTotals(cart.id!);
        expect(totals, isNotNull);
        expect(totals.baseCurrencyCode, isNotEmpty);
      },
      skip: 'Integration test - requires network',
      tags: ['integration'],
    );
  });
}
