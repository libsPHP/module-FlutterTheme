import 'dart:async';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import '../exceptions/magento_exception.dart';

/// Унифицированный сетевой сервис для всех HTTP операций
class NetworkService extends ChangeNotifier {
  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;
  NetworkService._internal();

  // HTTP клиенты
  late Dio _dio;
  late http.Client _httpClient;
  late Connectivity _connectivity;

  // Состояние сети
  bool _isOnline = false;
  bool _isInitialized = false;
  String? _baseUrl;
  Map<String, String> _defaultHeaders = {};
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  // Конфигурация
  int _connectionTimeout = 30000;
  int _receiveTimeout = 30000;
  int _maxRetries = 3;

  // Геттеры
  bool get isOnline => _isOnline;
  bool get isInitialized => _isInitialized;
  String? get baseUrl => _baseUrl;
  Dio get dio => _dio;
  http.Client get httpClient => _httpClient;

  /// Stream of connectivity changes
  Stream<List<ConnectivityResult>> get connectionStream =>
      _connectivity.onConnectivityChanged;

  /// Инициализация сетевого сервиса
  Future<void> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
    String? adminToken,
    int? maxRetries,
  }) async {
    if (_isInitialized) return;

    _baseUrl = baseUrl;
    _defaultHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?headers,
    };

    if (adminToken != null) {
      _defaultHeaders['Authorization'] = 'Bearer $adminToken';
    }

    _connectionTimeout = connectionTimeout ?? _connectionTimeout;
    _receiveTimeout = receiveTimeout ?? _receiveTimeout;
    _maxRetries = maxRetries ?? _maxRetries;

    // Инициализация Dio
    _initializeDio();

    // Инициализация HTTP клиента
    _httpClient = http.Client();

    // Инициализация мониторинга подключения
    _connectivity = Connectivity();
    await _checkConnectivity();
    _setupConnectivityListener();

    _isInitialized = true;
    notifyListeners();

    if (kDebugMode) {
      print('✅ NetworkService инициализирован: $_baseUrl');
    }
  }

  /// Инициализация Dio с настройками
  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl!,
        connectTimeout: Duration(milliseconds: _connectionTimeout),
        receiveTimeout: Duration(milliseconds: _receiveTimeout),
        headers: _defaultHeaders,
      ),
    );

    // Добавляем интерцепторы
    _dio.interceptors.add(_createRetryInterceptor());
    _dio.interceptors.add(_createLoggingInterceptor());
    _dio.interceptors.add(_createErrorInterceptor());
  }

  /// Создание интерцептора для повторных попыток
  Interceptor _createRetryInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout) {
          final extra = error.requestOptions.extra;
          final retryCount = extra['retry_count'] ?? 0;

          if (retryCount < _maxRetries) {
            extra['retry_count'] = retryCount + 1;

            // Экспоненциальная задержка
            final delay = Duration(seconds: (retryCount + 1) * 2);
            await Future.delayed(delay);

            try {
              final response = await _dio.request(
                error.requestOptions.path,
                options: Options(
                  method: error.requestOptions.method,
                  headers: error.requestOptions.headers,
                  extra: extra,
                ),
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters,
              );
              handler.resolve(response);
              return;
            } catch (e) {
              // Если повторная попытка не удалась, продолжаем с исходной ошибкой
            }
          }
        }
        handler.next(error);
      },
    );
  }

  /// Создание интерцептора для логирования
  Interceptor _createLoggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          print('🌐 ${options.method} ${options.uri}');
          if (options.data != null) {
            print('📤 Request data: ${options.data}');
          }
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        if (kDebugMode) {
          print('✅ ${response.statusCode} ${response.requestOptions.uri}');
        }
        handler.next(response);
      },
      onError: (error, handler) {
        if (kDebugMode) {
          print('❌ ${error.response?.statusCode} ${error.requestOptions.uri}');
          print('Error: ${error.message}');
        }
        handler.next(error);
      },
    );
  }

  /// Создание интерцептора для обработки ошибок
  Interceptor _createErrorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) {
        final magentoException = _convertDioErrorToMagentoException(error);
        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            error: magentoException,
            type: error.type,
            response: error.response,
          ),
        );
      },
    );
  }

  /// Проверка подключения к интернету
  Future<void> _checkConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    _isOnline = !connectivityResult.contains(ConnectivityResult.none);
    notifyListeners();
  }

  /// Настройка слушателя изменений подключения
  void _setupConnectivityListener() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final wasOnline = _isOnline;
      _isOnline =
          results.isNotEmpty &&
          !results.every((result) => result == ConnectivityResult.none);

      if (wasOnline != _isOnline) {
        notifyListeners();
        if (kDebugMode) {
          print(
            _isOnline
                ? '🌐 Подключение восстановлено'
                : '📵 Подключение потеряно',
          );
        }
      }
    });
  }

  /// GET запрос через Dio
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _checkInitialization();
    return await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// POST запрос через Dio
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _checkInitialization();
    return await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// PUT запрос через Dio
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _checkInitialization();
    return await _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// DELETE запрос через Dio
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _checkInitialization();
    return await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// HTTP GET запрос
  Future<http.Response> httpGet(
    String path, {
    Map<String, String>? headers,
  }) async {
    _checkInitialization();
    final uri = Uri.parse('$_baseUrl$path');
    final mergedHeaders = {..._defaultHeaders, ...?headers};
    return await _httpClient.get(uri, headers: mergedHeaders);
  }

  /// HTTP POST запрос
  Future<http.Response> httpPost(
    String path, {
    Map<String, String>? headers,
    Object? body,
  }) async {
    _checkInitialization();
    final uri = Uri.parse('$_baseUrl$path');
    final mergedHeaders = {..._defaultHeaders, ...?headers};
    return await _httpClient.post(uri, headers: mergedHeaders, body: body);
  }

  /// Обновление заголовков
  void updateHeaders(Map<String, String> headers) {
    _defaultHeaders.addAll(headers);
    _dio.options.headers.addAll(headers);
    notifyListeners();
  }

  /// Удаление заголовка
  void removeHeader(String key) {
    _defaultHeaders.remove(key);
    _dio.options.headers.remove(key);
    notifyListeners();
  }

  /// Установка токена авторизации
  void setAuthToken(String token) {
    updateHeaders({'Authorization': 'Bearer $token'});
  }

  /// Удаление токена авторизации
  void clearAuthToken() {
    removeHeader('Authorization');
  }

  /// Проверка доступности сервера
  Future<bool> ping() async {
    try {
      final response = await get('/health');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Получение статуса сети
  Map<String, dynamic> get status => {
    'isOnline': _isOnline,
    'isInitialized': _isInitialized,
    'baseUrl': _baseUrl,
    'connectionTimeout': _connectionTimeout,
    'receiveTimeout': _receiveTimeout,
    'maxRetries': _maxRetries,
  };

  /// Преобразование DioException в MagentoException
  MagentoException _convertDioErrorToMagentoException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return const MagentoException('Connection timeout', code: 'TIMEOUT');
      case DioExceptionType.sendTimeout:
        return const MagentoException('Send timeout', code: 'SEND_TIMEOUT');
      case DioExceptionType.receiveTimeout:
        return const MagentoException('Receive timeout', code: 'RECEIVE_TIMEOUT');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        final message =
            error.response?.data?['message'] ?? 'Server error: $statusCode';
        return MagentoException(message, code: 'HTTP_$statusCode');
      case DioExceptionType.cancel:
        return const MagentoException('Request cancelled', code: 'CANCELLED');
      case DioExceptionType.connectionError:
        return const MagentoException('Connection error', code: 'CONNECTION_ERROR');
      default:
        return MagentoException(
          error.message ?? 'Unknown network error',
          code: 'UNKNOWN_ERROR',
        );
    }
  }

  /// Проверка инициализации
  void _checkInitialization() {
    if (!_isInitialized) {
      throw const MagentoException(
        'NetworkService not initialized',
        code: 'NOT_INITIALIZED',
      );
    }
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    _httpClient.close();
    _dio.close();
    super.dispose();
  }
}
