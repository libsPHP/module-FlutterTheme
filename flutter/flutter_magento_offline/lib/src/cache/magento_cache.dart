import 'cache_entry.dart';

/// Abstract interface for cache operations.
abstract interface class MagentoCache {
  /// Gets a cached value by key.
  Future<T?> get<T>(String key, T Function(Map<String, dynamic>) decoder);

  /// Sets a value in cache with optional TTL.
  Future<void> set<T>(
    String key,
    T value, {
    Duration? ttl,
    Map<String, dynamic> Function(T)? encoder,
  });

  /// Deletes a value from cache.
  Future<void> delete(String key);

  /// Deletes all values with keys starting with prefix.
  Future<void> deleteByPrefix(String prefix);

  /// Clears all cached values.
  Future<void> clear();

  /// Checks if a key exists in cache.
  Future<bool> containsKey(String key);

  /// Gets a cached value with metadata.
  Future<CacheEntry<T>?> getWithMetadata<T>(
    String key,
    T Function(Map<String, dynamic>) decoder,
  );

  /// Gets all keys in the cache.
  Future<List<String>> getKeys();

  /// Gets the total number of entries in the cache.
  Future<int> get length;
}
