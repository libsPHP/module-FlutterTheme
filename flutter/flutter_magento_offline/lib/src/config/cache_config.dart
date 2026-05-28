/// Configuration for catalog caching TTLs.
class CatalogCacheConfig {
  /// TTL for product list queries.
  final Duration productListTtl;

  /// TTL for product details.
  final Duration productDetailsTtl;

  /// TTL for category list.
  final Duration categoryListTtl;

  /// TTL for category tree.
  final Duration categoryTreeTtl;

  /// TTL for search suggestions.
  final Duration searchSuggestionsTtl;

  const CatalogCacheConfig({
    this.productListTtl = const Duration(minutes: 15),
    this.productDetailsTtl = const Duration(hours: 1),
    this.categoryListTtl = const Duration(hours: 2),
    this.categoryTreeTtl = const Duration(hours: 2),
    this.searchSuggestionsTtl = const Duration(minutes: 30),
  });

  /// Creates a short-lived cache config for frequently changing data.
  factory CatalogCacheConfig.shortLived() {
    return const CatalogCacheConfig(
      productListTtl: Duration(minutes: 5),
      productDetailsTtl: Duration(minutes: 15),
      categoryListTtl: Duration(minutes: 30),
      categoryTreeTtl: Duration(minutes: 30),
      searchSuggestionsTtl: Duration(minutes: 10),
    );
  }

  /// Creates a long-lived cache config for mostly static data.
  factory CatalogCacheConfig.longLived() {
    return const CatalogCacheConfig(
      productListTtl: Duration(hours: 1),
      productDetailsTtl: Duration(hours: 4),
      categoryListTtl: Duration(hours: 12),
      categoryTreeTtl: Duration(hours: 12),
      searchSuggestionsTtl: Duration(hours: 2),
    );
  }
}

/// Configuration for cart caching.
class CartCacheConfig {
  /// TTL for cart data.
  final Duration cartTtl;

  const CartCacheConfig({
    this.cartTtl = const Duration(minutes: 30),
  });
}
