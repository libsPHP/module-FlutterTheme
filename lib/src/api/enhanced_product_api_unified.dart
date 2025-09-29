import 'package:flutter/foundation.dart';
import '../models/product_models.dart';
import '../models/enhanced_product.dart';
import '../adapters/custom_attributes_adapter.dart';
import '../adapters/custom_attributes_manager.dart';
import '../adapters/validation_result.dart';
import 'magento_api_client.dart';

/// Enhanced Product API with React-style interface
///
/// This class provides enhanced product functionality that matches the React Native
/// and React Web versions, including support for custom attributes and adapters.
class EnhancedProductApi {
  final MagentoApiClient _apiClient;

  EnhancedProductApi(this._apiClient);

  /// Get enhanced products with custom attributes
  Future<EnhancedProductListResponse<T>> getEnhancedProducts<T>({
    String? adapterId,
    int page = 1,
    int pageSize = 20,
    Map<String, dynamic>? customFilters,
  }) async {
    try {
      if (kDebugMode) {
        print('🔍 Getting enhanced products with adapter: $adapterId');
      }

      // Get products from Magento API
      final response = await _apiClient.guestRequest<Map<String, dynamic>>(
        '/rest/V1/products',
        queryParameters: {
          'searchCriteria[pageSize]': pageSize,
          'searchCriteria[currentPage]': page,
        },
      );

      if (response.data == null || response.data!['items'] == null) {
        return EnhancedProductListResponse<T>(
          items: <T>[],
          totalCount: 0,
          page: page,
          pageSize: pageSize,
          hasMore: false,
          rawItems: [],
        );
      }

      final rawItems = List<Map<String, dynamic>>.from(response.data!['items']);
      final enhancedItems = <T>[];

      for (final item in rawItems) {
        try {
          // Extract custom attributes
          final customAttributes = _extractCustomAttributes(item);

          // Apply adapter if specified
          if (adapterId != null) {
            final adapter = CustomAttributesManager.instance.getAdapter<T>(
              adapterId,
            );
            if (adapter != null) {
              final customData = adapter.fromCustomAttributes(customAttributes);
              final enhancedProduct = EnhancedProduct<T>(
                baseProduct: Product.fromJson(item),
                customData: customData,
                adapterId: adapterId,
                rawCustomAttributes: _buildRawAttributes(customAttributes),
                lastUpdated: DateTime.now(),
              );
              enhancedItems.add(enhancedProduct as T);
            }
          } else {
            // Auto-detect adapter
            final detectedAdapter = CustomAttributesManager.instance
                .detectAdapter(customAttributes);
            if (detectedAdapter != null &&
                detectedAdapter is CustomAttributesAdapter<T>) {
              final customData = detectedAdapter.fromCustomAttributes(
                customAttributes,
              );
              final enhancedProduct = EnhancedProduct<T>(
                baseProduct: Product.fromJson(item),
                customData: customData,
                adapterId: detectedAdapter.adapterId,
                rawCustomAttributes: _buildRawAttributes(customAttributes),
                lastUpdated: DateTime.now(),
              );
              enhancedItems.add(enhancedProduct as T);
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print('❌ Error processing product ${item['sku']}: $e');
          }
        }
      }

      return EnhancedProductListResponse<T>(
        items: enhancedItems,
        totalCount: response.data?['total_count'] ?? enhancedItems.length,
        page: page,
        pageSize: pageSize,
        hasMore: (response.data?['total_count'] ?? 0) > (page * pageSize),
        rawItems: rawItems,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error getting enhanced products: $e');
      }
      rethrow;
    }
  }

  /// Get single enhanced product
  Future<EnhancedProductResponse<T>> getEnhancedProduct<T>(
    String sku, {
    String? adapterId,
  }) async {
    try {
      if (kDebugMode) {
        print('🔍 Getting enhanced product: $sku with adapter: $adapterId');
      }

      // Get product from Magento API
      final response = await _apiClient.guestRequest<Map<String, dynamic>>('/rest/V1/products/$sku');
      if (response.data == null) {
        throw Exception('Product not found: $sku');
      }

      // Extract custom attributes
      final customAttributes = _extractCustomAttributes(response.data!);

      // Apply adapter
      T? customData;
      String? detectedAdapterId = adapterId;

      if (adapterId != null) {
        final adapter = CustomAttributesManager.instance.getAdapter<T>(
          adapterId,
        );
        if (adapter != null) {
          customData = adapter.fromCustomAttributes(customAttributes);
          detectedAdapterId = adapterId;
        }
      } else {
        // Auto-detect adapter
        final detectedAdapter = CustomAttributesManager.instance.detectAdapter(
          customAttributes,
        );
        if (detectedAdapter != null &&
            detectedAdapter is CustomAttributesAdapter<T>) {
          customData = detectedAdapter.fromCustomAttributes(customAttributes);
          detectedAdapterId = detectedAdapter.adapterId;
        }
      }

      final enhancedProduct = EnhancedProduct<T>(
        baseProduct: Product.fromJson(response.data!),
        customData: customData,
        adapterId: detectedAdapterId,
        rawCustomAttributes: _buildRawAttributes(customAttributes),
        lastUpdated: DateTime.now(),
      );

      return EnhancedProductResponse<T>(
        product: enhancedProduct as T,
        rawProduct: response.data!,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error getting enhanced product $sku: $e');
      }
      rethrow;
    }
  }

  /// Search enhanced products by custom attributes
  Future<EnhancedProductListResponse<T>> searchEnhancedProducts<T>(
    String query, {
    String? adapterId,
    int page = 1,
    int pageSize = 20,
    Map<String, dynamic>? customFilters,
  }) async {
    try {
      if (kDebugMode) {
        print(
          '🔍 Searching enhanced products: $query with adapter: $adapterId',
        );
      }

      // Search products using Magento API
      final response = await _apiClient.guestRequest<Map<String, dynamic>>(
        '/rest/V1/products',
        queryParameters: {
          'searchCriteria[filterGroups][0][filters][0][field]': 'name',
          'searchCriteria[filterGroups][0][filters][0][value]': query,
          'searchCriteria[filterGroups][0][filters][0][conditionType]': 'like',
          'searchCriteria[pageSize]': pageSize,
          'searchCriteria[currentPage]': page,
        },
      );

      if (response.data == null || response.data!['items'] == null) {
        return EnhancedProductListResponse<T>(
          items: <T>[],
          totalCount: 0,
          page: page,
          pageSize: pageSize,
          hasMore: false,
          rawItems: [],
        );
      }

      final rawItems = List<Map<String, dynamic>>.from(response.data!['items']);
      final enhancedItems = <T>[];

      for (final item in rawItems) {
        try {
          // Extract custom attributes
          final customAttributes = _extractCustomAttributes(item);

          // Apply adapter
          if (adapterId != null) {
            final adapter = CustomAttributesManager.instance.getAdapter<T>(
              adapterId,
            );
            if (adapter != null) {
              final customData = adapter.fromCustomAttributes(customAttributes);
              final enhancedProduct = EnhancedProduct<T>(
                baseProduct: Product.fromJson(item),
                customData: customData,
                adapterId: adapterId,
                rawCustomAttributes: _buildRawAttributes(customAttributes),
                lastUpdated: DateTime.now(),
              );
              enhancedItems.add(enhancedProduct as T);
            }
          } else {
            // Auto-detect adapter
            final detectedAdapter = CustomAttributesManager.instance
                .detectAdapter(customAttributes);
            if (detectedAdapter != null &&
                detectedAdapter is CustomAttributesAdapter<T>) {
              final customData = detectedAdapter.fromCustomAttributes(
                customAttributes,
              );
              final enhancedProduct = EnhancedProduct<T>(
                baseProduct: Product.fromJson(item),
                customData: customData,
                adapterId: detectedAdapter.adapterId,
                rawCustomAttributes: _buildRawAttributes(customAttributes),
                lastUpdated: DateTime.now(),
              );
              enhancedItems.add(enhancedProduct as T);
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print('❌ Error processing search result ${item['sku']}: $e');
          }
        }
      }

      return EnhancedProductListResponse<T>(
        items: enhancedItems,
        totalCount: response.data?['total_count'] ?? enhancedItems.length,
        page: page,
        pageSize: pageSize,
        hasMore: (response.data?['total_count'] ?? 0) > (page * pageSize),
        rawItems: rawItems,
      );
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error searching enhanced products: $e');
      }
      rethrow;
    }
  }

  /// Validate product custom attributes
  Future<ValidationResult> validateProductCustomAttributes(
    String sku,
    String adapterId,
  ) async {
    try {
      if (kDebugMode) {
        print(
          '🔍 Validating custom attributes for product: $sku with adapter: $adapterId',
        );
      }

      // Get product
      final response = await _apiClient.guestRequest<Map<String, dynamic>>('/rest/V1/products/$sku');
      if (response.data == null) {
        return ValidationResult(
          isValid: false,
          errors: ['Product not found: $sku'],
        );
      }

      // Extract custom attributes
      final customAttributes = _extractCustomAttributes(response.data!);

      // Get adapter
      final adapter = CustomAttributesManager.instance.getAdapter(adapterId);
      if (adapter == null) {
        return ValidationResult(
          isValid: false,
          errors: ['Adapter not found: $adapterId'],
        );
      }

      // Validate attributes
      return adapter.validate(customAttributes);
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error validating custom attributes for $sku: $e');
      }
      return ValidationResult(isValid: false, errors: ['Validation error: $e']);
    }
  }

