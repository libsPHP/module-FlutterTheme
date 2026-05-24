# Specifications: flutter_magento (Umbrella Package)

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento is the umbrella package that re-exports all sub-packages and provides factory methods for common configurations. It serves as the single entry point for most users while allowing advanced users to import specific packages.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| Package exports | Create | Re-export all sub-packages |
| MagentoSdkFactory | Create | Factory methods for setup |
| Legacy adapters | Create | Backward compatibility |

## Architecture

### Package Dependency Graph

```
┌─────────────────────────────────────────────────────────────┐
│                      flutter_magento                         │
│                    (Umbrella Package)                        │
└───────────────────────────┬─────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
┌───────────────┐  ┌───────────────┐  ┌───────────────┐
│   riverpod    │  │     ui        │  │   offline     │
└───────┬───────┘  └───────┬───────┘  └───────┬───────┘
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
┌───────────────┐  ┌───────────────┐  ┌───────────────┐
│     auth      │  │    catalog    │  │     cart      │
└───────┬───────┘  └───────┬───────┘  └───────┬───────┘
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
┌───────────────┐  ┌───────────────┐  ┌───────────────┐
│    graphql    │  │     rest      │  │localizations  │
└───────┬───────┘  └───────┬───────┘  └───────┬───────┘
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
                            ▼
                ┌───────────────────────┐
                │   flutter_magento_core │
                │   (Foundation Layer)   │
                └───────────────────────┘
```

## Factory Methods

### MagentoSdkFactory

```dart
class MagentoSdkFactory {
  /// Create a fully configured MagentoClient for GraphQL API
  static MagentoClient graphql({
    required String baseUrl,
    required MagentoStoreContext storeContext,
    MagentoAuthStorage? authStorage,
    MagentoCache? cache,
    List<MagentoObserver>? observers,
    MagentoLogger? logger,
    Duration? timeout,
    bool enableLogging = false,
    bool enableRetry = true,
  }) {
    var transport = GraphQlMagentoTransport(
      baseUrl: baseUrl,
      storeContext: storeContext,
      authStorage: authStorage ?? SecureMagentoAuthStorage(),
      timeout: timeout ?? const Duration(seconds: 30),
    );

    if (enableLogging) {
      transport = LoggingMagentoTransport(
        inner: transport,
        logger: logger ?? ConsoleMagentoLogger(),
      );
    }

    if (enableRetry) {
      transport = RetryMagentoTransport(inner: transport);
    }

    return MagentoClient(
      transport: transport,
      authStorage: authStorage ?? SecureMagentoAuthStorage(),
      storeContext: storeContext,
      logger: logger,
      cache: cache,
      observers: observers ?? [],
    );
  }

  /// Create a fully configured MagentoClient for REST API
  static MagentoClient rest({
    required String baseUrl,
    required MagentoStoreContext storeContext,
    MagentoAuthStorage? authStorage,
    MagentoCache? cache,
    List<MagentoObserver>? observers,
    MagentoLogger? logger,
    Duration? timeout,
    bool enableLogging = false,
    bool enableRetry = true,
    List<Interceptor>? dioInterceptors,
  }) {
    // Similar setup for REST
  }

  /// Create MagentoClient for testing with mock transport
  static MagentoClient mock({
    required MockMagentoTransport transport,
    MagentoStoreContext? storeContext,
    MagentoAuthStorage? authStorage,
  }) {
    return MagentoClient(
      transport: transport,
      authStorage: authStorage ?? MemoryMagentoAuthStorage(),
      storeContext: storeContext ?? MagentoStoreContext.defaults(),
    );
  }

  /// Create with custom transport (BFF, hybrid, etc.)
  static MagentoClient custom({
    required MagentoTransport transport,
    required MagentoStoreContext storeContext,
    required MagentoAuthStorage authStorage,
    MagentoCache? cache,
    List<MagentoObserver>? observers,
    MagentoLogger? logger,
  });
}
```

## Package Exports

### Main Export File

