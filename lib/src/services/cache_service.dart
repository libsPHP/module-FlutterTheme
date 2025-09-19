import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/result_models.dart';

/// Universal caching service for Magento data
/// Provides intelligent caching with expiration, compression, and size management
class MagentoCacheService extends ChangeNotifier {
  MagentoCacheService({
    this.defaultTtl = const Duration(hours: 1),
    this.maxCacheSize = 50 * 1024 * 1024, // 50MB
    this.compressionEnabled = true,
    this.enableMetrics = true,
  });

  /// Default time-to-live for cached items
  final Duration defaultTtl;

  /// Maximum cache size in bytes
  final int maxCacheSize;

  /// Whether to compress cached data
  final bool compressionEnabled;

  /// Whether to collect cache metrics
  final bool enableMetrics;

  // Private fields
  SharedPreferences? _prefs;
  final Map<String, DateTime> _expirationTimes = {};
  final Map<String, int> _accessCounts = {};
  final Map<String, DateTime> _lastAccessed = {};
  int _currentCacheSize = 0;

  // Metrics
  int _hitCount = 0;
  int _missCount = 0;
  int _evictionCount = 0;

  /// Cache hit rate (0.0 to 1.0)
  double get hitRate {
    final total = _hitCount + _missCount;
    return total > 0 ? _hitCount / total : 0.0;
  }

  /// Current cache size in bytes
  int get currentCacheSize => _currentCacheSize;

  /// Number of cached items
  int get itemCount => _expirationTimes.length;

  /// Initialize the cache service
  Future<void> initialize() async {
    _prefs ??= await SharedPreferences.getInstance();
    await _loadCacheMetadata();
    await _cleanupExpiredItems();
  }

  /// Cache data with optional TTL
  Future<MagentoCacheResult<T>> cache<T>({
    required String key,
    required T data,
    Duration? ttl,
    bool overwrite = true,
  }) async {
    try {
      _prefs ??= await SharedPreferences.getInstance();

      final cacheKey = _buildCacheKey(key);
      final expiresAt = DateTime.now().add(ttl ?? defaultTtl);

      // Check if key exists and overwrite is disabled
      if (!overwrite && _prefs!.containsKey(cacheKey)) {
        return MagentoCacheResult.error(
          'Cache key already exists and overwrite is disabled',
          cacheKey: key,
        );
      }

      // Serialize data
      final serializedData = _serializeData(data);
      final dataSize = serializedData.length;

      // Check cache size limits
      if (dataSize > maxCacheSize) {
        return MagentoCacheResult.error(
          'Data too large for cache (${dataSize} bytes > ${maxCacheSize} bytes)',
          cacheKey: key,
        );
      }

      // Ensure we have space
      await _ensureSpace(dataSize);

      // Store data
      await _prefs!.setString(cacheKey, serializedData);
      await _prefs!
          .setInt('${cacheKey}_expires', expiresAt.millisecondsSinceEpoch);

      // Update metadata
      _expirationTimes[cacheKey] = expiresAt;
      _currentCacheSize += dataSize;
      _lastAccessed[cacheKey] = DateTime.now();
      _accessCounts[cacheKey] = 0;

      await _saveCacheMetadata();

      if (kDebugMode) {
        print('Cached $key (${dataSize} bytes, expires: $expiresAt)');
      }

      return MagentoCacheResult.success(
        data,
        cacheKey: key,
        expiresAt: expiresAt,
      );
    } catch (e) {
      return MagentoCacheResult.error('Cache write failed: $e', cacheKey: key);
    }
  }

  /// Retrieve cached data
  Future<MagentoCacheResult<T>> get<T>({
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      _prefs ??= await SharedPreferences.getInstance();

      final cacheKey = _buildCacheKey(key);

      // Check if key exists
      if (!_prefs!.containsKey(cacheKey)) {
        if (enableMetrics) _missCount++;
        return MagentoCacheResult.miss(key);
      }

      // Check expiration
      final expiresAt = _expirationTimes[cacheKey];
      if (expiresAt != null && DateTime.now().isAfter(expiresAt)) {
        await _removeItem(cacheKey);
        if (enableMetrics) _missCount++;
        return MagentoCacheResult.miss(key);
      }

      // Retrieve data
      final serializedData = _prefs!.getString(cacheKey);
      if (serializedData == null) {
        if (enableMetrics) _missCount++;
        return MagentoCacheResult.miss(key);
      }

      // Deserialize data
      final data = _deserializeData<T>(serializedData, fromJson);

      // Update access metadata
      _accessCounts[cacheKey] = (_accessCounts[cacheKey] ?? 0) + 1;
      _lastAccessed[cacheKey] = DateTime.now();

      if (enableMetrics) _hitCount++;

      if (kDebugMode) {
        print('Cache hit for $key');
      }

      return MagentoCacheResult.success(
        data,
        cacheKey: key,
        cacheHit: true,
        expiresAt: expiresAt,
      );
    } catch (e) {
      if (enableMetrics) _missCount++;
      return MagentoCacheResult.error('Cache read failed: $e', cacheKey: key);
    }
  }

