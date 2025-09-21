import 'package:flutter/foundation.dart';
import 'services/magento_api_service.dart';
import 'services/auth_service.dart';
import 'services/cart_service.dart';
import 'exceptions/magento_exception.dart';
import 'models/auth_models.dart';
import 'models/cart.dart';

/// Main singleton class for Flutter Magento library.
///
/// This class provides centralized access to all Magento functionality through
/// a singleton pattern. It manages the core services and provides a unified
/// interface for authentication, API services, and cart operations.
///
/// ## Usage
///
/// ```dart
/// final core = FlutterMagentoCore.instance;
///
/// // Initialize the library
/// await core.initialize(baseUrl: 'https://yourstore.com');
///
/// // Access services
/// final authService = core.authService;
/// final cartService = core.cartService;
/// ```
class FlutterMagentoCore {
  static FlutterMagentoCore? _instance;

  late final MagentoApiService _apiService;
  late final AuthService _authService;
  late final CartService _cartService;

  bool _isInitialized = false;
  String? _baseUrl;

  FlutterMagentoCore._();

  /// Get singleton instance of FlutterMagentoCore.
  ///
  /// Returns the single instance of the core class, creating it if it doesn't exist.
  static FlutterMagentoCore get instance {
    _instance ??= FlutterMagentoCore._();
    return _instance!;
  }

  /// Get the API service instance.
  ///
  /// Provides access to the main API service for making HTTP requests to Magento.
  MagentoApiService get apiService => _apiService;

  /// Get the authentication service instance.
  ///
  /// Provides access to authentication-related operations like login, logout, and token management.
  AuthService get authService => _authService;

  /// Get the cart service instance.
  ///
  /// Provides access to shopping cart operations like adding items, updating quantities, etc.
  CartService get cartService => _cartService;

  /// Check if the library is initialized.
  ///
  /// Returns `true` if the library has been successfully initialized, `false` otherwise.
  bool get isInitialized => _isInitialized;

  /// Get the base URL of the Magento instance.
  ///
  /// Returns the base URL that was used during initialization, or `null` if not initialized.
  String? get baseUrl => _baseUrl;

