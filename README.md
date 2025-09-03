# 🚀 Flutter Magento Plugin

A comprehensive Flutter plugin for Magento e-commerce platform integration, providing 200+ functions for building modern mobile commerce applications.

## ✨ Features

### 🔐 Authentication & Customer Management
- Customer login/logout with JWT tokens
- Customer registration and profile management
- Password reset and change
- Social authentication (Google, Facebook, Apple)
- Address book management
- Customer preferences and groups

### 🛍️ Product Catalog & Management
- Product listing with advanced filters
- Product search with autocomplete
- Category management and navigation
- Product variants and options
- Product media gallery (images, videos, 360° views)
- Product reviews and ratings
- Related products and recommendations

### 🛒 Shopping Cart & Checkout
- Guest and customer cart management
- Add/remove/update cart items
- Apply coupons and gift cards
- Cart validation and totals
- Shipping estimation and methods
- Payment method selection
- Order placement and confirmation

### 📋 Order Management
- Order history and details
- Order status tracking
- Order cancellation and returns
- Invoice and shipment management
- Credit memo processing
- Reorder functionality

### ❤️ Wishlist & Favorites
- Multiple wishlist support
- Add/remove products
- Share wishlists
- Wishlist to cart conversion
- Wishlist analytics

### 🔍 Advanced Search & Filtering
- Full-text search with suggestions
- Attribute-based filtering
- Price range filtering
- Availability filtering
- Filter combinations and saving
- Search analytics and trends

### 📱 Enhanced User Experience
- Offline mode support
- Performance optimization
- Push notifications
- Multi-language support
- Dark/light theme support

## 🚀 Getting Started

### Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_magento: ^2.0.0
```

### Basic Usage

```dart
import 'package:flutter_magento/flutter_magento.dart';

void main() async {
  // Initialize the plugin
  final magento = FlutterMagento();
  
  await magento.initialize(
    baseUrl: 'https://your-magento-store.com',
    headers: {'Content-Type': 'application/json'},
  );
  
  // Authenticate customer
  try {
    final authResponse = await magento.authenticateCustomer(
      email: 'customer@example.com',
      password: 'password123',
    );
    
    print('Customer authenticated: ${authResponse.customer.firstName}');
  } catch (e) {
    print('Authentication failed: $e');
  }
}
```

## 📚 API Reference

### Authentication

```dart
// Customer login
final authResponse = await magento.authenticateCustomer(
  email: 'customer@example.com',
  password: 'password123',
);

// Customer registration
final customer = await magento.createCustomer(
  email: 'new@example.com',
  password: 'password123',
  firstName: 'John',
  lastName: 'Doe',
);

// Get current customer
final currentCustomer = await magento.getCurrentCustomer();

// Logout
await magento.logout();
```

### Products

```dart
// Get products with filters
final products = await magento.getProducts(
  page: 1,
  pageSize: 20,
  searchQuery: 'phone',
  categoryId: '123',
  sortBy: 'price',
  sortOrder: 'asc',
  filters: {'brand': 'Apple'},
);

// Get single product
final product = await magento.getProduct('SKU123');

// Search products
final searchResults = await magento.searchProducts(
  'smartphone',
  page: 1,
  pageSize: 20,
);

// Get product reviews
final reviews = await magento.getProductReviews('SKU123');
```

### Cart Management

```dart
// Create cart
final cart = await magento.createCart();

// Add item to cart
final updatedCart = await magento.addToCart(
  cartId: cart.id!,
  sku: 'SKU123',
  quantity: 2,
);

// Get cart totals
final totals = await magento.getCartTotals(cart.id!);

// Apply coupon
final cartWithCoupon = await magento.applyCoupon(
  cartId: cart.id!,
  couponCode: 'SAVE20',
);

// Estimate shipping
final shippingMethods = await magento.estimateShipping(
  cartId: cart.id!,
  address: shippingAddress,
);
```

### Orders

```dart
// Get customer orders
final orders = await magento.getCustomerOrders(
  page: 1,
  pageSize: 20,
);

// Get order details
final order = await magento.getOrder('ORDER123');

