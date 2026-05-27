import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Parameters for product search queries.
class ProductQueryParams {
  /// Search query text.
  final String? query;

  /// Product filter.
  final ProductFilter? filter;

  /// Sort order.
  final ProductSort? sort;

  /// Page number (1-indexed).
  final int page;

  /// Items per page.
  final int pageSize;

  const ProductQueryParams({
    this.query,
    this.filter,
    this.sort,
    this.page = 1,
    this.pageSize = 20,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductQueryParams &&
          query == other.query &&
          filter == other.filter &&
          sort == other.sort &&
          page == other.page &&
          pageSize == other.pageSize;

  @override
  int get hashCode => Object.hash(query, filter, sort, page, pageSize);
}

/// Parameters for category product queries.
class CategoryProductsParams {
  /// Category UID.
  final String categoryId;

  /// Page number (1-indexed).
  final int page;

  /// Items per page.
  final int pageSize;

  /// Sort order.
  final ProductSort? sort;

  /// Product filter.
  final ProductFilter? filter;

  const CategoryProductsParams({
    required this.categoryId,
    this.page = 1,
    this.pageSize = 20,
    this.sort,
    this.filter,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryProductsParams &&
          categoryId == other.categoryId &&
          page == other.page &&
          pageSize == other.pageSize &&
          sort == other.sort &&
          filter == other.filter;

  @override
  int get hashCode => Object.hash(categoryId, page, pageSize, sort, filter);
}