  /// Check if a key exists in cache and is not expired
  Future<bool> exists(String key) async {
    _prefs ??= await SharedPreferences.getInstance();

    final cacheKey = _buildCacheKey(key);

    if (!_prefs!.containsKey(cacheKey)) {
      return false;
    }

    final expiresAt = _expirationTimes[cacheKey];
    if (expiresAt != null && DateTime.now().isAfter(expiresAt)) {
      await _removeItem(cacheKey);
      return false;
    }

    return true;
  }

  /// Remove a specific cache entry
  Future<bool> remove(String key) async {
    _prefs ??= await SharedPreferences.getInstance();

    final cacheKey = _buildCacheKey(key);
    return await _removeItem(cacheKey);
  }

  /// Clear all cached data
  Future<void> clearAll() async {
    _prefs ??= await SharedPreferences.getInstance();

    final cacheKeys =
        _prefs!.getKeys().where((key) => key.startsWith('magento_cache_'));

    for (final key in cacheKeys) {
      await _prefs!.remove(key);
      await _prefs!.remove('${key}_expires');
    }

    _expirationTimes.clear();
    _accessCounts.clear();
    _lastAccessed.clear();
    _currentCacheSize = 0;

    await _saveCacheMetadata();
    notifyListeners();

    if (kDebugMode) {
      print('Cache cleared completely');
    }
  }

  /// Clear expired items
  Future<int> clearExpired() async {
    final now = DateTime.now();
    final expiredKeys = <String>[];

    for (final entry in _expirationTimes.entries) {
      if (now.isAfter(entry.value)) {
        expiredKeys.add(entry.key);
      }
    }

    for (final key in expiredKeys) {
      await _removeItem(key);
    }

    if (kDebugMode && expiredKeys.isNotEmpty) {
      print('Removed ${expiredKeys.length} expired cache items');
    }

    return expiredKeys.length;
  }

  /// Get cache statistics
  MagentoCacheStats getStats() {
    return MagentoCacheStats(
      hitCount: _hitCount,
      missCount: _missCount,
      evictionCount: _evictionCount,
      hitRate: hitRate,
      itemCount: itemCount,
      currentSize: _currentCacheSize,
      maxSize: maxCacheSize,
      utilizationRate: _currentCacheSize / maxCacheSize,
    );
  }

  /// Get information about a specific cache entry
  Future<MagentoCacheEntryInfo?> getEntryInfo(String key) async {
    final cacheKey = _buildCacheKey(key);

    if (!await exists(key)) {
      return null;
    }

    _prefs ??= await SharedPreferences.getInstance();
    final serializedData = _prefs!.getString(cacheKey);

    return MagentoCacheEntryInfo(
      key: key,
      size: serializedData?.length ?? 0,
      expiresAt: _expirationTimes[cacheKey],
      lastAccessed: _lastAccessed[cacheKey],
      accessCount: _accessCounts[cacheKey] ?? 0,
    );
  }

  /// Get all cache entries information
  Future<List<MagentoCacheEntryInfo>> getAllEntries() async {
    final entries = <MagentoCacheEntryInfo>[];

    for (final key in _expirationTimes.keys) {
      final originalKey = key.replaceFirst('magento_cache_', '');
      final info = await getEntryInfo(originalKey);
      if (info != null) {
        entries.add(info);
      }
    }

    return entries;
  }

  /// Preload cache with data
  Future<List<MagentoCacheResult>> preload<T>(
    Map<String, T> dataMap, {
    Duration? ttl,
  }) async {
    final results = <MagentoCacheResult>[];

    for (final entry in dataMap.entries) {
      final result = await cache(
        key: entry.key,
        data: entry.value,
        ttl: ttl,
      );
      results.add(result);
    }

    return results;
  }

  // Private methods

  String _buildCacheKey(String key) {
    return 'magento_cache_$key';
  }

  String _serializeData<T>(T data) {
    final jsonData = {
      'data': data,
      'type': T.toString(),
      'cached_at': DateTime.now().toIso8601String(),
    };

    final jsonString = jsonEncode(jsonData);

    // TODO: Add compression if enabled
    if (compressionEnabled) {
      // For now, just return the JSON string
      // In a real implementation, you might use gzip compression
      return jsonString;
    }

    return jsonString;
  }

  T _deserializeData<T>(
      String serializedData, T Function(Map<String, dynamic>) fromJson) {
    // TODO: Add decompression if needed
    final jsonData = jsonDecode(serializedData) as Map<String, dynamic>;

    if (jsonData['data'] is Map<String, dynamic>) {
      return fromJson(jsonData['data'] as Map<String, dynamic>);
    } else {
      // Handle primitive types
      return jsonData['data'] as T;
    }
  }

