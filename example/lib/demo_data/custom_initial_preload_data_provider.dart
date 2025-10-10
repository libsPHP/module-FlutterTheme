import 'package:flutter_magento/flutter_magento.dart';

/// Пример кастомного провайдера начальных данных для электроники
class ElectronicsInitialPreloadDataProvider implements DemoDataProvider {
  @override
  String get providerName => 'Electronics Initial Preload Data';

  @override
  String get providerDescription =>
      'Initial preload data for electronics store with smartphones, laptops, and accessories';

  @override
  bool supportsDataType(String dataType) {
    return ['products', 'categories', 'cart', 'customer'].contains(dataType);
  }

  @override
  List<Product> getInitialPreloadProducts() {
    return [
      Product(
        id: 1,
        name: 'iPhone 15 Pro',
        sku: 'IPHONE-15-PRO',
        typeId: 'simple',
        price: 999.99,
        specialPrice: 949.99,
        status: 1,
        visibility: 4,
        stockStatus: 1,
        description:
            'The latest iPhone with advanced camera system and A17 Pro chip.',
        categories: ['Smartphones', 'Apple'],
      ),
      Product(
        id: 2,
        name: 'Samsung Galaxy S24 Ultra',
        sku: 'SAMSUNG-S24-ULTRA',
        typeId: 'simple',
        price: 1199.99,
        status: 1,
        visibility: 4,
        stockStatus: 1,
        description:
            'Premium Android smartphone with S Pen and advanced camera system.',
        categories: ['Smartphones', 'Samsung'],
      ),
      Product(
        id: 3,
        name: 'MacBook Pro 16"',
        sku: 'MACBOOK-PRO-16',
        typeId: 'simple',
        price: 2499.99,
        status: 1,
        visibility: 4,
        stockStatus: 1,
        description:
            'Professional laptop with M3 Pro chip and Liquid Retina XDR display.',
        categories: ['Laptops', 'Apple'],
      ),
      Product(
        id: 4,
        name: 'Dell XPS 15',
        sku: 'DELL-XPS-15',
        typeId: 'simple',
        price: 1899.99,
        status: 1,
        visibility: 4,
        stockStatus: 1,
        description:
            'High-performance laptop with 4K OLED display and Intel i7 processor.',
        categories: ['Laptops', 'Dell'],
      ),
      Product(
        id: 5,
        name: 'AirPods Pro 2',
        sku: 'AIRPODS-PRO-2',
        typeId: 'simple',
        price: 249.99,
        status: 1,
        visibility: 4,
        stockStatus: 1,
        description:
            'Wireless earbuds with active noise cancellation and spatial audio.',
        categories: ['Accessories', 'Apple'],
      ),
      Product(
        id: 6,
        name: 'Sony WH-1000XM5',
        sku: 'SONY-WH-1000XM5',
        typeId: 'simple',
        price: 399.99,
        status: 1,
        visibility: 4,
        stockStatus: 1,
        description:
            'Premium noise-canceling headphones with 30-hour battery life.',
        categories: ['Accessories', 'Sony'],
      ),
    ];
  }

  @override
  List<Category> getInitialPreloadCategories() {
    return [
      Category(
        id: 1,
        name: 'Smartphones',
        isActive: true,
        position: 1,
        level: 1,
        childrenCount: 0,
      ),
      Category(
        id: 2,
        name: 'Laptops',
        isActive: true,
        position: 2,
        level: 1,
        childrenCount: 0,
      ),
      Category(
        id: 3,
        name: 'Accessories',
        isActive: true,
        position: 3,
        level: 1,
        childrenCount: 0,
      ),
      Category(
        id: 4,
        name: 'Apple',
        isActive: true,
        position: 1,
        level: 2,
        childrenCount: 0,
      ),
      Category(
        id: 5,
        name: 'Samsung',
        isActive: true,
        position: 2,
        level: 2,
        childrenCount: 0,
      ),
      Category(
        id: 6,
        name: 'Dell',
        isActive: true,
        position: 3,
        level: 2,
        childrenCount: 0,
      ),
      Category(
        id: 7,
        name: 'Sony',
        isActive: true,
        position: 4,
        level: 2,
        childrenCount: 0,
      ),
    ];
  }

  @override
  List<CartItem> getInitialPreloadCartItems() {
    return [
      CartItem(
        sku: 'IPHONE-15-PRO',
        name: 'iPhone 15 Pro',
        price: 999.99,
        qty: 1,
      ),
      CartItem(
        sku: 'AIRPODS-PRO-2',
        name: 'AirPods Pro 2',
        price: 249.99,
        qty: 2,
      ),
    ];
  }

  @override
  Map<String, dynamic>? getInitialPreloadCustomer() {
    return {
      'id': 1,
      'email': 'demo@example.com',
      'firstname': 'Demo',
      'lastname': 'User',
      'is_subscribed': true,
    };
  }
}
