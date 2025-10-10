import 'flutter_magento_core.dart';
import 'models/customer_models.dart';

/// Unified Flutter Magento API - React-style static interface
///
/// This class provides a unified API interface that matches the React Native
/// and React Web versions, making it easy to switch between platforms.
///
/// ## Usage
///
/// ```dart
/// // Initialize the library
/// await FlutterMagento.initialize({
///   baseUrl: 'https://your-magento-store.com',
///   headers: {'Content-Type': 'application/json'},
///   supportedLanguages: ['en', 'ru', 'de'],
/// });
///
/// // Authentication
/// final result = await FlutterMagento.login('user@example.com', 'password');
///
/// // Get products
/// final products = await FlutterMagento.getProducts({
///   page: 1,
///   pageSize: 20,
///   searchQuery: 'laptop',
/// });
///
/// // Add to cart
/// await FlutterMagento.addToCart({
///   sku: 'laptop-001',
///   quantity: 1,
/// });
/// ```
class FlutterMagento {
  static FlutterMagentoCore get _core => FlutterMagentoCore.instance;

  /// Initialize the library
  static Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
    String? adminToken,
    List<String>? supportedLanguages,
  }) async {
    return await _core.initialize(
      baseUrl: baseUrl,
      headers: headers,
      connectionTimeout: connectionTimeout ?? 30000,
      receiveTimeout: receiveTimeout ?? 30000,
      adminToken: adminToken,
    );
  }

  /// Get the core instance
  static FlutterMagentoCore get core => _core;

  /// Get API service
  static get api => _core.apiService;

  /// Get authentication service
  static get auth => _core.authService;

  /// Get cart service
  static get cart => _core.cartService;

  /// Get network service
  static get network => _core.apiService; // Using apiService as network service

  /// Get offline service
  static get offline => _core.apiService; // Using apiService as offline service

  /// Get localization service
  static get localization =>
      _core.apiService; // Using apiService as localization service

  /// Get notification service
  static get notifications =>
      _core.apiService; // Using apiService as notification service

  /// Get device info service
  static get deviceInfo =>
      _core.apiService; // Using apiService as device info service

  /// Get sync service
  static get sync => _core.apiService; // Using apiService as sync service

  /// Get image cache service
  static get imageCache =>
      _core.apiService; // Using apiService as image cache service

  /// Get cloud feature service
  static get cloudFeatures =>
      _core.apiService; // Using apiService as cloud feature service

  /// Get checkout API
  static get checkout => _core.apiService; // Using apiService as checkout API

  /// Get customer API
  static get customer => _core.apiService; // Using apiService as customer API

  /// Get enhanced product API
  static get enhancedProducts =>
      _core.apiService; // Using apiService as enhanced product API

  // ==================== Quick Access Methods ====================

  /// Login user
  static Future<AuthResult> login(
    String email,
    String password, [
    bool? rememberMe,
  ]) async {
    final result = await _core.authenticate(email: email, password: password);
    return AuthResult(
      success: result != null,
      customer: result is Map<String, dynamic>
          ? Customer.fromJson(result)
          : null,
      token: _core.customerToken,
      message: result != null ? 'Login successful' : 'Login failed',
    );
  }

  /// Register new user
  static Future<AuthResult> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final result = await _core.createAccount(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    return AuthResult(
      success: result != null,
      customer: result is Map<String, dynamic>
          ? Customer.fromJson(result)
          : null,
      token: _core.customerToken,
      message: result != null
          ? 'Registration successful'
          : 'Registration failed',
    );
  }

  /// Logout user
  static Future<void> logout() async {
    await _core.logout();
  }

  /// Get products
  static Future<Map<String, dynamic>> getProducts({
    int? page,
    int? pageSize,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  }) async {
    return await _core.getProducts(
      page: page ?? 1,
      pageSize: pageSize ?? 20,
      searchQuery: searchQuery,
      categoryId: categoryId,
      sortBy: sortBy,
      sortOrder: sortOrder,
      filters: filters,
    );
  }

  /// Get single product
  static Future<dynamic> getProduct(String sku) async {
    return await _core.getProduct(sku);
  }

  /// Search products
  static Future<Map<String, dynamic>> searchProducts(
    String query, {
    int? page,
    int? pageSize,
  }) async {
    return await _core.searchProducts(
      query,
      page: page ?? 1,
      pageSize: pageSize ?? 20,
    );
  }

  /// Add item to cart
  static Future<bool> addToCart({
    required String sku,
    required int quantity,
    Map<String, dynamic>? productOptions,
  }) async {
    return await _core.addToCart(
      sku: sku,
      quantity: quantity,
      productOptions: productOptions,
    );
  }

  /// Get cart
  static Future<dynamic> getCart() async {
    return await _core.getCart();
  }

  /// Remove item from cart
  static Future<bool> removeFromCart(int itemId) async {
    return await _core.removeFromCart(itemId);
  }

  /// Clear cart
  static Future<bool> clearCart() async {
    return await _core.clearCart();
  }

  /// Get customer orders
  static Future<List<dynamic>> getOrders({int? page, int? pageSize}) async {
    return await _core.getCustomerOrders();
  }

  /// Get single order
  static Future<dynamic> getOrder(String orderId) async {
    return await _core.getOrder(orderId);
  }

  /// Get wishlist
  static Future<Map<String, dynamic>> getWishlist() async {
    return await _core.getWishlist();
  }

  /// Add to wishlist
  static Future<bool> addToWishlist(String sku) async {
    return await _core.addToWishlist(sku);
  }

  /// Remove from wishlist
  static Future<bool> removeFromWishlist(int itemId) async {
    return await _core.removeFromWishlist(itemId);
  }

  // ==================== Utility Methods ====================

  /// Check if library is initialized
  static bool get isInitialized => _core.isInitialized;

  /// Check if user is authenticated
  static bool get isAuthenticated => _core.isAuthenticated;

  /// Check if online
  static bool get isOnline => _core.isOnline;

  /// Get current customer
  static Customer? get currentCustomer => _core.currentCustomer;

  /// Get cart items count
  static int get cartItemsCount => _core.cartItemsCount;

  /// Get cart total
  static double get cartTotal => _core.cartTotal;

  /// Get current locale
  static String get currentLocale => 'en'; // Default locale

  /// Translate text
  static String translate(String key, [Map<String, dynamic>? params]) {
    // Simple translation implementation
    return key;
  }

  /// Set locale
  static Future<bool> setLocale(String locale) async {
    // Simple locale setting implementation
    return true;
  }

  /// Format currency
  static String formatCurrency(double amount, [String currency = 'USD']) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  /// Format date
  static String formatDate(DateTime date, [Map<String, dynamic>? options]) {
    return date.toString();
  }

  /// Reset library
  static Future<void> reset() async {
    _core.reset();
  }

  /// Get version
  static String get version => _core.version;

  /// Get description
  static String get description => _core.description;

  /// Get service status
  static Map<String, dynamic> get serviceStatus => {
    'isInitialized': _core.isInitialized,
    'isAuthenticated': _core.isAuthenticated,
    'isOnline': _core.isOnline,
    'cartItemsCount': _core.cartItemsCount,
    'currentLocale': currentLocale,
  };
}

/// Auth result model for unified API
class AuthResult {
  final bool success;
  final Customer? customer;
  final String? token;
  final String? message;

  const AuthResult({
    required this.success,
    this.customer,
    this.token,
    this.message,
  });

  Map<String, dynamic> toJson() => {
    'success': success,
    'customer': customer?.toJson(),
    'token': token,
    'message': message,
  };
}
