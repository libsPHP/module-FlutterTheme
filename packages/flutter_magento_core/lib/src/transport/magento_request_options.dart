/// Options for customizing individual API requests.
class MagentoRequestOptions {
  /// Additional headers to include in the request.
  final Map<String, String>? headers;

  /// Request timeout duration.
  final Duration? timeout;

  /// Cache policy for this request.
  final CachePolicy cachePolicy;

  /// Whether to skip authentication for this request.
  final bool skipAuth;

  const MagentoRequestOptions({
    this.headers,
    this.timeout,
    this.cachePolicy = CachePolicy.networkFirst,
    this.skipAuth = false,
  });

  /// Creates options with no caching.
  const MagentoRequestOptions.noCache()
      : headers = null,
        timeout = null,
        cachePolicy = CachePolicy.networkOnly,
        skipAuth = false;

  /// Creates options that prefer cached data.
  const MagentoRequestOptions.cacheFirst()
      : headers = null,
        timeout = null,
        cachePolicy = CachePolicy.cacheFirst,
        skipAuth = false;
}

/// Cache policy for API requests.
enum CachePolicy {
  /// Always use network, never cache.
  networkOnly,

  /// Try network first, fall back to cache.
  networkFirst,

  /// Try cache first, fall back to network.
  cacheFirst,

  /// Use cache only, fail if not cached.
  cacheOnly,
}