  Future<void> _ensureSpace(int requiredSpace) async {
    if (_currentCacheSize + requiredSpace <= maxCacheSize) {
      return; // We have enough space
    }

    // Evict items using LRU strategy
    final entries = await getAllEntries();
    entries.sort((a, b) {
      final aLastAccessed =
          a.lastAccessed ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bLastAccessed =
          b.lastAccessed ?? DateTime.fromMillisecondsSinceEpoch(0);
      return aLastAccessed.compareTo(bLastAccessed);
    });

    int freedSpace = 0;
    for (final entry in entries) {
      if (_currentCacheSize + requiredSpace - freedSpace <= maxCacheSize) {
        break;
      }

      await _removeItem(_buildCacheKey(entry.key));
      freedSpace += entry.size;
      _evictionCount++;
    }

    if (kDebugMode) {
      print('Evicted cache items to free ${freedSpace} bytes');
    }
  }

  Future<bool> _removeItem(String cacheKey) async {
    _prefs ??= await SharedPreferences.getInstance();

    final serializedData = _prefs!.getString(cacheKey);
    if (serializedData != null) {
      _currentCacheSize -= serializedData.length;
    }

    final removed1 = await _prefs!.remove(cacheKey);
    final removed2 = await _prefs!.remove('${cacheKey}_expires');

    _expirationTimes.remove(cacheKey);
    _accessCounts.remove(cacheKey);
    _lastAccessed.remove(cacheKey);

    await _saveCacheMetadata();
    notifyListeners();

    return removed1 || removed2;
  }

  Future<void> _loadCacheMetadata() async {
    _prefs ??= await SharedPreferences.getInstance();

    // Load expiration times
    final keys = _prefs!.getKeys().where((key) => key.endsWith('_expires'));
    for (final key in keys) {
      final timestamp = _prefs!.getInt(key);
      if (timestamp != null) {
        final cacheKey = key.replaceAll('_expires', '');
        _expirationTimes[cacheKey] =
            DateTime.fromMillisecondsSinceEpoch(timestamp);
      }
    }

    // Calculate current cache size
    _currentCacheSize = 0;
    for (final key in _expirationTimes.keys) {
      final data = _prefs!.getString(key);
      if (data != null) {
        _currentCacheSize += data.length;
      }
    }

    // Load metrics
    _hitCount = _prefs!.getInt('cache_hit_count') ?? 0;
    _missCount = _prefs!.getInt('cache_miss_count') ?? 0;
    _evictionCount = _prefs!.getInt('cache_eviction_count') ?? 0;
  }

  Future<void> _saveCacheMetadata() async {
    _prefs ??= await SharedPreferences.getInstance();

    if (enableMetrics) {
      await _prefs!.setInt('cache_hit_count', _hitCount);
      await _prefs!.setInt('cache_miss_count', _missCount);
      await _prefs!.setInt('cache_eviction_count', _evictionCount);
    }
  }

  Future<void> _cleanupExpiredItems() async {
    await clearExpired();
  }

  @override
  void dispose() {
    _saveCacheMetadata();
    super.dispose();
  }
}

/// Cache statistics
@immutable
class MagentoCacheStats {
  const MagentoCacheStats({
    required this.hitCount,
    required this.missCount,
    required this.evictionCount,
    required this.hitRate,
    required this.itemCount,
    required this.currentSize,
    required this.maxSize,
    required this.utilizationRate,
  });

  final int hitCount;
  final int missCount;
  final int evictionCount;
  final double hitRate;
  final int itemCount;
  final int currentSize;
  final int maxSize;
  final double utilizationRate;

  int get totalRequests => hitCount + missCount;

  @override
  String toString() => 'MagentoCacheStats('
      'hits: $hitCount, '
      'misses: $missCount, '
      'hitRate: ${(hitRate * 100).toStringAsFixed(1)}%, '
      'items: $itemCount, '
      'size: ${(currentSize / 1024).toStringAsFixed(1)}KB/${(maxSize / 1024).toStringAsFixed(1)}KB'
      ')';
}

/// Information about a specific cache entry
@immutable
class MagentoCacheEntryInfo {
  const MagentoCacheEntryInfo({
    required this.key,
    required this.size,
    this.expiresAt,
    this.lastAccessed,
    this.accessCount = 0,
  });

  final String key;
  final int size;
  final DateTime? expiresAt;
  final DateTime? lastAccessed;
  final int accessCount;

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);

  Duration? get timeToExpiry => expiresAt?.difference(DateTime.now());

  Duration? get timeSinceAccess =>
      lastAccessed != null ? DateTime.now().difference(lastAccessed!) : null;

  @override
  String toString() => 'MagentoCacheEntryInfo('
      'key: $key, '
      'size: ${size}B, '
      'expires: $expiresAt, '
      'accessed: $accessCount times'
      ')';
}
