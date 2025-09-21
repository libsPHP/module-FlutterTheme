import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/api/auth_api.dart';
import 'package:flutter_magento/src/api/magento_api_client.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class MockMagentoApiClient extends Mock implements MagentoApiClient {}

void main() {
  group('AuthApi', () {
    test('login returns auth response on success', () async {
      final client = MockMagentoApiClient();
      final authApi = AuthApi(client);

      // Mock the guestRequest method
      when(client.guestRequest<Map<String, dynamic>>(
        '/rest/V1/integration/customer/token',
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: '/'),
            data: {
              'access_token': 'mock_access_token',
              'refresh_token': 'mock_refresh_token',
              'expires_in': 3600,
            },
            statusCode: 200,
          ));

      final result = await authApi.login(
        email: 'test@example.com',
        password: 'password',
      );

      expect(result.accessToken, 'mock_access_token');
      expect(result.refreshToken, 'mock_refresh_token');
    });
  });
}
