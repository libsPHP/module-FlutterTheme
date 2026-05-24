# flutter_magento

**Flutter SDK for building headless Magento 2 / Adobe Commerce mobile storefronts.**

`flutter_magento` is a production-oriented Flutter package for connecting Flutter applications to Magento 2 / Adobe Commerce through GraphQL, REST, custom Magento modules, or a Backend-for-Frontend layer.

It is designed for teams building real e-commerce apps: catalog browsing, authentication, cart, checkout, orders, customer profile, multi-store, localization, caching, marketplace scenarios, and custom Magento extensions.

> Build a Magento mobile app in Flutter without spreading Magento-specific API logic across your UI.

---

## Why flutter_magento?

Magento is powerful, but its APIs are not always convenient for mobile apps. A real Flutter storefront usually needs to handle:

* Magento GraphQL and REST APIs
* guest and customer carts
* configurable, bundle, grouped, virtual, downloadable, and custom products
* custom attributes and custom modules
* multi-store, multi-language, and multi-currency logic
* checkout, delivery, payment redirects, and order status
* cache, offline catalog, and error recovery
* different API contracts for mobile, web, admin, and marketplace apps

`flutter_magento` provides a clean SDK layer between Flutter UI and Magento.

```text
Flutter UI
   ↓
State Management: Riverpod / BLoC / Provider / GetIt
   ↓
flutter_magento SDK
   ↓
Transport: GraphQL / REST / BFF / Custom / Mock
   ↓
Magento 2 / Adobe Commerce
```

---

## Key Features

### Core commerce

* Product catalog
* Category tree
* Product details
* Product search
* Cart management
* Guest cart
* Customer cart
* Wishlist
* Customer authentication
* Customer profile
* Addresses
* Orders
* Coupons
* Checkout flow
* Shipping methods
* Payment methods

### Magento integration modes

* Magento GraphQL API
* Magento REST API
* Custom Magento REST endpoints
* Custom Magento GraphQL resolvers
* Backend-for-Frontend / Mobile API mode
* Mock transport for testing

### Flutter architecture

* Clean repository-based API
* Replaceable transport layer
* Domain models instead of raw Magento JSON everywhere
* Typed error model
* Secure token storage abstraction
* Store context abstraction
* Extension registry for custom Magento modules
* Optional adapters for Riverpod, BLoC, Provider, or your own state layer

### Production features

* Multi-store support
* Multi-currency support
* Multi-language support
* Configurable product support
* Offline-friendly catalog architecture
* Cache-ready repositories
* Payment adapter architecture
* Logging and observability hooks
* BFF-friendly design
* Marketplace-ready extension points

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_magento: ^4.4.0
```

Then run:

```bash
flutter pub get
```

Optional packages for a production app:

```yaml
dependencies:
  flutter_secure_storage: ^latest
  dio: ^latest
  graphql_flutter: ^latest
  freezed_annotation: ^latest
  json_annotation: ^latest
```

---

## Quick Start

### 1. Create a Magento client

```dart
import 'package:flutter_magento/flutter_magento.dart';

final magento = MagentoClient(
  transport: GraphQlMagentoTransport(
    baseUrl: 'https://shop.example.com/graphql',
  ),
  authStorage: SecureMagentoAuthStorage(),
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currency: 'USD',
    locale: 'en_US',
  ),
);
```

### 2. Load products

```dart
final products = await magento.catalog.searchProducts(
  query: 'shirt',
  page: 1,
  pageSize: 20,
);

for (final product in products.items) {
  print('${product.name}: ${product.price.formatted}');
}
```

### 3. Load product details

```dart
final product = await magento.catalog.getProductBySku('shirt-blue-m');

print(product.name);
print(product.description);
print(product.price.formatted);
```

### 4. Add a product to cart

```dart
final cart = await magento.cart.addSimpleProduct(
  sku: 'shirt-blue-m',
  quantity: 1,
);

print(cart.totals.grandTotal.formatted);
```

### 5. Login customer

```dart
final session = await magento.auth.login(
  email: 'customer@example.com',
  password: 'password',
);

print(session.customer.email);
```

### 6. Place order

```dart
await magento.checkout.setShippingAddress(address);
await magento.checkout.setShippingMethod(shippingMethod);
await magento.checkout.setBillingAddress(billingAddress);

