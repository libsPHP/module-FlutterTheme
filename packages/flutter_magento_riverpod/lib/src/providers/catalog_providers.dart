import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../params/query_params.dart';
import 'core_providers.dart';

/// Product search provider with caching.
final productsProvider = FutureProvider.autoDispose
    .family<ProductPage, ProductQueryParams>((ref, params) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.searchProducts(
    query: params.query,
    filter: params.filter,
    sort: params.sort,
    page: params.page,
    pageSize: params.pageSize,
  );
});

/// Single product details provider.
final productDetailsProvider = FutureProvider.autoDispose
    .family<ProductDetails, String>((ref, sku) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getProductBySku(sku);
});

/// Product by ID provider.
final productByIdProvider = FutureProvider.autoDispose
    .family<ProductDetails, int>((ref, id) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getProductById(id);
});

/// Category tree provider (cached longer).
final categoryTreeProvider = FutureProvider<List<Category>>((ref) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getCategoryTree();
});

/// Single category provider.
final categoryProvider = FutureProvider.autoDispose
    .family<Category, String>((ref, categoryId) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getCategoryById(categoryId);
});

/// Products by category provider.
final categoryProductsProvider = FutureProvider.autoDispose
    .family<ProductPage, CategoryProductsParams>((ref, params) async {
  final catalog = ref.watch(catalogRepositoryProvider);
  return catalog.getProductsByCategory(
    categoryId: params.categoryId,
    page: params.page,
    pageSize: params.pageSize,
    sort: params.sort,
    filter: params.filter,
  );
});
