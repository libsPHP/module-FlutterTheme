import '../models/product_models.dart';
import '../models/cart_models.dart';

/// Абстрактный интерфейс для предоставления начальных данных для предзагрузки
/// Позволяет каждому приложению кастомизировать начальный контент для офлайн-режима
abstract class PreloadDataProvider {
  /// Получить список начальных продуктов для предзагрузки
  List<Product> getInitialPreloadProducts();

  /// Получить список начальных категорий для предзагрузки
  List<Category> getInitialPreloadCategories();

  /// Получить начальные элементы корзины для предзагрузки
  List<CartItem> getInitialPreloadCartItems();

  /// Получить начального пользователя для предзагрузки
  Map<String, dynamic>? getInitialPreloadCustomer();

  /// Получить название провайдера
  String get providerName;

  /// Получить описание провайдера
  String get providerDescription;

  /// Проверить, поддерживает ли провайдер определенный тип данных
  bool supportsDataType(String dataType);
}

/// Стандартный провайдер начальных данных для предзагрузки
/// Содержит базовые начальные продукты и категории для офлайн-режима
class DefaultPreloadDataProvider implements PreloadDataProvider {
  @override
  String get providerName => 'Default Initial Preload Data';

  @override
  String get providerDescription =>
      'Standard initial preload products and categories for offline mode';

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
    return {
      'id': '1',
      'email': 'preload@example.com',
      'firstname': 'Preload',
      'lastname': 'User',
      'is_active': true,
      'created_at': DateTime.now().toIso8601String(),
    };
  }
}
