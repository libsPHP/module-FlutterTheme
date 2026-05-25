/// Configuration for GraphQL query caching.
class GraphQlCacheConfig {
  /// Default time-to-live for cached responses.
  final Duration defaultTtl;

  /// Operation names that should never be cached (e.g., mutations).
  final Set<String> excludedOperations;

  /// Maximum number of cached entries.
  final int maxCacheSize;

  const GraphQlCacheConfig({
    this.defaultTtl = const Duration(minutes: 5),
    this.excludedOperations = const {'mutation'},
    this.maxCacheSize = 100,
  });

  /// Creates a config with no caching.
  const GraphQlCacheConfig.disabled()
      : defaultTtl = Duration.zero,
        excludedOperations = const {},
        maxCacheSize = 0;

  /// Returns true if the given operation should be cached.
  bool shouldCache(String? operationName) {
    if (maxCacheSize == 0) return false;
    if (operationName == null) return true;
    return !excludedOperations.contains(operationName.toLowerCase());
  }
}
