# Specifications: flutter_magento_core

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_core is the foundation package providing transport abstraction, domain repository interfaces, store context, auth storage, error model, and extension architecture. All other flutter_magento_* packages depend on this.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| Transport layer | Create | `MagentoTransport` interface + `MagentoResponse` |
| Domain repositories | Create | Abstract interfaces for catalog, cart, auth, etc. |
| Store context | Create | `MagentoStoreContext` for multi-store |
| Auth storage | Create | `MagentoAuthStorage` interface |
| Error model | Create | `MagentoException` sealed class hierarchy |
| Extension registry | Create | Plugin architecture for custom modules |
| Domain models | Create | Core entities (Money, ProductType, etc.) |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    flutter_magento_core                      │
├─────────────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │ MagentoClient│  │  Repositories │  │   Models     │       │
│  │   (Facade)   │  │  (Interfaces) │  │  (Domain)    │       │
│  └──────┬───────┘  └──────────────┘  └──────────────┘       │
│         │                                                    │
│  ┌──────▼───────┐  ┌──────────────┐  ┌──────────────┐       │
│  │  Transport   │  │ StoreContext │  │  AuthStorage │       │
│  │ (Interface)  │  │              │  │  (Interface) │       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │   Errors     │  │   Logger     │  │  Extensions  │       │
│  │  (Sealed)    │  │ (Interface)  │  │  (Registry)  │       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
└─────────────────────────────────────────────────────────────┘
```

### Data Flow

```
App → MagentoClient → Repository Interface → Transport Interface → External
                                    ↓
                           Mapper (DTO → Domain)
                                    ↓
                              Domain Model
```

## Interfaces

### MagentoTransport

```dart
abstract interface class MagentoTransport {
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  Future<MagentoResponse<T>> post<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  Future<MagentoResponse<T>> put<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  Future<MagentoResponse<T>> delete<T>(
    String path, {
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });
}
```

### MagentoAuthStorage

```dart
abstract interface class MagentoAuthStorage {
  Future<String?> getCustomerToken();
  Future<void> saveCustomerToken(String token);
  Future<void> clearCustomerToken();

  Future<String?> getGuestCartId();
  Future<void> saveGuestCartId(String cartId);
  Future<void> clearGuestCartId();

  Future<void> clearAll();
}
```

### Domain Repository Interfaces

```dart
abstract interface class AuthRepository {
  Future<CustomerSession> login({required String email, required String password});
  Future<void> logout();
  Future<Customer> me();
  Future<CustomerSession> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
  Future<void> requestPasswordReset(String email);
  Future<void> resetPassword({required String token, required String newPassword});
}

abstract interface class CatalogRepository {
  Future<ProductPage> searchProducts({
    String? query,
    ProductFilter? filter,
    ProductSort? sort,
    required int page,
    required int pageSize,
  });
  Future<ProductDetails> getProductBySku(String sku);
  Future<List<Category>> getCategoryTree();
  Future<ProductPage> getProductsByCategory({
    required String categoryId,
    required int page,
    required int pageSize,
    ProductSort? sort,
    ProductFilter? filter,
  });
}

abstract interface class CartRepository {
  Future<Cart> getCurrentCart();
  Future<Cart> createGuestCart();
  Future<Cart> addSimpleProduct({required String sku, required int quantity});
  Future<Cart> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
  });
  Future<Cart> updateItemQuantity({required String itemId, required int quantity});
  Future<Cart> removeItem(String itemId);
  Future<Cart> applyCoupon(String couponCode);
  Future<Cart> removeCoupon();
  Future<Cart> mergeGuestCartToCustomerCart();
  Future<void> clearCart();
}

abstract interface class CheckoutRepository {
  Future<Cart> setShippingAddress(ShippingAddress address);
  Future<List<ShippingMethod>> getAvailableShippingMethods();
  Future<Cart> setShippingMethod(ShippingMethodCode method);
  Future<Cart> setBillingAddress(BillingAddress address);
  Future<List<PaymentMethod>> getAvailablePaymentMethods();
  Future<OrderResult> placeOrder({
    required String paymentMethodCode,
    Map<String, dynamic>? paymentData,
  });
}

abstract interface class CustomerRepository {
  Future<Customer> getCustomer();
  Future<Customer> updateCustomer(CustomerUpdate update);
  Future<List<Address>> getAddresses();
  Future<Address> addAddress(Address address);
  Future<Address> updateAddress(Address address);
  Future<void> deleteAddress(String addressId);
}

