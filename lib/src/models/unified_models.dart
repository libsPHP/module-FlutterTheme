/// Unified data models for Flutter Magento library
///
/// These models provide compatibility with React Native and React Web versions
/// while maintaining Flutter-specific functionality.

/// Product parameters for API calls
class ProductParams {
  final int? page;
  final int? pageSize;
  final String? searchQuery;
  final String? categoryId;
  final String? sortBy;
  final String? sortOrder;
  final Map<String, dynamic>? filters;

  const ProductParams({
    this.page,
    this.pageSize,
    this.searchQuery,
    this.categoryId,
    this.sortBy,
    this.sortOrder,
    this.filters,
  });

  Map<String, dynamic> toJson() => {
    'page': page,
    'pageSize': pageSize,
    'searchQuery': searchQuery,
    'categoryId': categoryId,
    'sortBy': sortBy,
    'sortOrder': sortOrder,
    'filters': filters,
  };

  factory ProductParams.fromJson(Map<String, dynamic> json) => ProductParams(
    page: json['page'],
    pageSize: json['pageSize'],
    searchQuery: json['searchQuery'],
    categoryId: json['categoryId'],
    sortBy: json['sortBy'],
    sortOrder: json['sortOrder'],
    filters: json['filters'],
  );
}

/// Authentication result
class AuthResult {
  final bool success;
  final dynamic customer; // Using dynamic to avoid import issues
  final String? token;
  final String? message;

  const AuthResult({
    required this.success,
    this.customer,
    this.token,
    this.message,
  });

  Map<String, dynamic> toJson() => {
    'success': success,
    'customer': customer,
    'token': token,
    'message': message,
  };

  factory AuthResult.fromJson(Map<String, dynamic> json) => AuthResult(
    success: json['success'] ?? false,
    customer: json['customer'],
    token: json['token'],
    message: json['message'],
  );
}

/// Cart item parameters
class CartItemParams {
  final String sku;
  final int quantity;
  final Map<String, dynamic>? productOptions;

  const CartItemParams({
    required this.sku,
    required this.quantity,
    this.productOptions,
  });

  Map<String, dynamic> toJson() => {
    'sku': sku,
    'quantity': quantity,
    'productOptions': productOptions,
  };

  factory CartItemParams.fromJson(Map<String, dynamic> json) => CartItemParams(
    sku: json['sku'] ?? '',
    quantity: json['quantity'] ?? 1,
    productOptions: json['productOptions'],
  );
}

/// Order parameters
class OrderParams {
  final int? page;
  final int? pageSize;

  const OrderParams({this.page, this.pageSize});

  Map<String, dynamic> toJson() => {'page': page, 'pageSize': pageSize};

  factory OrderParams.fromJson(Map<String, dynamic> json) =>
      OrderParams(page: json['page'], pageSize: json['pageSize']);
}

/// Search parameters
class SearchParams {
  final int? page;
  final int? pageSize;

  const SearchParams({this.page, this.pageSize});

  Map<String, dynamic> toJson() => {'page': page, 'pageSize': pageSize};

  factory SearchParams.fromJson(Map<String, dynamic> json) =>
      SearchParams(page: json['page'], pageSize: json['pageSize']);
}

/// Enhanced product parameters
class EnhancedProductParams {
  final String? adapterId;
  final int? page;
  final int? pageSize;
  final Map<String, dynamic>? customFilters;

  const EnhancedProductParams({
    this.adapterId,
    this.page,
    this.pageSize,
    this.customFilters,
  });

  Map<String, dynamic> toJson() => {
    'adapterId': adapterId,
    'page': page,
    'pageSize': pageSize,
    'customFilters': customFilters,
  };

  factory EnhancedProductParams.fromJson(Map<String, dynamic> json) =>
      EnhancedProductParams(
        adapterId: json['adapterId'],
        page: json['page'],
        pageSize: json['pageSize'],
        customFilters: json['customFilters'],
      );
}

/// Service status
class ServiceStatus {
  final bool isInitialized;
  final bool isAuthenticated;
  final bool isOnline;
  final int cartItemsCount;
  final String currentLocale;

  const ServiceStatus({
    required this.isInitialized,
    required this.isAuthenticated,
    required this.isOnline,
    required this.cartItemsCount,
    required this.currentLocale,
  });

  Map<String, dynamic> toJson() => {
    'isInitialized': isInitialized,
    'isAuthenticated': isAuthenticated,
    'isOnline': isOnline,
    'cartItemsCount': cartItemsCount,
    'currentLocale': currentLocale,
  };

  factory ServiceStatus.fromJson(Map<String, dynamic> json) => ServiceStatus(
    isInitialized: json['isInitialized'] ?? false,
    isAuthenticated: json['isAuthenticated'] ?? false,
    isOnline: json['isOnline'] ?? false,
    cartItemsCount: json['cartItemsCount'] ?? 0,
    currentLocale: json['currentLocale'] ?? 'en',
  );
}
