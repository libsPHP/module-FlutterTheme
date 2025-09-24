import 'result.dart';

/// Modern platform interface for the Flutter Magento plugin using Dart 3+ base classes.
///
/// This abstract base class defines the interface that platform-specific implementations
/// must follow to provide Magento e-commerce functionality across different platforms.
///
/// The interface includes methods for:
/// - Authentication and customer management
/// - Product catalog operations
/// - Shopping cart management
/// - Order processing
/// - Wishlist functionality
///
/// Using the `base` modifier ensures that this class can only be extended,
/// not implemented, providing better compile-time guarantees.
abstract base class FlutterMagentoPlatform {
  /// Private constructor to prevent direct instantiation.
  FlutterMagentoPlatform();

  static FlutterMagentoPlatform? _instance;

  /// The current instance of [FlutterMagentoPlatform].
  ///
  /// This getter provides access to the platform-specific implementation.
  /// If no instance has been set, it will throw an exception.
  static FlutterMagentoPlatform get instance {
    if (_instance == null) {
      throw StateError(
        'No platform implementation has been set. '
        'Make sure to call FlutterMagentoPlatform.instance = YourImplementation() '
        'before using the plugin.',
      );
    }
    return _instance!;
  }

  /// Sets the platform-specific implementation.
  ///
  /// This method should be called by platform-specific implementations
  /// to register themselves with the platform interface.
  static set instance(FlutterMagentoPlatform instance) {
    _instance = instance;
  }

  /// Resets the platform instance (useful for testing).
  static void reset() {
    _instance = null;
  }

  // ============================================================================
  // PLATFORM INFORMATION
  // ============================================================================

  /// Get platform version.
  ///
  /// Returns the version of the platform-specific implementation.
  /// This is typically used for debugging and compatibility checks.
  Future<Result<String>> getPlatformVersion();

  // ============================================================================
  // INITIALIZATION
  // ============================================================================

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
  /// Returns a [Result] indicating success or failure.
  Future<Result<bool>> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
  });

  // ============================================================================
  // AUTHENTICATION
  // ============================================================================

  /// Authenticate customer with email and password.
  ///
  /// Attempts to log in a customer using their email and password credentials.
  /// Upon successful authentication, the customer token is stored for subsequent requests.
  ///
  /// [email] the customer's email address
  /// [password] the customer's password
  ///
  /// Returns a [Result] containing authentication success status.
  Future<Result<bool>> authenticateCustomer({
    required String email,
    required String password,
  });

  /// Create a new customer account.
  ///
  /// Registers a new customer in the Magento system with the provided information.
  ///
  /// [email] the customer's email address (must be unique)
  /// [password] the customer's password
  /// [firstName] the customer's first name
  /// [lastName] the customer's last name
  ///
  /// Returns a [Result] containing the created customer data or error information.
  Future<Result<Map<String, dynamic>>> createCustomer({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  /// Get current customer information.
  ///
  /// Retrieves the profile information of the currently authenticated customer.
  /// Requires the customer to be logged in.
  ///
  /// Returns a [Result] containing the customer's profile data or error information.
  Future<Result<Map<String, dynamic>>> getCurrentCustomer();

  /// Logout customer.
  ///
  /// Logs out the currently authenticated customer and clears their session.
  /// This invalidates the customer token and removes any stored authentication data.
  ///
  /// Returns a [Result] indicating success or failure.
  Future<Result<bool>> logout();

  /// Check if customer is authenticated.
  ///
  /// Returns true if a customer is currently logged in, false otherwise.
  bool get isAuthenticated;

  /// Get current customer token.
  ///
  /// Returns the authentication token for the currently logged-in customer,
  /// or null if no customer is authenticated.
  String? get customerToken;

  // ============================================================================
  // PRODUCT CATALOG
  // ============================================================================

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
  /// Returns a [Result] containing the product list and pagination info or error information.
  Future<Result<Map<String, dynamic>>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  });

  /// Get product by SKU.
  ///
  /// Retrieves detailed information about a specific product using its SKU.
  ///
  /// [sku] the product's SKU (Stock Keeping Unit)
  ///
  /// Returns a [Result] containing the product details or error information.
  Future<Result<Map<String, dynamic>>> getProduct(String sku);

  // ============================================================================
  // SHOPPING CART
  // ============================================================================

  /// Get cart information.
  ///
  /// Retrieves the current shopping cart contents and details.
  /// Works for both guest and authenticated customers.
  ///
  /// Returns a [Result] containing the cart data or error information.
  Future<Result<Map<String, dynamic>>> getCart();

  /// Add item to cart.
  ///
  /// Adds a product to the shopping cart with the specified quantity.
  ///
  /// [sku] the product's SKU to add
  /// [quantity] the quantity to add
  /// [productOption] optional product options (size, color, etc.)
  ///
  /// Returns a [Result] indicating success or failure.
  Future<Result<bool>> addToCart(
    String sku,
    int quantity, [
    Map<String, dynamic>? productOption,
  ]);

  /// Remove item from cart.
  ///
  /// Removes a specific item from the shopping cart.
  ///
  /// [itemId] the ID of the cart item to remove
  ///
  /// Returns a [Result] indicating success or failure.
  Future<Result<bool>> removeFromCart(String itemId);

  /// Update cart item quantity.
  ///
  /// Updates the quantity of a specific item in the shopping cart.
  ///
  /// [itemId] the ID of the cart item to update
  /// [quantity] the new quantity (0 will remove the item)
  ///
  /// Returns a [Result] indicating success or failure.
  Future<Result<bool>> updateCartItem(String itemId, int quantity);

  // ============================================================================
  // ORDERS
  // ============================================================================

  /// Get customer orders.
  ///
  /// Retrieves the order history for the currently authenticated customer.
  /// Requires customer authentication.
  ///
  /// Returns a [Result] containing the list of orders or error information.
  Future<Result<List<Map<String, dynamic>>>> getCustomerOrders();

  /// Get order by ID.
  ///
  /// Retrieves detailed information about a specific order.
  ///
  /// [orderId] the unique identifier of the order
  ///
  /// Returns a [Result] containing the order details or error information.
  Future<Result<Map<String, dynamic>>> getOrder(String orderId);

  // ============================================================================
  // WISHLIST
  // ============================================================================

  /// Get customer wishlist.
  ///
  /// Retrieves the wishlist items for the currently authenticated customer.
  /// Requires customer authentication.
  ///
  /// Returns a [Result] containing the wishlist data or error information.
  Future<Result<Map<String, dynamic>>> getWishlist();

  /// Add product to wishlist.
  ///
  /// Adds a product to the customer's wishlist.
  /// Requires customer authentication.
  ///
  /// [sku] the product's SKU to add to wishlist
  ///
  /// Returns a [Result] indicating success or failure.
  Future<Result<bool>> addToWishlist(String sku);

  /// Remove product from wishlist.
  ///
  /// Removes a product from the customer's wishlist.
  /// Requires customer authentication.
  ///
  /// [itemId] the ID of the wishlist item to remove
  ///
  /// Returns a [Result] indicating success or failure.
  Future<Result<bool>> removeFromWishlist(String itemId);
}
