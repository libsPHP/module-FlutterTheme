# flutter_magento_offline

[![pub package](https://img.shields.io/pub/v/flutter_magento_offline.svg)](https://pub.dev/packages/flutter_magento_offline)

Offline support and caching for Flutter Magento SDK.

## Features

- Repository caching with TTL
- Offline cart operation queue
- Background sync engine
- Hive-based persistent storage
- Connectivity detection
- Decorator pattern for easy integration

## Installation

```yaml
dependencies:
  flutter_magento_offline: ^1.0.0
```

## Usage

### Setup Cache

```dart
import 'package:flutter_magento_offline/flutter_magento_offline.dart';

// Initialize Hive
await Hive.initFlutter();

// Create cache instance
final cache = HiveMagentoCache(
  boxName: 'magento_cache',
);
await cache.init();
```

### Cached Catalog Repository

```dart
final cachedCatalog = CachedCatalogRepository(
  inner: catalogRepository,
  cache: cache,
  config: CacheConfig(
    productsTtl: Duration(minutes: 15),
    categoriesTtl: Duration(hours: 1),
    productDetailsTtl: Duration(minutes: 30),
  ),
);

// First call: fetches from network, caches result
final products = await cachedCatalog.getProducts(page: 1, pageSize: 20);

// Subsequent calls within TTL: returns cached data
final cachedProducts = await cachedCatalog.getProducts(page: 1, pageSize: 20);
```

### Offline Cart Operations

```dart
final queue = OperationQueue(cache: cache);

final offlineCart = OfflineCartRepository(
  inner: cartRepository,
  queue: queue,
);

// When offline, operations are queued
await offlineCart.addSimpleProduct(
  cartId: cartId,
  sku: 'SHIRT-001',
  quantity: 1,
);

// Check pending operations
final pending = await queue.getPendingOperations();
print('${pending.length} operations pending');
```

### Sync Engine

```dart
final syncEngine = MagentoSyncEngine(
  queue: queue,
  cartRepository: cartRepository,
);

// Listen to sync events
syncEngine.events.listen((event) {
  switch (event) {
    case SyncStarted():
      print('Sync started');
    case SyncProgress(completed: final c, total: final t):
      print('Progress: $c/$t');
    case SyncCompleted(result: final r):
      print('Synced ${r.succeeded} operations');
    case SyncFailed(error: final e):
      print('Sync failed: $e');
  }
});

// Trigger sync when online
final result = await syncEngine.sync();
print('Succeeded: ${result.succeeded}, Failed: ${result.failed}');
```

### Operation Types

```dart
// Available cart operations for offline queue
sealed class CartOperation {
  factory CartOperation.addSimple({
    required String sku,
    required int quantity,
  });

  factory CartOperation.addConfigurable({
    required String parentSku,
    required String variantSku,
    required int quantity,
  });

  factory CartOperation.updateQuantity({
    required String itemId,
    required int quantity,
  });

  factory CartOperation.remove({
    required String itemId,
  });

  factory CartOperation.applyCoupon({
    required String couponCode,
  });

  factory CartOperation.removeCoupon();
}
```

### Cache Entry with Metadata

```dart
// Get cached data with metadata
final entry = await cache.getWithMetadata<ProductPage>(
  'products_page_1',
  ProductPage.fromJson,
);

if (entry != null) {
  print('Cached at: ${entry.cachedAt}');
  print('Expires at: ${entry.expiresAt}');
  print('Is expired: ${entry.isExpired}');
}
```

### Clear Cache

```dart
// Clear specific key
await cache.delete('products_page_1');

// Clear by prefix
await cache.deleteByPrefix('products_');

// Clear all
await cache.clear();
```

## API Reference

| Class | Description |
|-------|-------------|
| `MagentoCache` | Cache interface |
| `HiveMagentoCache` | Hive implementation |
| `CacheEntry` | Cached data with metadata |
| `CacheConfig` | TTL configuration |
| `CachedCatalogRepository` | Caching decorator for catalog |
| `OfflineCartRepository` | Offline-capable cart |
| `OperationQueue` | Pending operations queue |
| `CartOperation` | Cart operation types |
| `MagentoSyncEngine` | Background sync coordinator |
| `SyncEvent` | Sync status events |
| `SyncResult` | Sync operation result |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_catalog](https://pub.dev/packages/flutter_magento_catalog) - Catalog repository
- [flutter_magento_cart](https://pub.dev/packages/flutter_magento_cart) - Cart repository
