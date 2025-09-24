import '../models/product.dart' as product_models;
import '../models/product_models.dart' as models;
import '../models/cart.dart';

/// Абстрактный интерфейс для предоставления демо-данных
/// Позволяет каждому приложению кастомизировать демо-контент
abstract class DemoDataProvider {
  /// Получить список демо-продуктов
  List<product_models.Product> getDemoProducts();

  /// Получить список демо-категорий
  List<models.Category> getDemoCategories();

  /// Получить демо-элементы корзины
  List<CartItem> getDemoCartItems();

  /// Получить демо-пользователя
  Map<String, dynamic>? getDemoCustomer();

  /// Получить название провайдера
  String get providerName;

  /// Получить описание провайдера
  String get providerDescription;

  /// Проверить, поддерживает ли провайдер определенный тип данных
  bool supportsDataType(String dataType);
}

/// Стандартный провайдер демо-данных
/// Содержит базовые демо-продукты и категории
class DefaultDemoDataProvider implements DemoDataProvider {
  @override
  String get providerName => 'Default Demo Data';

  @override
  String get providerDescription =>
      'Standard demo products and categories for testing';

  @override
  bool supportsDataType(String dataType) {
    return ['products', 'categories', 'cart', 'customer'].contains(dataType);
  }

  @override
  List<product_models.Product> getDemoProducts() {
    return [
      product_models.Product(
        id: 1,
        name: 'Radiant Tee',
        sku: 'WS12-XS-Orange',
        typeId: 'simple',
        price: 22.00,
        specialPrice: 20.00,
        isInStock: true,
        thumbnail:
            'https://luma-demo.scandipwa.com/media/catalog/product/w/s/ws12-orange_main_2.jpg',
        description:
            'The Radiant Tee features a soft, lightweight fabric with a comfortable fit.',
        categories: ['Women', 'Tops'],
      ),
      product_models.Product(
        id: 2,
        name: 'Argus All-Weather Tank',
        sku: 'WSH12-XS-White',
        typeId: 'simple',
        price: 21.00,
        isInStock: true,
        thumbnail:
            'https://luma-demo.scandipwa.com/media/catalog/product/w/s/wsh12-white_main_2.jpg',
        description:
            'The Argus All-Weather Tank is a versatile piece for any wardrobe.',
        categories: ['Women', 'Tops'],
      ),
      product_models.Product(
        id: 3,
        name: 'Hero Hoodie',
        sku: 'WSH03-XS-Gray',
        typeId: 'simple',
        price: 54.00,
        isInStock: true,
        thumbnail:
            'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh03-gray_main_2.jpg',
        description:
            'The Hero Hoodie is perfect for those cool days and nights.',
        categories: ['Men', 'Tops'],
      ),
      product_models.Product(
        id: 4,
        name: 'Bruno Compete Hoodie',
        sku: 'WSH04-XS-Gray',
        typeId: 'simple',
        price: 62.00,
        isInStock: true,
        thumbnail:
            'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh04-gray_main_2.jpg',
        description: 'The Bruno Compete Hoodie offers comfort and style.',
        categories: ['Men', 'Tops'],
      ),
      product_models.Product(
        id: 5,
        name: 'Fusion Backpack',
        sku: '24-WB01',
        typeId: 'simple',
        price: 59.00,
        isInStock: true,
        thumbnail:
            'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wb01_2.jpg',
        description:
            'The Fusion Backpack is perfect for your daily adventures.',
        categories: ['Gear', 'Bags'],
      ),
    ];
  }

  @override
  List<models.Category> getDemoCategories() {
    return [
      models.Category(
        id: 1,
        name: 'Women',
        level: 1,
        position: 1,
        isActive: true,
        childrenCount: 3,
        children: [
          models.Category(
            id: 11,
            name: 'Tops',
            level: 2,
            position: 1,
            isActive: true,
            childrenCount: 2,
          ),
          models.Category(
            id: 12,
            name: 'Bottoms',
            level: 2,
            position: 2,
            isActive: true,
            childrenCount: 2,
          ),
          models.Category(
            id: 13,
            name: 'Accessories',
            level: 2,
            position: 3,
            isActive: true,
            childrenCount: 0,
          ),
        ],
      ),
      models.Category(
        id: 2,
        name: 'Men',
        level: 1,
        position: 2,
        isActive: true,
        childrenCount: 3,
        children: [
          models.Category(
            id: 21,
            name: 'Tops',
            level: 2,
            position: 1,
            isActive: true,
            childrenCount: 2,
          ),
          models.Category(
            id: 22,
            name: 'Bottoms',
            level: 2,
            position: 2,
            isActive: true,
            childrenCount: 2,
          ),
          models.Category(
            id: 23,
            name: 'Accessories',
            level: 2,
            position: 3,
            isActive: true,
            childrenCount: 0,
          ),
        ],
      ),
      models.Category(
        id: 3,
        name: 'Gear',
        level: 1,
        position: 3,
        isActive: true,
        childrenCount: 2,
        children: [
          models.Category(
            id: 31,
            name: 'Bags',
            level: 2,
            position: 1,
            isActive: true,
            childrenCount: 0,
          ),
          models.Category(
            id: 32,
            name: 'Fitness Equipment',
            level: 2,
            position: 2,
            isActive: true,
            childrenCount: 0,
          ),
        ],
      ),
    ];
  }

  @override
  List<CartItem> getDemoCartItems() {
    return [
      CartItem(
        id: 1,
        sku: 'WS12-XS-Orange',
        name: 'Radiant Tee',
        price: 22.00,
        quantity: 2,
        rowTotal: 44.00,
        image:
            'https://luma-demo.scandipwa.com/media/catalog/product/w/s/ws12-orange_main_2.jpg',
      ),
      CartItem(
        id: 2,
        sku: 'WSH03-XS-Gray',
        name: 'Hero Hoodie',
        price: 54.00,
        quantity: 1,
        rowTotal: 54.00,
        image:
            'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh03-gray_main_2.jpg',
      ),
    ];
  }

  @override
  Map<String, dynamic>? getDemoCustomer() {
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
