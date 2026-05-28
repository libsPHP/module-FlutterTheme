import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../mappers/category_mapper.dart';
import '../mappers/product_mapper.dart';
import '../queries/category_queries.dart';
import '../queries/product_queries.dart';

class MagentoCatalogRepository implements CatalogRepository {
  final MagentoTransport transport;
  final ProductMapper _productMapper;
  final CategoryMapper _categoryMapper;

  MagentoCatalogRepository(this.transport)
      : _productMapper = ProductMapper(),
        _categoryMapper = CategoryMapper();

  @override
  Future<ProductPage> searchProducts({
    String? query,
    ProductFilter? filter,
    ProductSort? sort,
    required int page,
    required int pageSize,
  }) async {
    final variables = <String, dynamic>{
      'pageSize': pageSize,
      'currentPage': page,
    };

    if (query != null && query.isNotEmpty) {
      variables['search'] = query;
    }

    if (filter != null && !filter.isEmpty) {
      variables['filter'] = _buildFilterInput(filter);
    }

    if (sort != null) {
      variables['sort'] = _buildSortInput(sort);
    }

    final response = await transport.graphql(
      ProductQueries.search,
      variables: variables,
      decoder: (json) =>
          _productMapper.mapProductPage(json['products'] as Map<String, dynamic>),
    );

    return response.data;
  }

  @override
  Future<ProductDetails> getProductBySku(String sku) async {
    final response = await transport.graphql(
      ProductQueries.productDetails,
      variables: {'sku': sku},
      decoder: (json) {
        final products = json['products'] as Map<String, dynamic>?;
        final items = products?['items'] as List<dynamic>?;

        if (items == null || items.isEmpty) {
          throw MagentoNotFoundException('Product not found: $sku');
        }

        return _productMapper
            .mapProductDetails(items.first as Map<String, dynamic>);
      },
    );

    return response.data;
  }

  @override
  Future<ProductDetails> getProductById(int id) async {
    final response = await transport.graphql(
      ProductQueries.productById,
      variables: {'id': id},
      decoder: (json) {
        final products = json['products'] as Map<String, dynamic>?;
        final items = products?['items'] as List<dynamic>?;

        if (items == null || items.isEmpty) {
          throw MagentoNotFoundException('Product not found: $id');
        }

        return _productMapper
            .mapProductDetails(items.first as Map<String, dynamic>);
      },
    );

    return response.data;
  }

  @override
  Future<List<Category>> getCategoryTree() async {
    final response = await transport.graphql(
      CategoryQueries.categoryTree,
      decoder: (json) => _categoryMapper.mapCategoryTree(json as Map<String, dynamic>),
    );

    return response.data;
  }

  @override
  Future<Category> getCategoryById(String categoryId) async {
    final response = await transport.graphql(
      CategoryQueries.categoryById,
      variables: {'uid': categoryId},
      decoder: (json) {
        final category = _categoryMapper.mapSingleCategory(json as Map<String, dynamic>);
        if (category == null) {
          throw MagentoNotFoundException('Category not found: $categoryId');
        }
        return category;
      },
    );

    return response.data;
  }

  @override
  Future<ProductPage> getProductsByCategory({
    required String categoryId,
    required int page,
    required int pageSize,
    ProductSort? sort,
    ProductFilter? filter,
  }) async {
    final variables = <String, dynamic>{
      'categoryUid': categoryId,
      'pageSize': pageSize,
      'currentPage': page,
    };

    if (sort != null) {
      variables['sort'] = _buildSortInput(sort);
    }

    if (filter != null && !filter.isEmpty) {
      variables['filter'] = _buildFilterInput(filter);
    }

    final response = await transport.graphql(
      CategoryQueries.productsByCategory,
      variables: variables,
      decoder: (json) =>
          _productMapper.mapProductPage(json['products'] as Map<String, dynamic>),
    );

    return response.data;
  }

  Map<String, dynamic> _buildFilterInput(ProductFilter filter) {
    final result = <String, dynamic>{};

    if (filter.categoryIds != null && filter.categoryIds!.isNotEmpty) {
      result['category_uid'] = {'in': filter.categoryIds};
    }

    if (filter.priceMin != null || filter.priceMax != null) {
      final priceFilter = <String, dynamic>{};
      if (filter.priceMin != null) {
        priceFilter['from'] = filter.priceMin!.value.toString();
      }
      if (filter.priceMax != null) {
        priceFilter['to'] = filter.priceMax!.value.toString();
      }
      result['price'] = priceFilter;
    }

    if (filter.attributes != null) {
      for (final entry in filter.attributes!.entries) {
        if (entry.value.isNotEmpty) {
          result[entry.key] = {'in': entry.value};
        }
      }
    }

    return result;
  }

  Map<String, dynamic> _buildSortInput(ProductSort sort) {
    final fieldName = switch (sort.field) {
      ProductSortField.name => 'name',
      ProductSortField.price => 'price',
      ProductSortField.position => 'position',
      ProductSortField.relevance => 'relevance',
      ProductSortField.createdAt => 'created_at',
    };

    return {
      fieldName: sort.direction == SortDirection.asc ? 'ASC' : 'DESC',
    };
  }
}
