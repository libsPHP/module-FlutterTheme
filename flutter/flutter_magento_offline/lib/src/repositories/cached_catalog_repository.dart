import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../cache/cache_entry.dart';
import '../cache/magento_cache.dart';
import '../config/cache_config.dart';

/// Caching decorator for [CatalogRepository].
///
/// Caches responses and serves stale data when offline.
class CachedCatalogRepository implements CatalogRepository {
  /// The inner repository to delegate to.
  final CatalogRepository inner;

  /// The cache to use for storing results.
  final MagentoCache cache;

  /// Cache configuration.
  final CatalogCacheConfig config;

  final Connectivity _connectivity;

  CachedCatalogRepository({
    required this.inner,
    required this.cache,
    this.config = const CatalogCacheConfig(),
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();

  @override
  Future<ProductPage> searchProducts({
    String? query,
    ProductFilter? filter,
    ProductSort? sort,
    required int page,
    required int pageSize,
  }) async {
    final key = _buildProductsKey(
      'search',
      query: query,
      filter: filter,
      sort: sort,
      page: page,
      pageSize: pageSize,
    );

    final cached = await _getCached<Map<String, dynamic>>(key);

    if (cached != null && !cached.isExpired) {
      return _decodeProductPage(cached.data);
    }

    if (!await _isOnline()) {
      if (cached != null) {
        return _decodeProductPage(cached.data);
      }
      throw MagentoNetworkException('Offline and no cached data');
    }

    final result = await inner.searchProducts(
      query: query,
      filter: filter,
      sort: sort,
      page: page,
      pageSize: pageSize,
    );

    await cache.set(
      key,
      _encodeProductPage(result),
      ttl: config.productListTtl,
      encoder: (data) => data,
    );

    return result;
  }

  @override
  Future<ProductDetails> getProductBySku(String sku) async {
    final key = 'product:sku:$sku';

    final cached = await _getCached<Map<String, dynamic>>(key);

    if (cached != null && !cached.isExpired) {
      return _decodeProductDetails(cached.data);
    }

    if (!await _isOnline()) {
      if (cached != null) {
        return _decodeProductDetails(cached.data);
      }
      throw MagentoNetworkException('Offline and no cached data');
    }

    final result = await inner.getProductBySku(sku);

    await cache.set(
      key,
      _encodeProductDetails(result),
      ttl: config.productDetailsTtl,
      encoder: (data) => data,
    );

    return result;
  }

  @override
  Future<ProductDetails> getProductById(int id) async {
    final key = 'product:id:$id';

    final cached = await _getCached<Map<String, dynamic>>(key);

    if (cached != null && !cached.isExpired) {
      return _decodeProductDetails(cached.data);
    }

    if (!await _isOnline()) {
      if (cached != null) {
        return _decodeProductDetails(cached.data);
      }
      throw MagentoNetworkException('Offline and no cached data');
    }

    final result = await inner.getProductById(id);

    await cache.set(
      key,
      _encodeProductDetails(result),
      ttl: config.productDetailsTtl,
      encoder: (data) => data,
    );

    return result;
  }

  @override
  Future<List<Category>> getCategoryTree() async {
    const key = 'categories:tree';

    final cached = await _getCached<Map<String, dynamic>>(key);

    if (cached != null && !cached.isExpired) {
      return _decodeCategoryList(cached.data['items'] as List);
    }

    if (!await _isOnline()) {
      if (cached != null) {
        return _decodeCategoryList(cached.data['items'] as List);
      }
      throw MagentoNetworkException('Offline and no cached data');
    }

    final result = await inner.getCategoryTree();

    await cache.set(
      key,
      {'items': result.map(_encodeCategory).toList()},
      ttl: config.categoryTreeTtl,
      encoder: (data) => data,
    );

    return result;
  }

  @override
  Future<ProductPage> getProductsByCategory({
    required String categoryId,
    required int page,
    required int pageSize,
    ProductSort? sort,
    ProductFilter? filter,
  }) async {
    final key = _buildProductsKey(
      'category:$categoryId',
      filter: filter,
      sort: sort,
      page: page,
      pageSize: pageSize,
    );

    final cached = await _getCached<Map<String, dynamic>>(key);

    if (cached != null && !cached.isExpired) {
      return _decodeProductPage(cached.data);
    }

    if (!await _isOnline()) {
      if (cached != null) {
        return _decodeProductPage(cached.data);
      }
      throw MagentoNetworkException('Offline and no cached data');
    }

    final result = await inner.getProductsByCategory(
      categoryId: categoryId,
      page: page,
      pageSize: pageSize,
      sort: sort,
      filter: filter,
    );

    await cache.set(
      key,
      _encodeProductPage(result),
      ttl: config.productListTtl,
      encoder: (data) => data,
    );

    return result;
  }

  @override
  Future<Category> getCategoryById(String categoryId) async {
    final key = 'category:$categoryId';

    final cached = await _getCached<Map<String, dynamic>>(key);

    if (cached != null && !cached.isExpired) {
      return _decodeCategory(cached.data);
    }

    if (!await _isOnline()) {
      if (cached != null) {
        return _decodeCategory(cached.data);
      }
      throw MagentoNetworkException('Offline and no cached data');
    }

    final result = await inner.getCategoryById(categoryId);

    await cache.set(
      key,
      _encodeCategory(result),
      ttl: config.categoryListTtl,
      encoder: (data) => data,
    );

    return result;
  }

  /// Invalidates product cache.
  Future<void> invalidateProducts() async {
    await cache.deleteByPrefix('product:');
    await cache.deleteByPrefix('search:');
    await cache.deleteByPrefix('category:');
  }

  /// Invalidates category cache.
  Future<void> invalidateCategories() async {
    await cache.deleteByPrefix('categories:');
    await cache.deleteByPrefix('category:');
  }

  /// Invalidates all catalog cache.
  Future<void> invalidateAll() async {
    await invalidateProducts();
    await invalidateCategories();
  }

  Future<bool> _isOnline() async {
    final results = await _connectivity.checkConnectivity();
    return results.isNotEmpty && !results.contains(ConnectivityResult.none);
  }

  Future<CacheEntry<T>?> _getCached<T>(String key) async {
    try {
      return await cache.getWithMetadata<T>(key, (json) => json as T);
    } catch (_) {
      return null;
    }
  }

  String _buildProductsKey(
    String prefix, {
    String? query,
    ProductFilter? filter,
    ProductSort? sort,
    required int page,
    required int pageSize,
  }) {
    final parts = <String>[prefix];
    if (query != null) parts.add('q=$query');
    if (filter != null) parts.add('f=${_hashFilter(filter)}');
    if (sort != null) parts.add('s=${sort.field}:${sort.direction.name}');
    parts.add('p=$page:$pageSize');
    return parts.join(':');
  }

  String _hashFilter(ProductFilter filter) {
    final buffer = StringBuffer();
    if (filter.categoryIds != null) {
      buffer.write('c${filter.categoryIds!.join(",")}');
    }
    if (filter.priceMin != null) buffer.write('mn${filter.priceMin!.value}');
    if (filter.priceMax != null) buffer.write('mx${filter.priceMax!.value}');
    if (filter.inStock != null) buffer.write('s${filter.inStock}');
    if (filter.attributes != null) {
      for (final attr in filter.attributes!.entries) {
        buffer.write('${attr.key}=${attr.value.join(",")}');
      }
    }
    return buffer.toString().hashCode.toRadixString(16);
  }

  // Encoding/decoding helpers
  Map<String, dynamic> _encodeProductPage(ProductPage page) {
    return {
      'items': page.items.map(_encodeProductSummary).toList(),
      'totalCount': page.totalCount,
      'page': page.page,
      'pageSize': page.pageSize,
      'aggregations': page.aggregations.map(_encodeAggregation).toList(),
    };
  }

  ProductPage _decodeProductPage(Map<String, dynamic> json) {
    return ProductPage(
      items: (json['items'] as List)
          .map((e) => _decodeProductSummary(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int,
      page: json['page'] as int,
      pageSize: json['pageSize'] as int,
      aggregations: (json['aggregations'] as List?)
              ?.map((e) => _decodeAggregation(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> _encodeProductSummary(ProductSummary product) {
    return {
      'id': product.id,
      'sku': product.sku,
      'name': product.name,
      'urlKey': product.urlKey,
      'type': product.type.name,
      'price': product.price.toJson(),
      'regularPrice': product.regularPrice?.toJson(),
      'imageUrl': product.imageUrl,
      'thumbnailUrl': product.thumbnailUrl,
      'inStock': product.inStock,
      'rating': product.rating,
      'reviewCount': product.reviewCount,
    };
  }

  ProductSummary _decodeProductSummary(Map<String, dynamic> json) {
    return ProductSummary(
      id: json['id'] as int,
      sku: json['sku'] as String,
      name: json['name'] as String,
      urlKey: json['urlKey'] as String,
      type: ProductType.values.byName(json['type'] as String),
      price: Money.fromJson(json['price'] as Map<String, dynamic>),
      regularPrice: json['regularPrice'] != null
          ? Money.fromJson(json['regularPrice'] as Map<String, dynamic>)
          : null,
      imageUrl: json['imageUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      inStock: json['inStock'] as bool? ?? true,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: json['reviewCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> _encodeProductDetails(ProductDetails product) {
    return {
      'id': product.id,
      'sku': product.sku,
      'name': product.name,
      'urlKey': product.urlKey,
      'type': product.type.name,
      'price': product.price.toJson(),
      'regularPrice': product.regularPrice?.toJson(),
      'imageUrl': product.imageUrl,
      'thumbnailUrl': product.thumbnailUrl,
      'inStock': product.inStock,
      'rating': product.rating,
      'reviewCount': product.reviewCount,
      'description': product.description,
      'shortDescription': product.shortDescription,
      'images': product.images.map(_encodeProductImage).toList(),
      'configurableOptions':
          product.configurableOptions?.map(_encodeConfigurableOption).toList(),
      'variants': product.variants?.map(_encodeProductVariant).toList(),
      'relatedProducts':
          product.relatedProducts.map(_encodeProductSummary).toList(),
      'metaTitle': product.metaTitle,
      'metaDescription': product.metaDescription,
      'metaKeywords': product.metaKeywords,
      'stockQuantity': product.stockQuantity,
    };
  }

  ProductDetails _decodeProductDetails(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'] as int,
      sku: json['sku'] as String,
      name: json['name'] as String,
      urlKey: json['urlKey'] as String,
      type: ProductType.values.byName(json['type'] as String),
      price: Money.fromJson(json['price'] as Map<String, dynamic>),
      regularPrice: json['regularPrice'] != null
          ? Money.fromJson(json['regularPrice'] as Map<String, dynamic>)
          : null,
      imageUrl: json['imageUrl'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      inStock: json['inStock'] as bool? ?? true,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: json['reviewCount'] as int? ?? 0,
      description: json['description'] as String?,
      shortDescription: json['shortDescription'] as String?,
      images: (json['images'] as List?)
              ?.map((e) => _decodeProductImage(e as Map<String, dynamic>))
              .toList() ??
          [],
      configurableOptions: (json['configurableOptions'] as List?)
          ?.map((e) => _decodeConfigurableOption(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List?)
          ?.map((e) => _decodeProductVariant(e as Map<String, dynamic>))
          .toList(),
      relatedProducts: (json['relatedProducts'] as List?)
              ?.map((e) => _decodeProductSummary(e as Map<String, dynamic>))
              .toList() ??
          [],
      metaTitle: json['metaTitle'] as String?,
      metaDescription: json['metaDescription'] as String?,
      metaKeywords: json['metaKeywords'] as String?,
      stockQuantity: json['stockQuantity'] as int?,
    );
  }

  Map<String, dynamic> _encodeProductImage(ProductImage image) {
    return {
      'url': image.url,
      'label': image.label,
      'position': image.position,
      'isMain': image.isMain,
    };
  }

  ProductImage _decodeProductImage(Map<String, dynamic> json) {
    return ProductImage(
      url: json['url'] as String,
      label: json['label'] as String?,
      position: json['position'] as int? ?? 0,
      isMain: json['isMain'] as bool? ?? false,
    );
  }

  Map<String, dynamic> _encodeProductVariant(ProductVariant variant) {
    return {
      'product': _encodeProductSummary(variant.product),
      'attributes': variant.attributes,
    };
  }

  ProductVariant _decodeProductVariant(Map<String, dynamic> json) {
    return ProductVariant(
      product: _decodeProductSummary(json['product'] as Map<String, dynamic>),
      attributes: (json['attributes'] as Map).cast<String, String>(),
    );
  }

  Map<String, dynamic> _encodeConfigurableOption(ConfigurableOption option) {
    return {
      'attributeId': option.attributeId,
      'attributeCode': option.attributeCode,
      'label': option.label,
      'values': option.values.map(_encodeConfigurableOptionValue).toList(),
    };
  }

  ConfigurableOption _decodeConfigurableOption(Map<String, dynamic> json) {
    return ConfigurableOption(
      attributeId: json['attributeId'] as String,
      attributeCode: json['attributeCode'] as String,
      label: json['label'] as String,
      values: (json['values'] as List)
          .map(
              (e) => _decodeConfigurableOptionValue(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> _encodeConfigurableOptionValue(
      ConfigurableOptionValue value) {
    return {
      'valueId': value.valueId,
      'label': value.label,
      'swatchData': value.swatchData,
      'swatchType': value.swatchType?.name,
    };
  }

  ConfigurableOptionValue _decodeConfigurableOptionValue(
      Map<String, dynamic> json) {
    return ConfigurableOptionValue(
      valueId: json['valueId'] as String,
      label: json['label'] as String,
      swatchData: json['swatchData'] as String?,
      swatchType: json['swatchType'] != null
          ? SwatchType.values.byName(json['swatchType'] as String)
          : null,
    );
  }

  Map<String, dynamic> _encodeAggregation(Aggregation agg) {
    return {
      'attributeCode': agg.attributeCode,
      'label': agg.label,
      'options': agg.options.map(_encodeAggregationOption).toList(),
      'count': agg.count,
    };
  }

  Aggregation _decodeAggregation(Map<String, dynamic> json) {
    return Aggregation(
      attributeCode: json['attributeCode'] as String,
      label: json['label'] as String,
      options: (json['options'] as List)
          .map((e) => _decodeAggregationOption(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> _encodeAggregationOption(AggregationOption option) {
    return {
      'value': option.value,
      'label': option.label,
      'count': option.count,
    };
  }

  AggregationOption _decodeAggregationOption(Map<String, dynamic> json) {
    return AggregationOption(
      value: json['value'] as String,
      label: json['label'] as String,
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> _encodeCategory(Category category) {
    return {
      'id': category.id,
      'name': category.name,
      'urlKey': category.urlKey,
      'urlPath': category.urlPath,
      'description': category.description,
      'imageUrl': category.imageUrl,
      'productCount': category.productCount,
      'parentId': category.parentId,
      'position': category.position,
      'level': category.level,
      'isActive': category.isActive,
      'children': category.children.map(_encodeCategory).toList(),
      'includeInMenu': category.includeInMenu,
    };
  }

  Category _decodeCategory(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      urlKey: json['urlKey'] as String,
      urlPath: json['urlPath'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      productCount: json['productCount'] as int? ?? 0,
      parentId: json['parentId'] as String?,
      position: json['position'] as int? ?? 0,
      level: json['level'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      children: (json['children'] as List?)
              ?.map((e) => _decodeCategory(e as Map<String, dynamic>))
              .toList() ??
          [],
      includeInMenu: json['includeInMenu'] as bool? ?? true,
    );
  }

  List<Category> _decodeCategoryList(List<dynamic> json) {
    return json
        .map((e) => _decodeCategory((e as Map).cast<String, dynamic>()))
        .toList();
  }
}