final order = await magento.checkout.placeOrder(
  paymentMethodCode: 'cashondelivery',
);

print(order.orderNumber);
```

---

## Architecture

`flutter_magento` is built around replaceable layers.

```text
┌────────────────────────────────────────────┐
│ Flutter UI                                 │
│ Screens, Widgets                           │
└────────────────────────────────────────────┘
                    ↓
┌────────────────────────────────────────────┐
│ State Management                           │
│ Riverpod / BLoC / Provider / GetIt         │
└────────────────────────────────────────────┘
                    ↓
┌────────────────────────────────────────────┐
│ Application Services                       │
│ CheckoutService, CartSessionManager        │
└────────────────────────────────────────────┘
                    ↓
┌────────────────────────────────────────────┐
│ Domain Repositories                        │
│ CatalogRepository, CartRepository          │
│ AuthRepository, CheckoutRepository         │
└────────────────────────────────────────────┘
                    ↓
┌────────────────────────────────────────────┐
│ Magento SDK Core                           │
│ Transport, Storage, Context, Errors        │
└────────────────────────────────────────────┘
                    ↓
┌────────────────────────────────────────────┐
│ Data Sources                               │
│ GraphQL / REST / BFF / Mock / Cache        │
└────────────────────────────────────────────┘
                    ↓
┌────────────────────────────────────────────┐
│ Magento 2 / Adobe Commerce                 │
└────────────────────────────────────────────┘
```

The UI should not know whether data comes from Magento GraphQL, Magento REST, a custom backend, or a mock server.

---

## Integration Modes

### Direct GraphQL mode

Recommended for most headless storefronts.

```dart
final magento = MagentoClient(
  transport: GraphQlMagentoTransport(
    baseUrl: 'https://shop.example.com/graphql',
  ),
  authStorage: SecureMagentoAuthStorage(),
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currency: 'USD',
    locale: 'en_US',
  ),
);
```

Use this when:

* you are building a standard mobile storefront
* Magento GraphQL covers your catalog/cart/customer flow
* you want fewer network round trips than raw REST
* your app can safely talk to Magento directly

---

### Direct REST mode

Useful for admin-like operations, custom endpoints, or features not fully covered by GraphQL.

```dart
final magento = MagentoClient(
  transport: RestMagentoTransport(
    baseUrl: 'https://shop.example.com/rest/V1',
  ),
  authStorage: SecureMagentoAuthStorage(),
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currency: 'USD',
    locale: 'en_US',
  ),
);
```

Use this when:

* your Magento module exposes REST endpoints
* you need admin/customer REST APIs
* you need a simple and explicit HTTP integration

---

### BFF mode

For serious production apps, you may not want Flutter to call Magento directly. Instead, use a Backend-for-Frontend.

```text
Flutter
   ↓
Mobile API / BFF
   ↓
Magento GraphQL + REST + Custom Modules
   ↓
Magento
```

```dart
final magento = MagentoClient(
  transport: BffMagentoTransport(
    baseUrl: 'https://api.example.com/mobile',
  ),
  authStorage: SecureMagentoAuthStorage(),
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currency: 'USD',
    locale: 'en_US',
  ),
);
```

Use BFF mode when you need:

* custom checkout
* payment orchestration
* ERP/CRM integration
* mobile-specific endpoints
* API versioning
* better caching
* hidden backend tokens
* custom business logic
* compatibility between old and new mobile app versions

The Flutter API stays the same, while the transport changes.

---

## Core Concepts

### MagentoClient

`MagentoClient` is the main entry point.

```dart
final magento = MagentoClient(...);

magento.catalog;
magento.cart;
magento.auth;
magento.checkout;
magento.customer;
magento.orders;
```

It exposes high-level repositories and hides low-level Magento API details from the UI.

---

### Transport Layer

The transport layer is responsible for communication with Magento or your backend.

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

  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });
}
```

Supported transport types:

* `GraphQlMagentoTransport`
* `RestMagentoTransport`
* `BffMagentoTransport`
* `MockMagentoTransport`
* `CachedMagentoTransport`
* `LoggingMagentoTransport`
* `RetryMagentoTransport`

Example:

