import 'package:test/test.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

void main() {
  group('MemoryMagentoAuthStorage', () {
    late MemoryMagentoAuthStorage storage;

    setUp(() {
      storage = MemoryMagentoAuthStorage();
    });

    group('customer token', () {
      test('initially returns null', () async {
        final token = await storage.getCustomerToken();
        expect(token, isNull);
      });

      test('saves and retrieves token', () async {
        await storage.saveCustomerToken('test-token-123');
        final token = await storage.getCustomerToken();
        expect(token, 'test-token-123');
      });

      test('clears token', () async {
        await storage.saveCustomerToken('test-token');
        await storage.clearCustomerToken();
        final token = await storage.getCustomerToken();
        expect(token, isNull);
      });

      test('hasCustomerToken returns false when empty', () async {
        final hasToken = await storage.hasCustomerToken();
        expect(hasToken, false);
      });

      test('hasCustomerToken returns true when set', () async {
        await storage.saveCustomerToken('token');
        final hasToken = await storage.hasCustomerToken();
        expect(hasToken, true);
      });

      test('hasCustomerToken returns false for empty string', () async {
        await storage.saveCustomerToken('');
        final hasToken = await storage.hasCustomerToken();
        expect(hasToken, false);
      });
    });

    group('guest cart ID', () {
      test('initially returns null', () async {
        final cartId = await storage.getGuestCartId();
        expect(cartId, isNull);
      });

      test('saves and retrieves cart ID', () async {
        await storage.saveGuestCartId('cart-abc-123');
        final cartId = await storage.getGuestCartId();
        expect(cartId, 'cart-abc-123');
      });

      test('clears cart ID', () async {
        await storage.saveGuestCartId('cart-123');
        await storage.clearGuestCartId();
        final cartId = await storage.getGuestCartId();
        expect(cartId, isNull);
      });
    });

    group('clearAll', () {
      test('clears both token and cart ID', () async {
        await storage.saveCustomerToken('token');
        await storage.saveGuestCartId('cart-id');

        await storage.clearAll();

        expect(await storage.getCustomerToken(), isNull);
        expect(await storage.getGuestCartId(), isNull);
      });
    });

    group('isAuthenticated', () {
      test('returns false when no token', () async {
        final isAuth = await storage.isAuthenticated;
        expect(isAuth, false);
      });

      test('returns true when token exists', () async {
        await storage.saveCustomerToken('valid-token');
        final isAuth = await storage.isAuthenticated;
        expect(isAuth, true);
      });

      test('returns false after clearing token', () async {
        await storage.saveCustomerToken('token');
        await storage.clearCustomerToken();
        final isAuth = await storage.isAuthenticated;
        expect(isAuth, false);
      });
    });
  });
}
