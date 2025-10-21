# Flutter Integration Guide

This guide explains how to integrate your Flutter application with NativeMind FlutterTheme for Magento 2.

## 📋 Overview

The FlutterTheme module provides seamless integration between Flutter Web and Magento 2, passing configuration and enabling full e-commerce functionality.

## 🎯 Architecture

```
┌─────────────────────────────────────────────┐
│           Magento 2 Backend                 │
│  (Product Data, Cart, Checkout, etc.)       │
└─────────────────┬───────────────────────────┘
                  │ REST/GraphQL API
                  │
┌─────────────────▼───────────────────────────┐
│        FlutterTheme Module                  │
│  - Detects user agent                       │
│  - Passes config to Flutter                 │
│  - Serves Flutter or Fallback               │
└─────────────────┬───────────────────────────┘
                  │
    ┌─────────────┴─────────────┐
    │                           │
    ▼                           ▼
┌───────────┐           ┌──────────────┐
│  Flutter  │           │   Fallback   │
│  Web App  │           │     HTML     │
│           │           │  (for bots)  │
└───────────┘           └──────────────┘
```

## 🚀 Setup Your Flutter App

### 1. Add Dependencies

In your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_magento: ^4.0.0
  provider: ^6.0.0
  dio: ^5.0.0
  shared_preferences: ^2.0.0
```

### 2. Create Magento Configuration Class

Create `lib/config/magento_web_config.dart`:

```dart
import 'dart:js' as js;

class MagentoWebConfig {
  final String baseUrl;
  final String storeCode;
  final String currency;
  final String locale;

  MagentoWebConfig({
    required this.baseUrl,
    required this.storeCode,
    required this.currency,
    required this.locale,
  });

  /// Get configuration from JavaScript window object
  factory MagentoWebConfig.fromBrowser() {
    try {
      if (js.context.hasProperty('flutterConfiguration')) {
        final jsConfig = js.context['flutterConfiguration'];
        final magento = jsConfig['magento'];
        
        return MagentoWebConfig(
          baseUrl: magento['baseUrl'] as String,
          storeCode: magento['storeCode'] as String,
          currency: magento['currency'] as String,
          locale: magento['locale'] as String,
        );
      }
    } catch (e) {
      print('Error reading Magento config from browser: $e');
    }
    
    // Fallback for development
    return MagentoWebConfig._defaultConfig();
  }

  factory MagentoWebConfig._defaultConfig() {
    return MagentoWebConfig(
      baseUrl: const String.fromEnvironment(
        'MAGENTO_URL',
        defaultValue: 'https://demo.magento.com',
      ),
      storeCode: 'default',
      currency: 'USD',
      locale: 'en_US',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
      'storeCode': storeCode,
      'currency': currency,
      'locale': locale,
    };
  }
}
```

### 3. Initialize Flutter Magento

Create `lib/services/magento_service.dart`:

```dart
import 'package:flutter_magento/flutter_magento.dart';
import '../config/magento_web_config.dart';

class MagentoService {
  late final MagentoClient client;
  late final MagentoWebConfig config;

  MagentoService() {
    config = MagentoWebConfig.fromBrowser();
    
    client = MagentoClient(
      baseUrl: config.baseUrl,
      storeCode: config.storeCode,
    );
  }

  // Product operations
  Future<List<Product>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? categoryId,
  }) async {
    return await client.products.getProducts(
      page: page,
      pageSize: pageSize,
      categoryId: categoryId,
    );
  }

  // Category operations
  Future<Category> getCategory(String categoryId) async {
    return await client.categories.getCategory(categoryId);
  }

  // Cart operations
  Future<Cart> getCart() async {
    return await client.cart.getCart();
  }

  Future<Cart> addToCart(String sku, int quantity) async {
    return await client.cart.addItem(sku, quantity);
  }

  // Customer operations
  Future<Customer?> getCurrentCustomer() async {
    return await client.customer.getCurrentCustomer();
  }
}
```

### 4. Create Main App

Update `lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/magento_web_config.dart';
import 'services/magento_service.dart';
import 'screens/home_screen.dart';

