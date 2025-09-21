import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_method_channel.dart';

/// Platform interface for the Flutter Magento plugin.
///
/// This abstract class defines the interface that platform-specific implementations
/// must follow to provide Magento e-commerce functionality across different platforms.
///
/// The interface includes methods for:
/// - Authentication and customer management
/// - Product catalog operations
/// - Shopping cart management
/// - Order processing
/// - Wishlist functionality
abstract class FlutterMagentoPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoPlatform.
  ///
  /// This constructor is used by platform-specific implementations
  /// to register themselves with the platform interface.
  FlutterMagentoPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoPlatform _instance = MethodChannelFlutterMagento();

  /// The default instance of [FlutterMagentoPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagento].
  static FlutterMagentoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Get platform version.
  ///
  /// Returns the version of the platform-specific implementation.
  /// This is typically used for debugging and compatibility checks.
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  /// Initialize the Magento plugin with base URL and configuration.
  ///
  /// This method must be called before using any other functionality.
  /// It sets up the connection to the Magento backend.
  ///
  /// [baseUrl] is the base URL of your Magento instance (e.g., "https://yourstore.com")
  /// [headers] optional custom headers to include with all requests
  /// [connectionTimeout] timeout for establishing connection in milliseconds
  /// [receiveTimeout] timeout for receiving data in milliseconds
  ///
  /// Returns `true` if initialization was successful, `false` otherwise.
  Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
  }) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  /// Authenticate customer with email and password.
  ///
  /// Attempts to log in a customer using their email and password credentials.
  /// Upon successful authentication, the customer token is stored for subsequent requests.
  ///
  /// [email] the customer's email address
  /// [password] the customer's password
  ///
  /// Returns `true` if authentication was successful, `false` otherwise.
  Future<bool> authenticateCustomer({
    required String email,
    required String password,
  }) {
    throw UnimplementedError(
      'authenticateCustomer() has not been implemented.',
    );
  }

  /// Create a new customer account.
  ///
  /// Registers a new customer in the Magento system with the provided information.
  ///
  /// [email] the customer's email address (must be unique)
  /// [password] the customer's password
  /// [firstName] the customer's first name
  /// [lastName] the customer's last name
  ///
  /// Returns a map containing the created customer data, or `null` if creation failed.
  Future<Map<String, dynamic>?> createCustomer({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    throw UnimplementedError('createCustomer() has not been implemented.');
  }

  /// Get current customer information.
  ///
  /// Retrieves the profile information of the currently authenticated customer.
  /// Requires the customer to be logged in.
  ///
  /// Returns a map containing the customer's profile data, or `null` if not authenticated.
  Future<Map<String, dynamic>?> getCurrentCustomer() {
    throw UnimplementedError('getCurrentCustomer() has not been implemented.');
  }

  /// Logout customer.
  ///
  /// Logs out the currently authenticated customer and clears their session.
  /// This invalidates the customer token and removes any stored authentication data.
  Future<void> logout() {
    throw UnimplementedError('logout() has not been implemented.');
  }

  /// Get products with pagination and filters.
  ///
  /// Retrieves a paginated list of products from the catalog with optional filtering.
  ///
  /// [page] the page number to retrieve (starts from 1)
  /// [pageSize] number of products per page (default: 20)
  /// [searchQuery] optional search term to filter products by name/description
  /// [categoryId] optional category ID to filter products by category
  /// [sortBy] field to sort by (e.g., 'name', 'price', 'created_at')
  /// [sortOrder] sort direction ('ASC' or 'DESC')
  /// [filters] additional custom filters to apply
  ///
  /// Returns a map containing the product list and pagination info, or `null` if failed.
  Future<Map<String, dynamic>?> getProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  }) {
    throw UnimplementedError('getProducts() has not been implemented.');
  }

  /// Get product by SKU.
  ///
  /// Retrieves detailed information about a specific product using its SKU.
  ///
  /// [sku] the product's SKU (Stock Keeping Unit)
  ///
  /// Returns a map containing the product details, or `null` if not found.
  Future<Map<String, dynamic>?> getProduct(String sku) {
    throw UnimplementedError('getProduct() has not been implemented.');
  }

  /// Get cart information.
  ///
  /// Retrieves the current shopping cart contents and details.
  /// Works for both guest and authenticated customers.
  ///
  /// Returns a map containing the cart data, or `null` if failed.
  Future<Map<String, dynamic>?> getCart() {
    throw UnimplementedError('getCart() has not been implemented.');
  }

  /// Add item to cart.
  ///
  /// Adds a product to the shopping cart with the specified quantity.
  ///
  /// [sku] the product's SKU to add
  /// [quantity] the quantity to add
  /// [productOption] optional product options (size, color, etc.)
  ///
  /// Returns `true` if item was added successfully, `false` otherwise.
  Future<bool> addToCart(
    String sku,
    int quantity, [
    Map<String, dynamic>? productOption,
  ]) {
    throw UnimplementedError('addToCart() has not been implemented.');
  }

  /// Remove item from cart.
  ///
  /// Removes a specific item from the shopping cart.
  ///
  /// [itemId] the ID of the cart item to remove
  ///
  /// Returns `true` if item was removed successfully, `false` otherwise.
  Future<bool> removeFromCart(String itemId) {
    throw UnimplementedError('removeFromCart() has not been implemented.');
  }

  /// Update cart item quantity.
  ///
  /// Updates the quantity of a specific item in the shopping cart.
  ///
  /// [itemId] the ID of the cart item to update
  /// [quantity] the new quantity (0 will remove the item)
  ///
  /// Returns `true` if quantity was updated successfully, `false` otherwise.
  Future<bool> updateCartItem(String itemId, int quantity) {
    throw UnimplementedError('updateCartItem() has not been implemented.');
  }

  /// Get customer orders.
  ///
  /// Retrieves the order history for the currently authenticated customer.
  /// Requires customer authentication.
  ///
  /// Returns a list of maps containing order data, or `null` if not authenticated or failed.
  Future<List<Map<String, dynamic>>?> getCustomerOrders() {
    throw UnimplementedError('getCustomerOrders() has not been implemented.');
  }

  /// Get order by ID.
  ///
  /// Retrieves detailed information about a specific order.
  ///
  /// [orderId] the unique identifier of the order
  ///
  /// Returns a map containing the order details, or `null` if not found.
  Future<Map<String, dynamic>?> getOrder(String orderId) {
    throw UnimplementedError('getOrder() has not been implemented.');
  }

  /// Get customer wishlist.
  ///
  /// Retrieves the wishlist items for the currently authenticated customer.
  /// Requires customer authentication.
  ///
  /// Returns a map containing the wishlist data, or `null` if not authenticated or failed.
  Future<Map<String, dynamic>?> getWishlist() {
    throw UnimplementedError('getWishlist() has not been implemented.');
  }

  /// Add product to wishlist.
  ///
  /// Adds a product to the customer's wishlist.
  /// Requires customer authentication.
  ///
  /// [sku] the product's SKU to add to wishlist
  ///
  /// Returns `true` if product was added successfully, `false` otherwise.
  Future<bool> addToWishlist(String sku) {
    throw UnimplementedError('addToWishlist() has not been implemented.');
  }

  /// Remove product from wishlist.
  ///
  /// Removes a product from the customer's wishlist.
  /// Requires customer authentication.
  ///
  /// [itemId] the ID of the wishlist item to remove
  ///
  /// Returns `true` if product was removed successfully, `false` otherwise.
  Future<bool> removeFromWishlist(String itemId) {
    throw UnimplementedError('removeFromWishlist() has not been implemented.');
  }

  /// Check if customer is authenticated.
  ///
  /// Returns `true` if a customer is currently logged in, `false` otherwise.
  bool get isAuthenticated =>
      throw UnimplementedError('isAuthenticated has not been implemented.');

  /// Get current customer token.
  ///
  /// Returns the authentication token for the currently logged-in customer,
  /// or `null` if no customer is authenticated.
  String? get customerToken =>
      throw UnimplementedError('customerToken has not been implemented.');

  /// Get current error message.
  ///
  /// Returns the last error message that occurred during an operation,
  /// or `null` if no error has occurred.
  String? get error =>
      throw UnimplementedError('error has not been implemented.');

  /// Clear current error.
  ///
  /// Clears any stored error message from previous operations.
  void clearError() =>
      throw UnimplementedError('clearError() has not been implemented.');
}
