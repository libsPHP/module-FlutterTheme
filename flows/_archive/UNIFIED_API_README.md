# Flutter Magento Unified API

## 🚀 Overview

The Flutter Magento library has been enhanced with a **unified API interface** that matches the React Native and React Web versions, providing cross-platform consistency and easier migration between platforms.

## ✨ What's New

### 🎯 **React-Style Static Methods**
- Static methods for easy access (like React versions)
- Unified parameter structure
- Consistent error handling
- Same method signatures across platforms

### 🔧 **Enhanced Product API**
- Custom attributes support
- Adapter system for type safety
- Auto-detection of custom attributes
- Validation and error handling

### 📱 **Unified Models**
- Compatible data structures
- Type-safe models
- JSON serialization support
- Cross-platform compatibility

## 📚 API Reference

### Initialization

```dart
// Initialize the library (React-style)
await FlutterMagento.initialize(
  baseUrl: 'https://your-magento-store.com',
  headers: {'Content-Type': 'application/json'},
  supportedLanguages: ['en', 'ru', 'de'],
);
```

### Authentication

```dart
// Login user
final result = await FlutterMagento.login(
  'user@example.com',
  'password123',
  true, // rememberMe
);

// Register new user
final registerResult = await FlutterMagento.register(
  email: 'new@example.com',
  password: 'password123',
  firstName: 'John',
  lastName: 'Doe',
);

// Logout
await FlutterMagento.logout();
```

### Products

```dart
// Get products
final products = await FlutterMagento.getProducts(
  page: 1,
  pageSize: 20,
  searchQuery: 'laptop',
  sortBy: 'price',
  sortOrder: 'asc',
);

// Get single product
final product = await FlutterMagento.getProduct('SKU123');

// Search products
final searchResults = await FlutterMagento.searchProducts(
  'smartphone',
  page: 1,
  pageSize: 10,
);
```

### Cart Operations

```dart
// Add to cart
await FlutterMagento.addToCart(
  sku: 'laptop-001',
  quantity: 1,
  productOptions: {'color': 'black'},
);

// Get cart
final cart = await FlutterMagento.getCart();

// Remove from cart
await FlutterMagento.removeFromCart(itemId);

// Clear cart
await FlutterMagento.clearCart();
```

### Orders

```dart
// Get customer orders
final orders = await FlutterMagento.getOrders(
  page: 1,
  pageSize: 20,
);

// Get single order
final order = await FlutterMagento.getOrder('ORDER123');
```

### Wishlist

```dart
// Get wishlist
final wishlist = await FlutterMagento.getWishlist();

// Add to wishlist
await FlutterMagento.addToWishlist('SKU123');

// Remove from wishlist
await FlutterMagento.removeFromWishlist(itemId);
```

### Enhanced Products

```dart
// Get enhanced products with custom attributes
final products = await FlutterMagento.enhancedProducts.getEnhancedProducts<MyProductModel>(
  adapterId: 'my_custom_adapter',
  page: 1,
  pageSize: 20,
  customFilters: {
    'brand': 'Apple',
    'price': {'gt': '100'},
  },
);

// Get single enhanced product
final product = await FlutterMagento.enhancedProducts.getEnhancedProduct<MyProductModel>(
  'SKU123',
  adapterId: 'my_custom_adapter',
);

// Search enhanced products
final searchResults = await FlutterMagento.enhancedProducts.searchEnhancedProducts<MyProductModel>(
  'smartphone',
  adapterId: 'my_custom_adapter',
);
```

### Service Access

```dart
// Access services (like React versions)
final authService = FlutterMagento.auth;
final cartService = FlutterMagento.cart;
final networkService = FlutterMagento.network;
final offlineService = FlutterMagento.offline;
final localizationService = FlutterMagento.localization;
final notificationService = FlutterMagento.notifications;
final deviceInfoService = FlutterMagento.deviceInfo;
final syncService = FlutterMagento.sync;
final imageCacheService = FlutterMagento.imageCache;
final cloudFeatureService = FlutterMagento.cloudFeatures;
final checkoutApi = FlutterMagento.checkout;
final customerApi = FlutterMagento.customer;
final enhancedProductApi = FlutterMagento.enhancedProducts;
```

### Utility Methods

