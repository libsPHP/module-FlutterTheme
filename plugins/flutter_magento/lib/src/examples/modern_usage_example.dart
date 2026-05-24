/// Example of modern Flutter Magento plugin usage with 2025 best practices.
///
/// This example demonstrates how to use the new architecture with:
/// - Base classes for type safety
/// - Result pattern for error handling
/// - Proper initialization and authentication flow

import '../core/platform_interface.dart';
import '../core/result.dart';
import '../implementations/method_channel_implementation.dart';

/// Example of modern Magento plugin usage
class ModernMagentoUsageExample {
  late FlutterMagentoPlatform _magento;

  /// Initialize the plugin with modern architecture
  Future<void> initializePlugin() async {
    // Set the platform implementation
    FlutterMagentoPlatform.instance = MethodChannelFlutterMagento();
    _magento = FlutterMagentoPlatform.instance;

    // Initialize with configuration
    final initResult = await _magento.initialize(
      baseUrl: 'https://your-magento-store.com',
      headers: {
        'User-Agent': 'Flutter-Magento-Plugin/3.1.1',
        'Accept': 'application/json',
      },
      connectionTimeout: 30000,
      receiveTimeout: 30000,
    );

    // Handle result with modern pattern
    initResult
        .onSuccess((success) => print('✅ Plugin initialized successfully'))
        .onFailure(
          (message, code) =>
              print('❌ Initialization failed: $message (code: $code)'),
        );
  }

  /// Example of customer authentication with Result pattern
  Future<void> authenticateCustomer() async {
    final authResult = await _magento.authenticateCustomer(
      email: 'customer@example.com',
      password: 'securePassword123',
    );

    authResult
        .map((success) => 'Authentication successful!')
        .onSuccess((message) => print('✅ $message'))
        .onFailure((message, code) => print('❌ Auth failed: $message'));
  }

  /// Example of getting products with error handling
  Future<void> getProducts() async {
    final productsResult = await _magento.getProducts(
      page: 1,
      pageSize: 20,
      searchQuery: 'laptop',
      sortBy: 'price',
      sortOrder: 'ASC',
    );

    productsResult
        .onSuccess((products) {
          print('✅ Found ${products['totalCount']} products');
          // Process products data
        })
        .onFailure((message, code) {
          print('❌ Failed to get products: $message');
          // Handle error appropriately
        });
  }

  /// Example of adding item to cart with proper error handling
  Future<void> addItemToCart() async {
    final addResult = await _magento.addToCart('SKU-12345', 2, {
      'color': 'blue',
      'size': 'L',
    });

    // Use getOrElse for default behavior
    final success = addResult.getOrElse(false);

    if (success) {
      print('✅ Item added to cart successfully');
    } else {
      final errorMessage = addResult.error ?? 'Unknown error';
      print('❌ Failed to add item: $errorMessage');
    }
  }

  /// Example of comprehensive error handling with Result pattern
  Future<void> comprehensiveExample() async {
    // Chain operations with proper error handling
    final productsResult = await _magento.getProducts(page: 1, pageSize: 10);

    if (productsResult.isSuccess) {
      final products = productsResult.data!;

      if (products['items'].isEmpty) {
        print('❌ No products available');
        return;
      }

      final firstProduct = products['items'][0];
      final sku = firstProduct['sku'];

      final addResult = await _magento.addToCart(sku, 1);

      addResult
          .onSuccess((_) => print('✅ Product added to cart successfully'))
          .onFailure((message, code) => print('❌ Operation failed: $message'));
    } else {
      print('❌ Failed to get products: ${productsResult.error}');
    }
  }

  /// Example of using Result pattern for conditional operations
  Future<void> conditionalOperations() async {
    // Check authentication status
    if (_magento.isAuthenticated) {
      print('✅ Customer is authenticated');

      // Get customer orders only if authenticated
      final ordersResult = await _magento.getCustomerOrders();

      ordersResult
          .onSuccess((orders) => print('✅ Found ${orders.length} orders'))
          .onFailure((message, _) => print('❌ Failed to get orders: $message'));
    } else {
      print('❌ Customer not authenticated');

      // Perform guest operations
      final cartResult = await _magento.getCart();
      cartResult.onSuccess(
        (cart) => print('✅ Guest cart has ${cart['itemsCount']} items'),
      );
    }
  }

  /// Example of handling multiple async operations
  Future<void> multipleOperations() async {
    // Perform multiple operations in parallel
    final results = await Future.wait([
      _magento.getProducts(page: 1, pageSize: 5),
      _magento.getCart(),
      if (_magento.isAuthenticated) _magento.getWishlist(),
    ]);

    final productsResult = results[0];
    final cartResult = results[1];

    productsResult.onSuccess(
      (products) => print('✅ Products: ${products['totalCount']}'),
    );
    cartResult.onSuccess(
      (cart) => print('✅ Cart: ${cart['itemsCount']} items'),
    );

    if (results.length > 2) {
      final wishlistResult = results[2];
      wishlistResult.onSuccess(
        (wishlist) => print('✅ Wishlist: ${wishlist['itemsCount']} items'),
      );
    }
  }
}

/// Extension methods for better Result handling
extension ResultExtensions on Result<bool> {
  /// Returns true if the operation was successful
  bool get isSuccessful => isSuccess && data == true;
}

/// Helper class for Result operations
class ResultUtils {
  /// Creates a success result
  static Result<T> success<T>(T data) => Success(data);

  /// Creates a failure result
  static Result<T> failure<T>(String message, [int? code]) =>
      Failure(message, code);

  /// Wraps a function that might throw in a Result
  static Result<T> tryCatch<T>(T Function() operation) {
    try {
      return Success(operation());
    } catch (e) {
      return Failure('Operation failed: $e');
    }
  }

  /// Wraps an async function that might throw in a Result
  static Future<Result<T>> tryCatchAsync<T>(
    Future<T> Function() operation,
  ) async {
    try {
      return Success(await operation());
    } catch (e) {
      return Failure('Operation failed: $e');
    }
  }
}
