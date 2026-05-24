# Specifications: flutter_magento_riverpod

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_riverpod provides Riverpod providers and notifiers for all Magento features. It wraps SDK repositories in reactive state management with automatic caching, error handling, and cross-feature coordination (e.g., auth→cart merge).

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| Core providers | Create | MagentoClient, repositories |
| Auth providers | Create | Login state, session |
| Catalog providers | Create | Products, categories |
| Cart providers | Create | Cart state, mutations |
| Profile providers | Create | Customer, orders, wishlist |
| Checkout providers | Create | Checkout flow state |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                 flutter_magento_riverpod                     │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌────────────────────────────────────────────────────┐     │
│  │              Configuration Providers                │     │
│  │  magentoClientProvider, storeContextProvider        │     │
│  └────────────────────────────────────────────────────┘     │
│                          │                                   │
│  ┌───────────┬───────────┼───────────┬───────────────┐      │
│  ▼           ▼           ▼           ▼               ▼      │
│ ┌─────┐   ┌─────┐   ┌─────┐   ┌─────────┐   ┌───────┐      │
│ │Auth │   │Cart │   │Cata-│   │ Profile │   │Check- │      │
│ │Ctrl │   │Ctrl │   │log  │   │ Provs   │   │out    │      │
│ └─────┘   └─────┘   └─────┘   └─────────┘   └───────┘      │
│                                                              │
└─────────────────────────────────────────────────────────────┘
           │
           ▼
┌─────────────────────────────────────────────────────────────┐
│                    flutter_magento_core                      │
│           Repositories, Models, Transport                    │
└─────────────────────────────────────────────────────────────┘
```

## Providers

### Core Providers

```dart
/// Configuration for MagentoClient - must be overridden
final magentoConfigProvider = Provider<MagentoConfig>((ref) {
  throw UnimplementedError('Override magentoConfigProvider');
});

/// The main MagentoClient instance
final magentoClientProvider = Provider<MagentoClient>((ref) {
  final config = ref.watch(magentoConfigProvider);
  return MagentoClient(
    transport: config.transport,
    authStorage: config.authStorage,
    storeContext: config.storeContext,
    logger: config.logger,
  );
});

/// Individual repository providers
final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  return ref.watch(magentoClientProvider).catalog;
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return ref.watch(magentoClientProvider).cart;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return ref.watch(magentoClientProvider).auth;
});
// ... etc
```

### Auth Controller

```dart
final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(AuthController.new);

class AuthController extends AsyncNotifier<AuthState> {
  late final AuthRepository _authRepo;
  late final CartSessionManager _cartSession;

  @override
  Future<AuthState> build() async {
    _authRepo = ref.watch(authRepositoryProvider);
    _cartSession = ref.watch(cartSessionManagerProvider);

    try {
      final customer = await _authRepo.me();
      return AuthState.authenticated(customer);
    } catch (_) {
      return AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final session = await _authRepo.login(email: email, password: password);
      await _cartSession.onLogin(); // Merge cart
      return AuthState.authenticated(session.customer);
    });
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _authRepo.logout();
      await _cartSession.onLogout();
      return AuthState.unauthenticated();
    });
  }

  Future<void> register({...}) async { ... }
}

sealed class AuthState {
  const AuthState();
  const factory AuthState.unauthenticated() = UnauthenticatedState;
  const factory AuthState.authenticated(Customer customer) = AuthenticatedState;
}
```

### Cart Controller

```dart
final cartControllerProvider =
    AsyncNotifierProvider<CartController, Cart>(CartController.new);

class CartController extends AsyncNotifier<Cart> {
  late final CartRepository _cartRepo;

  @override
  Future<Cart> build() async {
    _cartRepo = ref.watch(cartRepositoryProvider);
    return _cartRepo.getCurrentCart();
  }

  Future<void> addSimpleProduct(String sku, int quantity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.addSimpleProduct(sku: sku, quantity: quantity);
    });
  }

  Future<void> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _cartRepo.addConfigurableProduct(
        parentSku: parentSku,
        variantSku: variantSku,
        quantity: quantity,
      );
    });
  }

  Future<void> updateQuantity(String itemId, int quantity) async { ... }
  Future<void> removeItem(String itemId) async { ... }
  Future<void> applyCoupon(String code) async { ... }
  Future<void> removeCoupon() async { ... }
  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
