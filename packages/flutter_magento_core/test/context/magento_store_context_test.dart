import 'package:test/test.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

void main() {
  group('MagentoStoreContext', () {
    test('creates with required fields', () {
      const context = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );

      expect(context.storeCode, 'default');
      expect(context.currency, 'USD');
      expect(context.locale, 'en_US');
      expect(context.websiteCode, isNull);
      expect(context.customerGroupId, isNull);
    });

    test('creates with all fields', () {
      const context = MagentoStoreContext(
        storeCode: 'german',
        websiteCode: 'eu',
        currency: 'EUR',
        locale: 'de_DE',
        customerGroupId: '2',
      );

      expect(context.storeCode, 'german');
      expect(context.websiteCode, 'eu');
      expect(context.currency, 'EUR');
      expect(context.locale, 'de_DE');
      expect(context.customerGroupId, '2');
    });

    test('defaults() creates default context', () {
      const context = MagentoStoreContext.defaults();

      expect(context.storeCode, 'default');
      expect(context.currency, 'USD');
      expect(context.locale, 'en_US');
      expect(context.websiteCode, isNull);
      expect(context.customerGroupId, isNull);
    });

    test('copyWith creates modified copy', () {
      const original = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );

      final modified = original.copyWith(
        storeCode: 'german',
        currency: 'EUR',
      );

      expect(modified.storeCode, 'german');
      expect(modified.currency, 'EUR');
      expect(modified.locale, 'en_US'); // unchanged
    });

    test('languageCode extracts from locale', () {
      const context = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );

      expect(context.languageCode, 'en');
    });

    test('countryCode extracts from locale', () {
      const context = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );

      expect(context.countryCode, 'US');
    });

    test('countryCode returns null for locale without country', () {
      const context = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en',
      );

      expect(context.countryCode, isNull);
    });

    test('equality works correctly', () {
      const a = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );
      const b = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );
      const c = MagentoStoreContext(
        storeCode: 'other',
        currency: 'USD',
        locale: 'en_US',
      );

      expect(a == b, true);
      expect(a == c, false);
    });

    test('hashCode is consistent with equality', () {
      const a = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );
      const b = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );

      expect(a.hashCode, b.hashCode);
    });

    test('toString returns readable format', () {
      const context = MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      );

      expect(
        context.toString(),
        'MagentoStoreContext(store: default, currency: USD, locale: en_US)',
      );
    });
  });
}