```dart
// Check status
final isInitialized = FlutterMagento.isInitialized;
final isAuthenticated = FlutterMagento.isAuthenticated;
final isOnline = FlutterMagento.isOnline;
final currentCustomer = FlutterMagento.currentCustomer;
final cartItemsCount = FlutterMagento.cartItemsCount;
final cartTotal = FlutterMagento.cartTotal;

// Localization
final currentLocale = FlutterMagento.currentLocale;
final translatedText = FlutterMagento.translate('product.add_to_cart');
await FlutterMagento.setLocale('ru');
final formattedPrice = FlutterMagento.formatCurrency(99.99, 'USD');
final formattedDate = FlutterMagento.formatDate(DateTime.now());

// Service status
final status = FlutterMagento.serviceStatus;
```

## 🔄 Migration from Legacy API

### Before (Legacy Flutter Style)
```dart
final core = FlutterMagentoCore.instance;
await core.initialize(baseUrl: 'https://store.com');
final result = await core.authenticate(email: 'user@example.com', password: 'password');
final products = await core.getProducts(page: 1, pageSize: 20);
```

### After (Unified React Style)
```dart
await FlutterMagento.initialize(baseUrl: 'https://store.com');
final result = await FlutterMagento.login('user@example.com', 'password');
final products = await FlutterMagento.getProducts(page: 1, pageSize: 20);
```

## 🎯 Benefits

### ✅ **Cross-Platform Consistency**
- Same API across Flutter, React Native, and React Web
- Easy migration between platforms
- Consistent developer experience

### ✅ **Enhanced Functionality**
- Custom attributes support
- Type-safe models
- Better error handling
- Improved performance

### ✅ **Developer Experience**
- Static methods for easy access
- IntelliSense support
- Better documentation
- Comprehensive examples

## 📖 Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInitialized = false;
  List<dynamic> _products = [];

  @override
  void initState() {
    super.initState();
    _initializeMagento();
  }

  Future<void> _initializeMagento() async {
    final success = await FlutterMagento.initialize(
      baseUrl: 'https://your-magento-store.com',
      headers: {'Content-Type': 'application/json'},
      supportedLanguages: ['en', 'ru'],
    );

    if (success) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  Future<void> _login() async {
    final result = await FlutterMagento.login(
      'user@example.com',
      'password123',
      true, // rememberMe
    );

    if (result.success) {
      print('Logged in: ${result.customer?.firstName}');
    }
  }

  Future<void> _getProducts() async {
    final products = await FlutterMagento.getProducts(
      page: 1,
      pageSize: 20,
      searchQuery: 'laptop',
    );

    setState(() {
      _products = products['items'] ?? [];
    });
  }

  Future<void> _addToCart(String sku) async {
    final success = await FlutterMagento.addToCart(
      sku: sku,
      quantity: 1,
      productOptions: {'color': 'black'},
    );

    if (success) {
      print('Added to cart successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Magento Unified API')),
        body: _isInitialized
            ? Column(
                children: [
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: _getProducts,
                    child: Text('Get Products'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        final product = _products[index];
                        return ListTile(
                          title: Text(product['name']),
                          subtitle: Text('SKU: ${product['sku']}'),
                          trailing: ElevatedButton(
                            onPressed: () => _addToCart(product['sku']),
                            child: Text('Add to Cart'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
```

## 🔄 Backward Compatibility

The unified API is **fully backward compatible** with the existing Flutter Magento API:

```dart
// Old way still works
final core = FlutterMagentoCore.instance;
await core.initialize(baseUrl: 'https://store.com');

// New way also works
await FlutterMagento.initialize(baseUrl: 'https://store.com');
```

## 📁 New Files Added

- `lib/src/flutter_magento_unified.dart` - Unified API interface
- `lib/src/models/unified_models.dart` - Unified data models
- `lib/src/api/enhanced_product_api_unified.dart` - Enhanced Product API
- `lib/src/examples/unified_api_example.dart` - Usage examples
- `UNIFIED_API_MIGRATION.md` - Migration guide
- `UNIFIED_API_README.md` - This documentation

## 🚀 Getting Started

1. **Update your imports** to include the unified API
2. **Replace legacy calls** with unified static methods
3. **Add custom adapters** for enhanced product functionality
4. **Update your models** to use unified data structures
5. **Test thoroughly** to ensure compatibility

## 🆘 Support

- 📧 Email: support@nativemind.net
- 🐛 Issues: GitHub Issues
- 📚 Documentation: Wiki
- 💬 Community: Discord

---

**Ready to use the unified API?** Check out the [complete examples](lib/src/examples/unified_api_example.dart) and start building with cross-platform consistency! 🚀
