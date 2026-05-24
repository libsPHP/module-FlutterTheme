import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';
import '../services/network_service.dart';
import '../services/offline_service.dart';
import '../services/localization_service.dart';

/// Главный провайдер для управления состоянием Magento
class MagentoProvider extends ChangeNotifier {
  static final MagentoProvider _instance = MagentoProvider._internal();
  factory MagentoProvider() => _instance;
  MagentoProvider._internal();

  // Сервисы
  late final AuthService _authService;
  late final NetworkService _networkService;
  late final OfflineService _offlineService;
  late final LocalizationService _localizationService;

  // Состояние инициализации
  bool _isInitialized = false;
  bool _isInitializing = false;
  String? _error;

  // Геттеры для состояния
  bool get isInitialized => _isInitialized;
  bool get isInitializing => _isInitializing;
  String? get error => _error;

  // Геттеры для сервисов
  AuthService get auth => _authService;
  NetworkService get network => _networkService;
  OfflineService get offline => _offlineService;
  LocalizationService get localization => _localizationService;

  /// Инициализация провайдера
  Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
    String? adminToken,
    List<String>? supportedLanguages,
  }) async {
    if (_isInitialized || _isInitializing) return _isInitialized;

    _isInitializing = true;
    _error = null;
    notifyListeners();

    try {
      // Инициализируем сервисы
      _authService = AuthService();
      _networkService = NetworkService();
      _offlineService = OfflineService();
      _localizationService = LocalizationService();

      // Инициализируем сетевой сервис первым
      await _networkService.initialize(
        baseUrl: baseUrl,
        headers: headers,
        connectionTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        adminToken: adminToken,
      );

      // Инициализируем остальные сервисы
      await Future.wait([
        _authService.initialize(),
        _offlineService.initialize(),
        _localizationService.initialize(supportedLanguages ?? []),
      ]);

      // Настраиваем слушатели изменений
      _setupListeners();

      _isInitialized = true;
      _isInitializing = false;

      if (kDebugMode) {
        print('✅ MagentoProvider инициализирован успешно');
      }

      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isInitializing = false;
      _isInitialized = false;

      if (kDebugMode) {
        print('❌ Ошибка инициализации MagentoProvider: $e');
      }

      notifyListeners();
      return false;
    }
  }

  /// Настройка слушателей изменений от сервисов
  void _setupListeners() {
    _authService.addListener(() {
      notifyListeners();
    });

    _networkService.addListener(() {
      notifyListeners();
    });

    _offlineService.addListener(() {
      notifyListeners();
    });

    _localizationService.addListener(() {
      notifyListeners();
    });
  }

  /// Сброс состояния провайдера
  Future<void> reset() async {
    try {
      await _authService.logout();
      await _offlineService.clearCache();

      _isInitialized = false;
      _isInitializing = false;
      _error = null;

      notifyListeners();

      if (kDebugMode) {
        print('🔄 MagentoProvider сброшен');
      }
    } catch (e) {
      _error = e.toString();
      if (kDebugMode) {
        print('❌ Ошибка сброса MagentoProvider: $e');
      }
      notifyListeners();
    }
  }

  /// Проверка готовности к работе
  bool get isReady => _isInitialized && !_isInitializing && _error == null;

  /// Получение информации о состоянии
  Map<String, dynamic> get status => {
    'isInitialized': _isInitialized,
    'isInitializing': _isInitializing,
    'isReady': isReady,
    'error': _error,
    'authStatus': _authService.status,
    'networkStatus': _networkService.status,
    'offlineStatus': _offlineService.status,
    'localizationStatus': _localizationService.status,
  };

  @override
  void dispose() {
    _authService.removeListener(() {});
    _networkService.removeListener(() {});
    _offlineService.removeListener(() {});
    _localizationService.removeListener(() {});
    super.dispose();
  }
}