```dart
// flutter_magento.dart

// Core types
export 'package:flutter_magento_core/flutter_magento_core.dart';

// Transport implementations
export 'package:flutter_magento_graphql/flutter_magento_graphql.dart';
export 'package:flutter_magento_rest/flutter_magento_rest.dart';

// Domain packages
export 'package:flutter_magento_auth/flutter_magento_auth.dart';
export 'package:flutter_magento_catalog/flutter_magento_catalog.dart';
export 'package:flutter_magento_cart/flutter_magento_cart.dart';
export 'package:flutter_magento_profile/flutter_magento_profile.dart';

// State management
export 'package:flutter_magento_riverpod/flutter_magento_riverpod.dart';

// UI components
export 'package:flutter_magento_ui/flutter_magento_ui.dart';

// Offline support
export 'package:flutter_magento_offline/flutter_magento_offline.dart';

// Localizations
export 'package:flutter_magento_localizations/flutter_magento_localizations.dart';

// Factory
export 'src/factory/magento_sdk_factory.dart';

// Legacy compatibility (deprecated)
export 'src/legacy/legacy_flutter_magento.dart';
```

## Legacy Compatibility

```dart
/// Legacy class for backward compatibility
@Deprecated('Use MagentoClient from flutter_magento_core instead')
class FlutterMagento {
  final MagentoClient _client;

  FlutterMagento._(this._client);

  factory FlutterMagento({
    required String baseUrl,
    String? storeCode,
    String? currency,
    String? locale,
  }) {
    return FlutterMagento._(MagentoSdkFactory.graphql(
      baseUrl: baseUrl,
      storeContext: MagentoStoreContext(
        storeCode: storeCode ?? 'default',
        currency: currency ?? 'USD',
        locale: locale ?? 'en_US',
      ),
    ));
  }

  /// Access new client for migration
  MagentoClient get client => _client;

  @Deprecated('Use client.catalog.searchProducts() instead')
  Future<List<Product>> getProducts() async {
    final page = await _client.catalog.searchProducts(page: 1, pageSize: 20);
    return page.items.map(_toLegacyProduct).toList();
  }

  @Deprecated('Use client.cart.addSimpleProduct() instead')
  Future<void> addToCart(String sku, int quantity) {
    return _client.cart.addSimpleProduct(sku: sku, quantity: quantity);
  }

  // ... other legacy methods with @Deprecated
}
```

## Usage Examples

### Quick Start (Simple)

```dart
import 'package:flutter_magento/flutter_magento.dart';

final magento = MagentoSdkFactory.graphql(
  baseUrl: 'https://shop.example.com/graphql',
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currency: 'USD',
    locale: 'en_US',
  ),
);

// Use it
final products = await magento.catalog.searchProducts(
  query: 'phone',
  page: 1,
  pageSize: 20,
);
```

### Advanced (Full Control)

```dart
import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_magento_graphql/flutter_magento_graphql.dart';
import 'package:flutter_magento_auth/flutter_magento_auth.dart';
import 'package:flutter_magento_catalog/flutter_magento_catalog.dart';
import 'package:flutter_magento_offline/flutter_magento_offline.dart';

// Custom transport with caching
final transport = CachedMagentoTransport(
  inner: LoggingMagentoTransport(
    inner: GraphQlMagentoTransport(
      baseUrl: 'https://shop.example.com/graphql',
      storeContext: context,
      authStorage: SecureMagentoAuthStorage(),
    ),
    logger: SentryMagentoLogger(),
  ),
  cache: HiveMagentoCache.open(),
);

// Custom repository with caching
final catalog = CachedCatalogRepository(
  inner: MagentoCatalogRepository(transport),
  cache: cache,
);

// Build client
final magento = MagentoClient(
  transport: transport,
  catalog: catalog,
  // ... custom repositories
);
```

## Dependencies

### Requires

All flutter_magento_* packages as dependencies

## Package Structure

```
lib/
├── flutter_magento.dart        # Main export file
└── src/
    ├── factory/
    │   └── magento_sdk_factory.dart
    └── legacy/
        └── legacy_flutter_magento.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
