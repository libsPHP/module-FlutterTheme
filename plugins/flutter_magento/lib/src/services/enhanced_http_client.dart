import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../exceptions/magento_exception.dart';

/// Улучшенный HTTP клиент для Magento с retry логикой и расширенной обработкой ошибок
class MagentoEnhancedHttpClient {
  final String baseUrl;
  final String? accessToken;
  final Dio _dio;

  MagentoEnhancedHttpClient({
    required this.baseUrl,
    this.accessToken,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    int maxRetries = 3,
    Duration retryDelay = const Duration(seconds: 1),
  }) : _dio = Dio() {
    // Базовая конфигурация
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? const Duration(seconds: 30),
      receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
      headers: _getHeaders,
    );

    // Добавляем интерцептор для retry логики
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        maxRetries: maxRetries,
        retryDelay: retryDelay,
      ),
    );

    // Добавляем интерцептор для логирования
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );
  }

  Map<String, String> get _getHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (accessToken != null) 'Authorization': 'Bearer $accessToken',
  };

  /// GET запрос с обработкой ошибок
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// POST запрос с обработкой ошибок
  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// PUT запрос с обработкой ошибок
  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// DELETE запрос с обработкой ошибок
  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Обработка успешных ответов
  Response _handleResponse(Response response) {
    if (response.statusCode != null && response.statusCode! >= 400) {
      throw MagentoHttpException(
        'HTTP ${response.statusCode}: ${response.statusMessage}',
        response.statusCode,
        response.data,
      );
    }
    return response;
  }

  /// Обработка ошибок
  MagentoException _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return MagentoNetworkException('Connection timeout');
        case DioExceptionType.sendTimeout:
          return MagentoNetworkException('Send timeout');
        case DioExceptionType.receiveTimeout:
          return MagentoNetworkException('Receive timeout');
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final data = error.response?.data;
          return MagentoHttpException(
            'HTTP error: ${error.message}',
            statusCode,
            data,
          );
        case DioExceptionType.cancel:
          return MagentoException('Request was cancelled');
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return MagentoNetworkException('Network error: ${error.error}');
          }
          return MagentoException('Unknown error: ${error.message}');
        default:
          return MagentoException('Request failed: ${error.message}');
      }
    }

    if (error is MagentoException) {
      return error;
    }

    return MagentoException('Unexpected error: $error');
  }

  /// Закрытие клиента
  void dispose() {
    _dio.close();
  }
}

/// Интерцептор для retry логики
class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;
  final List<int> retryStatusCodes;
  final Dio dio;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
    this.retryStatusCodes = const [500, 502, 503, 504],
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final extra = err.requestOptions.extra;
    final retryCount = extra['retry_count'] ?? 0;

    if (retryCount < maxRetries && _shouldRetry(err)) {
      // Увеличиваем счетчик попыток
      err.requestOptions.extra['retry_count'] = retryCount + 1;

      // Ждем перед повторной попыткой
      await Future.delayed(retryDelay * (retryCount + 1));

      try {
        // Повторяем запрос
        final response = await dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );

        handler.resolve(response);
        return;
      } catch (e) {
        // Если повторная попытка не удалась, продолжаем с исходной ошибкой
      }
    }

    handler.next(err);
  }

  bool _shouldRetry(DioException error) {
    // Retry на определенных HTTP кодах
    if (error.response?.statusCode != null) {
      return retryStatusCodes.contains(error.response!.statusCode);
    }

    // Retry на сетевых ошибках
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return true;
    }

    // Retry на SocketException
    if (error.error is SocketException) {
      return true;
    }

    return false;
  }
}

/// Дополнительные исключения HTTP
class MagentoHttpException extends MagentoException {
  final int? statusCode;
  final dynamic responseData;

  const MagentoHttpException(
    String message, [
    this.statusCode,
    this.responseData,
  ]) : super(message);

  @override
  String toString() =>
      'MagentoHttpException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}

class MagentoNetworkException extends MagentoException {
  const MagentoNetworkException(String message) : super(message);

  @override
  String toString() => 'MagentoNetworkException: $message';
}
