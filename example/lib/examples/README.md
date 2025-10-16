# Flutter Magento Examples

This directory contains complete, runnable examples demonstrating how to use the Flutter Magento plugin. Each example is a standalone Flutter app that can be run directly and includes comprehensive tests.

## 📋 Available Examples

### 🔐 Authentication Examples
**File:** `auth_examples.dart`

Demonstrates authentication flows with real API calls to Luma demo store:
- ✅ Basic login with test credentials (`test@scandipwa.com` / `Test@123456`)
- ✅ Customer registration with validation
- ✅ Get current customer information
- ✅ Check authentication status
- ✅ Logout functionality

**Run:**
```bash
cd example
flutter run lib/examples/auth_examples.dart
```

**Test:**
```bash
flutter test test/examples/auth_examples_test.dart
```

### 📦 Product Examples
**File:** `product_examples.dart`

Shows product operations and catalog management:
- ✅ Get products with pagination
- ✅ Search products by query
- ✅ Get single product by SKU
- ✅ Filter products by category
- ✅ Apply sorting and filters

**Run:**
```bash
cd example
flutter run lib/examples/product_examples.dart
```

**Test:**
```bash
flutter test test/examples/product_examples_test.dart
```

### 🛒 Cart Examples
**File:** `cart_examples.dart`

Covers cart operations for e-commerce:
- ✅ Create guest cart
- ✅ Add items to cart
- ✅ Get cart totals
- ✅ View cart items
- ✅ Clear cart

**Run:**
```bash
cd example
flutter run lib/examples/cart_examples.dart
```

**Test:**
```bash
flutter test test/examples/cart_examples_test.dart
```

## 🚀 How to Use

### 1. Run an Example App

Each example can be run as a standalone Flutter application:

```bash
cd example
flutter run lib/examples/auth_examples.dart
```

The app will launch with:
- Interactive UI with buttons for each example
- Output area showing results
- Real API calls to Luma demo store
- Error handling and loading states

### 2. Use Example Code in Your Project

Each example exports a standalone class that you can use directly:

```dart
import 'package:flutter_magento/flutter_magento.dart';
import 'package:your_app/examples/auth_examples.dart';

// Initialize Magento
final magento = FlutterMagentoCore.instance;
await magento.initialize(
  baseUrl: 'https://luma-demo.scandipwa.com/',
);

// Use example functions
final authExamples = AuthExamples(magento);
final authResponse = await authExamples.basicLogin();

print('Logged in as: ${authResponse.customer.email}');
```

### 3. Copy-Paste Code

All example functions are documented and can be copied directly into your code:

```dart
// From auth_examples.dart
Future<AuthResponse> basicLogin() async {
  return await magento.authenticate(
    email: 'test@scandipwa.com',
    password: 'Test@123456',
  );
}
```

## 🧪 Testing

Each example has comprehensive unit and integration tests.

### Run All Example Tests

```bash
# Run all example tests
flutter test test/examples/

# Run specific example tests
flutter test test/examples/auth_examples_test.dart

# Run with coverage
flutter test --coverage test/examples/

# Run integration tests (requires network)
flutter test --tags integration test/examples/
```

### Test Structure

Each test file includes:
- **Unit tests** - Mock API calls for fast, reliable testing
- **Integration tests** - Real API calls (tagged, skip in CI)
- **Error handling tests** - Edge cases and error scenarios
- **Validation tests** - Input validation and constraints

Example test:
```dart
test('Basic Login - should authenticate successfully', () async {
  // Arrange
  final expectedResponse = AuthResponse(
    token: 'test-token-123',
    customer: Customer(
      email: 'test@scandipwa.com',
      firstname: 'Test',
      lastname: 'User',
    ),
  );

  when(mockMagento.authenticate(
    email: 'test@scandipwa.com',
    password: 'Test@123456',
  )).thenAnswer((_) async => expectedResponse);

  // Act
  final result = await authExamples.basicLogin();

  // Assert
  expect(result.token, equals('test-token-123'));
  expect(result.customer.email, equals('test@scandipwa.com'));
});
```

## 📝 Example Structure

Each example follows a consistent structure:

```dart
/// Example: Description
///
/// Run: flutter run lib/examples/example_name.dart

import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  runApp(const ExampleApp());
}

// Interactive UI implementation
class ExampleScreen extends StatefulWidget {
  // ... UI code with buttons and output area
}

// Standalone functions for testing and reuse
class ExampleClass {
  final FlutterMagentoCore magento;

  ExampleClass(this.magento);

  /// Example: Function description
  Future<ReturnType> exampleFunction() async {
    // Implementation
  }
}
```

## 🎯 Best Practices

1. **Always initialize Magento first:**
   ```dart
   await magento.initialize(baseUrl: 'https://your-store.com/');
   ```

2. **Handle errors gracefully:**
   ```dart
   try {
     final result = await magento.authenticate(...);
   } catch (e) {
     print('Error: $e');
   }
   ```

3. **Use test credentials for demos:**
   - Email: `test@scandipwa.com`
   - Password: `Test@123456`
   - Store: `https://luma-demo.scandipwa.com/`

4. **Check authentication before protected operations:**
   ```dart
   final isAuth = await magento.isAuthenticated();
   if (isAuth) {
     // Perform protected operation
   }
   ```

## 📚 Additional Resources

- [Main README](../../../README.md) - Plugin documentation
- [API Reference](../../../README.md#-api-reference) - Complete API docs
- [Test Coverage Report](../../../TEST_COVERAGE_REPORT.md) - Testing details
- [Migration Guide](../../../MIGRATION_3_0_0.md) - Upgrading from 2.x

## 🤝 Contributing

Want to add more examples? Follow these steps:

1. Create a new example file: `example_name_examples.dart`
2. Implement both UI and standalone functions
3. Create corresponding test file: `example_name_examples_test.dart`
4. Add to this README
5. Submit a pull request

## 📞 Support

- 📧 Email: support@nativemind.net
- 🐛 Issues: [GitHub Issues](https://github.com/nativemind/flutter_magento/issues)
- 💬 Community: [Discord](https://discord.gg/nativemind)

---

**Made with ❤️ by NativeMind Team**

