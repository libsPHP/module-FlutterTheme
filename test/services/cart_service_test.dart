import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/services/cart_service.dart';

void main() {
  group('CartService', () {
    test('should be created successfully', () {
      final cartService = CartService(null);
      expect(cartService, isNotNull);
    });
  });
}
