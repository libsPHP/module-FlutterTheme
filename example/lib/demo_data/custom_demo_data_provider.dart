import 'package:flutter_magento/flutter_magento.dart';

/// Пример кастомного провайдера демо-данных для электроники
class ElectronicsDemoDataProvider implements DemoDataProvider {
  @override
  String get providerName => 'Electronics Demo Data';
  
  @override
  String get providerDescription => 'Demo data for electronics store with smartphones, laptops, and accessories';
  
  @override
  bool supportsDataType(String dataType) {
    return ['products', 'categories', 'cart', 'customer'].contains(dataType);
  }
  
  @override
  List<Product> getDemoProducts() {
    return [
      Product(
        id: '1',
        name: 'iPhone 15 Pro',
        sku: 'IPHONE-15-PRO',
        price: 999.99,
        specialPrice: 949.99,
        inStock: true,
        imageUrl: 'https://example.com/iphone15pro.jpg',
        description: 'The latest iPhone with advanced camera system and A17 Pro chip.',
        categories: ['Smartphones', 'Apple'],
      ),
      Product(
        id: '2',
        name: 'Samsung Galaxy S24 Ultra',
        sku: 'SAMSUNG-S24-ULTRA',
        price: 1199.99,
        inStock: true,
        imageUrl: 'https://example.com/samsung-s24-ultra.jpg',
        description: 'Premium Android smartphone with S Pen and advanced AI features.',
        categories: ['Smartphones', 'Samsung'],
      ),
      Product(
        id: '3',
        name: 'MacBook Pro 16" M3 Max',
        sku: 'MACBOOK-PRO-16-M3-MAX',
        price: 3499.99,
        inStock: true,
        imageUrl: 'https://example.com/macbook-pro-16.jpg',
        description: 'Professional laptop with M3 Max chip for demanding workflows.',
        categories: ['Laptops', 'Apple'],
      ),
      Product(
        id: '4',
        name: 'Dell XPS 15',
        sku: 'DELL-XPS-15',
        price: 1899.99,
        inStock: true,
        imageUrl: 'https://example.com/dell-xps-15.jpg',
        description: 'Premium Windows laptop with stunning 4K display.',
        categories: ['Laptops', 'Dell'],
      ),
      Product(
        id: '5',
        name: 'AirPods Pro 2nd Gen',
        sku: 'AIRPODS-PRO-2',
        price: 249.99,
        inStock: true,
        imageUrl: 'https://example.com/airpods-pro-2.jpg',
        description: 'Wireless earbuds with active noise cancellation.',
        categories: ['Audio', 'Apple'],
      ),
      Product(
        id: '6',
        name: 'Sony WH-1000XM5',
        sku: 'SONY-WH-1000XM5',
        price: 399.99,
        inStock: true,
        imageUrl: 'https://example.com/sony-wh-1000xm5.jpg',
        description: 'Industry-leading noise canceling wireless headphones.',
        categories: ['Audio', 'Sony'],
      ),
      Product(
        id: '7',
        name: 'iPad Pro 12.9" M2',
        sku: 'IPAD-PRO-12.9-M2',
        price: 1099.99,
        inStock: true,
        imageUrl: 'https://example.com/ipad-pro-12.9.jpg',
        description: 'Professional tablet with M2 chip and Liquid Retina XDR display.',
        categories: ['Tablets', 'Apple'],
      ),
      Product(
        id: '8',
        name: 'Samsung Galaxy Tab S9 Ultra',
        sku: 'SAMSUNG-TAB-S9-ULTRA',
        price: 1199.99,
        inStock: true,
        imageUrl: 'https://example.com/samsung-tab-s9-ultra.jpg',
        description: 'Large Android tablet with S Pen and AMOLED display.',
        categories: ['Tablets', 'Samsung'],
      ),
      Product(
        id: '9',
        name: 'Apple Watch Series 9',
        sku: 'APPLE-WATCH-SERIES-9',
        price: 399.99,
        inStock: true,
        imageUrl: 'https://example.com/apple-watch-series-9.jpg',
        description: 'Advanced smartwatch with health monitoring and fitness tracking.',
        categories: ['Wearables', 'Apple'],
      ),
      Product(
        id: '10',
        name: 'Samsung Galaxy Watch 6 Classic',
        sku: 'SAMSUNG-WATCH-6-CLASSIC',
        price: 349.99,
        inStock: true,
        imageUrl: 'https://example.com/samsung-watch-6-classic.jpg',
        description: 'Premium smartwatch with rotating bezel and health monitoring.',
        categories: ['Wearables', 'Samsung'],
      ),
    ];
  }
  
  @override
  List<Category> getDemoCategories() {
    return [
      Category(
        id: '1',
        name: 'Smartphones',
        urlKey: 'smartphones',
        childrenCount: 2,
        level: 1,
        children: [
          Category(
            id: '11',
            name: 'Apple',
            urlKey: 'smartphones-apple',
            childrenCount: 0,
            level: 2,
          ),
          Category(
            id: '12',
            name: 'Samsung',
            urlKey: 'smartphones-samsung',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      Category(
        id: '2',
        name: 'Laptops',
        urlKey: 'laptops',
        childrenCount: 2,
        level: 1,
        children: [
          Category(
            id: '21',
            name: 'Apple',
            urlKey: 'laptops-apple',
            childrenCount: 0,
            level: 2,
          ),
          Category(
            id: '22',
            name: 'Dell',
            urlKey: 'laptops-dell',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      Category(
        id: '3',
        name: 'Tablets',
        urlKey: 'tablets',
        childrenCount: 2,
        level: 1,
        children: [
          Category(
            id: '31',
            name: 'Apple',
            urlKey: 'tablets-apple',
            childrenCount: 0,
            level: 2,
          ),
          Category(
            id: '32',
            name: 'Samsung',
            urlKey: 'tablets-samsung',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      Category(
        id: '4',
        name: 'Audio',
        urlKey: 'audio',
        childrenCount: 2,
        level: 1,
        children: [
          Category(
            id: '41',
            name: 'Apple',
            urlKey: 'audio-apple',
            childrenCount: 0,
            level: 2,
          ),
          Category(
            id: '42',
            name: 'Sony',
            urlKey: 'audio-sony',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      Category(
        id: '5',
        name: 'Wearables',
        urlKey: 'wearables',
        childrenCount: 2,
        level: 1,
        children: [
          Category(
            id: '51',
            name: 'Apple',
            urlKey: 'wearables-apple',
            childrenCount: 0,
            level: 2,
          ),
          Category(
            id: '52',
            name: 'Samsung',
            urlKey: 'wearables-samsung',
            childrenCount: 0,
            level: 2,
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
        sku: 'IPHONE-15-PRO',
        name: 'iPhone 15 Pro',
        price: 999.99,
        quantity: 1,
        rowTotal: 999.99,
        image: 'https://example.com/iphone15pro.jpg',
      ),
      CartItem(
        id: 2,
        sku: 'AIRPODS-PRO-2',
        name: 'AirPods Pro 2nd Gen',
        price: 249.99,
        quantity: 1,
        rowTotal: 249.99,
        image: 'https://example.com/airpods-pro-2.jpg',
      ),
    ];
  }
  
  @override
  Map<String, dynamic>? getDemoCustomer() {
    return {
      'id': '1',
      'email': 'tech.enthusiast@example.com',
      'firstname': 'Tech',
      'lastname': 'Enthusiast',
      'is_active': true,
      'created_at': DateTime.now().toIso8601String(),
    };
  }
}
