import 'package:hive_flutter/hive_flutter.dart';

import 'cache_entry.dart';
import 'magento_cache.dart';

/// Hive-based implementation of MagentoCache.
class HiveMagentoCache implements MagentoCache {
  final Box<Map> _box;

  /// Default TTL for cached entries.
  final Duration defaultTtl;

  /// Maximum number of entries to keep.
  final int maxEntries;

  HiveMagentoCache({
    required Box<Map> box,
    this.defaultTtl = const Duration(hours: 1),
    this.maxEntries = 1000,
  }) : _box = box;

  /// Opens or creates a HiveMagentoCache.
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

  @override
  Future<T?> get<T>(
    String key,
    T Function(Map<String, dynamic>) decoder,
  ) async {
    final entry = await getWithMetadata(key, decoder);
    if (entry == null || entry.isExpired) {
      if (entry?.isExpired == true) {
        await delete(key);
      }
      return null;
    }
    return entry.data;
  }

  @override
  Future<void> set<T>(
    String key,
    T value, {
    Duration? ttl,
    Map<String, dynamic> Function(T)? encoder,
  }) async {
    final effectiveTtl = ttl ?? defaultTtl;
    final now = DateTime.now();

    final entryData = <String, dynamic>{
      'data': encoder != null ? encoder(value) : (value as dynamic).toJson(),
      'createdAt': now.toIso8601String(),
      'expiresAt': now.add(effectiveTtl).toIso8601String(),
    };

    await _box.put(key, entryData);
    await _evictIfNeeded();
  }

  @override
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> deleteByPrefix(String prefix) async {
    final keysToDelete = _box.keys
        .whereType<String>()
        .where((key) => key.startsWith(prefix))
        .toList();

    for (final key in keysToDelete) {
      await _box.delete(key);
    }
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<bool> containsKey(String key) async {
    if (!_box.containsKey(key)) return false;

    // Check if expired
    final raw = _box.get(key);
    if (raw == null) return false;

    final expiresAtStr = raw['expiresAt'] as String?;
    if (expiresAtStr != null) {
      final expiresAt = DateTime.parse(expiresAtStr);
      if (DateTime.now().isAfter(expiresAt)) {
        await delete(key);
        return false;
      }
    }

    return true;
  }

  @override
  Future<CacheEntry<T>?> getWithMetadata<T>(
    String key,
    T Function(Map<String, dynamic>) decoder,
  ) async {
    final raw = _box.get(key);
    if (raw == null) return null;

    try {
      final map = Map<String, dynamic>.from(raw);
      return CacheEntry.fromJson(map, decoder);
    } catch (_) {
      await delete(key);
      return null;
    }
  }

  @override
  Future<List<String>> getKeys() async {
    return _box.keys.whereType<String>().toList();
  }

  @override
  Future<int> get length async => _box.length;

  /// Evicts oldest entries if cache exceeds maxEntries.
  Future<void> _evictIfNeeded() async {
    if (_box.length <= maxEntries) return;

    // Get all entries with their creation times
    final entries = <String, DateTime>{};
    for (final key in _box.keys.whereType<String>()) {
      final raw = _box.get(key);
      if (raw != null) {
        final createdAtStr = raw['createdAt'] as String?;
        if (createdAtStr != null) {
          entries[key] = DateTime.parse(createdAtStr);
        }
      }
    }

    // Sort by creation time and delete oldest
    final sortedKeys = entries.keys.toList()
      ..sort((a, b) => entries[a]!.compareTo(entries[b]!));

    final toDelete = sortedKeys.take(_box.length - maxEntries);
    for (final key in toDelete) {
      await _box.delete(key);
    }
  }

  /// Closes the underlying Hive box.
  Future<void> close() async {
    await _box.close();
  }
}
