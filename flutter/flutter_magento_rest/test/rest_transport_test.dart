import 'package:dio/dio.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_magento_rest/flutter_magento_rest.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthStorage implements MagentoAuthStorage {
  String? _customerToken;
  String? _guestCartId;

  void setCustomerToken(String? token) => _customerToken = token;

  @override
  Future<String?> getCustomerToken() async => _customerToken;

  @override
  Future<void> saveCustomerToken(String token) async =>
      _customerToken = token;

  @override
  Future<void> clearCustomerToken() async => _customerToken = null;

  @override
  Future<String?> getGuestCartId() async => _guestCartId;

  @override
  Future<void> saveGuestCartId(String cartId) async => _guestCartId = cartId;

  @override
  Future<void> clearGuestCartId() async => _guestCartId = null;

  @override
  Future<void> clearAll() async {
    _customerToken = null;
    _guestCartId = null;
  }

  @override
  Future<bool> hasCustomerToken() async =>
      _customerToken != null && _customerToken!.isNotEmpty;

  @override
  Future<bool> get isAuthenticated => hasCustomerToken();
}

/// Mock Dio adapter for testing
class MockDioAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = [];
  Response Function(RequestOptions)? responseBuilder;
  DioException? errorToThrow;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);

    if (errorToThrow != null) {
      throw errorToThrow!;
    }

    final response = responseBuilder?.call(options) ??
        Response(
          requestOptions: options,
          statusCode: 200,
          data: {},
        );

    return ResponseBody.fromString(
      response.data.toString(),
      response.statusCode ?? 200,
      headers: {
        'content-type': ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  group('RestMagentoTransport', () {
    late RestMagentoTransport transport;
    late MockAuthStorage authStorage;
    late Dio dio;
    late MockDioAdapter mockAdapter;

    setUp(() {
      authStorage = MockAuthStorage();
      dio = Dio();
      mockAdapter = MockDioAdapter();
      dio.httpClientAdapter = mockAdapter;

      transport = RestMagentoTransport(
        baseUrl: 'https://magento.test',
        storeContext: const MagentoStoreContext.defaults(),
        authStorage: authStorage,
        dio: dio,
      );
    });

    group('configuration', () {
      test('sets base URL correctly', () {
        expect(dio.options.baseUrl, 'https://magento.test');
      });

      test('sets default headers', () {
        expect(dio.options.headers['Content-Type'], 'application/json');
        expect(dio.options.headers['Accept'], 'application/json');
      });

      test('applies custom timeout', () {
        final customTransport = RestMagentoTransport(
          baseUrl: 'https://magento.test',
          storeContext: const MagentoStoreContext.defaults(),
          authStorage: authStorage,
          timeout: const Duration(seconds: 60),
        );

        // Transport is created successfully with custom timeout
        expect(customTransport, isNotNull);
      });
    });

    group('graphql()', () {
      test('throws UnsupportedError', () {
        expect(
          () => transport.graphql(
            'query { products { items { sku } } }',
            decoder: (json) => json,
          ),
          throwsA(isA<UnsupportedError>()),
        );
      });
    });

    group('request options', () {
      test('respects skipAuth option', () async {
        authStorage.setCustomerToken('should-not-be-used');

        mockAdapter.responseBuilder = (options) => Response(
              requestOptions: options,
              statusCode: 200,
              data: '{"result": "ok"}',
            );

        try {
          await transport.get(
            '/test',
            options: const MagentoRequestOptions(skipAuth: true),
            decoder: (json) => json,
          );
        } catch (_) {
          // Expected - mock doesn't return proper JSON
        }

        expect(mockAdapter.requests, isNotEmpty);
        final request = mockAdapter.requests.first;
        expect(request.extra['skipAuth'], isTrue);
      });

      test('passes custom headers', () async {
        mockAdapter.responseBuilder = (options) => Response(
              requestOptions: options,
              statusCode: 200,
              data: '{"result": "ok"}',
            );

        try {
          await transport.get(
            '/test',
            options: const MagentoRequestOptions(
              headers: {'X-Custom-Header': 'custom-value'},
            ),
            decoder: (json) => json,
          );
        } catch (_) {}

        expect(mockAdapter.requests, isNotEmpty);
        final request = mockAdapter.requests.first;
        expect(request.headers['X-Custom-Header'], 'custom-value');
      });
    });
  });

  group('RestMagentoTransport instantiation', () {
    test('creates transport with required parameters', () {
      final transport = RestMagentoTransport(
        baseUrl: 'https://magento.example.com',
        storeContext: const MagentoStoreContext.defaults(),
        authStorage: MockAuthStorage(),
      );

      expect(transport, isNotNull);
      expect(transport.baseUrl, 'https://magento.example.com');
    });

    test('creates transport with custom interceptors', () {
      final customInterceptor = InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
      );

      final transport = RestMagentoTransport(
        baseUrl: 'https://magento.example.com',
        storeContext: const MagentoStoreContext.defaults(),
        authStorage: MockAuthStorage(),
        customInterceptors: [customInterceptor],
      );

      expect(transport, isNotNull);
    });

    test('creates transport with custom store context', () {
      const customContext = MagentoStoreContext(
        storeCode: 'de_de',
        currency: 'EUR',
        locale: 'de_DE',
      );

      final transport = RestMagentoTransport(
        baseUrl: 'https://magento.example.com',
        storeContext: customContext,
        authStorage: MockAuthStorage(),
      );

      expect(transport.storeContext.storeCode, 'de_de');
      expect(transport.storeContext.currency, 'EUR');
      expect(transport.storeContext.locale, 'de_DE');
    });
  });
}
