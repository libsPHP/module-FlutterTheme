# flutter_magento

[![pub package](https://img.shields.io/pub/v/flutter_magento.svg)](https://pub.dev/packages/flutter_magento)

Complete Flutter SDK for Magento e-commerce platform.

This is an umbrella package that includes all flutter_magento modules for convenience.

## Included Packages

| Package | Description |
|---------|-------------|
| [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) | Core types and interfaces |
| [flutter_magento_auth](https://pub.dev/packages/flutter_magento_auth) | Authentication |
| [flutter_magento_catalog](https://pub.dev/packages/flutter_magento_catalog) | Products and categories |
| [flutter_magento_cart](https://pub.dev/packages/flutter_magento_cart) | Shopping cart |
| [flutter_magento_profile](https://pub.dev/packages/flutter_magento_profile) | Customer profile |
| [flutter_magento_localizations](https://pub.dev/packages/flutter_magento_localizations) | i18n and formatting |
| [flutter_magento_ui](https://pub.dev/packages/flutter_magento_ui) | UI widgets |
| [flutter_magento_riverpod](https://pub.dev/packages/flutter_magento_riverpod) | State management |

## Installation

```yaml
dependencies:
  flutter_magento: ^1.0.0
```

Or install individual packages for smaller bundle size.

## Quick Start

```dart
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        magentoConfigProvider.overrideWithValue(
          MagentoConfig(
            baseUrl: 'https://your-store.com/graphql',
            storeCode: 'default',
          ),
        ),
      ],
      child: MaterialApp(
        theme: MagentoTheme.light(),
        localizationsDelegates: [
          MagentoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        home: MyApp(),
      ),
    ),
  );
}
```

## Features

### Authentication

```dart
// Login
await ref.read(authControllerProvider.notifier).login(
  email: 'user@example.com',
  password: 'password123',
);

// Check auth state
final authState = ref.watch(authStateProvider);
```

### Catalog

```dart
// Get products
final products = ref.watch(
  productsProvider(ProductQueryParams(categoryId: 5)),
);

// Product details
final product = ref.watch(productProvider('SKU-001'));
```

### Cart

```dart
// Add to cart
await ref.read(cartControllerProvider.notifier).addProduct(
  sku: 'SKU-001',
  quantity: 1,
);

// View cart
final cart = ref.watch(cartProvider);
```

### UI Widgets

```dart
// Product card
MagentoProductCard(
  product: product,
  onTap: () => ...,
  onAddToCart: () => ...,
)

// Price display
MagentoPrice(
  price: product.price,
  regularPrice: product.regularPrice,
)

// Cart badge
MagentoCartBadge(itemCount: cart.itemCount)
```

## Additional Packages

For specialized functionality, install separately:

| Package | Description |
|---------|-------------|
| [flutter_magento_offline](https://pub.dev/packages/flutter_magento_offline) | Offline support and caching |
| [flutter_magento_marketplace](https://pub.dev/packages/flutter_magento_marketplace) | Multi-vendor support |
| [flutter_magento_blockchain](https://pub.dev/packages/flutter_magento_blockchain) | ICP/NFT/Yuku integration |

## Architecture

```
flutter_magento (umbrella)
├── flutter_magento_core         # Interfaces, models, errors
├── flutter_magento_auth         # Login, registration, tokens
├── flutter_magento_catalog      # Products, categories, search
├── flutter_magento_cart         # Cart operations, checkout
├── flutter_magento_profile      # Customer, addresses
├── flutter_magento_localizations # i18n, formatting
├── flutter_magento_ui           # Themed widgets
└── flutter_magento_riverpod     # State management
```

## Documentation

- [Getting Started Guide](https://github.com/libsMagento/flutter_magento/wiki/Getting-Started)
- [API Documentation](https://pub.dev/documentation/flutter_magento/latest/)
- [Examples](https://github.com/libsMagento/flutter_magento/tree/main/example)

