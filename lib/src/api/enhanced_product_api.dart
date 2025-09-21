import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/product_models.dart';
import '../models/enhanced_product.dart';
import '../adapters/custom_attributes_adapter.dart';
import '../adapters/custom_attributes_manager.dart';
import 'product_api.dart';

/// Enhanced Product API with custom adapters support.
///
/// This class extends the standard ProductApi to provide enhanced functionality
/// for working with custom product attributes through the universal custom
/// attributes system. It allows for type-safe handling of custom product data.
///
/// ## Features
///
/// - **Custom Attributes**: Support for universal custom attributes system
/// - **Type Safety**: Generic type support for custom product models
/// - **Adapter Integration**: Seamless integration with custom attribute adapters
/// - **Enhanced Filtering**: Filter products by custom attribute values
/// - **Validation**: Built-in validation for custom attribute data
/// - **Backward Compatibility**: Extends standard ProductApi functionality
/// - **Debug Support**: Comprehensive debug logging for custom attributes
///
/// ## Usage
///
/// ```dart
/// final enhancedApi = EnhancedProductApi(apiClient);
///
/// // Get products with custom adapter
/// final products = await enhancedApi.getEnhancedProducts<MyProductModel>(
///   adapterId: 'my_custom_adapter',
///   page: 1,
///   pageSize: 20,
/// );
///
/// // Get single enhanced product
/// final product = await enhancedApi.getEnhancedProduct<MyProductModel>(
///   'SKU123',
///   adapterId: 'my_custom_adapter',
/// );
/// ```
class EnhancedProductApi extends ProductApi {
  EnhancedProductApi(super.client);

  /// Get products with custom adapter application
  Future<EnhancedProductListResponse<T>> getEnhancedProducts<T>({
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? customAttributeFilters,
    bool includeCustomAttributesInFields = true,
  }) async {
    try {
      // Merge regular filters with custom attribute filters
      final allFilters = <String, dynamic>{
        ...?filters,
        ...?customAttributeFilters,
      };

      if (kDebugMode &&
          customAttributeFilters != null &&
          customAttributeFilters.isNotEmpty) {
        debugPrint(
          'EnhancedProductApi: Applying custom attribute filters: $customAttributeFilters',
        );
      }

      // Get regular products
      final response = await getProducts(
        page: page,
        pageSize: pageSize,
        searchQuery: searchQuery,
        categoryId: categoryId,
        sortBy: sortBy,
        sortOrder: sortOrder,
        filters: allFilters,
      );

      // Convert to enhanced products
      return EnhancedProductListResponse<T>.fromProductListResponse(
        response,
        adapterId: adapterId,
        adapter: adapter,
      );
    } on DioException catch (e) {
      throw Exception('Failed to get enhanced products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to get enhanced products: $e');
    }
  }

  /// Get single product with custom adapter application
  Future<EnhancedProduct<T>> getEnhancedProduct<T>(
    String sku, {
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
  }) async {
    try {
      if (kDebugMode) {
        debugPrint(
          'EnhancedProductApi: Getting enhanced product $sku with adapter ${adapterId ?? 'auto-detect'}',
        );
      }

      final product = await getProduct(sku);

      return EnhancedProduct<T>.fromProduct(
        product,
        adapterId: adapterId,
        adapter: adapter,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('Enhanced product not found: $sku');
      }
      throw Exception('Failed to get enhanced product: ${e.message}');
    } catch (e) {
      throw Exception('Failed to get enhanced product: $e');
    }
  }

  /// Search products by custom attributes
  Future<EnhancedProductListResponse<T>> searchByCustomAttributes<T>({
    required Map<String, dynamic> customAttributeFilters,
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
    int page = 1,
    int pageSize = 20,
    String? sortBy,
    String? sortOrder,
    String? searchQuery,
  }) async {
    if (kDebugMode) {
      debugPrint(
        'EnhancedProductApi: Searching by custom attributes: $customAttributeFilters',
      );
    }

    return getEnhancedProducts<T>(
      adapterId: adapterId,
      adapter: adapter,
      page: page,
      pageSize: pageSize,
      searchQuery: searchQuery,
      sortBy: sortBy,
      sortOrder: sortOrder,
      customAttributeFilters: customAttributeFilters,
    );
  }