```dart
final transport = LoggingMagentoTransport(
  inner: RetryMagentoTransport(
    inner: GraphQlMagentoTransport(
      baseUrl: 'https://shop.example.com/graphql',
    ),
  ),
);
```

---

### Store Context

Magento often has multiple websites, stores, languages, and currencies.

```dart
final context = MagentoStoreContext(
  websiteCode: 'base',
  storeCode: 'default',
  currency: 'USD',
  locale: 'en_US',
);
```

The store context can be used to send headers, query variables, or backend-specific parameters.

Typical context values:

* website code
* store code
* store view
* currency
* locale
* customer group

---

### Auth Storage

Token storage is separated from authentication logic.

```dart
abstract interface class MagentoAuthStorage {
  Future<String?> getCustomerToken();
  Future<void> saveCustomerToken(String token);
  Future<void> clearCustomerToken();

  Future<String?> getGuestCartId();
  Future<void> saveGuestCartId(String cartId);
  Future<void> clearGuestCartId();
}
```

Available implementations may include:

* `SecureMagentoAuthStorage`
* `MemoryMagentoAuthStorage`
* `SharedPrefsMagentoAuthStorage`
* `HiveMagentoAuthStorage`

---

## Repositories

### CatalogRepository

```dart
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
```

Example:

```dart
final page = await magento.catalog.getProductsByCategory(
  categoryId: '12',
  page: 1,
  pageSize: 20,
);
```

---

### CartRepository

```dart
abstract interface class CartRepository {
  Future<Cart> getCurrentCart();

  Future<Cart> createGuestCart();

  Future<Cart> addSimpleProduct({
    required String sku,
    required int quantity,
  });

  Future<Cart> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
  });

  Future<Cart> updateItemQuantity({
    required String itemId,
    required int quantity,
  });

  Future<Cart> removeItem(String itemId);

  Future<Cart> applyCoupon(String couponCode);

  Future<Cart> removeCoupon();

  Future<Cart> mergeGuestCartToCustomerCart();

  Future<void> clearCart();
}
```

Example:

```dart
await magento.cart.addSimpleProduct(
  sku: 'shirt-blue-m',
  quantity: 2,
);
```

---

### AuthRepository

```dart
abstract interface class AuthRepository {
  Future<CustomerSession> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<Customer> me();

  Future<CustomerSession> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });
}
```

Example:

```dart
await magento.auth.login(
  email: 'customer@example.com',
  password: 'password',
);
```

---

### CheckoutRepository

```dart
abstract interface class CheckoutRepository {
  Future<Cart> setShippingAddress(ShippingAddress address);

  Future<List<ShippingMethod>> getAvailableShippingMethods();

  Future<Cart> setShippingMethod(ShippingMethodCode method);

  Future<Cart> setBillingAddress(BillingAddress address);

  Future<List<PaymentMethod>> getAvailablePaymentMethods();

  Future<PaymentPreparation> preparePayment({
    required String paymentMethodCode,
  });

  Future<OrderResult> placeOrder({
    required String paymentMethodCode,
    Map<String, dynamic>? paymentData,
  });
}
```

Example:

```dart
final methods = await magento.checkout.getAvailableShippingMethods();

await magento.checkout.setShippingMethod(methods.first.code);

final order = await magento.checkout.placeOrder(
  paymentMethodCode: 'cashondelivery',
);
```

---

## Product Types

The SDK architecture is designed to support Magento product types:

| Product type         | Status                              |
| -------------------- | ----------------------------------- |
| Simple product       | Supported                           |
| Configurable product | Supported                           |
| Bundle product       | Planned / Partial                   |
| Grouped product      | Planned / Partial                   |
| Virtual product      | Planned / Partial                   |
| Downloadable product | Planned / Partial                   |
| Gift card            | Adobe Commerce / Extension-specific |
| Custom product type  | Via extension API                   |

Example configurable product flow:

```dart
await magento.cart.addConfigurableProduct(
  parentSku: 'shirt',
  variantSku: 'shirt-blue-m',
  quantity: 1,
  selectedOptions: {
    'color': 'blue',
    'size': 'm',
  },
);
```

---

## Custom Attributes

Magento stores often rely on custom product, customer, cart, and order attributes.

`flutter_magento` keeps custom attributes accessible without forcing every project to fork the SDK.

