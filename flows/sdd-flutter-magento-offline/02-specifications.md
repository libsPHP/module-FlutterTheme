# Specifications: flutter_magento_offline

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_offline provides cache decorators for repositories and a sync engine for offline operations. It uses the decorator pattern to wrap existing repositories without changing their interface.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| MagentoCache interface | Create | Abstract cache operations |
| HiveMagentoCache | Create | Hive-based implementation |
| CachedCatalogRepository | Create | Caching decorator |
| OfflineCartRepository | Create | Queue + cache decorator |
| MagentoSyncEngine | Create | Background sync |
| OperationQueue | Create | Pending operations storage |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                  flutter_magento_offline                     │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │               MagentoSyncEngine                     │     │
│  │         (Background sync coordinator)               │     │
│  └────────────────────────────────────────────────────┘     │
│                          │                                   │
│  ┌───────────────────────┼───────────────────────────┐      │
│  ▼                       ▼                           ▼      │
│ ┌──────────┐  ┌──────────────────┐  ┌──────────────────┐   │
│ │ Cached   │  │ OfflineCart      │  │ Operation        │   │
│ │ Catalog  │  │ Repository       │  │ Queue            │   │
│ │ Repo     │  │                  │  │                  │   │
│ └────┬─────┘  └────────┬─────────┘  └──────────────────┘   │
│      │                 │                                    │
│      └─────────────────┼────────────────────────────────┐  │
│                        ▼                                │  │
│               ┌──────────────────┐                      │  │
│               │  MagentoCache    │◄─────────────────────┘  │
│               │  (Interface)     │                          │
│               └────────┬─────────┘                          │
│                        │                                    │
│               ┌────────▼─────────┐                          │
│               │ HiveMagentoCache │                          │
│               └──────────────────┘                          │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### MagentoCache

```dart
abstract interface class MagentoCache {
  Future<T?> get<T>(String key, T Function(Map<String, dynamic>) decoder);
  Future<void> set<T>(String key, T value, {Duration? ttl});
  Future<void> delete(String key);
  Future<void> deleteByPrefix(String prefix);
  Future<void> clear();
  Future<bool> containsKey(String key);
  Future<CacheEntry<T>?> getWithMetadata<T>(
    String key,
    T Function(Map<String, dynamic>) decoder,
  );
}

class CacheEntry<T> {
  final T data;
  final DateTime createdAt;
  final DateTime? expiresAt;
  final bool isExpired;

  const CacheEntry({...});
}
```

### HiveMagentoCache

```dart
class HiveMagentoCache implements MagentoCache {
  final Box<Map> _box;
  final Duration defaultTtl;
  final int maxEntries;

  HiveMagentoCache({
    required Box<Map> box,
    this.defaultTtl = const Duration(hours: 1),
    this.maxEntries = 1000,
  }) : _box = box;

  static Future<HiveMagentoCache> open({
    String boxName = 'magento_cache',
    Duration? defaultTtl,
    int? maxEntries,
  }) async {
    await Hive.initFlutter();
    final box = await Hive.openBox<Map>(boxName);
    return HiveMagentoCache(
      box: box,
      defaultTtl: defaultTtl ?? const Duration(hours: 1),
      maxEntries: maxEntries ?? 1000,
    );
  }
}
```

### CachedCatalogRepository

```dart
class CachedCatalogRepository implements CatalogRepository {
  final CatalogRepository inner;
  final MagentoCache cache;
  final CatalogCacheConfig config;

  CachedCatalogRepository({
    required this.inner,
    required this.cache,
    this.config = const CatalogCacheConfig(),
  });

  @override
  Future<ProductPage> searchProducts({...}) async {
    final key = _buildProductsKey(query, filter, sort, page, pageSize);
    final cached = await cache.getWithMetadata(key, ProductPage.fromJson);

    if (cached != null && !cached.isExpired) {
      return cached.data;
    }

    if (!await _isOnline() && cached != null) {
      return cached.data;  // Stale data when offline
    }

    final fresh = await inner.searchProducts(...);
    await cache.set(key, fresh, ttl: config.productListTtl);
    return fresh;
  }
}
```

### OfflineCartRepository

```dart
class OfflineCartRepository implements CartRepository {
  final CartRepository inner;
  final MagentoCache cache;
  final OperationQueue queue;

  @override
  Future<Cart> addSimpleProduct({
    required String sku,
    required int quantity,
  }) async {
    if (!await _isOnline()) {
      await queue.enqueue(CartOperation.addSimple(sku: sku, quantity: quantity));
      // Optimistic update on cached cart
      final cached = await cache.get('cart:current', Cart.fromJson);
      if (cached != null) {
        return cached.withOptimisticAdd(sku, quantity);
      }
      throw MagentoNetworkException('Offline and no cached cart');
    }

    final cart = await inner.addSimpleProduct(sku: sku, quantity: quantity);
    await cache.set('cart:current', cart);
    return cart;
  }
}
```

### MagentoSyncEngine

```dart
class MagentoSyncEngine {
  final OperationQueue queue;
  final CartRepository cartRepository;

  Stream<SyncEvent> get events => _eventController.stream;

  Future<SyncResult> sync() async {
    final operations = await queue.getPending();
    int completed = 0, failed = 0;

    for (final op in operations) {
      try {
        await _executeOperation(op);
        await queue.markCompleted(op.id);
        completed++;
      } catch (e) {
        await queue.markFailed(op.id, e.toString());
        failed++;
      }
    }

    return SyncResult(completed: completed, failed: failed);
  }
}

sealed class SyncEvent {
  factory SyncEvent.started() = SyncStarted;
  factory SyncEvent.progress(int current, int total) = SyncProgress;
  factory SyncEvent.completed(int completed, int failed) = SyncCompleted;
  factory SyncEvent.failed(MagentoException error) = SyncFailed;
}
```

## Dependencies

### Requires

- flutter_magento_core
- hive: ^2.2.0
- hive_flutter: ^1.1.0
- connectivity_plus: ^5.0.0

## Package Structure

```
lib/
├── flutter_magento_offline.dart
└── src/
    ├── cache/
    │   ├── magento_cache.dart
    │   ├── hive_magento_cache.dart
    │   └── cache_entry.dart
    ├── repositories/
    │   ├── cached_catalog_repository.dart
    │   └── offline_cart_repository.dart
    ├── queue/
    │   ├── operation_queue.dart
    │   └── operations.dart
    ├── sync/
    │   ├── magento_sync_engine.dart
    │   └── sync_event.dart
    └── config/
        └── cache_config.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
