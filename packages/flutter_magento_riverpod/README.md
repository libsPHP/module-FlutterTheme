# flutter_magento_riverpod

[![pub package](https://img.shields.io/pub/v/flutter_magento_riverpod.svg)](https://pub.dev/packages/flutter_magento_riverpod)

Riverpod state management for Flutter Magento SDK.

## Features

- Pre-built providers for all Magento operations
- Auth state management with persistence
- Cart controller with optimistic updates
- Catalog providers with caching
- Profile state management
- Async state handling

## Installation

```yaml
dependencies:
  flutter_magento_riverpod: ^1.0.0
```

## Usage

### Setup

```dart
import 'package:flutter_magento_riverpod/flutter_magento_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        // Configure Magento connection
        magentoConfigProvider.overrideWithValue(
          MagentoConfig(
            baseUrl: 'https://your-store.com/graphql',
            storeCode: 'default',
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}
```

### Authentication

```dart
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      authenticated: (customer) => Text('Hello, ${customer.firstName}!'),
      unauthenticated: () => LoginForm(),
      loading: () => CircularProgressIndicator(),
    );
  }
}

// Login
await ref.read(authControllerProvider.notifier).login(
  email: 'user@example.com',
  password: 'password123',
);

// Logout
await ref.read(authControllerProvider.notifier).logout();
```

### Cart Management

```dart
class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return cart.when(
      data: (cart) => CartView(cart: cart),
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

// Add to cart
await ref.read(cartControllerProvider.notifier).addProduct(
  sku: 'SHIRT-001',
  quantity: 1,
);

// Update quantity
await ref.read(cartControllerProvider.notifier).updateQuantity(
  itemId: item.id,
  quantity: 3,
);

// Remove item
await ref.read(cartControllerProvider.notifier).removeItem(item.id);

// Apply coupon
await ref.read(cartControllerProvider.notifier).applyCoupon('SAVE20');
```

### Catalog

```dart
class ProductListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(
      productsProvider(ProductQueryParams(
        page: 1,
        pageSize: 20,
        categoryId: 5,
      )),
    );

    return products.when(
      data: (page) => ProductGrid(products: page.items),
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

// Get product details
final product = ref.watch(productProvider('SHIRT-001'));

// Get categories
final categories = ref.watch(categoriesProvider);

// Search
final results = ref.watch(
  searchProductsProvider(SearchParams(query: 'blue shirt')),
);
```

### Profile

```dart
class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(customerProvider);

    return profile.when(
      data: (customer) => ProfileView(customer: customer),
      loading: () => CircularProgressIndicator(),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

// Get addresses
final addresses = ref.watch(addressesProvider);
```

## Available Providers

### Core
| Provider | Type | Description |
|----------|------|-------------|
| `magentoConfigProvider` | `MagentoConfig` | Store configuration |
| `magentoTransportProvider` | `MagentoTransport` | API transport |

### Auth
| Provider | Type | Description |
|----------|------|-------------|
| `authStateProvider` | `AuthState` | Current auth state |
| `authControllerProvider` | `AuthController` | Login/logout actions |
| `currentCustomerProvider` | `Customer?` | Logged in customer |

### Cart
| Provider | Type | Description |
|----------|------|-------------|
| `cartProvider` | `AsyncValue<Cart>` | Current cart |
| `cartControllerProvider` | `CartController` | Cart mutations |
| `cartItemCountProvider` | `int` | Item count |

### Catalog
| Provider | Type | Description |
|----------|------|-------------|
| `productsProvider` | `AsyncValue<ProductPage>` | Product listing |
| `productProvider` | `AsyncValue<ProductDetails>` | Product details |
| `categoriesProvider` | `AsyncValue<List<Category>>` | Category tree |
| `searchProductsProvider` | `AsyncValue<ProductPage>` | Search results |

### Profile
| Provider | Type | Description |
|----------|------|-------------|
| `customerProvider` | `AsyncValue<Customer>` | Customer profile |
| `addressesProvider` | `AsyncValue<List<CustomerAddress>>` | Address book |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_auth](https://pub.dev/packages/flutter_magento_auth) - Auth implementation
- [flutter_magento_catalog](https://pub.dev/packages/flutter_magento_catalog) - Catalog implementation
- [flutter_magento_cart](https://pub.dev/packages/flutter_magento_cart) - Cart implementation