```

### Catalog Providers

```dart
/// Product search with caching
final productsProvider = FutureProvider.autoDispose
    .family<ProductPage, ProductQueryParams>((ref, params) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.searchProducts(
    query: params.query,
    filter: params.filter,
    sort: params.sort,
    page: params.page,
    pageSize: params.pageSize,
  );
});

/// Single product details
final productDetailsProvider = FutureProvider.autoDispose
    .family<ProductDetails, String>((ref, sku) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getProductBySku(sku);
});

/// Category tree (cached longer)
final categoryTreeProvider = FutureProvider<List<Category>>((ref) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getCategoryTree();
});

/// Products by category
final categoryProductsProvider = FutureProvider.autoDispose
    .family<ProductPage, CategoryProductsParams>((ref, params) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getProductsByCategory(
    categoryId: params.categoryId,
    page: params.page,
    pageSize: params.pageSize,
    sort: params.sort,
    filter: params.filter,
  );
});
```

### Profile Providers

```dart
final customerProvider = FutureProvider<Customer>((ref) async {
  final customer = ref.watch(customerRepositoryProvider);
  return customer.getCustomer();
});

final addressesProvider = FutureProvider<List<Address>>((ref) async {
  final customer = ref.watch(customerRepositoryProvider);
  return customer.getAddresses();
});

final ordersProvider = FutureProvider.autoDispose
    .family<OrderPage, OrderQueryParams>((ref, params) async {
  final orders = ref.watch(orderRepositoryProvider);
  return orders.getOrders(page: params.page, pageSize: params.pageSize);
});

final wishlistProvider = FutureProvider<Wishlist>((ref) async {
  final wishlist = ref.watch(wishlistRepositoryProvider);
  return wishlist.getWishlist();
});
```

### Checkout Controller

```dart
final checkoutControllerProvider =
    AsyncNotifierProvider<CheckoutController, CheckoutState>(
        CheckoutController.new);

class CheckoutController extends AsyncNotifier<CheckoutState> {
  late final CheckoutRepository _checkout;

  @override
  Future<CheckoutState> build() async {
    _checkout = ref.watch(checkoutRepositoryProvider);
    return CheckoutState.initial();
  }

  Future<void> setShippingAddress(ShippingAddress address) async { ... }
  Future<void> selectShippingMethod(ShippingMethod method) async { ... }
  Future<void> setBillingAddress(BillingAddress address) async { ... }
  Future<void> placeOrder(String paymentMethodCode) async { ... }
}
```

## Helper Classes

### MagentoConfig

```dart
class MagentoConfig {
  final MagentoTransport transport;
  final MagentoAuthStorage authStorage;
  final MagentoStoreContext storeContext;
  final MagentoLogger? logger;

  const MagentoConfig({
    required this.transport,
    required this.authStorage,
    required this.storeContext,
    this.logger,
  });
}
```

### Query Params

```dart
class ProductQueryParams {
  final String? query;
  final ProductFilter? filter;
  final ProductSort? sort;
  final int page;
  final int pageSize;

  const ProductQueryParams({...});
}

class CategoryProductsParams {
  final String categoryId;
  final int page;
  final int pageSize;
  final ProductSort? sort;
  final ProductFilter? filter;

  const CategoryProductsParams({...});
}

class OrderQueryParams {
  final int page;
  final int pageSize;

  const OrderQueryParams({...});
}
```

## Dependencies

### Requires

- flutter_magento_core
- flutter_magento_auth (for AuthRepository impl)
- flutter_magento_catalog (for CatalogRepository impl)
- flutter_magento_cart (for CartRepository impl)
- flutter_magento_profile (for Customer/Order/Wishlist repos)
- flutter_riverpod: ^2.5.0
- riverpod_annotation: ^2.3.0 (optional, for code gen)

### Blocks

- flutter_magento (umbrella)

## Package Structure

```
lib/
├── flutter_magento_riverpod.dart
└── src/
    ├── config/
    │   └── magento_config.dart
    ├── providers/
    │   ├── core_providers.dart
    │   ├── auth_providers.dart
    │   ├── catalog_providers.dart
    │   ├── cart_providers.dart
    │   ├── profile_providers.dart
    │   └── checkout_providers.dart
    ├── controllers/
    │   ├── auth_controller.dart
    │   ├── cart_controller.dart
    │   └── checkout_controller.dart
    ├── state/
    │   ├── auth_state.dart
    │   └── checkout_state.dart
    └── params/
        └── query_params.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