```dart
final brand = product.attr<String>('brand');
final vendorId = product.attr<String>('vendor_id');
final deliveryDays = product.attr<int>('delivery_days');
```

Domain entities can expose a generic custom attribute map:

```dart
class MagentoEntity {
  final Map<String, dynamic> customAttributes;

  const MagentoEntity({
    this.customAttributes = const {},
  });

  T? attr<T>(String code) {
    final value = customAttributes[code];
    if (value is T) return value;
    return null;
  }
}
```

---

## Custom Extensions

Magento is rarely used without custom modules. The SDK should be extendable without modifying its core.

```dart
final magento = MagentoClient(...);

magento.extensions.register<LoyaltyExtension>(
  LoyaltyExtension(
    transport: magento.transport,
  ),
);
```

Example extension:

```dart
class LoyaltyExtension {
  final MagentoTransport transport;

  LoyaltyExtension({required this.transport});

  Future<LoyaltyBalance> getBalance() {
    return transport.graphql(
      '''
      query GetLoyaltyBalance {
        customer {
          loyalty_balance
        }
      }
      ''',
      decoder: LoyaltyBalance.fromJson,
    );
  }
}
```

Usage:

```dart
final loyalty = magento.extensions.get<LoyaltyExtension>();
final balance = await loyalty.getBalance();
```

---

## Payment Architecture

Payment methods vary from project to project. Instead of hardcoding every payment provider, `flutter_magento` uses a payment adapter architecture.

```dart
abstract interface class MagentoPaymentAdapter {
  String get methodCode;

  Future<PaymentResult> pay({
    required Cart cart,
    required PaymentContext context,
  });
}
```

Example WebView checkout adapter:

```dart
class WebViewMagentoCheckoutPaymentAdapter implements MagentoPaymentAdapter {
  @override
  String get methodCode => 'webview_checkout';

  @override
  Future<PaymentResult> pay({
    required Cart cart,
    required PaymentContext context,
  }) async {
    // Open Magento checkout in WebView.
    // Wait for success, failure, cancel, or deep link callback.
    return PaymentResult.success();
  }
}
```

Possible payment integrations:

* Magento native payment methods
* WebView checkout
* Stripe
* PayPal / Braintree
* Adyen
* Omise
* 2C2P
* Razorpay
* Cash on delivery
* Bank transfer
* Custom payment modules

---

## Checkout Strategies

There are three common checkout strategies.

### 1. Native checkout

Flutter controls the whole checkout flow.

```text
Flutter checkout UI
   ↓
flutter_magento
   ↓
Magento GraphQL / REST
```

Best when:

* UX must be fully native
* payment method has mobile SDK support
* checkout logic is stable and well documented

### 2. WebView checkout

Flutter handles catalog/cart, then opens Magento checkout in WebView.

```text
Flutter catalog/cart
   ↓
Magento checkout URL in WebView
   ↓
Payment provider
```

Best when:

* you need a fast production launch
* payment provider requires browser redirects
* Magento checkout is already customized

### 3. BFF checkout

Flutter sends checkout intent to your backend.

```text
Flutter
   ↓
BFF / Mobile API
   ↓
Magento + payment provider + ERP
```

Best when:

* checkout is complex
* payment orchestration must happen server-side
* you need app-version compatibility
* multiple systems participate in order creation

---

## State Management

The core package does not require a specific state management library.

You can use:

* Riverpod
* BLoC
* Provider
* GetIt
* MobX
* custom controllers

### Riverpod example

```dart
final magentoClientProvider = Provider<MagentoClient>((ref) {
  return MagentoClient(
    transport: GraphQlMagentoTransport(
      baseUrl: 'https://shop.example.com/graphql',
    ),
    authStorage: SecureMagentoAuthStorage(),
    storeContext: MagentoStoreContext(
      storeCode: 'default',
      currency: 'USD',
      locale: 'en_US',
    ),
  );
});
```

```dart
final productsProvider = FutureProvider.family<ProductPage, ProductQueryParams>(
  (ref, params) async {
    final magento = ref.watch(magentoClientProvider);

    return magento.catalog.searchProducts(
      query: params.query,
      filter: params.filter,
      sort: params.sort,
      page: params.page,
      pageSize: params.pageSize,
    );
  },
);
```

