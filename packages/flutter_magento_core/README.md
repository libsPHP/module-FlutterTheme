# flutter_magento_core

[![pub package](https://img.shields.io/pub/v/flutter_magento_core.svg)](https://pub.dev/packages/flutter_magento_core)

Core abstractions for Flutter Magento SDK.

## Features

- **Transport abstraction** - Interface for REST/GraphQL communication
- **Repository interfaces** - Domain-driven design patterns for Magento operations
- **Domain models** - Product, Cart, Customer, Order, Address, etc.
- **Error handling** - Typed exceptions with MagentoException hierarchy
- **Store context** - Multi-store and multi-currency support
- **Extension registry** - Plugin system for custom modules

## Installation

```yaml
dependencies:
  flutter_magento_core: ^1.0.0
```

## Usage

### Models

```dart
import 'package:flutter_magento_core/flutter_magento_core.dart';

// Money with currency
final price = Money(value: 29.99, currency: 'USD');
print(price.formatted); // $29.99

// Product types
final product = ProductSummary(
  id: 1,
  sku: 'SHIRT-001',
  name: 'Cotton Shirt',
  urlKey: 'cotton-shirt',
  type: ProductType.simple,
  price: price,
  inStock: true,
);
```

### Repository Interfaces

```dart
// Implement with your transport (GraphQL/REST)
abstract interface class CatalogRepository {
  Future<ProductPage> getProducts({
    required int page,
    required int pageSize,
    ProductFilter? filter,
    ProductSort? sort,
  });

  Future<ProductDetails> getProductBySku(String sku);
  Future<List<Category>> getCategories({int? rootCategoryId});
}
```

### Store Context

```dart
final context = MagentoStoreContext(
  storeCode: 'default',
  currencyCode: 'USD',
  locale: const Locale('en', 'US'),
);
```

### Transport Interface

```dart
// Implement for your backend
abstract interface class MagentoTransport {
  Future<MagentoResponse> execute(
    String operation, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
  });
}
```

### Error Handling

```dart
try {
  await repository.getProductBySku('INVALID');
} on MagentoNotFoundException catch (e) {
  print('Product not found: ${e.message}');
} on MagentoNetworkException catch (e) {
  print('Network error: ${e.message}');
} on MagentoException catch (e) {
  print('Magento error: ${e.message}');
}
```

## Architecture

```
flutter_magento_core/
├── models/          # Domain models (Product, Cart, Customer, etc.)
├── repositories/    # Repository interfaces
├── transport/       # Transport abstraction
├── context/         # Store context
├── storage/         # Auth storage interfaces
├── errors/          # Exception types
├── logging/         # Logger interface
├── extensions/      # Extension registry
└── client/          # MagentoClient coordinator
```

## Related Packages

- [flutter_magento_catalog](https://pub.dev/packages/flutter_magento_catalog) - Catalog implementation
- [flutter_magento_auth](https://pub.dev/packages/flutter_magento_auth) - Authentication
- [flutter_magento_cart](https://pub.dev/packages/flutter_magento_cart) - Shopping cart
- [flutter_magento](https://pub.dev/packages/flutter_magento) - All-in-one package
