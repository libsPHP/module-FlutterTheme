import '../models/product_models.dart';
import '../models/cart_models.dart';

/// Абстрактный интерфейс для предоставления начальных данных
/// Позволяет каждому приложению кастомизировать начальный контент
abstract class DemoDataProvider {
  /// Получить список начальных продуктов
  List<Product> getInitialPreloadProducts();

  /// Получить список начальных категорий
  List<Category> getInitialPreloadCategories();

  /// Получить начальные элементы корзины
  List<CartItem> getInitialPreloadCartItems();

  /// Получить начального пользователя
  Map<String, dynamic>? getInitialPreloadCustomer();

  /// Получить название провайдера
  String get providerName;

  /// Получить описание провайдера
  String get providerDescription;

  /// Проверить, поддерживает ли провайдер определенный тип данных
  bool supportsDataType(String dataType);
}

/// Стандартный провайдер начальных данных
/// Содержит базовые начальные продукты и категории
class DefaultDemoDataProvider implements DemoDataProvider {
  @override
  String get providerName => 'Default Initial Preload Data';

  @override
  String get providerDescription =>
      'Standard initial preload products and categories for testing';

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
      'email': 'demo@example.com',
      'firstname': 'Demo',
      'lastname': 'User',
      'is_active': true,
      'created_at': DateTime.now().toIso8601String(),
    };
  }
}
