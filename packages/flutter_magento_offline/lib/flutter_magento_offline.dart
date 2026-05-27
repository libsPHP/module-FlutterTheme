/// Offline support and caching for Flutter Magento SDK.
///
/// Provides cache decorators for repositories, operation queue for offline
/// mutations, and sync engine for background synchronization.
library;

// Cache
export 'src/cache/cache_entry.dart';
export 'src/cache/magento_cache.dart';
export 'src/cache/hive_magento_cache.dart';

// Config
export 'src/config/cache_config.dart';

// Queue
export 'src/queue/operations.dart';
export 'src/queue/operation_queue.dart';

// Repositories
export 'src/repositories/cached_catalog_repository.dart';
export 'src/repositories/offline_cart_repository.dart';

// Sync
export 'src/sync/sync_event.dart';
export 'src/sync/sync_result.dart';
export 'src/sync/magento_sync_engine.dart';