### BLoC example

```dart
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc(this.cartRepository) : super(CartInitial()) {
    on<CartStarted>(_onStarted);
    on<CartProductAdded>(_onProductAdded);
  }

  Future<void> _onStarted(
    CartStarted event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    try {
      final cart = await cartRepository.getCurrentCart();
      emit(CartLoaded(cart));
    } on MagentoException catch (e) {
      emit(CartFailure(e.message));
    }
  }

  Future<void> _onProductAdded(
    CartProductAdded event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());

    try {
      final cart = await cartRepository.addSimpleProduct(
        sku: event.sku,
        quantity: event.quantity,
      );
      emit(CartLoaded(cart));
    } on MagentoException catch (e) {
      emit(CartFailure(e.message));
    }
  }
}
```

---

## Error Handling

Magento errors can come from REST, GraphQL, network failures, validation, checkout, payment, or custom modules.

`flutter_magento` exposes a unified exception model.

```dart
sealed class MagentoException implements Exception {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const MagentoException(
    this.message, {
    this.cause,
    this.stackTrace,
  });
}

class MagentoNetworkException extends MagentoException {
  const MagentoNetworkException(super.message);
}

class MagentoAuthException extends MagentoException {
  const MagentoAuthException(super.message);
}

class MagentoValidationException extends MagentoException {
  final Map<String, List<String>> fieldErrors;

  const MagentoValidationException(
    super.message, {
    this.fieldErrors = const {},
  });
}

class MagentoCartException extends MagentoException {
  const MagentoCartException(super.message);
}

class MagentoPaymentException extends MagentoException {
  const MagentoPaymentException(super.message);
}

class MagentoServerException extends MagentoException {
  final int? statusCode;

  const MagentoServerException(
    super.message, {
    this.statusCode,
  });
}
```

Usage:

```dart
try {
  await magento.cart.addSimpleProduct(
    sku: 'shirt-blue-m',
    quantity: 1,
  );
} on MagentoAuthException {
  router.go('/login');
} on MagentoCartException catch (e) {
  showError(e.message);
} on MagentoNetworkException {
  showError('No internet connection');
}
```

---

## Caching and Offline Mode

The package is designed for cache and offline-friendly repositories.

```dart
final catalog = CachedCatalogRepository(
  inner: MagentoCatalogRepository(transport),
  cache: HiveCatalogCache(),
);
```

Possible cache targets:

* categories
* product lists
* product details
* CMS pages
* CMS blocks
* store config
* images
* wishlist
* customer profile
* recently viewed products

Recommended strategies:

| Data            | Strategy                                |
| --------------- | --------------------------------------- |
| Category tree   | cache-first with TTL                    |
| Product list    | network-first with fallback             |
| Product details | stale-while-revalidate                  |
| Cart            | network-first                           |
| Checkout        | no offline mutation without sync policy |
| Orders          | network-first with local history cache  |
| CMS blocks      | cache-first with versioning             |

---

## Observability

Production apps need visibility into commerce failures.

`flutter_magento` can be connected to logging, analytics, and crash reporting through observers.

```dart
final magento = MagentoClient(
  transport: transport,
  authStorage: authStorage,
  storeContext: storeContext,
  observers: [
    SentryMagentoObserver(),
    FirebaseAnalyticsMagentoObserver(),
    ConsoleMagentoObserver(),
  ],
);
```

Useful events:

* product viewed
* product added to cart
* cart updated
* coupon applied
* checkout started
* shipping method selected
* payment started
* payment failed
* order placed
* API request failed
* GraphQL error received
* token expired

---

## Custom Magento REST Endpoints

You can call custom Magento REST endpoints through the transport layer.

```dart
final result = await magento.transport.post<MyDto>(
  '/V1/mobile/custom-action',
  body: {
    'foo': 'bar',
  },
  decoder: MyDto.fromJson,
);
```

---

## Custom Magento GraphQL Queries

You can call custom GraphQL resolvers without forking the SDK.

```dart
final result = await magento.transport.graphql<MyDto>(
  '''
  query CustomQuery($id: String!) {
    customEntity(id: $id) {
      id
      name
    }
  }
  ''',
  variables: {
    'id': '123',
  },
  decoder: MyDto.fromJson,
);
```

---

## Recommended Project Structure

