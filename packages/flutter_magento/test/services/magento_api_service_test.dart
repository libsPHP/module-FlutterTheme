import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/services/magento_api_service.dart';

void main() {
  group('MagentoApiService', () {
    test('should be created successfully', () {
      final apiService = MagentoApiService();
      expect(apiService, isNotNull);
    });
  });
}