  /// Initialize the Flutter Magento library.
  ///
  /// This method must be called before using any other functionality.
  /// It sets up the API service and initializes all core services.
  ///
  /// [baseUrl] is the base URL of your Magento instance (e.g., "https://yourstore.com")
  /// [headers] optional custom headers to include with all requests
  /// [connectionTimeout] timeout for establishing connection in milliseconds
  /// [receiveTimeout] timeout for receiving data in milliseconds
  /// [adminToken] optional admin token for admin-level operations
  ///
  /// Returns `true` if initialization was successful, `false` otherwise.
  Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
    String? adminToken,
  }) async {
    try {
      if (kDebugMode) {
        print('🚀 Initializing Flutter Magento...');
      }

      _baseUrl = baseUrl;

      // Initialize API service
      _apiService = MagentoApiService();
      final apiInitialized = await _apiService.initialize(
        baseUrl: baseUrl,
        headers: headers,
        connectionTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        adminToken: adminToken,
      );

      if (!apiInitialized) {
        throw const MagentoException('Failed to initialize API service');
      }

      // Initialize other services
      _authService = AuthService(_apiService);
      _cartService = CartService(_apiService);

      // Initialize services
      final authInitialized = await _authService.initialize();
      final cartInitialized = await _cartService.initialize();

      if (!authInitialized || !cartInitialized) {
        throw const MagentoException('Failed to initialize services');
      }

      _isInitialized = true;

      if (kDebugMode) {
        print('✅ Flutter Magento initialized successfully');
        print('📍 Base URL: $baseUrl');
      }

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to initialize Flutter Magento: $e');
      }
      _isInitialized = false;
      return false;
    }
  }

  /// Reset library state
  void reset() {
    _isInitialized = false;
    _baseUrl = null;

    try {
      _authService.logout();
      _cartService.reset();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error during reset: $e');
      }
    }
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _authService.isAuthenticated;

  /// Get current customer
  Customer? get currentCustomer => _authService.currentCustomer;

  /// Get customer token
  String? get customerToken => _authService.customerToken;

  /// Get cart information
  Cart? get currentCart => _cartService.currentCart;

  /// Get cart items count
  int get cartItemsCount => _cartService.itemsCount;

  /// Get cart total
  double get cartTotal => _cartService.cartTotal;

  /// Check if cart is empty
  bool get isCartEmpty => _cartService.isCartEmpty;

  /// Authenticate customer
  Future<dynamic> authenticate({
    required String email,
    required String password,
  }) async {
    _checkInitialization();
    return await _authService.authenticate(email: email, password: password);
  }

  /// Create customer account
  Future<dynamic> createAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    Map<String, dynamic>? additionalData,
  }) async {
    _checkInitialization();
    return await _authService.createAccount(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      additionalData: additionalData,
    );
  }

  /// Logout customer
  Future<void> logout() async {
    _checkInitialization();
    await _authService.logout();
    _cartService.reset();
  }

  /// Get products (using GraphQL by default)
  Future<Map<String, dynamic>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
    bool useGraphQL = true,
  }) async {
    _checkInitialization();

    if (useGraphQL) {
      try {
        return await _apiService.getProductsGraphQL(
          page: page,
          pageSize: pageSize,
          searchQuery: searchQuery,
          categoryId: categoryId,
          sortBy: sortBy,
          sortOrder: sortOrder,
          filters: filters,
        );
      } catch (e) {
        if (kDebugMode) {
          print('GraphQL failed, falling back to REST: $e');
        }
        // Fallback to REST API
      }
    }

    return await _apiService.getProducts(
      page: page,
      pageSize: pageSize,
      searchQuery: searchQuery,
      categoryId: categoryId,
      sortBy: sortBy,
      sortOrder: sortOrder,
      filters: filters,
    );
  }

  /// Get product by SKU (using GraphQL by default)
  Future<dynamic> getProduct(String sku, {bool useGraphQL = true}) async {
    _checkInitialization();

    if (useGraphQL) {
      try {
        final product = await _apiService.getProductGraphQL(sku);
        if (product != null) {
          return product;
        }
      } catch (e) {
        if (kDebugMode) {
          print('GraphQL failed, falling back to REST: $e');
        }
        // Fallback to REST API
      }
    }

    return await _apiService.getProduct(sku);
  }

  /// Search products (using GraphQL by default)
  Future<Map<String, dynamic>> searchProducts(
    String query, {
    int page = 1,
    int pageSize = 20,
    bool useGraphQL = true,
  }) async {
    _checkInitialization();

    if (useGraphQL) {
      try {
        return await _apiService.searchProductsGraphQL(
          query,
          page: page,
          pageSize: pageSize,
        );
      } catch (e) {
        if (kDebugMode) {
          print('GraphQL failed, falling back to REST: $e');
        }
        // Fallback to REST API
      }
    }

    return await _apiService.searchProducts(
      query,
      page: page,
      pageSize: pageSize,
    );
  }

  /// Get categories (using GraphQL by default)
  Future<List<Map<String, dynamic>>> getCategories({
    bool useGraphQL = true,
  }) async {
    _checkInitialization();

    if (useGraphQL) {
      try {
        return await _apiService.getCategoriesGraphQL();
      } catch (e) {
        if (kDebugMode) {
          print('GraphQL failed, falling back to REST: $e');
        }
        // Fallback to REST API
      }
    }

    return await _apiService.getCategories();
  }

  /// Get category by ID (REST API only)
  Future<Map<String, dynamic>> getCategory(int categoryId) async {
    _checkInitialization();
    return await _apiService.getCategory(categoryId);
  }

  /// Get products by category (using GraphQL by default)
  Future<Map<String, dynamic>> getProductsByCategory(
    String categoryId, {
    int page = 1,
    int pageSize = 20,
    String? sortBy,
    String? sortOrder,
    bool useGraphQL = true,
  }) async {
    _checkInitialization();

    if (useGraphQL) {
      try {
        return await _apiService.getProductsByCategoryGraphQL(
          categoryId,
          page: page,
          pageSize: pageSize,
          sortBy: sortBy,
          sortOrder: sortOrder,
        );
      } catch (e) {
        if (kDebugMode) {
          print('GraphQL failed, falling back to REST: $e');
        }
        // Fallback to REST API
      }
    }

    return await getProducts(
      categoryId: categoryId,
      page: page,
      pageSize: pageSize,
      sortBy: sortBy,
      sortOrder: sortOrder,
      useGraphQL: false,
    );
  }

  /// Create cart
  Future<String> createCart() async {
    _checkInitialization();
    return await _cartService.createCart();
  }

  /// Get cart
  Future<dynamic> getCart() async {
    _checkInitialization();
    return await _cartService.getCart();
  }

  /// Add product to cart
  Future<bool> addToCart({
    required String sku,
    required int quantity,
    Map<String, dynamic>? productOptions,
  }) async {
    _checkInitialization();
    return await _cartService.addToCart(
      sku: sku,
      quantity: quantity,
      productOptions: productOptions,
    );
  }

  /// Update cart item quantity
  Future<bool> updateCartItemQuantity({
    required int itemId,
    required int quantity,
  }) async {
    _checkInitialization();
    return await _cartService.updateQuantity(
      itemId: itemId,
      quantity: quantity,
    );
  }

  /// Remove item from cart
  Future<bool> removeFromCart(int itemId) async {
    _checkInitialization();
    return await _cartService.removeFromCart(itemId);
  }

  /// Clear cart
  Future<bool> clearCart() async {
    _checkInitialization();
    return await _cartService.clearCart();
  }

  /// Get customer orders
  Future<List<dynamic>> getCustomerOrders() async {
    _checkInitialization();
    return await _apiService.getCustomerOrders();
  }

  /// Get order by ID
  Future<dynamic> getOrder(String orderId) async {
    _checkInitialization();
    return await _apiService.getOrder(orderId);
  }

  /// Get wishlist
  Future<Map<String, dynamic>> getWishlist() async {
    _checkInitialization();
    return await _apiService.getWishlist();
  }

  /// Add product to wishlist
  Future<bool> addToWishlist(String sku) async {
    _checkInitialization();
    return await _apiService.addToWishlist(sku);
  }

  /// Remove product from wishlist
  Future<bool> removeFromWishlist(int itemId) async {
    _checkInitialization();
    return await _apiService.removeFromWishlist(itemId);
  }

  /// Estimate shipping
  Future<List<Map<String, dynamic>>> estimateShipping(
    Map<String, dynamic> address,
  ) async {
    _checkInitialization();
    return await _cartService.estimateShipping(address);
  }

  /// Get payment methods
  Future<List<Map<String, dynamic>>> getPaymentMethods() async {
    _checkInitialization();
    return await _cartService.getPaymentMethods();
  }

  /// Place order
  Future<Map<String, dynamic>> placeOrder(
    Map<String, dynamic> orderData,
  ) async {
    _checkInitialization();
    return await _cartService.placeOrder(orderData);
  }

  /// Check if product is in cart
  bool isProductInCart(String sku) {
    _checkInitialization();
    return _cartService.isProductInCart(sku);
  }

  /// Get product quantity in cart
  int getProductQuantityInCart(String sku) {
    _checkInitialization();
    return _cartService.getProductQuantity(sku);
  }

  /// Apply coupon code
  Future<bool> applyCoupon(String couponCode) async {
    _checkInitialization();
    return await _cartService.applyCoupon(couponCode);
  }

  /// Remove coupon code
  Future<bool> removeCoupon() async {
    _checkInitialization();
    return await _cartService.removeCoupon();
  }

  /// Check initialization
  void _checkInitialization() {
    if (!_isInitialized) {
      throw const MagentoException(
        'Flutter Magento not initialized. Call initialize() first.',
      );
    }
  }

  /// Get library version
  String get version => '1.0.0';

  /// Get library description
  String get description =>
      'Flutter plugin for integrating with Magento e-commerce platform';

  // ==================== GraphQL Specific Methods ====================

  /// Get store configuration via GraphQL
  Future<Map<String, dynamic>> getStoreConfig() async {
    _checkInitialization();
    return await _apiService.getStoreConfigGraphQL();
  }

  /// Get currency information via GraphQL
  Future<Map<String, dynamic>> getCurrency() async {
    _checkInitialization();
    return await _apiService.getCurrencyGraphQL();
  }

  /// Get CMS pages via GraphQL
  Future<List<Map<String, dynamic>>> getCmsPages() async {
    _checkInitialization();
    return await _apiService.getCmsPagesGraphQL();
  }

  /// Execute custom GraphQL query
  Future<Map<String, dynamic>?> executeGraphQL(
    String query, {
    Map<String, dynamic>? variables,
    String? operationName,
  }) async {
    _checkInitialization();
    return await _apiService.executeGraphQL(
      query,
      variables: variables,
      operationName: operationName,
    );
  }

  /// Check if GraphQL is available
  Future<bool> isGraphQLAvailable() async {
    _checkInitialization();
    try {
      await _apiService.getStoreConfigGraphQL();
      return true;
    } catch (e) {
      return false;
    }
  }

  // ==================== Advanced GraphQL Methods ====================

  /// Get detailed category tree via GraphQL
  Future<Map<String, dynamic>> getCategoryTree({int rootCategoryId = 2}) async {
    _checkInitialization();
    return await _apiService.getCategoryTreeGraphQL(
      rootCategoryId: rootCategoryId,
    );
  }

  /// Get product reviews via GraphQL
  Future<Map<String, dynamic>> getProductReviews(
    String sku, {
    int page = 1,
    int pageSize = 10,
  }) async {
    _checkInitialization();
    return await _apiService.getProductReviewsGraphQL(
      sku,
      page: page,
      pageSize: pageSize,
    );
  }

  /// Get product filters/facets via GraphQL
  Future<Map<String, dynamic>> getProductFilters({String? categoryId}) async {
    _checkInitialization();
    return await _apiService.getProductFiltersGraphQL(categoryId: categoryId);
  }

  /// Get wishlist via GraphQL (requires authentication)
  Future<Map<String, dynamic>> getWishlistGraphQL() async {
    _checkInitialization();
    return await _apiService.getWishlistGraphQL();
  }

  /// Get customer orders via GraphQL (requires authentication)
  Future<Map<String, dynamic>> getCustomerOrdersGraphQL({
    int page = 1,
    int pageSize = 10,
  }) async {
    _checkInitialization();
    return await _apiService.getCustomerOrdersGraphQL(
      page: page,
      pageSize: pageSize,
    );
  }

  /// Get detailed customer information via GraphQL (requires authentication)
  Future<Map<String, dynamic>> getCustomerInfoGraphQL() async {
    _checkInitialization();
    return await _apiService.getCustomerInfoGraphQL();
  }

  /// Get product recommendations via GraphQL
  Future<List<Map<String, dynamic>>> getProductRecommendations(
    String sku,
  ) async {
    _checkInitialization();
    return await _apiService.getProductRecommendationsGraphQL(sku);
  }

  /// Get available countries via GraphQL
  Future<List<Map<String, dynamic>>> getCountries() async {
    _checkInitialization();
    return await _apiService.getCountriesGraphQL();
  }

  /// Get search suggestions via GraphQL
  Future<Map<String, dynamic>> getSearchSuggestions(String query) async {
    _checkInitialization();
    return await _apiService.getSearchSuggestionsGraphQL(query);
  }
}