void main() {
  final config = MagentoWebConfig.fromBrowser();
  
  print('Magento Configuration:');
  print('  Base URL: ${config.baseUrl}');
  print('  Store Code: ${config.storeCode}');
  print('  Currency: ${config.currency}');
  print('  Locale: ${config.locale}');
  
  runApp(MagentoStoreApp(config: config));
}

class MagentoStoreApp extends StatelessWidget {
  final MagentoWebConfig config;

  const MagentoStoreApp({
    Key? key,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MagentoWebConfig>.value(value: config),
        Provider<MagentoService>(
          create: (_) => MagentoService(),
        ),
      ],
      child: MaterialApp(
        title: 'Magento Store',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
```

### 5. Create Home Screen

Create `lib/screens/home_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/magento_service.dart';
import '../config/magento_web_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final config = context.read<MagentoWebConfig>();
    final service = context.read<MagentoService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magento Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Store info banner
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Row(
              children: [
                const Icon(Icons.store, color: Colors.blue),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Store: ${config.storeCode}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Currency: ${config.currency} | Locale: ${config.locale}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Product grid
          Expanded(
            child: FutureBuilder(
              future: service.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                
                final products = snapshot.data ?? [];
                
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(product: product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                image: product.image != null
                    ? DecorationImage(
                        image: NetworkImage(product.image),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

## 🔨 Building for Production

### 1. Build Flutter Web

```bash
# Build with CanvasKit renderer (better performance)
flutter build web --web-renderer canvaskit --release

# Or build with HTML renderer (smaller size)
flutter build web --web-renderer html --release

# Optimize build
flutter build web --web-renderer canvaskit --release --tree-shake-icons
```

### 2. Copy to Magento

```bash
# Copy entire build directory
cp -r build/web/* /path/to/magento/app/code/NativeMind/FlutterTheme/view/frontend/web/flutter/

# Or use rsync for incremental updates
rsync -av --delete build/web/ /path/to/magento/app/code/NativeMind/FlutterTheme/view/frontend/web/flutter/
```

### 3. Deploy in Magento

```bash
cd /path/to/magento
php bin/magento setup:static-content:deploy -f
php bin/magento cache:flush
```

## 🧪 Testing

### Local Development

Create `web/index.html` for local testing:

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Magento Store - Local Dev</title>
  <script>
    // Mock Magento configuration for local development
    window.flutterConfiguration = {
      magento: {
        baseUrl: 'https://demo.magento.com',
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US'
      }
    };
  </script>
</head>
<body>
  <script src="flutter_bootstrap.js" async></script>
</body>
</html>
```

Run locally:
```bash
flutter run -d chrome
```

## 📱 Advanced Features

### Handling Routes

Update router to work with Magento URLs:

```dart
import 'package:flutter/material.dart';

class MagentoRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/product':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ProductScreen(productId: args['id']),
        );
      case '/category':
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(categoryId: args['id']),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundScreen(),
        );
    }
  }
}
```

### State Management

Use Provider for global state:

```dart
class CartProvider extends ChangeNotifier {
  final MagentoService _service;
  Cart? _cart;

  CartProvider(this._service);

  Cart? get cart => _cart;

  Future<void> loadCart() async {
    _cart = await _service.getCart();
    notifyListeners();
  }

  Future<void> addItem(String sku, int quantity) async {
    _cart = await _service.addToCart(sku, quantity);
    notifyListeners();
  }
}
```

## 🔒 Security

### API Authentication

```dart
class MagentoClient {
  String? _customerToken;

  Future<void> login(String email, String password) async {
    final response = await dio.post('/rest/V1/integration/customer/token', 
      data: {
        'username': email,
        'password': password,
      },
    );
    
    _customerToken = response.data;
    // Save token securely
  }

  // Use token in requests
  Future<Customer> getCurrentCustomer() async {
    final response = await dio.get(
      '/rest/V1/customers/me',
      options: Options(
        headers: {'Authorization': 'Bearer $_customerToken'},
      ),
    );
    return Customer.fromJson(response.data);
  }
}
```

## 📚 Resources

- [Flutter Magento Plugin Documentation](https://pub.dev/packages/flutter_magento)
- [Magento REST API Reference](https://devdocs.magento.com/guides/v2.4/rest/bk-rest.html)
- [Flutter Web Documentation](https://flutter.dev/web)

---

Need help? Contact: contact@nativemind.net

