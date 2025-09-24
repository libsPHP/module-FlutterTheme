import 'package:pigeon/pigeon.dart';

/// Configuration for Pigeon code generation
@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/generated/api.dart',
    kotlinOut: 'android/src/main/kotlin/Api.g.kt',
    swiftOut: 'ios/Runner/Api.g.swift',
    dartPackageName: 'flutter_magento',
    kotlinOptions: KotlinOptions(
      package: 'ru.nativemind.flutter.magento.flutter_magento',
    ),
    swiftOptions: SwiftOptions(),
    dartOptions: DartOptions(),
  ),
)
/// Magento plugin API definition for type-safe platform communication
abstract class Api {
  /// Initialize the Magento plugin
  @async
  bool initializeMagento(MagentoConfiguration config);

  /// Get platform version
  @async
  String getPlatformVersion();

  /// Authenticate customer
  @async
  Customer? authenticateCustomer(CustomerCredentials credentials);

  /// Create new customer
  @async
  Customer? createCustomer(CustomerData customerData);

  /// Get current customer
  @async
  Customer? getCurrentCustomer();

  /// Logout customer
  @async
  bool logout();

  /// Check if customer is authenticated
  @async
  bool isAuthenticated();

  /// Get customer token
  @async
  String? getCustomerToken();

  /// Get products with filters
  @async
  ProductList? getProducts(ProductRequest request);

  /// Get product by SKU
  @async
  Product? getProduct(String sku);

  /// Get cart
  @async
  Cart? getCart();

  /// Add item to cart
  @async
  bool addToCart(CartItem item);

  /// Remove item from cart
  @async
  bool removeFromCart(String itemId);

  /// Update cart item quantity
  @async
  bool updateCartItemQuantity(String itemId, int quantity);

  /// Get customer orders
  @async
  List<Order>? getCustomerOrders();

  /// Get order by ID
  @async
  Order? getOrder(String orderId);

  /// Get wishlist
  @async
  Wishlist? getWishlist();

  /// Add product to wishlist
  @async
  bool addToWishlist(String sku);

  /// Remove product from wishlist
  @async
  bool removeFromWishlist(String itemId);
}

/// Magento configuration data
class MagentoConfiguration {
  MagentoConfiguration({
    required this.baseUrl,
    this.headers,
    this.connectionTimeout,
    this.receiveTimeout,
  });

  final String baseUrl;
  final Map<String, String>? headers;
  final int? connectionTimeout;
  final int? receiveTimeout;
}

/// Customer credentials for authentication
class CustomerCredentials {
  CustomerCredentials({required this.email, required this.password});

  final String email;
  final String password;
}

/// Customer data for registration
class CustomerData {
  CustomerData({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  final String email;
  final String password;
  final String firstName;
  final String lastName;
}

/// Customer information
class Customer {
  Customer({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.dateOfBirth,
    this.gender,
    this.customAttributes,
  });

  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phone;
  final String? dateOfBirth;
  final int? gender;
  final Map<String, dynamic>? customAttributes;
}

/// Product request parameters
class ProductRequest {
  ProductRequest({
    this.page = 1,
    this.pageSize = 20,
    this.searchQuery,
    this.categoryId,
    this.sortBy,
    this.sortOrder,
    this.filters,
  });

  final int page;
  final int pageSize;
  final String? searchQuery;
  final String? categoryId;
  final String? sortBy;
  final String? sortOrder;
  final Map<String, dynamic>? filters;
}

/// Product information
class Product {
  Product({
    required this.sku,
    required this.name,
    required this.price,
    this.description,
    this.shortDescription,
    this.images,
    this.customAttributes,
    this.stockStatus,
    this.quantity,
  });

  final String sku;
  final String name;
  final double price;
  final String? description;
  final String? shortDescription;
  final List<String>? images;
  final Map<String, dynamic>? customAttributes;
  final String? stockStatus;
  final int? quantity;
}

/// Product list with pagination
class ProductList {
  ProductList({
    required this.items,
    required this.totalCount,
    required this.pageSize,
    required this.currentPage,
    required this.totalPages,
  });

  final List<Product> items;
  final int totalCount;
  final int pageSize;
  final int currentPage;
  final int totalPages;
}

/// Cart item
class CartItem {
  CartItem({required this.sku, required this.quantity, this.productOptions});

  final String sku;
  final int quantity;
  final Map<String, dynamic>? productOptions;
}

/// Shopping cart
class Cart {
  Cart({
    required this.id,
    required this.items,
    required this.itemsCount,
    required this.itemsQty,
    required this.grandTotal,
    this.subtotal,
    this.taxAmount,
    this.discountAmount,
  });

  final String id;
  final List<CartItem> items;
  final int itemsCount;
  final int itemsQty;
  final double grandTotal;
  final double? subtotal;
  final double? taxAmount;
  final double? discountAmount;
}

/// Order information
class Order {
  Order({
    required this.id,
    required this.incrementId,
    required this.status,
    required this.state,
    required this.grandTotal,
    required this.createdAt,
    this.items,
    this.billingAddress,
    this.shippingAddress,
    this.paymentMethod,
    this.shippingMethod,
  });

  final String id;
  final String incrementId;
  final String status;
  final String state;
  final double grandTotal;
  final String createdAt;
  final List<CartItem>? items;
  final Map<String, dynamic>? billingAddress;
  final Map<String, dynamic>? shippingAddress;
  final String? paymentMethod;
  final String? shippingMethod;
}

/// Wishlist information
class Wishlist {
  Wishlist({required this.id, required this.items, required this.itemsCount});

  final String id;
  final List<Product> items;
  final int itemsCount;
}
