import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'marketplace_config.dart';
import 'marketplace_exceptions.dart';

/// Main client for Magento Marketplace API communication
class MagentoMarketplaceClient {
  static MagentoMarketplaceClient? _instance;
  late final Dio _dio;
  late final FlutterMagentoCore _magentoCore;
  late final MarketplaceConfig _config;

  MagentoMarketplaceClient._({
    required MarketplaceConfig config,
    required FlutterMagentoCore magentoCore,
  }) {
    _config = config;
    _magentoCore = magentoCore;
    _dio = _createDio();
  }

  /// Factory constructor to create singleton instance
  factory MagentoMarketplaceClient({
    required MarketplaceConfig config,
    required FlutterMagentoCore magentoCore,
  }) {
    _instance ??= MagentoMarketplaceClient._(
      config: config,
      magentoCore: magentoCore,
    );
    return _instance!;
  }

  /// Get singleton instance
  static MagentoMarketplaceClient get instance {
    if (_instance == null) {
      throw MarketplaceTimeoutException(
        'MagentoMarketplaceClient not initialized. Call create() first.',
      );
    }
    return _instance!;
  }

  /// Create Dio instance with marketplace configuration
  Dio _createDio() {
    final dio = Dio();

    // Base options
    dio.options.baseUrl = _config.baseUrl;
    dio.options.connectTimeout = Duration(seconds: _config.connectTimeout);
    dio.options.receiveTimeout = Duration(seconds: _config.receiveTimeout);
    dio.options.sendTimeout = Duration(seconds: _config.sendTimeout);

    // Headers
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'User-Agent': 'Flutter-Magento-Marketplace/1.0.0',
      if (_config.apiKey != null) 'X-API-Key': _config.apiKey!,
    };

    // Interceptors
    dio.interceptors.addAll([
      _AuthInterceptor(_magentoCore),
      _LoggingInterceptor(_config.enableLogging),
      _ErrorInterceptor(),
    ]);

    return dio;
  }

  /// Get Dio instance for direct API calls
  Dio get dio => _dio;

  /// Get underlying Magento client
  FlutterMagentoCore get magentoCore => _magentoCore;

  /// Get marketplace configuration
  MarketplaceConfig get config => _config;

  /// Make GET request to marketplace API
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        _buildPath(path),
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Make POST request to marketplace API
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        _buildPath(path),
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Make PUT request to marketplace API
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put<T>(
        _buildPath(path),
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Make DELETE request to marketplace API
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete<T>(
        _buildPath(path),
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Build full API path
  String _buildPath(String path) {
    if (path.startsWith('/')) {
      return '${_config.apiPrefix}$path';
    }
    return '${_config.apiPrefix}/$path';
  }

  /// Handle API errors
  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return MarketplaceTimeoutException(
            'Request timeout: ${error.message}',
            error: error,
          );
        case DioExceptionType.badResponse:
          return _handleHttpError(error);
        case DioExceptionType.cancel:
          return MarketplaceCancelledException(
            'Request cancelled',
            error: error,
          );
        case DioExceptionType.connectionError:
          return MarketplaceConnectionException(
            'Connection error: ${error.message}',
            error: error,
          );
        default:
          return MarketplaceTimeoutException(
            'Unknown error: ${error.message}',
            error: error,
          );
      }
    }
    return MarketplaceTimeoutException(
      'Unexpected error: $error',
      error: error,
    );
  }

  /// Handle HTTP response errors
  Exception _handleHttpError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    String message = 'HTTP Error $statusCode';
    if (data is Map<String, dynamic>) {
      message = (data['message'] ?? data['error'] ?? message).toString();
    }

    switch (statusCode) {
      case 400:
        return MarketplaceBadRequestException(message, error: error);
      case 401:
        return MarketplaceUnauthorizedException(message, error: error);
      case 403:
        return MarketplaceForbiddenException(message, error: error);
      case 404:
        return MarketplaceNotFoundException(message, error: error);
      case 422:
        return MarketplaceValidationException(message, error: error);
      case 429:
        return MarketplaceRateLimitException(message, error: error);
      case 500:
        return MarketplaceServerException(message, error: error);
      default:
        return MarketplaceTimeoutException(message, error: error);
    }
  }

  /// Clear singleton instance
  static void clear() {
    _instance = null;
  }
}

/// Authentication interceptor
class _AuthInterceptor extends Interceptor {
  final FlutterMagentoCore _magentoCore;

  _AuthInterceptor(this._magentoCore);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add authentication token if available
    final token = _magentoCore.authService.customerToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

/// Logging interceptor
class _LoggingInterceptor extends Interceptor {
  final bool _enabled;

  _LoggingInterceptor(this._enabled);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_enabled) {
      print('🚀 Marketplace API Request: ${options.method} ${options.uri}');
      if (options.data != null) {
        print('📤 Request Data: ${jsonEncode(options.data)}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (_enabled) {
      print(
        '✅ Marketplace API Response: ${response.statusCode} ${response.requestOptions.uri}',
      );
      if (response.data != null) {
        print('📥 Response Data: ${jsonEncode(response.data)}');
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_enabled) {
      print('❌ Marketplace API Error: ${err.type} ${err.message}');
      if (err.response?.data != null) {
        print('📥 Error Data: ${jsonEncode(err.response!.data)}');
      }
    }
    handler.next(err);
  }
}

/// Error handling interceptor
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Add custom error handling logic here
    handler.next(err);
  }
}
