import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../core/platform_interface.dart';
import '../core/result.dart';
import '../generated/api.dart';

/// Modern Method Channel implementation for Flutter Magento plugin.
///
/// This implementation uses the new base class architecture and Result pattern
/// for better type safety and error handling.
final class MethodChannelFlutterMagento extends FlutterMagentoPlatform {
  MethodChannelFlutterMagento() : super();

  static const MethodChannel _channel = MethodChannel('flutter_magento');

  final Logger _logger = Logger();

  String? _customerToken;
  bool _isAuthenticated = false;

  // ============================================================================
  // PLATFORM INFORMATION
  // ============================================================================

  @override
  Future<Result<String>> getPlatformVersion() async {
    try {
      final String version = await _channel.invokeMethod('getPlatformVersion');
      _logger.d('Platform version: $version');
      return ResultUtils.success(version);
    } on PlatformException catch (e) {
      _logger.e('Failed to get platform version', error: e);
      return ResultUtils.failure(
        'Failed to get platform version: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting platform version', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  // ============================================================================
  // INITIALIZATION
  // ============================================================================

  @override
  Future<Result<bool>> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
  }) async {
    try {
      final config = MagentoConfiguration(
        baseUrl: baseUrl,
        headers: headers,
        connectionTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
      );

      final bool success = await _channel.invokeMethod(
        'initializeMagento',
        config.encode(),
      );

      if (success) {
        _logger.i('Magento plugin initialized successfully');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Failed to initialize Magento plugin');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to initialize Magento plugin', error: e);
      return ResultUtils.failure(
        'Failed to initialize: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error during initialization', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  // ============================================================================
  // AUTHENTICATION
  // ============================================================================

  @override
  Future<Result<bool>> authenticateCustomer({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = CustomerCredentials(email: email, password: password);

      final Customer? customer = await _channel.invokeMethod(
        'authenticateCustomer',
        credentials.encode(),
      );

      if (customer != null) {
        _isAuthenticated = true;
        _customerToken = await _channel.invokeMethod('getCustomerToken');
        _logger.i('Customer authenticated successfully: ${customer.email}');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Invalid credentials');
      }
    } on PlatformException catch (e) {
      _logger.e('Authentication failed', error: e);
      return ResultUtils.failure(
        'Authentication failed: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error during authentication', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> createCustomer({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final customerData = CustomerData(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      final Customer? customer = await _channel.invokeMethod(
        'createCustomer',
        customerData.encode(),
      );

      if (customer != null) {
        _logger.i('Customer created successfully: ${customer.email}');
        return ResultUtils.success(customer.encode() as Map<String, dynamic>);
      } else {
        return ResultUtils.failure('Failed to create customer');
      }
    } on PlatformException catch (e) {
      _logger.e('Customer creation failed', error: e);
      return ResultUtils.failure(
        'Failed to create customer: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error during customer creation', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getCurrentCustomer() async {
    try {
      if (!_isAuthenticated) {
        return ResultUtils.failure('Customer not authenticated');
      }

      final Customer? customer = await _channel.invokeMethod(
        'getCurrentCustomer',
      );

      if (customer != null) {
        return ResultUtils.success(customer.encode() as Map<String, dynamic>);
      } else {
        return ResultUtils.failure('Failed to get customer information');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to get current customer', error: e);
      return ResultUtils.failure(
        'Failed to get customer: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting customer', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<bool>> logout() async {
    try {
      final bool success = await _channel.invokeMethod('logout');

      if (success) {
        _isAuthenticated = false;
        _customerToken = null;
        _logger.i('Customer logged out successfully');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Failed to logout');
      }
    } on PlatformException catch (e) {
      _logger.e('Logout failed', error: e);
      return ResultUtils.failure(
        'Logout failed: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error during logout', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  bool get isAuthenticated => _isAuthenticated;

  @override
  String? get customerToken => _customerToken;

  // ============================================================================
  // PRODUCT CATALOG
  // ============================================================================

  @override
  Future<Result<Map<String, dynamic>>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  }) async {
    try {
      final request = ProductRequest(
        page: page,
        pageSize: pageSize,
        searchQuery: searchQuery,
        categoryId: categoryId,
        sortBy: sortBy,
        sortOrder: sortOrder,
        filters: filters,
      );

      final ProductList? productList = await _channel.invokeMethod(
        'getProducts',
        request.encode() as Map<String, dynamic>,
      );

      if (productList != null) {
        return ResultUtils.success(
          productList.encode() as Map<String, dynamic>,
        );
      } else {
        return ResultUtils.failure('Failed to get products');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to get products', error: e);
      return ResultUtils.failure(
        'Failed to get products: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting products', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getProduct(String sku) async {
    try {
      final Product? product = await _channel.invokeMethod('getProduct', sku);

      if (product != null) {
        return ResultUtils.success(product.encode() as Map<String, dynamic>);
      } else {
        return ResultUtils.failure('Product not found');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to get product: $sku', error: e);
      return ResultUtils.failure(
        'Failed to get product: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting product', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  // ============================================================================
  // SHOPPING CART
  // ============================================================================

  @override
  Future<Result<Map<String, dynamic>>> getCart() async {
    try {
      final Cart? cart = await _channel.invokeMethod('getCart');

      if (cart != null) {
        return ResultUtils.success(cart.encode() as Map<String, dynamic>);
      } else {
        return ResultUtils.failure('Failed to get cart');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to get cart', error: e);
      return ResultUtils.failure(
        'Failed to get cart: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting cart', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<bool>> addToCart(
    String sku,
    int quantity, [
    Map<String, dynamic>? productOption,
  ]) async {
    try {
      final item = CartItem(
        sku: sku,
        quantity: quantity,
        productOptions: productOption,
      );

      final bool success = await _channel.invokeMethod(
        'addToCart',
        item.encode() as Map<String, dynamic>,
      );

      if (success) {
        _logger.d('Added $quantity x $sku to cart');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Failed to add item to cart');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to add item to cart', error: e);
      return ResultUtils.failure(
        'Failed to add to cart: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error adding to cart', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<bool>> removeFromCart(String itemId) async {
    try {
      final bool success = await _channel.invokeMethod(
        'removeFromCart',
        itemId,
      );

      if (success) {
        _logger.d('Removed item $itemId from cart');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Failed to remove item from cart');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to remove item from cart', error: e);
      return ResultUtils.failure(
        'Failed to remove from cart: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error removing from cart', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<bool>> updateCartItem(String itemId, int quantity) async {
    try {
      final bool success = await _channel.invokeMethod(
        'updateCartItemQuantity',
        {'itemId': itemId, 'quantity': quantity},
      );

      if (success) {
        _logger.d('Updated item $itemId quantity to $quantity');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Failed to update cart item');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to update cart item', error: e);
      return ResultUtils.failure(
        'Failed to update cart item: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error updating cart item', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  // ============================================================================
  // ORDERS
  // ============================================================================

  @override
  Future<Result<List<Map<String, dynamic>>>> getCustomerOrders() async {
    try {
      if (!_isAuthenticated) {
        return ResultUtils.failure('Customer not authenticated');
      }

      final List<Order>? orders = await _channel.invokeMethod(
        'getCustomerOrders',
      );

      if (orders != null) {
        final ordersData = orders
            .map((order) => order.encode() as Map<String, dynamic>)
            .toList();
        return ResultUtils.success(ordersData);
      } else {
        return ResultUtils.failure('Failed to get customer orders');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to get customer orders', error: e);
      return ResultUtils.failure(
        'Failed to get orders: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting customer orders', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getOrder(String orderId) async {
    try {
      final Order? order = await _channel.invokeMethod('getOrder', orderId);

      if (order != null) {
        return ResultUtils.success(order.encode() as Map<String, dynamic>);
      } else {
        return ResultUtils.failure('Order not found');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to get order: $orderId', error: e);
      return ResultUtils.failure(
        'Failed to get order: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting order', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  // ============================================================================
  // WISHLIST
  // ============================================================================

  @override
  Future<Result<Map<String, dynamic>>> getWishlist() async {
    try {
      if (!_isAuthenticated) {
        return ResultUtils.failure('Customer not authenticated');
      }

      final Wishlist? wishlist = await _channel.invokeMethod('getWishlist');

      if (wishlist != null) {
        return ResultUtils.success(wishlist.encode() as Map<String, dynamic>);
      } else {
        return ResultUtils.failure('Failed to get wishlist');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to get wishlist', error: e);
      return ResultUtils.failure(
        'Failed to get wishlist: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error getting wishlist', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<bool>> addToWishlist(String sku) async {
    try {
      if (!_isAuthenticated) {
        return ResultUtils.failure('Customer not authenticated');
      }

      final bool success = await _channel.invokeMethod('addToWishlist', sku);

      if (success) {
        _logger.d('Added $sku to wishlist');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Failed to add item to wishlist');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to add item to wishlist', error: e);
      return ResultUtils.failure(
        'Failed to add to wishlist: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error adding to wishlist', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }

  @override
  Future<Result<bool>> removeFromWishlist(String itemId) async {
    try {
      if (!_isAuthenticated) {
        return ResultUtils.failure('Customer not authenticated');
      }

      final bool success = await _channel.invokeMethod(
        'removeFromWishlist',
        itemId,
      );

      if (success) {
        _logger.d('Removed item $itemId from wishlist');
        return ResultUtils.success(true);
      } else {
        return ResultUtils.failure('Failed to remove item from wishlist');
      }
    } on PlatformException catch (e) {
      _logger.e('Failed to remove item from wishlist', error: e);
      return ResultUtils.failure(
        'Failed to remove from wishlist: ${e.message}',
        int.tryParse(e.code),
      );
    } catch (e) {
      _logger.e('Unexpected error removing from wishlist', error: e);
      return ResultUtils.failure('Unexpected error: $e');
    }
  }
}