  /// Extract custom attributes from Magento product
  List<CustomAttribute> _extractCustomAttributes(Map<String, dynamic> product) {
    final customAttributes = <CustomAttribute>[];

    // Extract from custom_attributes field if present
    if (product['custom_attributes'] != null &&
        product['custom_attributes'] is List) {
      for (final attr in product['custom_attributes']) {
        if (attr['attribute_code'] != null && attr['value'] != null) {
          customAttributes.add(
            CustomAttribute(
              attributeCode: attr['attribute_code'],
              value: attr['value'].toString(),
            ),
          );
        }
      }
    }

    // Extract from extension_attributes if present
    if (product['extension_attributes'] != null) {
      for (final entry
          in (product['extension_attributes'] as Map<String, dynamic>)
              .entries) {
        customAttributes.add(
          CustomAttribute(
            attributeCode: entry.key,
            value: entry.value.toString(),
          ),
        );
      }
    }

    return customAttributes;
  }

  /// Build raw attributes map
  Map<String, dynamic> _buildRawAttributes(List<CustomAttribute> attributes) {
    final rawAttributes = <String, dynamic>{};
    for (final attr in attributes) {
      rawAttributes[attr.attributeCode] = attr.value;
    }
    return rawAttributes;
  }
}

/// Enhanced product list response
class EnhancedProductListResponse<T> {
  final List<T> items;
  final int totalCount;
  final int page;
  final int pageSize;
  final bool hasMore;
  final List<Map<String, dynamic>> rawItems;

  const EnhancedProductListResponse({
    required this.items,
    required this.totalCount,
    required this.page,
    required this.pageSize,
    required this.hasMore,
    required this.rawItems,
  });

  Map<String, dynamic> toJson() => {
    'items': items,
    'totalCount': totalCount,
    'page': page,
    'pageSize': pageSize,
    'hasMore': hasMore,
    'rawItems': rawItems,
  };
}

/// Enhanced product response
class EnhancedProductResponse<T> {
  final T product;
  final Map<String, dynamic> rawProduct;

  const EnhancedProductResponse({
    required this.product,
    required this.rawProduct,
  });

  Map<String, dynamic> toJson() => {
    'product': product,
    'rawProduct': rawProduct,
  };
}
