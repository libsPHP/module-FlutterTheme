# Implementation Plan: flutter_magento_offline

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_offline provides cache decorators and sync engine for offline support. Uses Hive for local storage, decorator pattern for repositories, and operation queue for pending mutations. Connectivity detection determines online/offline behavior.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_offline/lib/flutter_magento_offline.dart` - Modify
  - `packages/flutter_magento_offline/lib/flutter_magento_offline_method_channel.dart` - Delete
  - `packages/flutter_magento_offline/lib/flutter_magento_offline_platform_interface.dart` - Delete
  - `packages/flutter_magento_offline/android/` - Delete
  - `packages/flutter_magento_offline/ios/` - Delete
  - `packages/flutter_magento_offline/linux/` - Delete
  - `packages/flutter_magento_offline/macos/` - Delete
  - `packages/flutter_magento_offline/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, hive, hive_flutter, connectivity_plus
- **Files**:
  - `packages/flutter_magento_offline/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Cache Infrastructure

#### Task 2.1: Create MagentoCache Interface
- **Description**: Abstract cache operations interface
- **Files**:
  - `packages/flutter_magento_offline/lib/src/cache/magento_cache.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Interface compiles
- **Complexity**: Low

#### Task 2.2: Create CacheEntry Model
- **Description**: Cache entry with metadata (TTL, expiry)
- **Files**:
  - `packages/flutter_magento_offline/lib/src/cache/cache_entry.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.3: Create HiveMagentoCache
- **Description**: Hive-based cache implementation
- **Files**:
  - `packages/flutter_magento_offline/lib/src/cache/hive_magento_cache.dart` - Create
- **Dependencies**: Task 2.1, Task 2.2
- **Verification**: Cache operations work
- **Complexity**: Medium

#### Task 2.4: Create CatalogCacheConfig
- **Description**: Configuration for catalog caching TTLs
- **Files**:
  - `packages/flutter_magento_offline/lib/src/config/cache_config.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config instantiation works
- **Complexity**: Low

### Phase 3: Operation Queue

#### Task 3.1: Create CartOperation Model
- **Description**: Serializable cart operation types
- **Files**:
  - `packages/flutter_magento_offline/lib/src/queue/operations.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Operations serialize/deserialize
- **Complexity**: Medium

#### Task 3.2: Create OperationQueue
- **Description**: Persistent queue for pending operations
- **Files**:
  - `packages/flutter_magento_offline/lib/src/queue/operation_queue.dart` - Create
- **Dependencies**: Task 3.1
- **Verification**: Queue persists to Hive
- **Complexity**: Medium

### Phase 4: Cached Repositories

#### Task 4.1: Create CachedCatalogRepository
- **Description**: Caching decorator for CatalogRepository
- **Files**:
  - `packages/flutter_magento_offline/lib/src/repositories/cached_catalog_repository.dart` - Create
- **Dependencies**: Task 2.3, Task 2.4
- **Verification**: Cache hits work, stale data on offline
- **Complexity**: High

#### Task 4.2: Create OfflineCartRepository
- **Description**: Queue + cache decorator for CartRepository
- **Files**:
  - `packages/flutter_magento_offline/lib/src/repositories/offline_cart_repository.dart` - Create
- **Dependencies**: Task 2.3, Task 3.2
- **Verification**: Optimistic updates work offline
- **Complexity**: High

### Phase 5: Sync Engine

#### Task 5.1: Create SyncEvent
- **Description**: Sealed class for sync events
- **Files**:
  - `packages/flutter_magento_offline/lib/src/sync/sync_event.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Events compile
- **Complexity**: Low

#### Task 5.2: Create SyncResult
- **Description**: Sync operation result
- **Files**:
  - `packages/flutter_magento_offline/lib/src/sync/sync_result.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Result model compiles
- **Complexity**: Low

#### Task 5.3: Create MagentoSyncEngine
- **Description**: Background sync coordinator
- **Files**:
  - `packages/flutter_magento_offline/lib/src/sync/magento_sync_engine.dart` - Create
- **Dependencies**: Task 3.2, Task 5.1, Task 5.2
- **Verification**: Sync executes queued operations
- **Complexity**: High

### Phase 6: Exports and Tests

#### Task 6.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_offline/lib/flutter_magento_offline.dart` - Modify
- **Dependencies**: All previous tasks
- **Verification**: All types accessible
- **Complexity**: Low

#### Task 6.2: Create Unit Tests
- **Description**: Test cache, queue, sync
- **Files**:
  - `packages/flutter_magento_offline/test/hive_cache_test.dart` - Create
  - `packages/flutter_magento_offline/test/operation_queue_test.dart` - Create
  - `packages/flutter_magento_offline/test/sync_engine_test.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──┬──→ Task 2.3 ──┬──→ Task 4.1 ──┐
                        │               │               │               │
                        ├──→ Task 2.2 ──┘               │               │
                        │                               │               │
                        ├──→ Task 2.4 ──────────────────┘               │
                        │                                               │
                        ├──→ Task 3.1 ──→ Task 3.2 ──┬──→ Task 4.2 ──┐ │
                        │                            │               │ │
                        └──→ Task 5.1 ──┐            │               │ │
                                        │            │               │ │
                        └──→ Task 5.2 ──┴──→ Task 5.3────────────────┴─┴──→ Task 6.1 ──→ Task 6.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_offline.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/cache/*.dart` | Create | Cache infrastructure |
| `lib/src/config/*.dart` | Create | Configuration |
| `lib/src/queue/*.dart` | Create | Operation queue |
| `lib/src/repositories/*.dart` | Create | Cached repositories |
| `lib/src/sync/*.dart` | Create | Sync engine |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Cache corruption | Low | High | Graceful degradation |
| Sync conflicts | Medium | Medium | Last-write-wins strategy |
| Hive initialization issues | Low | Medium | Try-catch with fallback |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
