# Flutter Magento

[![Flutter](https://img.shields.io/badge/Flutter-3.10.0+-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2.3+-blue.svg)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A comprehensive Flutter plugin for integrating with Magento e-commerce platform. This library provides a complete solution for building Flutter applications that interact with Magento stores through REST API.

## 🚀 Features

- **Customer Management**: Authentication, registration, profile management
- **Product Catalog**: Browse products, search, categories, filters
- **Shopping Cart**: Add/remove items, update quantities, apply coupons
- **Order Management**: View orders, order history, order details
- **Wishlist**: Add/remove products, manage wishlist
- **Checkout**: Shipping estimation, payment methods, order placement
- **Secure Storage**: Token management, secure data storage
- **Error Handling**: Comprehensive error handling with custom exceptions
- **Type Safety**: Full type safety with Freezed models
- **Modern Architecture**: Clean architecture with service layer pattern

## 📋 Requirements

- Flutter 3.10.0 or higher
- Dart 3.2.3 or higher
- Magento 2.x store with REST API enabled
- Internet connection for API calls

## 📦 Installation

Add the following dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_magento: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 🔧 Setup

### 1. Initialize the Library

```dart
import 'package:flutter_magento/flutter_magento.dart';

void main() async {
  final magento = FlutterMagento();
  
  final success = await magento.initialize(
    baseUrl: 'https://your-magento-store.com',
    headers: {
      'User-Agent': 'YourApp/1.0.0',
    },
    connectionTimeout: 30000,
    receiveTimeout: 30000,
  );
  
  if (success) {
    print('Magento library initialized successfully');
  }
}
```

### 2. Configure Magento Store

Ensure your Magento store has:
- REST API enabled
- Customer tokens enabled
- Proper CORS configuration
- API permissions set up

## 📚 Usage Examples

### Customer Authentication

```dart
// Authenticate existing customer
final customer = await magento.authenticateCustomer(
  email: 'customer@example.com',
  password: 'password123',
);

// Create new customer account
final newCustomer = await magento.createCustomer(
  email: 'new@example.com',
  password: 'StrongPassword123!',
  firstName: 'John',
  lastName: 'Doe',
  additionalData: {
    'telephone': '+1234567890',
  },
);

// Check authentication status
if (magento.isAuthenticated) {
  print('Customer: ${magento.currentCustomer.firstname}');
}
```

### Product Management

```dart
// Get products with filters
final products = await magento.getProducts(
  page: 1,
  pageSize: 20,
  searchQuery: 'shirt',
  categoryId: '15',
  sortBy: 'price',
  sortOrder: 'ASC',
  filters: {
    'price': {'from': '10.00', 'to': '100.00'},
    'color': 'blue',
  },
);

// Search products
final searchResults = await magento.searchProducts(
  'wireless headphones',
  page: 1,
  pageSize: 10,
);

// Get single product
final product = await magento.getProduct('SHIRT-001');
```

### Shopping Cart

```dart
// Create cart
final cartId = await magento.createCart();

// Add product to cart
final added = await magento.addToCart(
  sku: 'SHIRT-001',
  quantity: 2,
  productOptions: {
    'color': 'blue',
    'size': 'M',
  },
);

// Update quantity
final updated = await magento.updateCartItemQuantity(
  itemId: 1,
  quantity: 3,
);

// Remove item
final removed = await magento.removeFromCart(1);

// Get cart information
final cart = await magento.getCart();
print('Cart total: \$${cart.grandTotal}');

// Apply coupon
final couponApplied = await magento.applyCoupon('SAVE20');
```

### Orders and Wishlist

```dart
// Get customer orders
final orders = await magento.getCustomerOrders();

// Get specific order
final order = await magento.getOrder('ORDER-001');

// Wishlist operations
final wishlist = await magento.getWishlist();
await magento.addToWishlist('SHIRT-001');
await magento.removeFromWishlist(1);
```

### Checkout Process

```dart
// Estimate shipping
final shippingMethods = await magento.estimateShipping({
  'region_id': '12',
  'region': 'California',
  'country_id': 'US',
  'postcode': '90210',
  'city': 'Beverly Hills',
  'street': ['123 Main St'],
});

// Get payment methods
final paymentMethods = await magento.getPaymentMethods();

// Place order
final orderData = {
  'paymentMethod': {'method': 'checkmo'},
  'billing_address': {...},
  'shipping_address': {...},
};

final order = await magento.placeOrder(orderData);
```

## 🏗️ Architecture

The library follows a clean architecture pattern with the following layers:

```
lib/
├── src/
│   ├── models/           # Data models (Customer, Product, Cart, Order)
│   ├── services/         # Business logic services
│   │   ├── magento_api_service.dart
│   │   ├── auth_service.dart
│   │   └── cart_service.dart
│   ├── exceptions/       # Custom exceptions
│   ├── constants/        # API constants and configuration
│   ├── utils/            # Utility functions
│   └── examples/         # Usage examples
├── flutter_magento.dart  # Main library entry point
└── flutter_magento_core.dart # Core implementation
```

### Key Components

- **FlutterMagento**: Main public API class
- **FlutterMagentoCore**: Core implementation with singleton pattern
- **MagentoApiService**: Handles all REST API communications
- **AuthService**: Manages customer authentication and sessions
- **CartService**: Handles shopping cart operations
- **Models**: Type-safe data models using Freezed

## 🔐 Security Features

- Secure token storage using `flutter_secure_storage`
- Automatic token refresh and validation
- Secure HTTP communication with proper headers
- Input validation and sanitization
- Error handling without exposing sensitive information

## 🚨 Error Handling

The library provides comprehensive error handling with custom exceptions:

```dart
try {
  await magento.authenticateCustomer(
    email: 'user@example.com',
    password: 'password',
  );
} on MagentoException catch (e) {
  if (e.isAuthenticationError) {
    print('Authentication failed: ${e.message}');
  } else if (e.isNetworkError) {
    print('Network error: ${e.message}');
  }
}
```

### Exception Types

- `MagentoException`: Base exception class
- Authentication errors (401)
- Authorization errors (403)
- Validation errors (400)
- Not found errors (404)
- Server errors (5xx)
- Network errors

## 🧪 Testing

The library includes comprehensive testing:

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 📱 Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 🔧 Configuration

### Environment Variables

```dart
// Development
baseUrl: 'https://dev-store.magento.com'

// Production
baseUrl: 'https://store.magento.com'

// Staging
baseUrl: 'https://staging-store.magento.com'
```

### Custom Headers

```dart
await magento.initialize(
  baseUrl: 'https://your-store.com',
  headers: {
    'X-Custom-Header': 'value',
    'User-Agent': 'YourApp/1.0.0',
  },
);
```

### Timeout Configuration

```dart
await magento.initialize(
  baseUrl: 'https://your-store.com',
  connectionTimeout: 60000, // 60 seconds
  receiveTimeout: 60000,    // 60 seconds
);
```

## 📊 Performance

- Efficient HTTP client with Dio
- Request/response caching
- Connection pooling
- Automatic retry on failures
- Optimized JSON parsing

## 🔄 State Management

The library is designed to work with any state management solution:

```dart
// Provider
final magentoProvider = Provider<FlutterMagento>((ref) {
  return FlutterMagento();
});

// Riverpod
final magentoProvider = StateNotifierProvider<MagentoNotifier, MagentoState>((ref) {
  return MagentoNotifier();
});

// Bloc
class MagentoBloc extends Bloc<MagentoEvent, MagentoState> {
  // Implementation
}
```

## 🌐 Internationalization

Support for multiple languages and locales:

```dart
// The library automatically handles Magento's locale settings
final products = await magento.getProducts(
  // Products will be returned in the store's default locale
);
```

## 📈 Monitoring and Analytics

Built-in logging and debugging support:

```dart
// Debug mode logging
if (kDebugMode) {
  print('API Request: ${request.url}');
  print('API Response: ${response.data}');
}
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- 📖 [Documentation](https://github.com/your-username/flutter_magento/wiki)
- 🐛 [Issue Tracker](https://github.com/your-username/flutter_magento/issues)
- 💬 [Discussions](https://github.com/your-username/flutter_magento/discussions)
- 📧 [Email Support](mailto:support@your-email.com)

## 🙏 Acknowledgments

- Magento team for the excellent e-commerce platform
- Flutter team for the amazing framework
- Dio team for the HTTP client
- Freezed team for the code generation

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed list of changes.

---

**Made with ❤️ for the Flutter and Magento communities**