abstract interface class OrderRepository {
  Future<OrderPage> getOrders({required int page, required int pageSize});
  Future<Order> getOrder(String orderId);
  Future<List<OrderItem>> getOrderItems(String orderId);
}

abstract interface class WishlistRepository {
  Future<Wishlist> getWishlist();
  Future<Wishlist> addItem(String sku);
  Future<Wishlist> removeItem(String itemId);
  Future<Cart> moveToCart(String itemId);
}
```

## Data Models

### Core Value Objects

```dart
class Money {
  final double value;
  final String currency;
  const Money({required this.value, required this.currency});
}

enum ProductType { simple, configurable, bundle, grouped, virtual, downloadable }

class MagentoStoreContext {
  final String storeCode;
  final String? websiteCode;
  final String currency;
  final String locale;
  final String? customerGroupId;
  const MagentoStoreContext({...});
}
```

### MagentoEntity Base

```dart
abstract class MagentoEntity {
  final Map<String, dynamic> customAttributes;
  const MagentoEntity({this.customAttributes = const {}});

  T? attr<T>(String code) {
    final value = customAttributes[code];
    return value is T ? value : null;
  }
}
```

## Error Model

```dart
sealed class MagentoException implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;
  const MagentoException(this.message, {this.cause, this.stackTrace});
}

class MagentoNetworkException extends MagentoException {...}
class MagentoAuthException extends MagentoException {...}
class MagentoValidationException extends MagentoException {
  final Map<String, List<String>> fieldErrors;
  ...
}
class MagentoCartException extends MagentoException {...}
class MagentoPaymentException extends MagentoException {...}
class MagentoServerException extends MagentoException {
  final int? statusCode;
  ...
}
class MagentoNotFoundException extends MagentoException {...}
class MagentoRateLimitException extends MagentoException {...}
```

## Extension Architecture

```dart
class MagentoExtensionRegistry {
  final Map<Type, Object> _extensions = {};

  void register<T extends Object>(T extension) => _extensions[T] = extension;
  T get<T extends Object>() => _extensions[T] as T;
  T? maybeGet<T extends Object>() => _extensions[T] as T?;
}

abstract interface class MagentoProductExtension<T> {
  String get code;
  T fromProduct(ProductDetails product);
}
```

## MagentoClient Facade

```dart
class MagentoClient {
  final MagentoTransport transport;
  final MagentoAuthStorage authStorage;
  final MagentoStoreContext storeContext;
  final MagentoLogger logger;
  final MagentoExtensionRegistry extensions;

  late final CatalogRepository catalog;
  late final CartRepository cart;
  late final AuthRepository auth;
  late final CheckoutRepository checkout;
  late final CustomerRepository customer;
  late final OrderRepository orders;
  late final WishlistRepository wishlist;

  MagentoClient({...});
}
```

## Dependencies

### Requires

- None (foundation package)

### Blocks

- flutter_magento_graphql
- flutter_magento_rest
- flutter_magento_auth (implementations)
- flutter_magento_catalog (implementations)
- flutter_magento_cart (implementations)
- flutter_magento_riverpod
- flutter_magento_offline
- flutter_magento

## Testing Strategy

### Unit Tests

- [ ] MagentoStoreContext serialization
- [ ] MagentoException hierarchy
- [ ] MagentoExtensionRegistry operations
- [ ] Money value object operations
- [ ] MagentoEntity custom attributes

### Integration Tests

- [ ] MagentoClient construction with mock transport

## Package Structure

```
lib/
├── flutter_magento_core.dart          # Public exports
└── src/
    ├── client/
    │   └── magento_client.dart
    ├── transport/
    │   ├── magento_transport.dart
    │   ├── magento_response.dart
    │   └── magento_request_options.dart
    ├── repositories/
    │   ├── auth_repository.dart
    │   ├── catalog_repository.dart
    │   ├── cart_repository.dart
    │   ├── checkout_repository.dart
    │   ├── customer_repository.dart
    │   ├── order_repository.dart
    │   └── wishlist_repository.dart
    ├── models/
    │   ├── money.dart
    │   ├── product_type.dart
    │   ├── magento_entity.dart
    │   └── ... (domain models)
    ├── context/
    │   └── magento_store_context.dart
    ├── storage/
    │   └── magento_auth_storage.dart
    ├── errors/
    │   └── magento_exception.dart
    ├── logging/
    │   └── magento_logger.dart
    └── extensions/
        └── magento_extension_registry.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
- [x] Notes: Based on architecture plan provided
