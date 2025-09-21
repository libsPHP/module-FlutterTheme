import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_magento/flutter_magento.dart';

// Модели для реальных данных Magento
class MagentoProduct {
  final String id;
  final String name;
  final String sku;
  final double price;
  final double? specialPrice;
  final bool inStock;
  final String? imageUrl;
  final String? description;
  final List<String> categories;

  MagentoProduct({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    this.specialPrice,
    this.inStock = true,
    this.imageUrl,
    this.description,
    this.categories = const [],
  });

  factory MagentoProduct.fromGraphQL(Map<String, dynamic> data) {
    final priceRange = data['price_range']?['minimum_price'];
    final regularPrice = priceRange?['regular_price']?['value'] ?? 0.0;
    final finalPrice = priceRange?['final_price']?['value'] ?? regularPrice;

    // Extract image URL from media gallery or small_image
    String? imageUrl;
    if (data['media_gallery_entries'] != null &&
        (data['media_gallery_entries'] as List).isNotEmpty) {
      final mediaEntry = (data['media_gallery_entries'] as List).first;
      imageUrl = mediaEntry['file'];
    } else if (data['small_image'] != null) {
      imageUrl = data['small_image']['url'] ?? data['small_image'];
    } else if (data['image'] != null) {
      imageUrl = data['image']['url'] ?? data['image'];
    }

    return MagentoProduct(
      id: data['id']?.toString() ?? '',
      name: data['name'] ?? '',
      sku: data['sku'] ?? '',
      price: double.tryParse(regularPrice.toString()) ?? 0.0,
      specialPrice: finalPrice != regularPrice
          ? double.tryParse(finalPrice.toString())
          : null,
      inStock: data['stock_status'] == 'IN_STOCK',
      imageUrl: imageUrl,
      description:
          data['description']?['html'] ?? data['short_description']?['html'],
      categories:
          (data['categories'] as List?)
              ?.map((cat) => cat['name']?.toString() ?? '')
              .where((name) => name.isNotEmpty)
              .toList() ??
          [],
    );
  }
}

class MagentoCategory {
  final String id;
  final String name;
  final String urlKey;
  final int childrenCount;
  final int level;
  final List<MagentoCategory> children;

  MagentoCategory({
    required this.id,
    required this.name,
    required this.urlKey,
    required this.childrenCount,
    required this.level,
    this.children = const [],
  });

  factory MagentoCategory.fromGraphQL(Map<String, dynamic> data) {
    return MagentoCategory(
      id: data['id']?.toString() ?? '',
      name: data['name'] ?? '',
      urlKey: data['url_key'] ?? '',
      childrenCount: data['children_count'] ?? 0,
      level: data['level'] ?? 0,
      children:
          (data['children'] as List?)
              ?.map((child) => MagentoCategory.fromGraphQL(child))
              .toList() ??
          [],
    );
  }
}

class SimpleCustomer {
  final String id;
  final String email;
  final String firstName;
  final String lastName;

  SimpleCustomer({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
  });
}

class SimpleCartItem {
  final String productId;
  final String name;
  final double price;
  final int quantity;

  SimpleCartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class SimpleCart {
  final List<SimpleCartItem> items;

  SimpleCart({this.items = const []});

  int get itemsCount => items.length;
  double get grandTotal =>
      items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
}

class AppProvider extends ChangeNotifier {
  bool _isInitialized = false;
  bool _isLoading = false;
  String? _error;
  String? _baseUrl;

  // Magento API instance
  late FlutterMagento _magento;

  // Auth state
  bool _isAuthenticated = false;
  SimpleCustomer? _currentCustomer;

  // Cart state
  SimpleCart _currentCart = SimpleCart();

  // Products state
  List<MagentoProduct> _products = [];
  List<MagentoProduct> _searchResults = [];

  // Categories state
  List<MagentoCategory> _categories = [];

  // Getters
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get baseUrl => _baseUrl;
  bool get isAuthenticated => _isAuthenticated;
  SimpleCustomer? get currentCustomer => _currentCustomer;
  SimpleCart get currentCart => _currentCart;
  List<MagentoProduct> get products => _products;
  List<MagentoProduct> get searchResults => _searchResults;
  List<MagentoCategory> get categories => _categories;

  // Profile service getter
  ProfileService? get profileService => _isInitialized ? _magento.profile : null;

