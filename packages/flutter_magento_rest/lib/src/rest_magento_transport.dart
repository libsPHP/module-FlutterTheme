import 'package:dio/dio.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

import 'interceptors/magento_auth_interceptor.dart';
import 'interceptors/magento_error_interceptor.dart';
import 'interceptors/magento_store_interceptor.dart';
import 'rest_error_mapper.dart';

/// REST implementation of [MagentoTransport] using Dio.
///
/// Handles Magento's REST API conventions:
/// - Path prefixing: `/rest/{store}/V1/{path}`
/// - Authentication via Bearer token
/// - Store context headers (currency, locale)
/// - Error response parsing
///
/// Example:
/// ```dart
/// final transport = RestMagentoTransport(
///   baseUrl: 'https://magento.example.com',
///   storeContext: MagentoStoreContext.defaults(),
///   authStorage: MemoryMagentoAuthStorage(),
/// );
///
/// final response = await transport.get<Product>(
///   '/products/123',
///   decoder: Product.fromJson,
/// );
/// ```
class RestMagentoTransport implements MagentoTransport {
  /// Base URL of the Magento instance (without /rest/).
  final String baseUrl;

  /// Store context for multi-store setup.
  final MagentoStoreContext storeContext;

  /// Storage for authentication tokens.
  final MagentoAuthStorage authStorage;

  /// Request timeout duration.
  final Duration timeout;

  /// Internal Dio client.
  final Dio _dio;

  /// Creates a REST transport.
  ///
  /// [baseUrl] - Magento base URL (e.g., 'https://magento.example.com')
  /// [storeContext] - Store context for headers and path prefixing
  /// [authStorage] - Storage for customer authentication tokens
  /// [timeout] - Request timeout (default: 30 seconds)
  /// [customInterceptors] - Additional Dio interceptors
  RestMagentoTransport({
    required this.baseUrl,
    required this.storeContext,
    required this.authStorage,
    this.timeout = const Duration(seconds: 30),
    List<Interceptor>? customInterceptors,
    Dio? dio,
  }) : _dio = dio ?? Dio() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = timeout;
    _dio.options.receiveTimeout = timeout;
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers['Accept'] = 'application/json';

    // Add interceptors in order:
    // 1. Custom interceptors (logging, retry, etc.)
    if (customInterceptors != null) {
      _dio.interceptors.addAll(customInterceptors);
    }

    // 2. Auth interceptor (adds Bearer token)
    _dio.interceptors.add(MagentoAuthInterceptor(authStorage));

    // 3. Store interceptor (prefixes path, adds headers)
    _dio.interceptors.add(MagentoStoreInterceptor(storeContext));

    // 4. Error interceptor (maps errors to MagentoException)
    _dio.interceptors.add(MagentoErrorInterceptor());
  }

  @override
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: query,
        options: _buildOptions(options),
      );
      return _handleResponse(response, decoder);
    } on DioException catch (e) {
      throw _extractMagentoException(e);
    }
  }

  @override
  Future<MagentoResponse<T>> post<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        path,
        data: body,
        options: _buildOptions(options),
      );
      return _handleResponse(response, decoder);
    } on DioException catch (e) {
      throw _extractMagentoException(e);
    }
  }

  @override
  Future<MagentoResponse<T>> put<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        path,
        data: body,
        options: _buildOptions(options),
      );
      return _handleResponse(response, decoder);
    } on DioException catch (e) {
      throw _extractMagentoException(e);
    }
  }

  @override
  Future<MagentoResponse<T>> delete<T>(
    String path, {
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    try {
      final response = await _dio.delete<dynamic>(
        path,
        options: _buildOptions(options),
      );
      return _handleResponse(response, decoder);
    } on DioException catch (e) {
      throw _extractMagentoException(e);
    }
  }

  @override
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) {
    throw UnsupportedError(
      'RestMagentoTransport does not support GraphQL. '
      'Use GraphQlMagentoTransport for GraphQL operations.',
    );
  }

  /// Builds Dio request options from [MagentoRequestOptions].
  Options _buildOptions(MagentoRequestOptions? options) {
    return Options(
      headers: options?.headers,
      sendTimeout: options?.timeout,
      receiveTimeout: options?.timeout,
      extra: {
        'skipAuth': options?.skipAuth ?? false,
      },
    );
  }

  /// Converts Dio response to [MagentoResponse].
  MagentoResponse<T> _handleResponse<T>(
    Response<dynamic> response,
    T Function(dynamic json) decoder,
  ) {
    final data = decoder(response.data);
    return MagentoResponse<T>(
      data: data,
      statusCode: response.statusCode ?? 200,
      headers: _convertHeaders(response.headers),
    );
  }

  /// Converts Dio headers to simple map.
  Map<String, String> _convertHeaders(Headers headers) {
    final result = <String, String>{};
    headers.forEach((name, values) {
      if (values.isNotEmpty) {
        result[name] = values.first;
      }
    });
    return result;
  }

  /// Extracts [MagentoException] from [DioException].
  MagentoException _extractMagentoException(DioException e) {
    // Check if error interceptor already wrapped it
    if (e.error is MagentoException) {
      return e.error as MagentoException;
    }
    // Fall back to error mapper
    return RestErrorMapper.map(e);
  }
}
