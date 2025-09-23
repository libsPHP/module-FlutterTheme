import 'demo_data_provider.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../models/cart.dart';

/// Стандартный провайдер демо-данных
/// Содержит базовые демо-продукты и категории для тестирования
class DefaultDemoDataProvider implements DemoDataProvider {
  @override
  String get providerName => 'Default Demo Data';
  
  @override
  String get providerDescription => 'Standard demo products and categories for testing';
  
  @override
  bool supportsDataType(String dataType) {
    return ['products', 'categories', 'cart', 'customer'].contains(dataType);
  }
  
  @override
  List<Product> getDemoProducts() {
    return [
      Product(
        id: '1',
        name: 'Radiant Tee',
        sku: 'WS12-XS-Orange',
        price: 22.00,
        specialPrice: 20.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/w/s/ws12-orange_main_2.jpg',
        description: 'The Radiant Tee features a soft, lightweight fabric with a comfortable fit.',
        categories: ['Women', 'Tops'],
      ),
      Product(
        id: '2',
        name: 'Argus All-Weather Tank',
        sku: 'WSH12-XS-White',
        price: 21.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/w/s/wsh12-white_main_2.jpg',
        description: 'The Argus All-Weather Tank is a versatile piece for any wardrobe.',
        categories: ['Women', 'Tops'],
      ),
      Product(
        id: '3',
        name: 'Hero Hoodie',
        sku: 'WSH03-XS-Gray',
        price: 54.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh03-gray_main_2.jpg',
        description: 'The Hero Hoodie is perfect for those cool days and nights.',
        categories: ['Men', 'Tops'],
      ),
      Product(
        id: '4',
        name: 'Bruno Compete Hoodie',
        sku: 'WSH04-XS-Gray',
        price: 62.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh04-gray_main_2.jpg',
        description: 'The Bruno Compete Hoodie offers comfort and style.',
        categories: ['Men', 'Tops'],
      ),
      Product(
        id: '5',
        name: 'Fusion Backpack',
        sku: '24-WB01',
        price: 59.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wb01_2.jpg',
        description: 'The Fusion Backpack is perfect for your daily adventures.',
        categories: ['Gear', 'Bags'],
      ),
      Product(
        id: '6',
        name: 'Push It Messenger Bag',
        sku: '24-WB02',
        price: 45.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wb02_2.jpg',
        description: 'The Push It Messenger Bag is stylish and functional.',
        categories: ['Gear', 'Bags'],
      ),
      Product(
        id: '7',
        name: 'Set of Sprite Yoga Straps',
        sku: '24-WG01',
        price: 29.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wg01_2.jpg',
        description: 'Perfect for your yoga practice.',
        categories: ['Gear', 'Fitness Equipment'],
      ),
      Product(
        id: '8',
        name: 'Sprite Foam Roller',
        sku: '24-WG03',
        price: 45.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wg03_2.jpg',
        description: 'Great for muscle recovery and flexibility.',
        categories: ['Gear', 'Fitness Equipment'],
      ),
      Product(
        id: '9',
        name: 'Downloadable Video',
        sku: '240-LV01',
        price: 9.99,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/2/4/240-lv01_2.jpg',
        description: 'High-quality training video for download.',
        categories: ['Training', 'Video Download'],
      ),
      Product(
        id: '10',
        name: 'Yoga Block',
        sku: '24-WG04',
        price: 18.00,
        inStock: true,
        imageUrl: 'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wg04_2.jpg',
        description: 'Essential yoga accessory for proper alignment.',
        categories: ['Gear', 'Fitness Equipment'],
      ),
    ];
  }
  
  @override
  List<Category> getDemoCategories() {
    return [
      Category(
        id: '1',
        name: 'Women',
        urlKey: 'women',
        childrenCount: 3,
        level: 1,
        children: [
          Category(
            id: '11',
            name: 'Tops',
            urlKey: 'women-tops',
            childrenCount: 2,
            level: 2,
          ),
          Category(
            id: '12',
            name: 'Bottoms',
            urlKey: 'women-bottoms',
            childrenCount: 2,
            level: 2,
          ),
          Category(
            id: '13',
            name: 'Accessories',
            urlKey: 'women-accessories',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      Category(
        id: '2',
        name: 'Men',
        urlKey: 'men',
        childrenCount: 3,
        level: 1,
        children: [
          Category(
            id: '21',
            name: 'Tops',
            urlKey: 'men-tops',
            childrenCount: 2,
            level: 2,
          ),
          Category(
            id: '22',
            name: 'Bottoms',
            urlKey: 'men-bottoms',
            childrenCount: 2,
            level: 2,
          ),
          Category(
            id: '23',
            name: 'Accessories',
            urlKey: 'men-accessories',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      Category(
        id: '3',
        name: 'Gear',
        urlKey: 'gear',
        childrenCount: 2,
        level: 1,
        children: [
          Category(
            id: '31',
            name: 'Bags',
            urlKey: 'gear-bags',
            childrenCount: 0,
            level: 2,
          ),
          Category(
            id: '32',
            name: 'Fitness Equipment',
            urlKey: 'gear-fitness',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      Category(
        id: '4',
        name: 'Training',
        urlKey: 'training',
        childrenCount: 1,
        level: 1,
        children: [
          Category(
            id: '41',
            name: 'Video Download',
            urlKey: 'training-video',
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
        sku: 'WS12-XS-Orange',
        name: 'Radiant Tee',
        price: 22.00,
        quantity: 2,
        rowTotal: 44.00,
        image: 'https://luma-demo.scandipwa.com/media/catalog/product/w/s/ws12-orange_main_2.jpg',
      ),
      CartItem(
        id: 2,
        sku: 'WSH03-XS-Gray',
        name: 'Hero Hoodie',
        price: 54.00,
        quantity: 1,
        rowTotal: 54.00,
        image: 'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh03-gray_main_2.jpg',
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