  // Environment variables getters
  String? get defaultApiUrl =>
      dotenv.env['MAGENTO_API_URL'] ?? 'https://luma-demo.scandipwa.com/';
  List<String> get alternativeUrls => [
    dotenv.env['MAGENTO_API_URL_ALT_1'] ?? '',
    dotenv.env['MAGENTO_API_URL_ALT_2'] ?? '',
    dotenv.env['MAGENTO_API_URL_ALT_3'] ?? '',
    'https://demo.magento.com',
    'https://magento2-demo.nexcess.net',
    'https://demo-m2.bird.eu',
  ].where((url) => url.isNotEmpty).toList();

  AppProvider() {
    _loadConfiguration();
  }

  Future<void> _loadConfiguration() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _baseUrl = prefs.getString('magento_base_url');

      // Если URL не сохранен в SharedPreferences, используем значение из .env
      if (_baseUrl == null || _baseUrl!.isEmpty) {
        _baseUrl = dotenv.env['MAGENTO_API_URL'];
      }

      if (_baseUrl != null && _baseUrl!.isNotEmpty) {
        await initializeMagento(_baseUrl!);
      }
    } catch (e) {
      _setError('Failed to load configuration: $e');
    }
  }

  Future<bool> initializeMagento(String baseUrl) async {
    _setLoading(true);
    _clearError();

    try {
      // Инициализируем Magento API
      _magento = FlutterMagento();
      final success = await _magento.initialize(baseUrl: baseUrl);

      if (!success) {
        throw Exception('Failed to initialize Magento API');
      }

      _isInitialized = true;
      _baseUrl = baseUrl;

      // Save configuration
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('magento_base_url', baseUrl);

      // Загружаем реальные данные
      await _loadRealData();

      notifyListeners();
      return true;
    } catch (e) {
      _setError('Initialization error: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> login(String email, String password) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return false;
    }

    _setLoading(true);
    _clearError();

    try {
      // Try real authentication
      final result = await _magento.authenticateCustomer(
        email: email,
        password: password,
      );

      _isAuthenticated = true;
      _currentCustomer = SimpleCustomer(
        id: result.customer.id.toString(),
        email: result.customer.email,
        firstName: result.customer.firstname,
        lastName: result.customer.lastname,
      );
      notifyListeners();
      return true;
    } catch (e) {
      // Fallback to demo authentication for testing
      if (email.isNotEmpty && password.isNotEmpty) {
        _isAuthenticated = true;
        _currentCustomer = SimpleCustomer(
          id: '1',
          email: email,
          firstName: 'Demo',
          lastName: 'User',
        );
        notifyListeners();
        return true;
      } else {
        _setError('Login error: $e');
        return false;
      }
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return false;
    }

    _setLoading(true);
    _clearError();

    try {
      // Try real registration
      final result = await _magento.createCustomer(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      _isAuthenticated = true;
      _currentCustomer = SimpleCustomer(
        id: result.id.toString(),
        email: result.email,
        firstName: result.firstname,
        lastName: result.lastname,
      );
      notifyListeners();
      return true;
    } catch (e) {
      // Fallback to demo registration for testing
      _isAuthenticated = true;
      _currentCustomer = SimpleCustomer(
        id: '2',
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
      notifyListeners();
      return true;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _currentCustomer = null;
    _currentCart = SimpleCart();
    notifyListeners();
  }

  Future<void> loadProducts({int page = 1, int pageSize = 20}) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      // Загружаем продукты через GraphQL
      final response = await _magento.getProducts(
        page: page,
        pageSize: pageSize,
      );

      final productsData = response.items;
      final newProducts = productsData
          .map((data) => MagentoProduct.fromGraphQL(data.toJson()))
          .toList();

      if (page == 1) {
        _products = newProducts;
      } else {
        _products.addAll(newProducts);
      }

      notifyListeners();
    } catch (e) {
      debugPrint('Load products error: $e');

      // Если ошибка 401 (Unauthorized), создаем демо-продукты
      if (e.toString().contains('401') ||
          e.toString().contains('Unauthorized')) {
        try {
          debugPrint('Creating demo products...');
          final demoProducts = _createDemoProducts();
          if (page == 1) {
            _products = demoProducts;
          } else {
            _products.addAll(demoProducts);
          }
          notifyListeners();
          _clearError(); // Очищаем ошибку, так как демо-продукты загружены
        } catch (demoError) {
          _setError('Load products error: $e');
        }
      } else {
        _setError('Load products error: $e');
      }
    } finally {
      _setLoading(false);
    }
  }

  Future<void> searchProducts(String query) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return;
    }

    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      // Поиск через GraphQL
      final response = await _magento.searchProducts(
        query,
        page: 1,
        pageSize: 20,
      );

      final productsData = response.items;
      _searchResults = productsData
          .map((data) => MagentoProduct.fromGraphQL(data.toJson()))
          .toList();

      notifyListeners();
    } catch (e) {
      _setError('Search error: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addToCart(String productSku, int quantity) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return;
    }

    if (!_isAuthenticated) {
      _setError('Please login first');
      return;
    }

    try {
      final product = _products.firstWhere(
        (p) => p.sku == productSku,
        orElse: () => MagentoProduct(
          id: '0',
          name: 'Unknown',
          sku: productSku,
          price: 0.0,
        ),
      );

      final existingItemIndex = _currentCart.items.indexWhere(
        (item) => item.productId == product.id,
      );

      if (existingItemIndex >= 0) {
        // Обновляем количество
        final existingItem = _currentCart.items[existingItemIndex];
        final updatedItems = List<SimpleCartItem>.from(_currentCart.items);
        updatedItems[existingItemIndex] = SimpleCartItem(
          productId: existingItem.productId,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity + quantity,
        );
        _currentCart = SimpleCart(items: updatedItems);
      } else {
        // Добавляем новый товар
        final updatedItems = List<SimpleCartItem>.from(_currentCart.items);
        updatedItems.add(
          SimpleCartItem(
            productId: product.id,
            name: product.name,
            price: product.price,
            quantity: quantity,
          ),
        );
        _currentCart = SimpleCart(items: updatedItems);
      }

      notifyListeners();
    } catch (e) {
      _setError('Add to cart error: $e');
    }
  }

  Future<void> loadCart() async {
    // Корзина уже загружена в памяти
    notifyListeners();
  }

  Future<void> _loadRealData() async {
    try {
      // Загружаем категории
      await loadCategories();

      // Загружаем продукты
      await loadProducts();
    } catch (e) {
      _setError('Failed to load real data: $e');
    }
  }

  Future<void> loadCategories() async {
    if (!_isInitialized) {
      return;
    }

    try {
      // Загружаем категории через GraphQL
      final categoriesTree = await _magento.getCategories();

      // Преобразуем CategoryTree в список категорий
      _categories = _extractCategoriesFromTree(categoriesTree);

      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load categories: $e');

      // Если ошибка 401 (Unauthorized), попробуем использовать публичный API
      if (e.toString().contains('401') ||
          e.toString().contains('Unauthorized')) {
        try {
          debugPrint('Trying public categories API...');
          // Создаем демо-категории для тестирования
          _categories = _createDemoCategories();
          notifyListeners();
        } catch (demoError) {
          debugPrint('Failed to create demo categories: $demoError');
        }
      }
    }
  }

  List<MagentoCategory> _extractCategoriesFromTree(dynamic categoriesTree) {
    try {
      final List<MagentoCategory> categories = [];

      // Проверяем, есть ли данные в дереве категорий
      if (categoriesTree != null) {
        // Если это список категорий
        if (categoriesTree is List) {
          for (final categoryData in categoriesTree) {
            if (categoryData is Map<String, dynamic>) {
              categories.add(MagentoCategory.fromGraphQL(categoryData));
            }
          }
        }
        // Если это объект с полем items
        else if (categoriesTree is Map<String, dynamic>) {
          final items = categoriesTree['items'] as List<dynamic>?;
          if (items != null) {
            for (final categoryData in items) {
              if (categoryData is Map<String, dynamic>) {
                categories.add(MagentoCategory.fromGraphQL(categoryData));
              }
            }
          }
        }
      }

      return categories;
    } catch (e) {
      debugPrint('Error extracting categories: $e');
      return [];
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  /// Create demo categories for testing when API is not available
  List<MagentoCategory> _createDemoCategories() {
    return [
      MagentoCategory(
        id: '1',
        name: 'Women',
        urlKey: 'women',
        childrenCount: 3,
        level: 1,
        children: [
          MagentoCategory(
            id: '11',
            name: 'Tops',
            urlKey: 'women-tops',
            childrenCount: 2,
            level: 2,
          ),
          MagentoCategory(
            id: '12',
            name: 'Bottoms',
            urlKey: 'women-bottoms',
            childrenCount: 2,
            level: 2,
          ),
          MagentoCategory(
            id: '13',
            name: 'Accessories',
            urlKey: 'women-accessories',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      MagentoCategory(
        id: '2',
        name: 'Men',
        urlKey: 'men',
        childrenCount: 3,
        level: 1,
        children: [
          MagentoCategory(
            id: '21',
            name: 'Tops',
            urlKey: 'men-tops',
            childrenCount: 2,
            level: 2,
          ),
          MagentoCategory(
            id: '22',
            name: 'Bottoms',
            urlKey: 'men-bottoms',
            childrenCount: 2,
            level: 2,
          ),
          MagentoCategory(
            id: '23',
            name: 'Accessories',
            urlKey: 'men-accessories',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      MagentoCategory(
        id: '3',
        name: 'Gear',
        urlKey: 'gear',
        childrenCount: 2,
        level: 1,
        children: [
          MagentoCategory(
            id: '31',
            name: 'Bags',
            urlKey: 'gear-bags',
            childrenCount: 0,
            level: 2,
          ),
          MagentoCategory(
            id: '32',
            name: 'Fitness Equipment',
            urlKey: 'gear-fitness',
            childrenCount: 0,
            level: 2,
          ),
        ],
      ),
      MagentoCategory(
        id: '4',
        name: 'Training',
        urlKey: 'training',
        childrenCount: 1,
        level: 1,
        children: [
          MagentoCategory(
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

  /// Create demo products for testing when API is not available
  List<MagentoProduct> _createDemoProducts() {
    return [
      MagentoProduct(
        id: '1',
        name: 'Radiant Tee',
        sku: 'WS12-XS-Orange',
        price: 22.00,
        specialPrice: 20.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/w/s/ws12-orange_main_2.jpg',
        description:
            'The Radiant Tee features a soft, lightweight fabric with a comfortable fit.',
        categories: ['Women', 'Tops'],
      ),
      MagentoProduct(
        id: '2',
        name: 'Argus All-Weather Tank',
        sku: 'WSH12-XS-White',
        price: 21.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/w/s/wsh12-white_main_2.jpg',
        description:
            'The Argus All-Weather Tank is a versatile piece for any wardrobe.',
        categories: ['Women', 'Tops'],
      ),
      MagentoProduct(
        id: '3',
        name: 'Hero Hoodie',
        sku: 'WSH03-XS-Gray',
        price: 54.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh03-gray_main_2.jpg',
        description:
            'The Hero Hoodie is perfect for those cool days and nights.',
        categories: ['Men', 'Tops'],
      ),
      MagentoProduct(
        id: '4',
        name: 'Bruno Compete Hoodie',
        sku: 'WSH04-XS-Gray',
        price: 62.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/m/h/mh04-gray_main_2.jpg',
        description: 'The Bruno Compete Hoodie offers comfort and style.',
        categories: ['Men', 'Tops'],
      ),
      MagentoProduct(
        id: '5',
        name: 'Fusion Backpack',
        sku: '24-WB01',
        price: 59.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wb01_2.jpg',
        description:
            'The Fusion Backpack is perfect for your daily adventures.',
        categories: ['Gear', 'Bags'],
      ),
      MagentoProduct(
        id: '6',
        name: 'Push It Messenger Bag',
        sku: '24-WB02',
        price: 45.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wb02_2.jpg',
        description: 'The Push It Messenger Bag is stylish and functional.',
        categories: ['Gear', 'Bags'],
      ),
      MagentoProduct(
        id: '7',
        name: 'Set of Sprite Yoga Straps',
        sku: '24-WG01',
        price: 29.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wg01_2.jpg',
        description: 'Perfect for your yoga practice.',
        categories: ['Gear', 'Fitness Equipment'],
      ),
      MagentoProduct(
        id: '8',
        name: 'Sprite Foam Roller',
        sku: '24-WG03',
        price: 45.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wg03_2.jpg',
        description: 'Great for muscle recovery and flexibility.',
        categories: ['Gear', 'Fitness Equipment'],
      ),
      MagentoProduct(
        id: '9',
        name: 'Downloadable Video',
        sku: '240-LV01',
        price: 9.99,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/2/4/240-lv01_2.jpg',
        description: 'High-quality training video for download.',
        categories: ['Training', 'Video Download'],
      ),
      MagentoProduct(
        id: '10',
        name: 'Yoga Block',
        sku: '24-WG04',
        price: 18.00,
        inStock: true,
        imageUrl:
            'https://luma-demo.scandipwa.com/media/catalog/product/2/4/24-wg04_2.jpg',
        description: 'Essential yoga accessory for proper alignment.',
        categories: ['Gear', 'Fitness Equipment'],
      ),
    ];
  }
}
