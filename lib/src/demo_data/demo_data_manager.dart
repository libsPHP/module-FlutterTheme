import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/services.dart';
import 'demo_data_provider.dart';
import '../models/product_models.dart';
import '../models/cart_models.dart';

/// Менеджер для управления провайдерами демо-данных
/// Позволяет регистрировать и использовать различные источники демо-данных
class DemoDataManager {
  static final Map<String, DemoDataProvider> _providers = {};
  static DemoDataProvider? _defaultProvider;
  static String? _currentProviderName;

  /// Регистрация провайдера демо-данных
  static void registerProvider(String name, DemoDataProvider provider) {
    _providers[name] = provider;

    if (kDebugMode) {
      print('📦 DemoDataProvider registered: $name');
    }
  }

  /// Установка провайдера по умолчанию
  static void setDefaultProvider(String name) {
    if (_providers.containsKey(name)) {
      _defaultProvider = _providers[name];
      _currentProviderName = name;

      if (kDebugMode) {
        print('📦 Default DemoDataProvider set to: $name');
      }
    } else {
      throw ArgumentError('Provider with name "$name" not found');
    }
  }

  /// Получение провайдера по имени
  static DemoDataProvider? getProvider(String name) {
    return _providers[name];
  }

  /// Получение текущего активного провайдера
  static DemoDataProvider? get currentProvider {
    if (_currentProviderName != null) {
      return _providers[_currentProviderName];
    }
    return _defaultProvider;
  }

  /// Получение списка всех зарегистрированных провайдеров
  static List<String> get registeredProviders => _providers.keys.toList();

  /// Получение демо-продуктов из текущего провайдера
  static List<product_models.Product> getDemoProducts() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadProducts();
    }

    if (kDebugMode) {
      print('⚠️ No demo data provider available, returning empty list');
    }
    return [];
  }

  /// Получение демо-категорий из текущего провайдера
  static List<models.Category> getDemoCategories() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadCategories();
    }

    if (kDebugMode) {
      print('⚠️ No demo data provider available, returning empty list');
    }
    return [];
  }

  /// Получение демо-элементов корзины из текущего провайдера
  static List<CartItem> getDemoCartItems() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadCartItems();
    }

    if (kDebugMode) {
      print('⚠️ No demo data provider available, returning empty list');
    }
    return [];
  }

  /// Получение демо-пользователя из текущего провайдера
  static Map<String, dynamic>? getDemoCustomer() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadCustomer();
    }

    if (kDebugMode) {
      print('⚠️ No demo data provider available, returning null');
    }
    return null;
  }

  /// Инициализация менеджера с провайдером по умолчанию
  static void initialize({String? defaultProviderName}) {
    // Регистрируем стандартный провайдер, если он еще не зарегистрирован
    if (!_providers.containsKey('default')) {
      registerProvider('default', DefaultDemoDataProvider());
    }

    // Устанавливаем провайдер по умолчанию
    if (defaultProviderName != null &&
        _providers.containsKey(defaultProviderName)) {
      setDefaultProvider(defaultProviderName);
    } else {
      setDefaultProvider('default');
    }

    if (kDebugMode) {
      print(
        '📦 DemoDataManager initialized with ${_providers.length} providers',
      );
    }
  }

  /// Очистка всех провайдеров
  static void clear() {
    _providers.clear();
    _defaultProvider = null;
    _currentProviderName = null;

    if (kDebugMode) {
      print('📦 DemoDataManager cleared');
    }
  }

  /// Получение информации о текущем провайдере
  static Map<String, dynamic> getCurrentProviderInfo() {
    final provider = currentProvider;
    if (provider != null) {
      return {
        'name': _currentProviderName ?? 'unknown',
        'providerName': provider.providerName,
        'description': provider.providerDescription,
        'supportsProducts': provider.supportsDataType('products'),
        'supportsCategories': provider.supportsDataType('categories'),
        'supportsCart': provider.supportsDataType('cart'),
        'supportsCustomer': provider.supportsDataType('customer'),
      };
    }
    return {};
  }

  /// Получение статистики по всем провайдерам
  static Map<String, dynamic> getStatistics() {
    return {
      'totalProviders': _providers.length,
      'registeredProviders': _providers.keys.toList(),
      'currentProvider': _currentProviderName,
      'hasDefaultProvider': _defaultProvider != null,
    };
  }
}

/// Провайдер демо-данных из JSON файла
class JsonDemoDataProvider implements DemoDataProvider {
  final String jsonData;
  final String _providerName;
  final String _providerDescription;

  JsonDemoDataProvider({
    required this.jsonData,
    String? providerName,
    String? providerDescription,
  }) : _providerName = providerName ?? 'JSON Demo Data',
       _providerDescription =
           providerDescription ?? 'Demo data loaded from JSON';

  @override
  String get providerName => _providerName;

  @override
  String get providerDescription => _providerDescription;

  @override
  bool supportsDataType(String dataType) {
    return ['products', 'categories', 'cart', 'customer'].contains(dataType);
  }

  @override
  List<Product> getInitialPreloadProducts() {
    return [];
  }

  @override
  List<Category> getInitialPreloadCategories() {
    return [];
  }

  @override
  List<CartItem> getInitialPreloadCartItems() {
    return [];
  }

  @override
  Map<String, dynamic>? getInitialPreloadCustomer() {
    try {
      final data = jsonDecode(jsonData) as Map<String, dynamic>;
      return data['customer'] as Map<String, dynamic>?;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error parsing JSON demo customer: $e');
      }
      return null;
    }
  }
}

/// Утилита для загрузки демо-данных из assets
class AssetDemoDataLoader {
  /// Загрузка демо-данных из assets файла
  static Future<JsonDemoDataProvider> loadFromAsset(
    String assetPath, {
    String? providerName,
    String? providerDescription,
  }) async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      return JsonDemoDataProvider(
        jsonData: jsonString,
        providerName: providerName,
        providerDescription: providerDescription,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error loading demo data from asset $assetPath: $e');
      }
      rethrow;
    }
  }
}
