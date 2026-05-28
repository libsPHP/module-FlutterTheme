import 'package:dio/dio.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_magento_rest/src/interceptors/magento_auth_interceptor.dart';
import 'package:flutter_magento_rest/src/interceptors/magento_store_interceptor.dart';
import 'package:flutter_magento_rest/src/interceptors/magento_error_interceptor.dart';
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

class MockRequestInterceptorHandler implements RequestInterceptorHandler {
  RequestOptions? nextOptions;
  DioException? rejectedError;

  @override
  void next(RequestOptions requestOptions) {
    nextOptions = requestOptions;
  }

  @override
  void reject(DioException error, [bool callFollowingErrorInterceptor = false]) {
    rejectedError = error;
  }

  @override
  void resolve(Response response, [bool callFollowingResponseInterceptor = false]) {}

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class MockErrorInterceptorHandler implements ErrorInterceptorHandler {
  DioException? nextError;
  DioException? rejectedError;
  Response? resolvedResponse;

  @override
  void next(DioException err) {
    nextError = err;
  }

  @override
  void reject(DioException error) {
    rejectedError = error;
  }

  @override
  void resolve(Response response) {
    resolvedResponse = response;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

void main() {
  group('MagentoAuthInterceptor', () {
    late MockAuthStorage authStorage;
    late MagentoAuthInterceptor interceptor;
    late MockRequestInterceptorHandler handler;

    setUp(() {
      authStorage = MockAuthStorage();
      interceptor = MagentoAuthInterceptor(authStorage);
      handler = MockRequestInterceptorHandler();
    });

    test('adds Authorization header when token exists', () async {
      authStorage.setCustomerToken('test-token-123');
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(options, handler);

      // Wait for async operation
      await Future.delayed(Duration.zero);

      expect(handler.nextOptions, isNotNull);
      expect(
        handler.nextOptions!.headers['Authorization'],
        'Bearer test-token-123',
      );
    });

    test('does not add Authorization header when token is null', () async {
      authStorage.setCustomerToken(null);
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(options, handler);

      await Future.delayed(Duration.zero);

      expect(handler.nextOptions, isNotNull);
      expect(handler.nextOptions!.headers['Authorization'], isNull);
    });

    test('does not add Authorization header when token is empty', () async {
      authStorage.setCustomerToken('');
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(options, handler);

      await Future.delayed(Duration.zero);

      expect(handler.nextOptions, isNotNull);
      expect(handler.nextOptions!.headers['Authorization'], isNull);
    });

    test('skips auth when skipAuth extra is true', () async {
      authStorage.setCustomerToken('test-token');
      final options = RequestOptions(
        path: '/test',
        extra: {'skipAuth': true},
      );

      interceptor.onRequest(options, handler);

      await Future.delayed(Duration.zero);

      expect(handler.nextOptions, isNotNull);
      expect(handler.nextOptions!.headers['Authorization'], isNull);
    });
  });

  group('MagentoStoreInterceptor', () {
    late MagentoStoreInterceptor interceptor;
    late MockRequestInterceptorHandler handler;

    setUp(() {
      interceptor = MagentoStoreInterceptor(
        const MagentoStoreContext(
          storeCode: 'us_en',
          currency: 'USD',
          locale: 'en_US',
        ),
      );
      handler = MockRequestInterceptorHandler();
    });

    test('prefixes path with /rest/{store}/V1/', () {
      final options = RequestOptions(path: '/products');

      interceptor.onRequest(options, handler);

      expect(handler.nextOptions, isNotNull);
      expect(handler.nextOptions!.path, '/rest/us_en/V1/products');
    });

    test('does not double-prefix already prefixed paths', () {
      final options = RequestOptions(path: '/rest/default/V1/products');

      interceptor.onRequest(options, handler);

      expect(handler.nextOptions, isNotNull);
      expect(handler.nextOptions!.path, '/rest/default/V1/products');
    });

    test('adds Content-Currency header', () {
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(options, handler);

      expect(handler.nextOptions, isNotNull);
      expect(handler.nextOptions!.headers['Content-Currency'], 'USD');
    });

    test('adds Accept-Language header', () {
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(options, handler);

      expect(handler.nextOptions, isNotNull);
      expect(handler.nextOptions!.headers['Accept-Language'], 'en_US');
    });

    test('uses default store context values', () {
      final defaultInterceptor = MagentoStoreInterceptor(
        const MagentoStoreContext.defaults(),
      );
      final options = RequestOptions(path: '/test');

      defaultInterceptor.onRequest(options, handler);

      expect(handler.nextOptions!.path, '/rest/default/V1/test');
      expect(handler.nextOptions!.headers['Content-Currency'], 'USD');
      expect(handler.nextOptions!.headers['Accept-Language'], 'en_US');
    });
  });

  group('MagentoErrorInterceptor', () {
    late MagentoErrorInterceptor interceptor;
    late MockErrorInterceptorHandler handler;

    setUp(() {
      interceptor = MagentoErrorInterceptor();
      handler = MockErrorInterceptorHandler();
    });

    test('converts DioException to MagentoException', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        response: Response(
          requestOptions: RequestOptions(path: '/test'),
          statusCode: 401,
          data: {'message': 'Unauthorized'},
        ),
        type: DioExceptionType.badResponse,
      );

      interceptor.onError(error, handler);

      expect(handler.rejectedError, isNotNull);
      expect(handler.rejectedError!.error, isA<MagentoAuthException>());
    });

    test('preserves original request options', () {
      final originalOptions = RequestOptions(path: '/original');
      final error = DioException(
        requestOptions: originalOptions,
        response: Response(
          requestOptions: originalOptions,
          statusCode: 500,
        ),
        type: DioExceptionType.badResponse,
      );

      interceptor.onError(error, handler);

      expect(handler.rejectedError, isNotNull);
      expect(handler.rejectedError!.requestOptions.path, '/original');
    });

    test('maps timeout errors correctly', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/test'),
        type: DioExceptionType.connectionTimeout,
      );

      interceptor.onError(error, handler);

      expect(handler.rejectedError, isNotNull);
      expect(handler.rejectedError!.error, isA<MagentoNetworkException>());
      expect(
        (handler.rejectedError!.error as MagentoNetworkException).isTimeout,
        isTrue,
      );
    });
  });
}
