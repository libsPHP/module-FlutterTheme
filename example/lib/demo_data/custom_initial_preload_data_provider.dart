import 'package:flutter_magento/flutter_magento.dart';
import 'package:flutter_magento/src/models/product.dart' as product_models;
import 'package:flutter_magento/src/models/product_models.dart' as models;
import 'package:flutter_magento/src/models/cart.dart' as cart_models;

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
  List<product_models.Product> getInitialPreloadProducts() {
    return [
      product_models.Product(
        id: 1,
        name: 'iPhone 15 Pro',
        sku: 'IPHONE-15-PRO',
        typeId: 'simple',
        price: 999.99,
        specialPrice: 949.99,
        description:
            'The latest iPhone with advanced camera system and A17 Pro chip.',
        isInStock: true,
        stockQuantity: 50,
        categories: ['Smartphones', 'Apple'],
      ),
      product_models.Product(
        id: 2,
        name: 'Samsung Galaxy S24 Ultra',
        sku: 'SAMSUNG-S24-ULTRA',
        typeId: 'simple',
        price: 1199.99,
        description:
            'Premium Android smartphone with S Pen and advanced camera system.',
        isInStock: true,
        stockQuantity: 30,
        categories: ['Smartphones', 'Samsung'],
      ),
      product_models.Product(
        id: 3,
        name: 'MacBook Pro 16"',
        sku: 'MACBOOK-PRO-16',
        typeId: 'simple',
        price: 2499.99,
        description:
            'Professional laptop with M3 Pro chip and Liquid Retina XDR display.',
        isInStock: true,
        stockQuantity: 20,
        categories: ['Laptops', 'Apple'],
      ),
      product_models.Product(
        id: 4,
        name: 'Dell XPS 15',
        sku: 'DELL-XPS-15',
        typeId: 'simple',
        price: 1899.99,
        description:
            'High-performance laptop with 4K OLED display and Intel i7 processor.',
        isInStock: true,
        stockQuantity: 25,
        categories: ['Laptops', 'Dell'],
      ),
      product_models.Product(
        id: 5,
        name: 'AirPods Pro 2',
        sku: 'AIRPODS-PRO-2',
        typeId: 'simple',
        price: 249.99,
        description:
            'Wireless earbuds with active noise cancellation and spatial audio.',
        isInStock: true,
        stockQuantity: 100,
        categories: ['Accessories', 'Apple'],
      ),
      product_models.Product(
        id: 6,
        name: 'Sony WH-1000XM5',
        sku: 'SONY-WH-1000XM5',
        typeId: 'simple',
        price: 399.99,
        description:
            'Premium noise-canceling headphones with 30-hour battery life.',
        isInStock: true,
        stockQuantity: 40,
        categories: ['Accessories', 'Sony'],
      ),
    ];
  }

  @override
  List<models.Category> getInitialPreloadCategories() {
    return [
      models.Category(
        id: 1,
        name: 'Smartphones',
        isActive: true,
        position: 1,
        level: 1,
        childrenCount: 0,
        description: 'Latest smartphones from top brands',
      ),
      models.Category(
        id: 2,
        name: 'Laptops',
        isActive: true,
        position: 2,
        level: 1,
        childrenCount: 0,
        description: 'Professional and gaming laptops',
      ),
      models.Category(
        id: 3,
        name: 'Accessories',
        isActive: true,
        position: 3,
        level: 1,
        childrenCount: 0,
        description: 'Phone and laptop accessories',
      ),
      models.Category(
        id: 4,
        name: 'Apple',
        isActive: true,
        position: 1,
        level: 2,
        childrenCount: 0,
        description: 'Apple products and accessories',
      ),
      models.Category(
        id: 5,
        name: 'Samsung',
        isActive: true,
        position: 2,
        level: 2,
        childrenCount: 0,
        description: 'Samsung products and accessories',
      ),
      models.Category(
        id: 6,
        name: 'Dell',
        isActive: true,
        position: 3,
        level: 2,
        childrenCount: 0,
        description: 'Dell laptops and accessories',
      ),
      models.Category(
        id: 7,
        name: 'Sony',
        isActive: true,
        position: 4,
        level: 2,
        childrenCount: 0,
        description: 'Sony audio products',
      ),
    ];
  }

  @override
  List<cart_models.CartItem> getInitialPreloadCartItems() {
    return [
      cart_models.CartItem(
        id: 1,
        sku: 'IPHONE-15-PRO',
        name: 'iPhone 15 Pro',
        price: 999.99,
        quantity: 1,
        rowTotal: 999.99,
      ),
      cart_models.CartItem(
        id: 2,
        sku: 'AIRPODS-PRO-2',
        name: 'AirPods Pro 2',
        price: 249.99,
        quantity: 2,
        rowTotal: 499.98,
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
