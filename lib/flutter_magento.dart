
import 'flutter_magento_platform_interface.dart';

/// A Flutter plugin for integrating with Magento e-commerce platform.
/// 
/// This plugin provides methods to interact with Magento REST API,
/// including authentication, products, cart, orders, and customer operations.
class FlutterMagento {
  /// Get the platform version.
  Future<String?> getPlatformVersion() {
    return FlutterMagentoPlatform.instance.getPlatformVersion();
  }

  /// Initialize the Magento plugin with base URL and configuration.
  Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
  }) {
    return FlutterMagentoPlatform.instance.initialize(
      baseUrl: baseUrl,
      headers: headers,
      connectionTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
    );
  }

  /// Authenticate customer with email and password.
  Future<bool> authenticateCustomer({
    required String email,
    required String password,
  }) {
    return FlutterMagentoPlatform.instance.authenticateCustomer(
      email: email,
      password: password,
    );
  }

  /// Create a new customer account.
  Future<Map<String, dynamic>?> createCustomer({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    return FlutterMagentoPlatform.instance.createCustomer(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
  }

  /// Get current customer information.
  Future<Map<String, dynamic>?> getCurrentCustomer() {
    return FlutterMagentoPlatform.instance.getCurrentCustomer();
  }

  /// Logout customer.
  Future<void> logout() {
    return FlutterMagentoPlatform.instance.logout();
  }

  /// Get products with pagination and filters.
  Future<Map<String, dynamic>?> getProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  }) {
    return FlutterMagentoPlatform.instance.getProducts(
      page: page,
      pageSize: pageSize,
      searchQuery: searchQuery,
      categoryId: categoryId,
      sortBy: sortBy,
      sortOrder: sortOrder,
      filters: filters,
    );
  }

  /// Get product by SKU.
  Future<Map<String, dynamic>?> getProduct(String sku) {
    return FlutterMagentoPlatform.instance.getProduct(sku);
  }

  /// Get cart information.
  Future<Map<String, dynamic>?> getCart() {
    return FlutterMagentoPlatform.instance.getCart();
  }

  /// Add item to cart.
  Future<bool> addToCart(String sku, int quantity, [Map<String, dynamic>? productOption]) {
    return FlutterMagentoPlatform.instance.addToCart(sku, quantity, productOption);
  }

  /// Remove item from cart.
  Future<bool> removeFromCart(String itemId) {
    return FlutterMagentoPlatform.instance.removeFromCart(itemId);
  }

  /// Update cart item quantity.
  Future<bool> updateCartItem(String itemId, int quantity) {
    return FlutterMagentoPlatform.instance.updateCartItem(itemId, quantity);
  }

  /// Get customer orders.
  Future<List<Map<String, dynamic>>?> getCustomerOrders() {
    return FlutterMagentoPlatform.instance.getCustomerOrders();
  }

  /// Get order by ID.
  Future<Map<String, dynamic>?> getOrder(String orderId) {
    return FlutterMagentoPlatform.instance.getOrder(orderId);
  }

  /// Get customer wishlist.
  Future<Map<String, dynamic>?> getWishlist() {
    return FlutterMagentoPlatform.instance.getWishlist();
  }

  /// Add product to wishlist.
  Future<bool> addToWishlist(String sku) {
    return FlutterMagentoPlatform.instance.addToWishlist(sku);
  }

  /// Remove product from wishlist.
  Future<bool> removeFromWishlist(String itemId) {
    return FlutterMagentoPlatform.instance.removeFromWishlist(itemId);
  }

  /// Check if customer is authenticated.
  bool get isAuthenticated => FlutterMagentoPlatform.instance.isAuthenticated;

  /// Get current customer token.
  String? get customerToken => FlutterMagentoPlatform.instance.customerToken;

  /// Get current error message.
  String? get error => FlutterMagentoPlatform.instance.error;

  /// Clear current error.
  void clearError() => FlutterMagentoPlatform.instance.clearError();
}