For a production Flutter app:

```text
lib/
  app/
    app.dart
    router.dart
    di.dart

  features/
    catalog/
      presentation/
      application/
      domain/
      data/

    product/
      presentation/
      application/
      domain/
      data/

    cart/
      presentation/
      application/
      domain/
      data/

    checkout/
      presentation/
      application/
      domain/
      data/

    auth/
      presentation/
      application/
      domain/
      data/

  infrastructure/
    magento/
      magento_client_provider.dart
      magento_store_context.dart
      magento_extensions.dart
```

The app should depend on repository interfaces, not raw HTTP or GraphQL clients.

---

## Example App

The repository should include a full example app demonstrating:

* home page
* category tree
* product listing
* product details
* configurable product selection
* cart
* login
* registration
* address book
* shipping methods
* payment methods
* checkout
* order success
* order history
* wishlist
* multi-store switching
* language switching
* currency switching
* offline catalog cache

Run example:

```bash
cd example
flutter pub get
flutter run
```

Configure Magento endpoint:

```dart
const magentoBaseUrl = String.fromEnvironment(
  'MAGENTO_BASE_URL',
  defaultValue: 'https://shop.example.com/graphql',
);
```

Run with custom endpoint:

```bash
flutter run \
  --dart-define=MAGENTO_BASE_URL=https://shop.example.com/graphql \
  --dart-define=MAGENTO_STORE_CODE=default \
  --dart-define=MAGENTO_CURRENCY=USD
```

---

## Magento Setup Checklist

Before using the SDK, verify your Magento instance:

* Magento 2.4.x or Adobe Commerce 2.4.x
* HTTPS enabled
* GraphQL endpoint available at `/graphql`
* REST endpoint available at `/rest/V1`
* correct CORS settings for Flutter Web, if needed
* store views configured
* currencies configured
* product catalog indexed
* cron configured
* cache configured
* payment methods configured
* shipping methods configured
* test customer account created
* test products created
* configurable product tested
* guest checkout setting verified
* API permissions verified

Useful Magento commands:

```bash
bin/magento cache:flush
bin/magento indexer:reindex
bin/magento setup:di:compile
bin/magento setup:upgrade
```

---

## Compatibility Matrix

| Component           | Supported                              |
| ------------------- | -------------------------------------- |
| Flutter             | 3.x                                    |
| Dart                | 3.x                                    |
| Magento Open Source | 2.4.x                                  |
| Adobe Commerce      | 2.4.x                                  |
| Android             | Supported                              |
| iOS                 | Supported                              |
| Web                 | Supported with CORS configuration      |
| macOS               | Supported for development / admin apps |
| Windows             | Supported for development / admin apps |
| Linux               | Supported for development / admin apps |

> Exact compatibility depends on your Magento modules, GraphQL schema, payment providers, and checkout strategy.

---

## API Coverage

| Area                  | Status                       |
| --------------------- | ---------------------------- |
| Catalog               | Supported                    |
| Categories            | Supported                    |
| Product details       | Supported                    |
| Product search        | Supported                    |
| Guest cart            | Supported                    |
| Customer cart         | Supported                    |
| Customer login        | Supported                    |
| Customer registration | Supported                    |
| Wishlist              | Supported                    |
| Coupons               | Supported                    |
| Shipping methods      | Supported                    |
| Payment methods       | Supported / Adapter-based    |
| Native checkout       | Supported / Project-specific |
| WebView checkout      | Adapter-based                |
| Orders                | Supported                    |
| Customer addresses    | Supported                    |
| CMS pages             | Planned / Partial            |
| CMS blocks            | Planned / Partial            |
| Reviews               | Planned / Partial            |
| Compare products      | Planned                      |
| MSI inventory         | Planned / Project-specific   |
| Marketplace           | Extension-based              |
| Custom modules        | Extension-based              |

---

## Security Notes

Do not store Magento admin tokens inside a mobile app.

Recommended:

* use customer tokens for customer operations
* use guest cart tokens for guest operations
* use secure storage for tokens
* use HTTPS only
* use BFF for sensitive operations
* keep admin operations on the server side
* never expose payment provider secrets in Flutter
* never expose Magento integration tokens in Flutter

For sensitive integrations:

```text
Flutter
   ↓
BFF
   ↓
Magento / Payment Provider / ERP
```

---

## What Not To Do

Avoid this:

```text
ProductScreen → Dio → Magento REST
```

Avoid this:

```text
Button → raw GraphQL query string → Magento
```

Avoid this:

```text
Flutter app → Magento admin token
```

Prefer this:

```text
Flutter UI
   ↓
State layer
   ↓
Repository interface
   ↓
flutter_magento SDK
   ↓
GraphQL / REST / BFF transport
```

---

## Roadmap

### Short-term

* Improve README and documentation
* Publish compatibility matrix
* Add full API coverage table
* Add production example app
* Improve GraphQL-first catalog and cart APIs
* Improve checkout documentation
* Add payment adapter examples
* Add BFF transport example
* Add custom extension examples

### Mid-term

* Typed GraphQL operations
* Generated models for common Magento GraphQL queries
* Better configurable product support
* Bundle/grouped/downloadable product support
* CMS pages and blocks
* Reviews
* Compare products
* Multi-store demo
* Offline catalog demo
* Riverpod adapter package
* BLoC adapter package

### Long-term

* Marketplace toolkit
* MSI inventory support
* Advanced checkout orchestration
* Sync engine
* Admin/vendor app support
* Demo Magento backend
* Integration test environment
* CI with mock Magento server

---

## Migration Strategy

If you already use older `flutter_magento` methods, the recommended migration path is:

1. Keep old public methods working.
2. Internally route them through repositories.
3. Mark old methods as deprecated.
4. Introduce `MagentoClient` as the new entry point.
5. Add transport-based configuration.
6. Move project-specific features to extensions.

Example:

```dart
@Deprecated('Use magento.catalog.searchProducts() instead')
Future<ProductPage> getProducts() {
  return catalog.searchProducts(
    page: 1,
    pageSize: 20,
  );
}
```

---

## Comparison

| Approach                   | Description                      | Best for                     |
| -------------------------- | -------------------------------- | ---------------------------- |
| `flutter_magento`          | Reusable Flutter SDK for Magento | Mobile storefronts           |
| `graphql_flutter` directly | Raw GraphQL client               | Teams that want full control |
| `dio` + Magento REST       | Raw REST integration             | Admin/custom operations      |
| BFF + Flutter              | Custom mobile backend            | Enterprise production apps   |
| Magento PWA Studio         | React PWA frontend               | Web storefronts              |
| WebView checkout           | Hybrid checkout                  | Fast payment launch          |

`flutter_magento` is intended to sit between raw GraphQL/REST clients and a full custom mobile backend.

---

## Contributing

Contributions are welcome.

Recommended contribution areas:

* Magento GraphQL coverage
* REST endpoint coverage
* payment adapters
* checkout examples
* custom extension examples
* tests
* documentation
* example app screens
* BFF examples
* marketplace modules

Before submitting a pull request:

```bash
flutter analyze
flutter test
dart format .
```

---

## Development

Clone the repository:

```bash
git clone https://github.com/NativeMindNet/flutter_magento.git
cd flutter_magento
```

Install dependencies:

```bash
flutter pub get
```

Run tests:

```bash
flutter test
```

Run analyzer:

```bash
flutter analyze
```

Format code:

```bash
dart format .
```

---

## License

Choose and declare the license explicitly.

Recommended open-source licenses:

* MIT
* Apache-2.0
* BSD-3-Clause

If the project is not fully open-source, state it clearly:

```text
This package is free for non-commercial use.
Commercial usage requires a commercial license.
```

Do not leave the package with an unknown license. License clarity is critical for commercial adoption.

---

## Maintainer

Maintained by NativeMind.

* Website: [https://nativemind.net](https://nativemind.net)
* GitHub: [https://github.com/NativeMindNet](https://github.com/NativeMindNet)

---

## Summary

`flutter_magento` aims to be the standard Flutter SDK layer for Magento 2 / Adobe Commerce mobile apps.

It gives Flutter developers a clean, extensible architecture for building real commerce applications without binding UI code directly to Magento-specific REST, GraphQL, checkout, and custom module details.

```text
Flutter app
   ↓
flutter_magento
   ↓
Magento GraphQL / REST / BFF
   ↓
Magento 2 / Adobe Commerce
```
