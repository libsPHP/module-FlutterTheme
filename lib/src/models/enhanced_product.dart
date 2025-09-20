import 'product_models.dart';
import '../adapters/custom_attributes_adapter.dart';
import '../adapters/custom_attributes_manager.dart';

/// Enhanced product model with support for custom adapters
class EnhancedProduct<T> {
  final Product baseProduct;
  final T? customData;
  final String? adapterId;
  final Map<String, dynamic> rawCustomAttributes;
  final DateTime? lastUpdated;

  const EnhancedProduct({
    required this.baseProduct,
    this.customData,
    this.adapterId,
    this.rawCustomAttributes = const {},
    this.lastUpdated,
  });

  /// Create EnhancedProduct from regular Product with adapter application
  factory EnhancedProduct.fromProduct(
    Product product, {
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
  }) {
    T? customData;
    String? detectedAdapterId = adapterId;
    Map<String, dynamic> rawAttributes = {};

    if (product.customAttributes != null &&
        product.customAttributes!.isNotEmpty) {
      // Build raw attributes map
      rawAttributes = {
        for (var attr in product.customAttributes!)
          attr.attributeCode: attr.value
      };

      if (adapter != null) {
        // Use provided adapter
        customData = adapter.fromCustomAttributes(product.customAttributes!);
        detectedAdapterId = adapter.adapterId;
      } else if (adapterId != null) {
        // Use registered adapter by ID
        final registeredAdapter =
            CustomAttributesManager.instance.getAdapter<T>(adapterId);
        if (registeredAdapter != null) {
          customData =
              registeredAdapter.fromCustomAttributes(product.customAttributes!);
          detectedAdapterId = adapterId;
        }
      } else {
        // Auto-detect adapter
        final detectedAdapter = CustomAttributesManager.instance
            .detectAdapter(product.customAttributes!);
        if (detectedAdapter != null &&
            detectedAdapter is CustomAttributesAdapter<T>) {
          customData =
              detectedAdapter.fromCustomAttributes(product.customAttributes!);
          detectedAdapterId = detectedAdapter.adapterId;
        }
      }
    }

    return EnhancedProduct<T>(
      baseProduct: product,
      customData: customData,
      adapterId: detectedAdapterId,
      rawCustomAttributes: rawAttributes,
      lastUpdated: DateTime.now(),
    );
  }

  /// Get custom attribute value by code
  String? getCustomAttribute(String code) {
    return rawCustomAttributes[code]?.toString();
  }

  /// Get typed custom attribute value
  U? getTypedCustomAttribute<U>(String code) {
    final rawValue = rawCustomAttributes[code];
    if (rawValue == null) return null;

    try {
      if (U == String) return rawValue.toString() as U;
      if (U == int) return int.parse(rawValue.toString()) as U;
      if (U == double) return double.parse(rawValue.toString()) as U;
      if (U == bool) return (rawValue.toString().toLowerCase() == 'true') as U;
      if (U == DateTime) return DateTime.parse(rawValue.toString()) as U;
    } catch (e) {
      // Return null if parsing fails
    }

    return null;
  }

  /// Check if custom attribute exists
  bool hasCustomAttribute(String code) {
    return rawCustomAttributes.containsKey(code);
  }

  /// Get all custom attribute codes
  List<String> get customAttributeCodes => rawCustomAttributes.keys.toList();

  /// Check if product has custom data
  bool get hasCustomData => customData != null;

  /// Check if adapter was detected/used
  bool get hasAdapter => adapterId != null;

  /// Get adapter instance if available
  CustomAttributesAdapter<T>? get adapter {
    return adapterId != null
        ? CustomAttributesManager.instance.getAdapter<T>(adapterId!)
        : null;
  }

  /// Validate custom data using adapter
  bool get isCustomDataValid {
    final adapterInstance = adapter;
    if (adapterInstance == null || customData == null) return true;

    final result = adapterInstance.validate(customData!);
    return result.isValid;
  }

  /// Get validation errors for custom data
  List<String> get customDataValidationErrors {
    final adapterInstance = adapter;
    if (adapterInstance == null || customData == null) return [];

    final result = adapterInstance.validate(customData!);
    return result.errors;
  }

