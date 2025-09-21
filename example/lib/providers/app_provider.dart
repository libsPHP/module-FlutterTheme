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
    
    return MagentoProduct(
      id: data['id']?.toString() ?? '',
      name: data['name'] ?? '',
      sku: data['sku'] ?? '',
      price: double.tryParse(regularPrice.toString()) ?? 0.0,
      specialPrice: finalPrice != regularPrice ? double.tryParse(finalPrice.toString()) : null,
      inStock: data['stock_status'] == 'IN_STOCK',
      imageUrl: data['small_image']?['url'],
      description: data['description']?['html'] ?? data['short_description']?['html'],
      categories: (data['categories'] as List?)
          ?.map((cat) => cat['name']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .toList() ?? [],
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
      children: (data['children'] as List?)
          ?.map((child) => MagentoCategory.fromGraphQL(child))
          .toList() ?? [],
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

  // Auth state
  bool _isAuthenticated = false;
  SimpleCustomer? _currentCustomer;

  // Cart state
  SimpleCart _currentCart = SimpleCart();

  // Products state
  List<SimpleProduct> _products = [];
  List<SimpleProduct> _searchResults = [];

  // Getters
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get baseUrl => _baseUrl;
  bool get isAuthenticated => _isAuthenticated;
  SimpleCustomer? get currentCustomer => _currentCustomer;
  SimpleCart get currentCart => _currentCart;
  List<SimpleProduct> get products => _products;
  List<SimpleProduct> get searchResults => _searchResults;

  // Environment variables getters
  String? get defaultApiUrl => dotenv.env['MAGENTO_API_URL'];
  List<String> get alternativeUrls => [
    dotenv.env['MAGENTO_API_URL_ALT_1'] ?? '',
    dotenv.env['MAGENTO_API_URL_ALT_2'] ?? '',
    dotenv.env['MAGENTO_API_URL_ALT_3'] ?? '',
  ].where((url) => url.isNotEmpty).toList();

  AppProvider() {
    _loadConfiguration();
  }

  Future<void> _loadConfiguration() async {
    try {
      // Загружаем .env файл
      await dotenv.load(fileName: ".env");

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
      // Симуляция инициализации
      await Future.delayed(const Duration(seconds: 1));

      _isInitialized = true;
      _baseUrl = baseUrl;

      // Save configuration
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('magento_base_url', baseUrl);

      // Загружаем демо продукты
      _loadDemoProducts();

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
      // Симуляция логина
      await Future.delayed(const Duration(seconds: 1));

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
        _setError('Invalid credentials');
        return false;
      }
    } catch (e) {
      _setError('Login error: $e');
      return false;
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
      // Симуляция регистрации
      await Future.delayed(const Duration(seconds: 1));

      _isAuthenticated = true;
      _currentCustomer = SimpleCustomer(
        id: '2',
        email: email,
        firstName: firstName,
        lastName: lastName,
      );
      notifyListeners();
      return true;
    } catch (e) {
      _setError('Registration error: $e');
      return false;
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
      // Симуляция загрузки продуктов
      await Future.delayed(const Duration(seconds: 1));

      if (page == 1) {
        _products = _getDemoProducts();
      }
      notifyListeners();
    } catch (e) {
      _setError('Error loading products: $e');
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
      // Симуляция поиска
      await Future.delayed(const Duration(milliseconds: 500));

      _searchResults = _getDemoProducts()
          .where(
            (product) =>
                product.name.toLowerCase().contains(query.toLowerCase()),
          )
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
        orElse: () => SimpleProduct(
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

  void _loadDemoProducts() {
    _products = _getDemoProducts();
  }

  List<SimpleProduct> _getDemoProducts() {
    return [
      SimpleProduct(
        id: '1',
        name: 'iPhone 15 Pro',
        sku: 'IPHONE-15-PRO',
        price: 999.99,
        inStock: true,
      ),
      SimpleProduct(
        id: '2',
        name: 'MacBook Air M3',
        sku: 'MACBOOK-AIR-M3',
        price: 1299.99,
        inStock: true,
      ),
      SimpleProduct(
        id: '3',
        name: 'iPad Pro 12.9"',
        sku: 'IPAD-PRO-129',
        price: 799.99,
        inStock: true,
      ),
      SimpleProduct(
        id: '4',
        name: 'Apple Watch Series 9',
        sku: 'WATCH-S9',
        price: 399.99,
        inStock: false,
      ),
      SimpleProduct(
        id: '5',
        name: 'AirPods Pro',
        sku: 'AIRPODS-PRO',
        price: 249.99,
        inStock: true,
      ),
      SimpleProduct(
        id: '6',
        name: 'Magic Keyboard',
        sku: 'MAGIC-KEYBOARD',
        price: 299.99,
        inStock: true,
      ),
    ];
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
}
