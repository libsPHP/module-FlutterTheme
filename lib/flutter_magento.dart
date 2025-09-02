
library flutter_magento;

export 'src/flutter_magento_core.dart';
export 'src/services/magento_api_service.dart';
export 'src/services/auth_service.dart';
export 'src/services/cart_service.dart';
export 'src/models/customer.dart';
export 'src/models/product.dart';
export 'src/models/cart.dart';
export 'src/models/order.dart';
export 'src/exceptions/magento_exception.dart';

/// A Flutter plugin for integrating with Magento e-commerce platform.
/// 
/// This plugin provides methods to interact with Magento REST API,
/// including authentication, products, cart, orders, and customer operations.
class FlutterMagento {
  /// Get the platform version.
  Future<String?> getPlatformVersion() async {
    return '1.0.0';
  }

  /// Initialize the Magento plugin with base URL and configuration.
  Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
    String? adminToken,
  }) async {
    return await FlutterMagentoCore.instance.initialize(
      baseUrl: baseUrl,
      headers: headers,
      connectionTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      adminToken: adminToken,
    );
  }

  /// Authenticate customer with email and password.
  Future<dynamic> authenticateCustomer({
    required String email,
    required String password,
  }) async {
    return await FlutterMagentoCore.instance.authenticate(
      email: email,
      password: password,
    );
  }

  /// Create a new customer account.
  Future<dynamic> createCustomer({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    Map<String, dynamic>? additionalData,
  }) async {
    return await FlutterMagentoCore.instance.createAccount(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      additionalData: additionalData,
    );
  }

  /// Get current customer information.
  dynamic getCurrentCustomer() {
    return FlutterMagentoCore.instance.currentCustomer;
  }

  /// Logout customer.
  Future<void> logout() async {
    await FlutterMagentoCore.instance.logout();
  }

  /// Get products with pagination and filters.
  Future<Map<String, dynamic>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  }) async {
    return await FlutterMagentoCore.instance.getProducts(
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
  Future<dynamic> getProduct(String sku) async {
    return await FlutterMagentoCore.instance.getProduct(sku);
  }

  /// Search products.
  Future<Map<String, dynamic>> searchProducts(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    return await FlutterMagentoCore.instance.searchProducts(
      query,
      page: page,
      pageSize: pageSize,
    );
  }

  /// Get categories.
  Future<List<Map<String, dynamic>>> getCategories() async {
    return await FlutterMagentoCore.instance.getCategories();
  }

  /// Get category by ID.
  Future<Map<String, dynamic>> getCategory(int categoryId) async {
    return await FlutterMagentoCore.instance.getCategory(categoryId);
  }

  /// Get cart information.
  Future<dynamic> getCart() async {
    return await FlutterMagentoCore.instance.getCart();
  }

  /// Create cart.
  Future<String> createCart() async {
    return await FlutterMagentoCore.instance.createCart();
  }

  /// Add item to cart.
  Future<bool> addToCart({
    required String sku,
    required int quantity,
    Map<String, dynamic>? productOptions,
  }) async {
    return await FlutterMagentoCore.instance.addToCart(
      sku: sku,
      quantity: quantity,
      productOptions: productOptions,
    );
  }

  /// Remove item from cart.
  Future<bool> removeFromCart(int itemId) async {
    return await FlutterMagentoCore.instance.removeFromCart(itemId);
  }

  /// Update cart item quantity.
  Future<bool> updateCartItemQuantity({
    required int itemId,
    required int quantity,
  }) async {
    return await FlutterMagentoCore.instance.updateCartItemQuantity(
      itemId: itemId,
      quantity: quantity,
    );
  }

  /// Clear cart.
  Future<bool> clearCart() async {
    return await FlutterMagentoCore.instance.clearCart();
  }

  /// Get customer orders.
  Future<List<dynamic>> getCustomerOrders() async {
    return await FlutterMagentoCore.instance.getCustomerOrders();
  }

  /// Get order by ID.
  Future<dynamic> getOrder(String orderId) async {
    return await FlutterMagentoCore.instance.getOrder(orderId);
  }

  /// Get customer wishlist.
  Future<Map<String, dynamic>> getWishlist() async {
    return await FlutterMagentoCore.instance.getWishlist();
  }

  /// Add product to wishlist.
  Future<bool> addToWishlist(String sku) async {
    return await FlutterMagentoCore.instance.addToWishlist(sku);
  }

  /// Remove product from wishlist.
  Future<bool> removeFromWishlist(int itemId) async {
    return await FlutterMagentoCore.instance.removeFromWishlist(itemId);
  }

  /// Estimate shipping methods.
  Future<List<Map<String, dynamic>>> estimateShipping(Map<String, dynamic> address) async {
    return await FlutterMagentoCore.instance.estimateShipping(address);
  }

  /// Get payment methods.
  Future<List<Map<String, dynamic>>> getPaymentMethods() async {
    return await FlutterMagentoCore.instance.getPaymentMethods();
  }

  /// Place order.
  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> orderData) async {
    return await FlutterMagentoCore.instance.placeOrder(orderData);
  }

  /// Apply coupon code.
  Future<bool> applyCoupon(String couponCode) async {
    return await FlutterMagentoCore.instance.applyCoupon(couponCode);
  }

  /// Remove coupon code.
  Future<bool> removeCoupon() async {
    return await FlutterMagentoCore.instance.removeCoupon();
  }

  /// Check if customer is authenticated.
  bool get isAuthenticated => FlutterMagentoCore.instance.isAuthenticated;

  /// Get current customer token.
  String? get customerToken => FlutterMagentoCore.instance.customerToken;

  /// Get cart items count.
  int get cartItemsCount => FlutterMagentoCore.instance.cartItemsCount;

  /// Get cart total.
  double get cartTotal => FlutterMagentoCore.instance.cartTotal;

  /// Check if cart is empty.
  bool get isCartEmpty => FlutterMagentoCore.instance.isCartEmpty;

  /// Check if product is in cart.
  bool isProductInCart(String sku) {
    return FlutterMagentoCore.instance.isProductInCart(sku);
  }

  /// Get product quantity in cart.
  int getProductQuantityInCart(String sku) {
    return FlutterMagentoCore.instance.getProductQuantityInCart(sku);
  }

  /// Get library version.
  String get version => FlutterMagentoCore.instance.version;

  /// Get library description.
  String get description => FlutterMagentoCore.instance.description;

  /// Check if library is initialized.
  bool get isInitialized => FlutterMagentoCore.instance.isInitialized;

  /// Get base URL.
  String? get baseUrl => FlutterMagentoCore.instance.baseUrl;

  /// Reset library state.
  void reset() {
    FlutterMagentoCore.instance.reset();
  }
}
