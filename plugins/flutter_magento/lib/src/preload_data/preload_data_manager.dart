import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/services.dart';
import 'preload_data_provider.dart';
import '../models/product_models.dart';
import '../models/cart_models.dart';

/// Менеджер для управления провайдерами данных предзагрузки
/// Позволяет регистрировать и использовать различные источники данных для офлайн-режима
class PreloadDataManager {
  static final Map<String, PreloadDataProvider> _providers = {};
  static PreloadDataProvider? _defaultProvider;
  static String? _currentProviderName;

  /// Регистрация провайдера данных предзагрузки
  static void registerProvider(String name, PreloadDataProvider provider) {
    _providers[name] = provider;

    if (kDebugMode) {
      print('📦 PreloadDataProvider registered: $name');
    }
  }

  /// Установка провайдера по умолчанию
  static void setDefaultProvider(String name) {
    if (_providers.containsKey(name)) {
      _defaultProvider = _providers[name];
      _currentProviderName = name;

      if (kDebugMode) {
        print('📦 Default PreloadDataProvider set to: $name');
      }
    } else {
      throw ArgumentError('Provider with name "$name" not found');
    }
  }

  /// Получение провайдера по имени
  static PreloadDataProvider? getProvider(String name) {
    return _providers[name];
  }

  /// Получение текущего активного провайдера
  static PreloadDataProvider? get currentProvider {
    if (_currentProviderName != null) {
      return _providers[_currentProviderName];
    }
    return _defaultProvider;
  }

  /// Получение списка всех зарегистрированных провайдеров
  static List<String> get registeredProviders => _providers.keys.toList();

  /// Получение данных предзагрузки продуктов из текущего провайдера
  static List<Product> getPreloadProducts() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadProducts();
    }

    if (kDebugMode) {
      print('⚠️ No preload data provider available, returning empty list');
    }
    return [];
  }

  /// Получение данных предзагрузки категорий из текущего провайдера
  static List<Category> getPreloadCategories() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadCategories();
    }

    if (kDebugMode) {
      print('⚠️ No preload data provider available, returning empty list');
    }
    return [];
  }

  /// Получение данных предзагрузки элементов корзины из текущего провайдера
  static List<CartItem> getPreloadCartItems() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadCartItems();
    }

    if (kDebugMode) {
      print('⚠️ No preload data provider available, returning empty list');
    }
    return [];
  }

  /// Получение данных предзагрузки пользователя из текущего провайдера
  static Map<String, dynamic>? getPreloadCustomer() {
    final provider = currentProvider;
    if (provider != null) {
      return provider.getInitialPreloadCustomer();
    }

    if (kDebugMode) {
      print('⚠️ No preload data provider available, returning null');
    }
    return null;
  }

  /// Инициализация менеджера с провайдером по умолчанию
  static void initialize({String? defaultProviderName}) {
    // Регистрируем стандартный провайдер, если он еще не зарегистрирован
    if (!_providers.containsKey('default')) {
      registerProvider('default', DefaultPreloadDataProvider());
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
        '📦 PreloadDataManager initialized with ${_providers.length} providers',
      );
    }
  }

  /// Очистка всех провайдеров
  static void clear() {
    _providers.clear();
    _defaultProvider = null;
    _currentProviderName = null;

    if (kDebugMode) {
      print('📦 PreloadDataManager cleared');
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

/// Провайдер данных предзагрузки из JSON файла
class JsonPreloadDataProvider implements PreloadDataProvider {
  final String jsonData;
  final String _providerName;
  final String _providerDescription;

  JsonPreloadDataProvider({
    required this.jsonData,
    String? providerName,
    String? providerDescription,
  }) : _providerName = providerName ?? 'JSON Preload Data',
       _providerDescription =
           providerDescription ?? 'Preload data loaded from JSON';

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
        print('❌ Error parsing JSON preload customer: $e');
      }
      return null;
    }
  }
}

/// Утилита для загрузки данных предзагрузки из assets
class AssetPreloadDataLoader {
  /// Загрузка данных предзагрузки из assets файла
  static Future<JsonPreloadDataProvider> loadFromAsset(
    String assetPath, {
    String? providerName,
    String? providerDescription,
  }) async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      return JsonPreloadDataProvider(
        jsonData: jsonString,
        providerName: providerName,
        providerDescription: providerDescription,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error loading preload data from asset $assetPath: $e');
      }
      rethrow;
    }
  }
}
