# Flutter Magento Unified API Migration Guide

## 🚀 Overview

The Flutter Magento library now includes a **unified API interface** that matches the React Native and React Web versions, making it easy to switch between platforms while maintaining the same API.

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
- Type-safe models with Freezed
- JSON serialization support
- Cross-platform compatibility

## 🔄 Migration Guide

### From Legacy Flutter API to Unified API

#### Before (Legacy Flutter Style)
```dart
// Old way
final core = FlutterMagentoCore.instance;
await core.initialize(baseUrl: 'https://store.com');

final result = await core.authenticate(
  email: 'user@example.com',
  password: 'password',
);

final products = await core.getProducts(
  page: 1,
  pageSize: 20,
  searchQuery: 'laptop',
);
```

#### After (Unified React Style)
```dart
// New way - matches React Native/Web API
await FlutterMagento.initialize(
  baseUrl: 'https://store.com',
  headers: {'Content-Type': 'application/json'},
  supportedLanguages: ['en', 'ru'],
);

final result = await FlutterMagento.login(
  'user@example.com',
  'password',
  true, // rememberMe
);

final products = await FlutterMagento.getProducts(
  page: 1,
  pageSize: 20,
  searchQuery: 'laptop',
  sortBy: 'price',
  sortOrder: 'asc',
);
```

### Key Changes

| Aspect | Legacy Flutter | Unified API |
|--------|----------------|-------------|
| **Access** | `FlutterMagentoCore.instance` | `FlutterMagento` (static) |
| **Initialize** | `core.initialize()` | `FlutterMagento.initialize()` |
| **Login** | `core.authenticate()` | `FlutterMagento.login()` |
| **Products** | `core.getProducts()` | `FlutterMagento.getProducts()` |
| **Cart** | `core.addToCart()` | `FlutterMagento.addToCart()` |
| **Parameters** | Named parameters | Map-style parameters |

## 📚 New Features

### 1. Enhanced Product API

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

### 2. Unified Models

```dart
// Product parameters
final params = ProductParams(
  page: 1,
  pageSize: 20,
  searchQuery: 'laptop',
  sortBy: 'price',
  sortOrder: 'asc',
  filters: {'brand': 'Apple'},
);

// Cart item parameters
final cartItem = CartItemParams(
  sku: 'laptop-001',
  quantity: 1,
  productOptions: {'color': 'black'},
);

// Service status
final status = ServiceStatus(
  isInitialized: true,
  isAuthenticated: true,
  isOnline: true,
  cartItemsCount: 3,
  currentLocale: 'en',
);
```

### 3. React-Style Service Access

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

## 🔧 Configuration

### Environment Setup

```dart
// Development
await FlutterMagento.initialize(
  baseUrl: 'https://dev-store.com',
  headers: {
    'Content-Type': 'application/json',
    'X-API-Key': 'dev-key',
  },
  connectionTimeout: 30000,
  receiveTimeout: 30000,
  supportedLanguages: ['en', 'ru', 'de'],
);

// Production
await FlutterMagento.initialize(
  baseUrl: 'https://store.com',
  headers: {
    'Content-Type': 'application/json',
    'X-API-Key': 'prod-key',
    'X-Store-Code': 'default',
  },
  supportedLanguages: ['en', 'ru', 'de', 'fr', 'es'],
);
```

### Custom Headers

```dart
await FlutterMagento.initialize(
  baseUrl: 'https://store.com',
  headers: {
    'Authorization': 'Bearer token',
    'Accept-Language': 'en-US',
    'X-Custom-Header': 'value',
  },
);
```

## 🎯 Complete Example

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

## 🚀 Benefits

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

## 📖 Next Steps

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

**Ready to migrate?** Check out the [complete examples](src/examples/unified_api_example.dart) and start using the unified API today! 🚀
