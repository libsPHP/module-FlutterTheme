import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/services/cart_service.dart';
import 'package:flutter_magento/src/services/magento_api_service.dart';
import 'package:mockito/mockito.dart';

class MockMagentoApiService extends Mock implements MagentoApiService {}

void main() {
  group('CartService', () {
    test('should be created successfully', () {
      final mockApiService = MockMagentoApiService();
      final cartService = CartService(mockApiService);
      expect(cartService, isNotNull);
    });
  });
}
