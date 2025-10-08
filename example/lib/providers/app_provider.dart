import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_magento/flutter_magento.dart';
import '../demo_data/custom_initial_preload_data_provider.dart';

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
  late FlutterMagentoCore _magento;

  // API instances for RADA export
  ProductApi? _productApi;

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
  ProductApi? get productApi => _productApi;

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
      // Инициализируем Magento API с кастомными демо-данными
      _magento = FlutterMagentoCore.instance;

      // Создаем кастомный провайдер демо-данных для электроники
      final customDemoProvider = ElectronicsInitialPreloadDataProvider();

      final success = await _magento.initialize(
        baseUrl: baseUrl,
        demoDataProvider: customDemoProvider,
        enableDemoData: true,
      );

      if (!success) {
        throw Exception('Failed to initialize Magento API');
      }

      _isInitialized = true;
      _baseUrl = baseUrl;

      // Initialize ProductApi for RADA export
      try {
        _productApi = ProductApi(_flutterMagento.client);
      } catch (e) {
        debugPrint('Failed to initialize ProductApi: $e');
      }

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
      final result = await _magento.authenticate(
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
      final result = await _magento.createAccount(
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

      final productsData = response['items'] ?? [];
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

      // Если ошибка 401 (Unauthorized), используем демо-данные из системы
      if (e.toString().contains('401') ||
          e.toString().contains('Unauthorized')) {
        try {
          debugPrint('Using demo products from system...');
          final demoProducts = _magento.getDemoProducts();
          final magentoProducts = demoProducts
              .map(
                (product) => MagentoProduct(
                  id: product.id,
                  name: product.name,
                  sku: product.sku,
                  price: product.price,
                  specialPrice: product.specialPrice,
                  inStock: product.inStock,
                  imageUrl: product.imageUrl,
                  description: product.description,
                  categories: product.categories,
                ),
              )
              .toList();

          if (page == 1) {
            _products = magentoProducts;
          } else {
            _products.addAll(magentoProducts);
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

  Future<void> loadProductsByCategory(
    String categoryId, {
    int page = 1,
    int pageSize = 20,
  }) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      // Загружаем продукты по категории через GraphQL
      final response = await _magento.getProducts(
        page: page,
        pageSize: pageSize,
        categoryId: categoryId,
      );

      final productsData = response['items'] ?? [];
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
      debugPrint('Load products by category error: $e');

      // Если ошибка 401 (Unauthorized), используем демо-данные из системы
      if (e.toString().contains('401') ||
          e.toString().contains('Unauthorized')) {
        try {
          debugPrint(
            'Using demo products from system for category $categoryId...',
          );
          final demoProducts = _magento.getDemoProducts();
          // Фильтруем демо-продукты по категории
          final filteredProducts = demoProducts.where((product) {
            return product.categories.any(
              (cat) => cat.toLowerCase().contains(categoryId.toLowerCase()),
            );
          }).toList();

          final magentoProducts = filteredProducts
              .map(
                (product) => MagentoProduct(
                  id: product.id,
                  name: product.name,
                  sku: product.sku,
                  price: product.price,
                  specialPrice: product.specialPrice,
                  inStock: product.inStock,
                  imageUrl: product.imageUrl,
                  description: product.description,
                  categories: product.categories,
                ),
              )
              .toList();

          if (page == 1) {
            _products = magentoProducts;
          } else {
            _products.addAll(magentoProducts);
          }

          notifyListeners();
        } catch (demoError) {
          debugPrint('Demo products error: $demoError');
          _setError('Failed to load products for category: $e');
        }
      } else {
        _setError('Failed to load products for category: $e');
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

      final productsData = response['items'] ?? [];
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

  Future<void> updateCartItemQuantity(String productId, int newQuantity) async {
    if (!_isAuthenticated) {
      _setError('Please login first');
      return;
    }

    if (newQuantity <= 0) {
      await removeFromCart(productId);
      return;
    }

    try {
      final existingItemIndex = _currentCart.items.indexWhere(
        (item) => item.productId == productId,
      );

      if (existingItemIndex >= 0) {
        final existingItem = _currentCart.items[existingItemIndex];
        final updatedItems = List<SimpleCartItem>.from(_currentCart.items);
        updatedItems[existingItemIndex] = SimpleCartItem(
          productId: existingItem.productId,
          name: existingItem.name,
          price: existingItem.price,
          quantity: newQuantity,
        );
        _currentCart = SimpleCart(items: updatedItems);
        notifyListeners();
      }
    } catch (e) {
      _setError('Update cart error: $e');
    }
  }

  Future<void> removeFromCart(String productId) async {
    if (!_isAuthenticated) {
      _setError('Please login first');
      return;
    }

    try {
      final updatedItems = _currentCart.items
          .where((item) => item.productId != productId)
          .toList();
      _currentCart = SimpleCart(items: updatedItems);
      notifyListeners();
    } catch (e) {
      _setError('Remove from cart error: $e');
    }
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

      // Если ошибка 401 (Unauthorized), используем демо-категории из системы
      if (e.toString().contains('401') ||
          e.toString().contains('Unauthorized')) {
        try {
          debugPrint('Using demo categories from system...');
          final demoCategories = _magento.getDemoCategories();
          final magentoCategories = demoCategories
              .map(
                (category) => MagentoCategory(
                  id: category.id,
                  name: category.name,
                  urlKey: category.urlKey,
                  childrenCount: category.childrenCount,
                  level: category.level,
                  children: category.children
                      ?.map(
                        (child) => MagentoCategory(
                          id: child.id,
                          name: child.name,
                          urlKey: child.urlKey,
                          childrenCount: child.childrenCount,
                          level: child.level,
                        ),
                      )
                      .toList(),
                ),
              )
              .toList();

          _categories = magentoCategories;
          notifyListeners();
        } catch (demoError) {
          debugPrint('Failed to load demo categories: $demoError');
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

  /// Load data from RADA package
  Future<void> loadFromRadaPackage(RadaPackage package) async {
    try {
      _setLoading(true);
      _clearError();

      // Convert RADA categories to MagentoCategory
      final radaCategories = package.data.categories;
      _categories = radaCategories.map((cat) {
        return MagentoCategory(
          id: cat.id.toString(),
          name: cat.name,
          urlKey: cat.name.toLowerCase().replaceAll(' ', '-'),
          childrenCount: cat.childrenCount,
          level: cat.level,
          children:
              cat.children?.map((child) {
                return MagentoCategory(
                  id: child.id.toString(),
                  name: child.name,
                  urlKey: child.name.toLowerCase().replaceAll(' ', '-'),
                  childrenCount: child.childrenCount,
                  level: child.level,
                );
              }).toList() ??
              [],
        );
      }).toList();

      // Convert RADA products to MagentoProduct
      final radaProducts = package.data.products;
      _products = radaProducts.map((prod) {
        return MagentoProduct(
          id: prod.id.toString(),
          name: prod.name,
          sku: prod.sku,
          price: prod.price,
          specialPrice: prod.specialPrice,
          inStock: prod.isAvailable,
          imageUrl: prod.mediaGalleryEntries?.firstOrNull?.file,
          description: prod.description,
          categories: prod.categories ?? [],
        );
      }).toList();

      notifyListeners();
    } catch (e) {
      _setError('Failed to load RADA data: $e');
      rethrow;
    } finally {
      _setLoading(false);
    }
  }
}