  /// Refresh custom data using current adapter
  EnhancedProduct<T> refreshCustomData() {
    if (baseProduct.customAttributes == null ||
        baseProduct.customAttributes!.isEmpty) {
      return this;
    }

    final adapterInstance = adapter;
    if (adapterInstance == null) return this;

    final newCustomData =
        adapterInstance.fromCustomAttributes(baseProduct.customAttributes!);

    return copyWith(
      customData: newCustomData,
      lastUpdated: DateTime.now(),
    );
  }

  /// Create a copy with new values
  EnhancedProduct<T> copyWith({
    Product? baseProduct,
    T? customData,
    String? adapterId,
    Map<String, dynamic>? rawCustomAttributes,
    DateTime? lastUpdated,
  }) {
    return EnhancedProduct<T>(
      baseProduct: baseProduct ?? this.baseProduct,
      customData: customData ?? this.customData,
      adapterId: adapterId ?? this.adapterId,
      rawCustomAttributes: rawCustomAttributes ?? this.rawCustomAttributes,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  /// Update custom data and sync back to base product
  EnhancedProduct<T> updateCustomData(T newCustomData) {
    final adapterInstance = adapter;
    if (adapterInstance == null) {
      return copyWith(customData: newCustomData, lastUpdated: DateTime.now());
    }

    // Convert back to CustomAttribute list
    final newCustomAttributes =
        adapterInstance.toCustomAttributes(newCustomData);

    // Update base product
    final updatedBaseProduct = baseProduct.copyWith(
      customAttributes: newCustomAttributes,
    );

    // Update raw attributes map
    final newRawAttributes = {
      for (var attr in newCustomAttributes) attr.attributeCode: attr.value
    };

    return copyWith(
      baseProduct: updatedBaseProduct,
      customData: newCustomData,
      rawCustomAttributes: newRawAttributes,
      lastUpdated: DateTime.now(),
    );
  }

  /// Create a copy with new adapter
  EnhancedProduct<U> withAdapter<U>(
    String newAdapterId, {
    CustomAttributesAdapter<U>? adapter,
  }) {
    return EnhancedProduct<U>.fromProduct(
      baseProduct,
      adapterId: newAdapterId,
      adapter: adapter,
    );
  }

  /// Get search filters for this product's custom data
  Map<String, dynamic> getSearchFilters() {
    final adapterInstance = adapter;
    if (adapterInstance == null || customData == null) return {};

    return adapterInstance.buildSearchFilters(customData!);
  }

  /// Check if product matches custom attribute filters
  bool matchesFilters(Map<String, dynamic> filters) {
    for (final entry in filters.entries) {
      final attributeCode = entry.key;
      final filterValue = entry.value;
      final productValue = getCustomAttribute(attributeCode);

      if (productValue == null) return false;

      if (filterValue is String) {
        if (productValue != filterValue) return false;
      } else if (filterValue is Map<String, dynamic>) {
        // Handle complex filters (gt, lt, like, etc.)
        if (!_matchesComplexFilter(productValue, filterValue)) return false;
      } else {
        if (productValue != filterValue.toString()) return false;
      }
    }

    return true;
  }

  /// Helper method to match complex filters
  bool _matchesComplexFilter(String productValue, Map<String, dynamic> filter) {
    for (final entry in filter.entries) {
      final operator = entry.key;
      final value = entry.value.toString();

      switch (operator.toLowerCase()) {
        case 'eq':
          if (productValue != value) return false;
          break;
        case 'neq':
          if (productValue == value) return false;
          break;
        case 'like':
          if (!productValue.toLowerCase().contains(value.toLowerCase()))
            return false;
          break;
        case 'nlike':
          if (productValue.toLowerCase().contains(value.toLowerCase()))
            return false;
          break;
        case 'gt':
          final numValue = double.tryParse(productValue);
          final filterNum = double.tryParse(value);
          if (numValue == null || filterNum == null || numValue <= filterNum)
            return false;
          break;
        case 'gte':
        case 'gteq':
          final numValue = double.tryParse(productValue);
          final filterNum = double.tryParse(value);
          if (numValue == null || filterNum == null || numValue < filterNum)
            return false;
          break;
        case 'lt':
          final numValue = double.tryParse(productValue);
          final filterNum = double.tryParse(value);
          if (numValue == null || filterNum == null || numValue >= filterNum)
            return false;
          break;
        case 'lte':
        case 'lteq':
          final numValue = double.tryParse(productValue);
          final filterNum = double.tryParse(value);
          if (numValue == null || filterNum == null || numValue > filterNum)
            return false;
          break;
        case 'in':
          if (entry.value is List) {
            final values =
                (entry.value as List).map((v) => v.toString()).toList();
            if (!values.contains(productValue)) return false;
          }
          break;
        case 'nin':
          if (entry.value is List) {
            final values =
                (entry.value as List).map((v) => v.toString()).toList();
            if (values.contains(productValue)) return false;
          }
          break;
        case 'range':
          if (entry.value is Map<String, dynamic>) {
            final rangeMap = entry.value as Map<String, dynamic>;
            final numValue = double.tryParse(productValue);
            if (numValue == null) return false;

            if (rangeMap.containsKey('from')) {
              final fromValue = double.tryParse(rangeMap['from'].toString());
              if (fromValue != null && numValue < fromValue) return false;
            }

            if (rangeMap.containsKey('to')) {
              final toValue = double.tryParse(rangeMap['to'].toString());
              if (toValue != null && numValue > toValue) return false;
            }
          }
          break;
      }
    }

    return true;
  }
}

/// Enhanced product list response
class EnhancedProductListResponse<T> {
  final List<EnhancedProduct<T>> items;
  final int totalCount;
  final int pageSize;
  final int currentPage;
  final int totalPages;
  final List<Aggregation>? aggregations;
  final List<SortOption>? sortOptions;
  final Map<String, dynamic>? metadata;

  const EnhancedProductListResponse({
    this.items = const [],
    this.totalCount = 0,
    this.pageSize = 20,
    this.currentPage = 1,
    this.totalPages = 0,
    this.aggregations,
    this.sortOptions,
    this.metadata,
  });

  /// Create from regular ProductListResponse
  factory EnhancedProductListResponse.fromProductListResponse(
    ProductListResponse response, {
    String? adapterId,
    CustomAttributesAdapter<T>? adapter,
  }) {
    final enhancedItems = response.items
        .map((product) => EnhancedProduct<T>.fromProduct(
              product,
              adapterId: adapterId,
              adapter: adapter,
            ))
        .toList();

    return EnhancedProductListResponse<T>(
      items: enhancedItems,
      totalCount: response.totalCount,
      pageSize: response.pageSize,
      currentPage: response.currentPage,
      totalPages: response.totalPages,
      aggregations: response.aggregations,
      sortOptions: response.sortOptions,
    );
  }

  /// Check if response has items
  bool get hasItems => items.isNotEmpty;

  /// Check if there are more pages
  bool get hasMorePages => currentPage < totalPages;

  /// Get items with valid custom data only
  List<EnhancedProduct<T>> get itemsWithCustomData =>
      items.where((item) => item.hasCustomData).toList();

  /// Get items with specific adapter
  List<EnhancedProduct<T>> getItemsWithAdapter(String adapterId) =>
      items.where((item) => item.adapterId == adapterId).toList();

  /// Get statistics about custom data usage
  Map<String, dynamic> get customDataStatistics {
    final totalItems = items.length;
    final itemsWithData = itemsWithCustomData;
    final adapterUsage = <String, int>{};

    for (final item in items) {
      if (item.adapterId != null) {
        adapterUsage[item.adapterId!] =
            (adapterUsage[item.adapterId!] ?? 0) + 1;
      }
    }

    return {
      'totalItems': totalItems,
      'itemsWithCustomData': itemsWithData.length,
      'customDataUsagePercentage': totalItems > 0
          ? (itemsWithData.length / totalItems * 100).toStringAsFixed(1)
          : '0.0',
      'adapterUsage': adapterUsage,
    };
  }

  /// Create a copy with new values
  EnhancedProductListResponse<T> copyWith({
    List<EnhancedProduct<T>>? items,
    int? totalCount,
    int? pageSize,
    int? currentPage,
    int? totalPages,
    List<Aggregation>? aggregations,
    List<SortOption>? sortOptions,
    Map<String, dynamic>? metadata,
  }) {
    return EnhancedProductListResponse<T>(
      items: items ?? this.items,
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      aggregations: aggregations ?? this.aggregations,
      sortOptions: sortOptions ?? this.sortOptions,
      metadata: metadata ?? this.metadata,
    );
  }
}
