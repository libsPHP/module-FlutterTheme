import 'dart:convert';

import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../graphql_cache_config.dart';

/// A transport decorator that caches GraphQL responses.
///
/// Wraps another [MagentoTransport] and caches successful query responses
/// based on the document and variables. Mutations are never cached.
///
/// Example:
/// ```dart
/// final transport = CachedMagentoTransport(
///   inner: GraphQlMagentoTransport(...),
///   config: GraphQlCacheConfig(defaultTtl: Duration(minutes: 10)),
/// );
/// ```
class CachedMagentoTransport implements MagentoTransport {
  /// The wrapped transport.
  final MagentoTransport inner;

  /// Cache configuration.
  final GraphQlCacheConfig config;

  /// In-memory cache storage.
  final Map<String, _CacheEntry> _cache = {};

  CachedMagentoTransport({
    required this.inner,
    GraphQlCacheConfig? config,
  }) : config = config ?? const GraphQlCacheConfig();

  @override
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    // Check if this is a mutation (never cache)
    if (_isMutation(document)) {
      return inner.graphql(
        document,
        variables: variables,
        options: options,
        decoder: decoder,
      );
    }

    // Check cache policy
    final cachePolicy = options?.cachePolicy ?? CachePolicy.networkFirst;
    if (cachePolicy == CachePolicy.networkOnly) {
      return inner.graphql(
        document,
        variables: variables,
        options: options,
        decoder: decoder,
      );
    }

    final cacheKey = _generateCacheKey(document, variables);

    // Try cache first if policy allows
    if (cachePolicy == CachePolicy.cacheFirst ||
        cachePolicy == CachePolicy.cacheOnly) {
      final cached = _getFromCache<T>(cacheKey, decoder);
      if (cached != null) {
        return cached;
      }
      if (cachePolicy == CachePolicy.cacheOnly) {
        throw const MagentoNetworkException('No cached response available');
      }
    }

    // Fetch from network
    try {
      final response = await inner.graphql(
        document,
        variables: variables,
        options: options,
        decoder: decoder,
      );

      // Cache the raw data (not decoded) for later decoding with different decoders
      _putInCache(cacheKey, response.data);

      return response;
    } catch (e) {
      // On network failure with networkFirst, try cache
      if (cachePolicy == CachePolicy.networkFirst) {
        final cached = _getFromCache<T>(cacheKey, decoder);
        if (cached != null) {
          return cached;
        }
      }
      rethrow;
    }
  }

  bool _isMutation(String document) {
    final trimmed = document.trimLeft();
    return trimmed.startsWith('mutation') ||
        trimmed.startsWith('mutation ') ||
        RegExp(r'^mutation\s*[\({]').hasMatch(trimmed);
  }

  String _generateCacheKey(String document, Map<String, dynamic>? variables) {
    final normalized = document.replaceAll(RegExp(r'\s+'), ' ').trim();
    final varsJson = variables != null ? jsonEncode(variables) : '';
    return '$normalized|$varsJson';
  }

  MagentoResponse<T>? _getFromCache<T>(
    String key,
    T Function(dynamic) decoder,
  ) {
    final entry = _cache[key];
    if (entry == null) return null;

    if (entry.isExpired) {
      _cache.remove(key);
      return null;
    }

    try {
      final decoded = decoder(entry.data);
      return MagentoResponse.cached(decoded);
    } catch (_) {
      // If decoding fails, remove from cache
      _cache.remove(key);
      return null;
    }
  }

  void _putInCache(String key, dynamic data) {
    // Enforce max cache size
    if (_cache.length >= config.maxCacheSize) {
      _evictOldest();
    }

    _cache[key] = _CacheEntry(
      data: data,
      expiresAt: DateTime.now().add(config.defaultTtl),
    );
  }

  void _evictOldest() {
    if (_cache.isEmpty) return;

    // Find and remove the entry closest to expiration
    String? oldestKey;
    DateTime? oldestExpiry;

    for (final entry in _cache.entries) {
      if (oldestExpiry == null || entry.value.expiresAt.isBefore(oldestExpiry)) {
        oldestKey = entry.key;
        oldestExpiry = entry.value.expiresAt;
      }
    }

    if (oldestKey != null) {
      _cache.remove(oldestKey);
    }
  }

  /// Clears all cached entries.
  void clearCache() {
    _cache.clear();
  }

  /// Removes expired entries from cache.
  void pruneExpired() {
    _cache.removeWhere((_, entry) => entry.isExpired);
  }

  @override
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.get(path, query: query, options: options, decoder: decoder);

  @override
  Future<MagentoResponse<T>> post<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.post(path, body: body, options: options, decoder: decoder);

  @override
  Future<MagentoResponse<T>> put<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.put(path, body: body, options: options, decoder: decoder);

  @override
  Future<MagentoResponse<T>> delete<T>(
    String path, {
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.delete(path, options: options, decoder: decoder);
}

class _CacheEntry {
  final dynamic data;
  final DateTime expiresAt;

  const _CacheEntry({
    required this.data,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