// Get order status
final status = await magento.getOrderStatus('ORDER123');

// Cancel order
final cancelled = await magento.cancelOrder(
  'ORDER123',
  reason: 'Changed mind',
);

// Reorder
final newCart = await magento.reorder('ORDER123');
```

### Wishlist

```dart
// Get wishlist
final wishlist = await magento.getWishlist();

// Add to wishlist
final wishlistItem = await magento.addToDefaultWishlist(
  productId: '123',
);

// Remove from wishlist
final removed = await magento.removeFromDefaultWishlist(1);

// Share wishlist
final shared = await magento.shareDefaultWishlist(
  email: 'friend@example.com',
  message: 'Check out my wishlist!',
);

// Add all to cart
final addedToCart = await magento.addAllDefaultWishlistToCart();
```

### Advanced Search

```dart
// Advanced search
final searchResults = await magento.search(
  query: 'smartphone',
  filters: {'brand': 'Apple', 'price': '100-500'},
  page: 1,
  pageSize: 20,
  sortBy: 'price',
  sortOrder: 'asc',
);

// Search by category
final categoryResults = await magento.searchByCategory(
  categoryId: '123',
  query: 'phone',
);

// Search by attribute
final attributeResults = await magento.searchByAttribute(
  attribute: 'brand',
  value: 'Apple',
);

// Get search suggestions
final suggestions = await magento.getSearchSuggestions('smart');

// Get filterable attributes
final attributes = await magento.getFilterableAttributes();

// Apply price filter
final priceFiltered = await magento.applyPriceFilter(
  minPrice: 100.0,
  maxPrice: 500.0,
);
```

## 🏗️ Architecture

The plugin follows a clean architecture pattern with the following layers:

- **API Layer**: HTTP client with Dio, REST API integration
- **Service Layer**: Business logic and data processing
- **Model Layer**: Data models with JSON serialization
- **Plugin Layer**: Flutter plugin interface

### Directory Structure

```
lib/
├── src/
│   ├── api/           # API classes
│   │   ├── auth_api.dart
│   │   ├── product_api.dart
│   │   ├── cart_api.dart
│   │   ├── order_api.dart
│   │   ├── wishlist_api.dart
│   │   └── search_api.dart
│   ├── models/        # Data models
│   │   ├── auth_models.dart
│   │   ├── product_models.dart
│   │   ├── cart_models.dart
│   │   ├── order_models.dart
│   │   ├── wishlist_models.dart
│   │   └── search_models.dart
│   └── flutter_magento_plugin.dart
├── flutter_magento.dart
└── flutter_magento_platform_interface.dart
```

## 🔧 Configuration

### Environment Setup

```dart
// Development
await magento.initialize(
  baseUrl: 'https://dev-store.com',
  connectionTimeout: 30000,
  receiveTimeout: 30000,
);

// Production
await magento.initialize(
  baseUrl: 'https://store.com',
  headers: {
    'X-API-Key': 'your-api-key',
    'X-Store-Code': 'default',
  },
);
```

### Custom Headers

```dart
await magento.initialize(
  baseUrl: 'https://store.com',
  headers: {
    'Authorization': 'Bearer token',
    'Accept-Language': 'en-US',
    'X-Custom-Header': 'value',
  },
);
```

## 🧪 Testing

```bash
# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Generate code
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🔒 Security Features

- JWT token authentication
- HTTPS enforcement
- Input validation and sanitization
- Secure token storage
- Rate limiting support
- CSRF protection

## 📊 Performance Features

- Request caching
- Image optimization
- Lazy loading support
- Offline mode
- Background sync
- Memory management

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- 📧 Email: support@nativemind.net
- 🐛 Issues: [GitHub Issues](https://github.com/nativemind/flutter_magento/issues)
- 📚 Documentation: [Wiki](https://github.com/nativemind/flutter_magento/wiki)
- 💬 Community: [Discord](https://discord.gg/nativemind)

## 🙏 Acknowledgments

- Magento team for the excellent e-commerce platform
- Flutter team for the amazing framework
- ScandiPWA team for inspiration and best practices
- All contributors and community members

---

**Made with ❤️ by NativeMind Team**