  /// Get products by category with custom adapter
  Future<EnhancedProductListResponse<T>> getEnhancedProductsByCategory<T>(
    int categoryId, {
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
    int page = 1,
    int pageSize = 20,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? customAttributeFilters,
  }) async {
    try {
      final allFilters = <String, dynamic>{
        ...?filters,
        ...?customAttributeFilters,
      };

      final response = await getProductsByCategory(
        categoryId,
        page: page,
        pageSize: pageSize,
        sortBy: sortBy,
        sortOrder: sortOrder,
        filters: allFilters,
      );

      return EnhancedProductListResponse<T>.fromProductListResponse(
        response,
        adapterId: adapterId,
        adapter: adapter,
      );
    } on DioException catch (e) {
      throw Exception(
        'Failed to get enhanced products by category: ${e.message}',
      );
    } catch (e) {
      throw Exception('Failed to get enhanced products by category: $e');
    }
  }

  /// Search enhanced products
  Future<EnhancedProductListResponse<T>> searchEnhancedProducts<T>(
    String query, {
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
    int page = 1,
    int pageSize = 20,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? customAttributeFilters,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final allFilters = <String, dynamic>{
        ...?filters,
        ...?customAttributeFilters,
      };

      final response = await searchProducts(
        query,
        page: page,
        pageSize: pageSize,
        filters: allFilters,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      return EnhancedProductListResponse<T>.fromProductListResponse(
        response,
        adapterId: adapterId,
        adapter: adapter,
      );
    } on DioException catch (e) {
      throw Exception('Failed to search enhanced products: ${e.message}');
    } catch (e) {
      throw Exception('Failed to search enhanced products: $e');
    }
  }

  /// Get products with multiple adapters (returns dynamic type)
  Future<EnhancedProductListResponse<dynamic>> getProductsWithMultipleAdapters({
    List<String>? adapterIds,
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? customAttributeFilters,
  }) async {
    try {
      final allFilters = <String, dynamic>{
        ...?filters,
        ...?customAttributeFilters,
      };

      final response = await getProducts(
        page: page,
        pageSize: pageSize,
        searchQuery: searchQuery,
        categoryId: categoryId,
        sortBy: sortBy,
        sortOrder: sortOrder,
        filters: allFilters,
      );

      // Convert each product using auto-detection or specified adapters
      final enhancedItems = response.items.map((product) {
        // Try auto-detection first
        final detectedAdapter = CustomAttributesManager.instance.detectAdapter(
          product.customAttributes ?? [],
        );

        if (detectedAdapter != null) {
          final customData = detectedAdapter.fromCustomAttributes(
            product.customAttributes!,
          );
          return EnhancedProduct<dynamic>(
            baseProduct: product,
            customData: customData,
            adapterId: detectedAdapter.adapterId,
            rawCustomAttributes: {
              for (var attr in product.customAttributes ?? [])
                attr.attributeCode: attr.value,
            },
            lastUpdated: DateTime.now(),
          );
        }

        // Fallback to raw attributes only
        return EnhancedProduct<dynamic>(
          baseProduct: product,
          rawCustomAttributes: {
            for (var attr in product.customAttributes ?? [])
              attr.attributeCode: attr.value,
          },
          lastUpdated: DateTime.now(),
        );
      }).toList();

      return EnhancedProductListResponse<dynamic>(
        items: enhancedItems,
        totalCount: response.totalCount,
        pageSize: response.pageSize,
        currentPage: response.currentPage,
        totalPages: response.totalPages,
        aggregations: response.aggregations,
        sortOptions: response.sortOptions,
      );
    } on DioException catch (e) {
      throw Exception(
        'Failed to get products with multiple adapters: ${e.message}',
      );
    } catch (e) {
      throw Exception('Failed to get products with multiple adapters: $e');
    }
  }

  /// Filter products by custom data validation
  Future<EnhancedProductListResponse<T>> getValidatedProducts<T>({
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
    bool onlyValid = true,
    int page = 1,
    int pageSize = 20,
    Map<String, dynamic>? filters,
  }) async {
    final response = await getEnhancedProducts<T>(
      adapterId: adapterId,
      adapter: adapter,
      page: page,
      pageSize: pageSize,
      filters: filters,
    );

    if (!onlyValid) return response;

    // Filter only valid products
    final validItems = response.items
        .where((item) => item.isCustomDataValid)
        .toList();

    return response.copyWith(items: validItems, totalCount: validItems.length);
  }

  /// Get products grouped by adapter type
  Future<Map<String, EnhancedProductListResponse<dynamic>>>
  getProductsGroupedByAdapter({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    Map<String, dynamic>? filters,
  }) async {
    final response = await getProductsWithMultipleAdapters(
      page: page,
      pageSize: pageSize,
      searchQuery: searchQuery,
      filters: filters,
    );

    final groupedProducts = <String, List<EnhancedProduct<dynamic>>>{};

    for (final product in response.items) {
      final adapterId = product.adapterId ?? 'no_adapter';
      groupedProducts[adapterId] ??= [];
      groupedProducts[adapterId]!.add(product);
    }

    return groupedProducts.map(
      (adapterId, products) => MapEntry(
        adapterId,
        EnhancedProductListResponse<dynamic>(
          items: products,
          totalCount: products.length,
          pageSize: pageSize,
          currentPage: page,
          totalPages: (products.length / pageSize).ceil(),
        ),
      ),
    );
  }

  /// Get custom attribute statistics across products
  Future<Map<String, dynamic>> getCustomAttributeStatistics({
    int page = 1,
    int pageSize = 100,
    String? categoryId,
  }) async {
    final response = await getProductsWithMultipleAdapters(
      page: page,
      pageSize: pageSize,
      categoryId: categoryId,
    );

    final attributeUsage = <String, int>{};
    final adapterUsage = <String, int>{};
    final attributeValues = <String, Set<String>>{};

    for (final product in response.items) {
      // Count adapter usage
      if (product.adapterId != null) {
        adapterUsage[product.adapterId!] =
            (adapterUsage[product.adapterId!] ?? 0) + 1;
      }

      // Count attribute usage and collect values
      for (final entry in product.rawCustomAttributes.entries) {
        final code = entry.key;
        final value = entry.value.toString();

        attributeUsage[code] = (attributeUsage[code] ?? 0) + 1;
        attributeValues[code] ??= <String>{};
        attributeValues[code]!.add(value);
      }
    }

    return {
      'totalProducts': response.items.length,
      'productsWithCustomData': response.itemsWithCustomData.length,
      'attributeUsage': attributeUsage,
      'adapterUsage': adapterUsage,
      'attributeValueCounts': attributeValues.map(
        (code, values) => MapEntry(code, values.length),
      ),
      'mostUsedAttributes': attributeUsage.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value))
        ..take(10).map((e) => {'code': e.key, 'usage': e.value}).toList(),
    };
  }

  /// Bulk update custom attributes (admin operation)
  Future<List<EnhancedProduct<T>>> bulkUpdateCustomAttributes<T>(
    List<String> skus,
    Map<String, dynamic> attributeUpdates, {
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
  }) async {
    final updatedProducts = <EnhancedProduct<T>>[];

    for (final sku in skus) {
      try {
        // This would typically require admin API access
        // For now, we'll simulate by getting and updating locally
        final product = await getEnhancedProduct<T>(
          sku,
          adapterId: adapterId,
          adapter: adapter,
        );

        // Update raw attributes
        final newRawAttributes = {
          ...product.rawCustomAttributes,
          ...attributeUpdates,
        };

        // Convert to CustomAttribute list
        final newCustomAttributes = newRawAttributes.entries
            .map(
              (entry) => CustomAttribute(
                attributeCode: entry.key,
                value: entry.value.toString(),
              ),
            )
            .toList();

        // Update base product
        final updatedBaseProduct = product.baseProduct.copyWith(
          customAttributes: newCustomAttributes,
        );

        // Create new enhanced product
        final updatedProduct = EnhancedProduct<T>.fromProduct(
          updatedBaseProduct,
          adapterId: adapterId,
          adapter: adapter,
        );

        updatedProducts.add(updatedProduct);
      } catch (e) {
        if (kDebugMode) {
          debugPrint('Failed to update product $sku: $e');
        }
        // Continue with other products
      }
    }

    return updatedProducts;
  }
}
