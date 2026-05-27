# flutter_magento

[![pub package](https://img.shields.io/pub/v/flutter_magento.svg)](https://pub.dev/packages/flutter_magento)

**Flutter SDK for building headless Magento 2 / Adobe Commerce mobile storefronts.**

`flutter_magento` is a production-oriented Flutter package for connecting Flutter applications to Magento 2 / Adobe Commerce through GraphQL, REST, custom Magento modules, or a Backend-for-Frontend layer.

It is designed for teams building real e-commerce apps: catalog browsing, authentication, cart, checkout, orders, customer profile, multi-store, localization, caching, marketplace scenarios, and custom Magento extensions.

> Build a Magento mobile app in Flutter without spreading Magento-specific API logic across your UI.

---

## Package Architecture

```
flutter_magento (umbrella)
├── flutter_magento_core         # Interfaces, models, errors
├── flutter_magento_auth         # Login, registration, tokens
├── flutter_magento_catalog      # Products, categories, search
├── flutter_magento_cart         # Cart operations, checkout
├── flutter_magento_profile      # Customer, addresses
├── flutter_magento_localizations # i18n, formatting
├── flutter_magento_ui           # Themed widgets
├── flutter_magento_riverpod     # State management
├── flutter_magento_graphql      # GraphQL transport
├── flutter_magento_rest         # REST transport
├── flutter_magento_offline      # Offline support and caching
├── flutter_magento_marketplace  # Multi-vendor support
└── flutter_magento_blockchain   # ICP/EVM payments, NFT products
```

---

## Packages

| Package | Description | Version |
|---------|-------------|---------|
| [flutter_magento](https://pub.dev/packages/flutter_magento) | Umbrella package | [![pub](https://img.shields.io/pub/v/flutter_magento.svg)](https://pub.dev/packages/flutter_magento) |
| [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) | Core types, interfaces, errors | [![pub](https://img.shields.io/pub/v/flutter_magento_core.svg)](https://pub.dev/packages/flutter_magento_core) |
| [flutter_magento_auth](https://pub.dev/packages/flutter_magento_auth) | Authentication | [![pub](https://img.shields.io/pub/v/flutter_magento_auth.svg)](https://pub.dev/packages/flutter_magento_auth) |
| [flutter_magento_catalog](https://pub.dev/packages/flutter_magento_catalog) | Products and categories | [![pub](https://img.shields.io/pub/v/flutter_magento_catalog.svg)](https://pub.dev/packages/flutter_magento_catalog) |
| [flutter_magento_cart](https://pub.dev/packages/flutter_magento_cart) | Shopping cart | [![pub](https://img.shields.io/pub/v/flutter_magento_cart.svg)](https://pub.dev/packages/flutter_magento_cart) |
| [flutter_magento_profile](https://pub.dev/packages/flutter_magento_profile) | Customer profile | [![pub](https://img.shields.io/pub/v/flutter_magento_profile.svg)](https://pub.dev/packages/flutter_magento_profile) |
| [flutter_magento_localizations](https://pub.dev/packages/flutter_magento_localizations) | i18n and formatting | [![pub](https://img.shields.io/pub/v/flutter_magento_localizations.svg)](https://pub.dev/packages/flutter_magento_localizations) |
| [flutter_magento_ui](https://pub.dev/packages/flutter_magento_ui) | UI widgets | [![pub](https://img.shields.io/pub/v/flutter_magento_ui.svg)](https://pub.dev/packages/flutter_magento_ui) |
| [flutter_magento_riverpod](https://pub.dev/packages/flutter_magento_riverpod) | State management | [![pub](https://img.shields.io/pub/v/flutter_magento_riverpod.svg)](https://pub.dev/packages/flutter_magento_riverpod) |
| [flutter_magento_graphql](https://pub.dev/packages/flutter_magento_graphql) | GraphQL transport | [![pub](https://img.shields.io/pub/v/flutter_magento_graphql.svg)](https://pub.dev/packages/flutter_magento_graphql) |
| [flutter_magento_rest](https://pub.dev/packages/flutter_magento_rest) | REST transport | [![pub](https://img.shields.io/pub/v/flutter_magento_rest.svg)](https://pub.dev/packages/flutter_magento_rest) |
| [flutter_magento_offline](https://pub.dev/packages/flutter_magento_offline) | Offline support | [![pub](https://img.shields.io/pub/v/flutter_magento_offline.svg)](https://pub.dev/packages/flutter_magento_offline) |
| [flutter_magento_marketplace](https://pub.dev/packages/flutter_magento_marketplace) | Multi-vendor marketplace | [![pub](https://img.shields.io/pub/v/flutter_magento_marketplace.svg)](https://pub.dev/packages/flutter_magento_marketplace) |
| [flutter_magento_blockchain](https://pub.dev/packages/flutter_magento_blockchain) | Blockchain payments | [![pub](https://img.shields.io/pub/v/flutter_magento_blockchain.svg)](https://pub.dev/packages/flutter_magento_blockchain) |

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
* Riverpod state management integration

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
* Blockchain payments (ICP, EVM)

---

## Installation

### Option 1: Umbrella package (recommended for most apps)

```yaml
dependencies:
  flutter_magento: ^1.0.0
```

### Option 2: Individual packages (for smaller bundle size)

```yaml
dependencies:
  flutter_magento_core: ^1.0.0
  flutter_magento_auth: ^1.0.0
  flutter_magento_catalog: ^1.0.0
  flutter_magento_cart: ^1.0.0
  flutter_magento_graphql: ^1.0.0
```

### Optional packages

```yaml
dependencies:
  # Offline support
  flutter_magento_offline: ^1.0.0

  # Multi-vendor marketplace
  flutter_magento_marketplace: ^1.0.0

  # Blockchain payments (ICP, EVM, NFT)
  flutter_magento_blockchain: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## Quick Start

### 1. Setup with Riverpod

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

### 2. Load products

```dart
// Using Riverpod
final products = ref.watch(
  productsProvider(ProductQueryParams(categoryId: 5)),
);

// Using repository directly
final productRepository = MagentoCatalogRepository(transport: transport);
final products = await productRepository.searchProducts(
  query: 'shirt',
  page: 1,
  pageSize: 20,
);

for (final product in products.items) {
  print('${product.name}: ${product.price.formatted}');
}
```

### 3. Add to cart

```dart
// Using Riverpod
await ref.read(cartControllerProvider.notifier).addProduct(
  sku: 'SKU-001',
  quantity: 1,
);

// Using repository directly
final cartRepository = MagentoCartRepository(transport: transport);
final cart = await cartRepository.addItem(
  AddToCartInput(sku: 'shirt-blue-m', quantity: 1),
);
```

### 4. Customer login

```dart
// Using Riverpod
await ref.read(authControllerProvider.notifier).login(
  email: 'user@example.com',
  password: 'password123',
);

// Check auth state
final authState = ref.watch(authStateProvider);
```

---

## Core Concepts

### Transport Layer

The transport layer handles communication with Magento or your backend.

```dart
abstract interface class MagentoTransport {
  Future<MagentoResponse<T>> execute<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
  });
}
```

Available transports:

| Transport | Description |
|-----------|-------------|
| `GraphQlMagentoTransport` | Direct GraphQL communication |
| `RestMagentoTransport` | REST API communication |
| `LoggingMagentoTransport` | Logging decorator |
| `RetryMagentoTransport` | Retry with exponential backoff |
| `CachedMagentoTransport` | Response caching |

Example with decorators:

```dart
var transport = GraphQlMagentoTransport(
  baseUrl: 'https://magento.example.com/graphql',
  storeContext: context,
  authStorage: storage,
);

// Add caching
transport = CachedMagentoTransport(
  inner: transport,
  config: GraphQlCacheConfig(defaultTtl: Duration(minutes: 5)),
);

// Add retry
transport = RetryMagentoTransport(
  inner: transport,
  maxRetries: 3,
);

// Add logging (outermost)
transport = LoggingMagentoTransport(
  inner: transport,
  logger: ConsoleMagentoLogger(),
);
```

---

### Store Context

Magento often has multiple websites, stores, languages, and currencies.

```dart
final context = MagentoStoreContext(
  websiteCode: 'base',
  storeCode: 'default',
  currencyCode: 'USD',
  locale: 'en_US',
);
```

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

Available implementations:

| Implementation | Description |
|----------------|-------------|
| `SecureMagentoAuthStorage` | Flutter secure storage |
| `InMemoryMagentoAuthStorage` | Memory storage for testing |

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
  Future<ProductPage> getProductsByCategory({...});
}
```

### CartRepository

```dart
abstract interface class CartRepository {
  Future<Cart> getCart();
  Future<Cart> addItem(AddToCartInput input);
  Future<Cart> updateItem(UpdateCartItemInput input);
  Future<Cart> removeItem(String itemId);
  Future<Cart> applyCoupon(String couponCode);
  Future<Cart> removeCoupon();
  Future<void> clearCart();
}
```

### AuthRepository

```dart
abstract interface class AuthRepository {
  Future<AuthResult> login(LoginInput input);
  Future<void> logout();
  Future<Customer> getCurrentCustomer();
  Future<AuthResult> register(RegisterInput input);
  Future<void> requestPasswordReset(String email);
}
```

### ProfileRepository

```dart
abstract interface class ProfileRepository {
  Future<Customer> getProfile();
  Future<Customer> updateProfile(CustomerUpdateInput input);
  Future<List<CustomerAddress>> getAddresses();
  Future<CustomerAddress> addAddress(AddressInput input);
  Future<CustomerAddress> updateAddress(String id, AddressInput input);
  Future<void> deleteAddress(String id);
}
```

---

## Error Handling

All Magento errors are mapped to typed exceptions:

```dart
try {
  await authRepository.login(credentials);
} on MagentoAuthException catch (e) {
  // Token expired, invalid credentials
} on MagentoNotFoundException catch (e) {
  // Resource not found
} on MagentoValidationException catch (e) {
  // Invalid input
} on MagentoNetworkException catch (e) {
  // Network error
} on MagentoServerException catch (e) {
  // Server error (5xx)
}
```

---

## Offline Support

The `flutter_magento_offline` package provides offline-first architecture:

```dart
import 'package:flutter_magento_offline/flutter_magento_offline.dart';

// Wrap repository with offline support
final offlineCatalog = OfflineCatalogRepository(
  inner: catalogRepository,
  storage: HiveCatalogStorage(),
  config: OfflineConfig(
    strategy: CacheStrategy.cacheFirst,
    ttl: Duration(hours: 24),
  ),
);

// Sync operations
final syncEngine = MagentoSyncEngine(
  catalogRepository: offlineCatalog,
  cartRepository: offlineCart,
);

// Listen to sync events
syncEngine.events.listen((event) {
  if (event is SyncCompleted) {
    print('Synced ${event.itemCount} items');
  }
});

// Manual sync
await syncEngine.syncAll();
```

---

## Multi-Vendor Marketplace

The `flutter_magento_marketplace` package supports multi-vendor scenarios:

```dart
import 'package:flutter_magento_marketplace/flutter_magento_marketplace.dart';

final sellerRepository = MagentoSellerRepository(transport: transport);

// Get sellers
final sellers = await sellerRepository.getSellers(
  page: 1,
  pageSize: 20,
  filter: SellerFilter(isVerified: true, minRating: 4.0),
);

// Group cart by seller
final cartExtension = MarketplaceCartExtension(
  sellerRepository: sellerRepository,
);
final cartBySeller = await cartExtension.getCartBySeller(cart);

// Split checkout
final checkoutExtension = MarketplaceCheckoutExtension(
  sellerRepository: sellerRepository,
);
final orders = await checkoutExtension.createSplitOrders(
  cart: cart,
  shippingAddress: address,
  paymentMethod: payment,
);
```

---

## Blockchain Payments

The `flutter_magento_blockchain` package provides ICP and EVM payment integrations:

```dart
import 'package:flutter_magento_blockchain/flutter_magento_blockchain.dart';

// ICP Payments
final icpAdapter = ICPPaymentAdapter(
  icpClient: myICPClient,
  config: BlockchainConfig.mainnet(
    merchantWalletAddress: 'your-principal-id',
  ),
);

await icpAdapter.connectWallet();
final balance = await icpAdapter.getWalletBalance();

final result = await icpAdapter.pay(
  cart: cart,
  context: PaymentContext(orderId: 'ORD-123'),
);

// EVM Payments (Ethereum, Polygon, etc.)
final polygonAdapter = EVMPaymentAdapter(
  evmClient: myEVMClient,
  config: BlockchainConfig.mainnet(merchantWalletAddress: '0x...'),
  network: BlockchainNetwork.polygon,
);

// NFT Products
final nftExtension = NFTProductExtension(nftClient: myNftClient);
if (nftExtension.isNFTProduct(product)) {
  final nftData = nftExtension.getNFTMetadata(product);
  print('Token ID: ${nftData.tokenId}');
}

// Yuku Marketplace
final yuku = YukuMarketplaceExtension(yukuClient: myYukuClient);
final listing = await yuku.syncProduct(product);
```

---

## UI Widgets

The `flutter_magento_ui` package provides themed e-commerce widgets:

```dart
import 'package:flutter_magento_ui/flutter_magento_ui.dart';

// Apply theme
MaterialApp(
  theme: MagentoTheme.light(),
  darkTheme: MagentoTheme.dark(),
  // ...
)

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

---

## Localization

The `flutter_magento_localizations` package provides i18n and formatting:

```dart
import 'package:flutter_magento_localizations/flutter_magento_localizations.dart';

// Setup
MaterialApp(
  localizationsDelegates: [
    MagentoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: MagentoLocalizations.supportedLocales,
)

// Usage
final l10n = MagentoLocalizations.of(context);
Text(l10n.addToCart);
Text(l10n.outOfStock);

// Currency formatting
final formatted = MagentoCurrencyFormatter.format(
  99.99,
  currencyCode: 'USD',
  locale: 'en_US',
);
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
│ flutter_magento_riverpod                   │
└────────────────────────────────────────────┘
                    ↓
┌────────────────────────────────────────────┐
│ Domain Repositories                        │
│ CatalogRepository, CartRepository          │
│ AuthRepository, ProfileRepository          │
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
final transport = GraphQlMagentoTransport(
  baseUrl: 'https://shop.example.com/graphql',
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currencyCode: 'USD',
  ),
  authStorage: SecureMagentoAuthStorage(),
);
```

### Direct REST mode

Useful for admin-like operations or features not covered by GraphQL.

```dart
final transport = RestMagentoTransport(
  baseUrl: 'https://shop.example.com/rest',
  storeContext: context,
  authStorage: storage,
);
```

### BFF mode

For serious production apps, use a Backend-for-Frontend.

```text
Flutter
   ↓
Mobile API / BFF
   ↓
Magento GraphQL + REST + Custom Modules
   ↓
Magento
```

---

## Product Types

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

---

## Custom Attributes

Magento stores often rely on custom attributes. Access them via `customAttributes`:

```dart
final brand = product.customAttributes['brand'];
final vendorId = product.customAttributes['vendor_id'];
```

All domain entities extend `MagentoEntity`:

```dart
class MagentoEntity {
  final Map<String, dynamic> customAttributes;

  T? attr<T>(String code) {
    final value = customAttributes[code];
    if (value is T) return value;
    return null;
  }
}
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

---

## Development

Clone the repository:

```bash
git clone https://github.com/libsMagento/flutter_magento.git
cd flutter_magento
```

Install dependencies for all packages:

```bash
cd packages/flutter_magento_core && flutter pub get && cd ../..
cd packages/flutter_magento_auth && flutter pub get && cd ../..
# ... repeat for all packages
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

## License

MIT License

---

## Maintainer


Maintained by NativeMind
* GitHub: [https://github.com/libsMagento/flutter_magento](https://github.com/libsMagento/flutter_magento)

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
