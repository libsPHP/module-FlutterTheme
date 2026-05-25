import 'package:test/test.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

void main() {
  group('Money', () {
    test('creates with value and currency', () {
      const money = Money(value: 99.99, currency: 'USD');

      expect(money.value, 99.99);
      expect(money.currency, 'USD');
    });

    test('creates zero value', () {
      const money = Money.zero('EUR');

      expect(money.value, 0);
      expect(money.currency, 'EUR');
      expect(money.isZero, true);
    });

    test('fromJson parses correctly', () {
      final money = Money.fromJson({'value': 50.0, 'currency': 'GBP'});

      expect(money.value, 50.0);
      expect(money.currency, 'GBP');
    });

    test('toJson returns correct map', () {
      const money = Money(value: 123.45, currency: 'USD');
      final json = money.toJson();

      expect(json['value'], 123.45);
      expect(json['currency'], 'USD');
    });

    test('isZero returns true for zero value', () {
      const zero = Money(value: 0, currency: 'USD');
      const nonZero = Money(value: 1, currency: 'USD');

      expect(zero.isZero, true);
      expect(nonZero.isZero, false);
    });

    test('isPositive returns true for positive value', () {
      const positive = Money(value: 10, currency: 'USD');
      const zero = Money(value: 0, currency: 'USD');
      const negative = Money(value: -5, currency: 'USD');

      expect(positive.isPositive, true);
      expect(zero.isPositive, false);
      expect(negative.isPositive, false);
    });

    test('isNegative returns true for negative value', () {
      const negative = Money(value: -10, currency: 'USD');
      const zero = Money(value: 0, currency: 'USD');
      const positive = Money(value: 5, currency: 'USD');

      expect(negative.isNegative, true);
      expect(zero.isNegative, false);
      expect(positive.isNegative, false);
    });

    test('addition works with same currency', () {
      const a = Money(value: 10, currency: 'USD');
      const b = Money(value: 20, currency: 'USD');

      final result = a + b;

      expect(result.value, 30);
      expect(result.currency, 'USD');
    });

    test('subtraction works with same currency', () {
      const a = Money(value: 30, currency: 'USD');
      const b = Money(value: 10, currency: 'USD');

      final result = a - b;

      expect(result.value, 20);
      expect(result.currency, 'USD');
    });

    test('multiplication works', () {
      const money = Money(value: 10, currency: 'USD');

      final result = money * 3;

      expect(result.value, 30);
      expect(result.currency, 'USD');
    });

    test('equality works correctly', () {
      const a = Money(value: 10, currency: 'USD');
      const b = Money(value: 10, currency: 'USD');
      const c = Money(value: 10, currency: 'EUR');
      const d = Money(value: 20, currency: 'USD');

      expect(a == b, true);
      expect(a == c, false);
      expect(a == d, false);
    });

    test('hashCode is consistent with equality', () {
      const a = Money(value: 10, currency: 'USD');
      const b = Money(value: 10, currency: 'USD');

      expect(a.hashCode, b.hashCode);
    });

    test('toString returns readable format', () {
      const money = Money(value: 99.99, currency: 'USD');

      expect(money.toString(), 'Money(99.99 USD)');
    });
  });
}
