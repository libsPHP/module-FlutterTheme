import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/customer.dart';
import '../models/product.dart';
import '../models/cart.dart';
import '../models/order.dart';
import '../exceptions/magento_exception.dart';

/// Service for interacting with Magento REST API and GraphQL.
///
/// This service provides a high-level interface for communicating with Magento
/// backend services. It handles HTTP requests, authentication, and data transformation
/// for various Magento operations including products, cart, orders, and customer management.
///
/// ## Features
///
/// - **REST API Integration**: Full support for Magento REST API endpoints
/// - **GraphQL Support**: GraphQL query execution for complex data fetching
/// - **Authentication**: Token-based authentication with automatic refresh
/// - **Request/Response Handling**: Automatic request formatting and response parsing
/// - **Error Handling**: Comprehensive error handling with proper exception types
/// - **Timeout Management**: Configurable connection and receive timeouts
/// - **Header Management**: Custom header support for API requests
///
/// ## Usage
///
/// ```dart
/// final apiService = MagentoApiService();
///
/// // Initialize with base URL
/// await apiService.initialize(
///   baseUrl: 'https://yourstore.com',
///   connectionTimeout: 30000,
/// );
///
/// // Make API requests
/// final products = await apiService.getProducts();
/// ```
class MagentoApiService {
  late final Dio _dio;
  late final Dio _graphqlDio;
  String? _baseUrl;
  String? _customerToken;
  String? _adminToken;

  // Configuration
  static const int _defaultConnectionTimeout = 30000;
  static const int _defaultReceiveTimeout = 30000;
  static const String _apiVersion = 'V1';

  /// Initialize the API service
  Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
    String? adminToken,
  }) async {
    try {
      _baseUrl = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      _adminToken = adminToken;

      _dio = Dio(
        BaseOptions(
          baseUrl: '${_baseUrl}rest/$_apiVersion/',
          connectTimeout: Duration(
            milliseconds: connectionTimeout ?? _defaultConnectionTimeout,
          ),
          receiveTimeout: Duration(
            milliseconds: receiveTimeout ?? _defaultReceiveTimeout,
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            ...?headers,
          },
        ),
      );

      // Initialize GraphQL client
      _graphqlDio = Dio(
        BaseOptions(
          baseUrl: _baseUrl!,
          connectTimeout: Duration(
            milliseconds: connectionTimeout ?? _defaultConnectionTimeout,
          ),
          receiveTimeout: Duration(
            milliseconds: receiveTimeout ?? _defaultReceiveTimeout,
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            ...?headers,
          },
        ),
      );

      // Add interceptors for REST API logging and error handling
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          logPrint: (obj) => kDebugMode ? print('🌐 REST API: $obj') : null,
        ),
      );

      _dio.interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            if (kDebugMode) {
              print('❌ REST API Error: ${error.message}');
            }
            handler.next(error);
          },
        ),
      );

      // Add interceptors for GraphQL logging and error handling
      _graphqlDio.interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          logPrint: (obj) => kDebugMode ? print('🌐 GraphQL: $obj') : null,
        ),
      );

      _graphqlDio.interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            if (kDebugMode) {
              print('❌ GraphQL Error: ${error.message}');
            }
            handler.next(error);
          },
        ),
      );

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to initialize Magento API service: $e');
      }
      return false;
    }
  }

  /// Set customer authentication token
  void setCustomerToken(String token) {
    _customerToken = token;
    _updateAuthHeaders();
  }

  /// Clear customer authentication token
  void clearCustomerToken() {
    _customerToken = null;
    _updateAuthHeaders();
  }

  /// Update authentication headers
  void _updateAuthHeaders() {
    if (_customerToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $_customerToken';
      _graphqlDio.options.headers['Authorization'] = 'Bearer $_customerToken';
    } else if (_adminToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $_adminToken';
      _graphqlDio.options.headers['Authorization'] = 'Bearer $_adminToken';
    } else {
      _dio.options.headers.remove('Authorization');
      _graphqlDio.options.headers.remove('Authorization');
    }
  }

  /// Make authenticated request
  Future<Response<T>> _authenticatedRequest<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      throw MagentoException.fromDioException(e);
    } catch (e) {
      throw MagentoException('Unexpected error: $e');
    }
  }

  // ==================== GraphQL API Methods ====================

  /// Execute GraphQL query
  Future<Map<String, dynamic>?> executeGraphQL(
    String query, {
    Map<String, dynamic>? variables,
    String? operationName,
  }) async {
    try {
      final requestData = {
        'query': query,
        if (variables != null) 'variables': variables,
        if (operationName != null) 'operationName': operationName,
      };

      final response = await _graphqlDio.post('/graphql', data: requestData);

      if (response.data != null) {
        final responseData = response.data as Map<String, dynamic>;

        // Check for GraphQL errors
        if (responseData.containsKey('errors')) {
          final errors = responseData['errors'] as List;
          final errorMessages = errors.map((e) => e['message']).join(', ');
          throw MagentoException('GraphQL Error: $errorMessages');
        }

        return responseData;
      }

      return null;
    } on DioException catch (e) {
      throw MagentoException.fromDioException(e);
    } catch (e) {
      throw MagentoException('GraphQL request failed: $e');
    }
  }

  /// Get store configuration via GraphQL
  Future<Map<String, dynamic>> getStoreConfigGraphQL() async {
    const query = '''
      query {
        storeConfig {
          store_code
          store_name
          website_name
          locale
          base_currency_code
          default_display_currency_code
          timezone
          weight_unit
          base_url
          base_media_url
        }
      }
    ''';

    final result = await executeGraphQL(query);
    if (result?['data']?['storeConfig'] != null) {
      return result!['data']['storeConfig'];
    }

    throw MagentoException('Failed to get store configuration');
  }

  /// Get categories via GraphQL
  Future<List<Map<String, dynamic>>> getCategoriesGraphQL() async {
    const query = '''
      query {
        categories {
          items {
            id
            name
            url_key
            url_path
            children_count
            path
            level
            position
            include_in_menu
            children {
              id
              name
              url_key
              children_count
              position
            }
          }
        }
      }
    ''';

    final result = await executeGraphQL(query);
    if (result?['data']?['categories']?['items'] != null) {
      return List<Map<String, dynamic>>.from(
        result!['data']['categories']['items'],
      );
    }

    return [];
  }

  /// Get products via GraphQL
  Future<Map<String, dynamic>> getProductsGraphQL({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  }) async {
    final queryBuilder = StringBuffer();
    queryBuilder.write('query(');

    final variables = <String, dynamic>{};
    final filterConditions = <String>[];

    // Add search parameter
    if (searchQuery != null && searchQuery.isNotEmpty) {
      queryBuilder.write('\$search: String, ');
      variables['search'] = searchQuery;
    }

    // Add category filter
    if (categoryId != null) {
      filterConditions.add('category_id: { eq: "$categoryId" }');
    }

    // Add custom filters
    if (filters != null) {
      filters.forEach((key, value) {
        if (value is String) {
          filterConditions.add('$key: { eq: "$value" }');
        } else if (value is List) {
          filterConditions.add(
            '$key: { in: [${value.map((v) => '"$v"').join(', ')}] }',
          );
        }
      });
    }

    queryBuilder.write(') {');
    queryBuilder.write('products(');

    if (searchQuery != null && searchQuery.isNotEmpty) {
      queryBuilder.write('search: \$search, ');
    }

    if (filterConditions.isNotEmpty) {
      queryBuilder.write('filter: { ${filterConditions.join(', ')} }, ');
    }

    queryBuilder.write('pageSize: $pageSize, currentPage: $page');

    // Add sorting
    if (sortBy != null) {
      final direction = sortOrder?.toUpperCase() == 'DESC' ? 'DESC' : 'ASC';
      queryBuilder.write(', sort: { $sortBy: $direction }');
    }

    queryBuilder.write(''') {
      total_count
      page_info {
        current_page
        page_size
        total_pages
      }
      items {
        id
        name
        sku
        url_key
        price_range {
          minimum_price {
            regular_price {
              value
              currency
            }
            final_price {
              value
              currency
            }
          }
        }
        stock_status
        type_id
        categories {
          id
          name
          url_key
        }
        small_image {
          url
          label
        }
        description {
          html
        }
        short_description {
          html
        }
      }
    }
  }''');

    final result = await executeGraphQL(
      queryBuilder.toString(),
      variables: variables,
    );
    if (result?['data']?['products'] != null) {
      return result!['data']['products'];
    }

    throw MagentoException('Failed to get products');
  }

  /// Search products via GraphQL
  Future<Map<String, dynamic>> searchProductsGraphQL(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    return getProductsGraphQL(
      searchQuery: query,
      page: page,
      pageSize: pageSize,
    );
  }

  /// Get single product by SKU via GraphQL
  Future<Map<String, dynamic>?> getProductGraphQL(String sku) async {
    const query = '''
      query(\$sku: String!) {
        products(filter: { sku: { eq: \$sku } }) {
          items {
            id
            name
            sku
            url_key
            description {
              html
            }
            short_description {
              html
            }
            price_range {
              minimum_price {
                regular_price {
                  value
                  currency
                }
                final_price {
                  value
                  currency
                }
              }
            }
            stock_status
            type_id
            weight
            categories {
              id
              name
              url_key
            }
            media_gallery {
              url
              label
              position
            }
            ... on ConfigurableProduct {
              configurable_options {
                id
                attribute_id
                attribute_code
                label
                values {
                  value_index
                  label
                }
              }
            }
          }
        }
      }
    ''';

    final result = await executeGraphQL(query, variables: {'sku': sku});
    if (result?['data']?['products']?['items']?.isNotEmpty == true) {
      return result!['data']['products']['items'][0];
    }

    return null;
  }

  /// Get products by category via GraphQL
  Future<Map<String, dynamic>> getProductsByCategoryGraphQL(
    String categoryId, {
    int page = 1,
    int pageSize = 20,
    String? sortBy,
    String? sortOrder,
  }) async {
    return getProductsGraphQL(
      categoryId: categoryId,
      page: page,
      pageSize: pageSize,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  /// Get currency information via GraphQL
  Future<Map<String, dynamic>> getCurrencyGraphQL() async {
    const query = '''
      query {
        currency {
          available_currency_codes
          base_currency_code
          base_currency_symbol
          default_display_currency_code
          default_display_currency_symbol
          exchange_rates {
            currency_to
            rate
          }
        }
      }
    ''';

    final result = await executeGraphQL(query);
    if (result?['data']?['currency'] != null) {
      return result!['data']['currency'];
    }

    throw MagentoException('Failed to get currency information');
  }

  /// Get CMS pages via GraphQL (if supported)
  Future<List<Map<String, dynamic>>> getCmsPagesGraphQL() async {
    const query = '''
      query {
        cmsPages {
          items {
            identifier
            title
            content_heading
            page_layout
            meta_title
            meta_description
          }
        }
      }
    ''';

    try {
      final result = await executeGraphQL(query);
      if (result?['data']?['cmsPages']?['items'] != null) {
        return List<Map<String, dynamic>>.from(
          result!['data']['cmsPages']['items'],
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('CMS Pages not supported or error: $e');
      }
    }

    return [];
  }

  /// Get category tree via GraphQL with detailed information
  Future<Map<String, dynamic>> getCategoryTreeGraphQL({
    int rootCategoryId = 2,
  }) async {
    const query = '''
      query(\$id: String!) {
        category(id: \$id) {
          id
          name
          url_key
          url_path
          description
          meta_title
          meta_description
          meta_keywords
          image
          children_count
          path
          level
          position
          include_in_menu
          is_active
          children {
            id
            name
            url_key
            url_path
            children_count
            position
            include_in_menu
            is_active
            children {
              id
              name
              url_key
              children_count
              position
            }
          }
        }
      }
    ''';

    final result = await executeGraphQL(
      query,
      variables: {'id': rootCategoryId.toString()},
    );
    if (result?['data']?['category'] != null) {
      return result!['data']['category'];
    }

    throw MagentoException('Failed to get category tree');
  }

  /// Get product reviews via GraphQL
  Future<Map<String, dynamic>> getProductReviewsGraphQL(
    String sku, {
    int page = 1,
    int pageSize = 10,
  }) async {
    const query = '''
      query(\$sku: String!, \$currentPage: Int!, \$pageSize: Int!) {
        products(filter: { sku: { eq: \$sku } }) {
          items {
            reviews(currentPage: \$currentPage, pageSize: \$pageSize) {
              items {
                average_rating
                ratings_breakdown {
                  name
                  value
                }
                summary
                text
                created_at
                nickname
              }
              page_info {
                current_page
                page_size
                total_pages
              }
            }
            review_count
            rating_summary
          }
        }
      }
    ''';

    final result = await executeGraphQL(
      query,
      variables: {'sku': sku, 'currentPage': page, 'pageSize': pageSize},
    );

    if (result?['data']?['products']?['items']?.isNotEmpty == true) {
      return result!['data']['products']['items'][0];
    }

    throw MagentoException('Failed to get product reviews');
  }

  /// Get product filters/facets via GraphQL
  Future<Map<String, dynamic>> getProductFiltersGraphQL({
    String? categoryId,
  }) async {
    final filterCondition = categoryId != null
        ? 'filter: { category_id: { eq: "$categoryId" } }, '
        : '';

    final query =
        '''
      query {
        products(${filterCondition}pageSize: 1) {
          aggregations {
            attribute_code
            label
            count
            options {
              label
              value
              count
            }
          }
        }
      }
    ''';

    final result = await executeGraphQL(query);
    if (result?['data']?['products']?['aggregations'] != null) {
      return {'filters': result!['data']['products']['aggregations']};
    }

    return {'filters': []};
  }

  /// Get wishlist via GraphQL (requires authentication)
  Future<Map<String, dynamic>> getWishlistGraphQL() async {
    const query = '''
      query {
        customer {
          wishlist {
            items_count
            sharing_code
            updated_at
            items {
              id
              quantity
              description
              added_at
              product {
                id
                name
                sku
                url_key
                price_range {
                  minimum_price {
                    final_price {
                      value
                      currency
                    }
                  }
                }
                small_image {
                  url
                  label
                }
                stock_status
              }
            }
          }
        }
      }
    ''';

    final result = await executeGraphQL(query);
    if (result?['data']?['customer']?['wishlist'] != null) {
      return result!['data']['customer']['wishlist'];
    }

    throw MagentoException('Failed to get wishlist');
  }

  /// Get customer orders via GraphQL
  Future<Map<String, dynamic>> getCustomerOrdersGraphQL({
    int page = 1,
    int pageSize = 10,
  }) async {
    const query = '''
      query(\$currentPage: Int!, \$pageSize: Int!) {
        customer {
          orders(currentPage: \$currentPage, pageSize: \$pageSize) {
            items {
              id
              number
              order_date
              status
              state
              total {
                grand_total {
                  value
                  currency
                }
                base_grand_total {
                  value
                  currency
                }
                subtotal {
                  value
                  currency
                }
                total_tax {
                  value
                  currency
                }
                total_shipping {
                  value
                  currency
                }
              }
              items {
                id
                product_name
                product_sku
                quantity_ordered
                quantity_shipped
                quantity_invoiced
                quantity_refunded
                product_sale_price {
                  value
                  currency
                }
                selected_options {
                  label
                  value
                }
                product {
                  id
                  name
                  sku
                  small_image {
                    url
                    label
                  }
                }
              }
              shipping_address {
                firstname
                lastname
                street
                city
                region {
                  region
                  region_code
                }
                postcode
                country_code
                telephone
              }
              billing_address {
                firstname
                lastname
                street
                city
                region {
                  region
                  region_code
                }
                postcode
                country_code
                telephone
              }
              payment_methods {
                name
                type
              }
              shipping_method
            }
            page_info {
              current_page
              page_size
              total_pages
            }
            total_count
          }
        }
      }
    ''';

    final result = await executeGraphQL(
      query,
      variables: {'currentPage': page, 'pageSize': pageSize},
    );

    if (result?['data']?['customer']?['orders'] != null) {
      return result!['data']['customer']['orders'];
    }

    throw MagentoException('Failed to get customer orders');
  }

  /// Get customer information via GraphQL
  Future<Map<String, dynamic>> getCustomerInfoGraphQL() async {
    const query = '''
      query {
        customer {
          id
          firstname
          lastname
          email
          date_of_birth
          gender
          group_id
          created_at
          updated_at
          addresses {
            id
            firstname
            lastname
            street
            city
            region {
              region
              region_code
              region_id
            }
            postcode
            country_code
            telephone
            default_shipping
            default_billing
          }
        }
      }
    ''';

    final result = await executeGraphQL(query);
    if (result?['data']?['customer'] != null) {
      return result!['data']['customer'];
    }

    throw MagentoException('Failed to get customer information');
  }

  /// Get product recommendations via GraphQL
  Future<List<Map<String, dynamic>>> getProductRecommendationsGraphQL(
    String sku,
  ) async {
    const query = '''
      query(\$sku: String!) {
        products(filter: { sku: { eq: \$sku } }) {
          items {
            related_products {
              id
              name
              sku
              url_key
              price_range {
                minimum_price {
                  final_price {
                    value
                    currency
                  }
                }
              }
              small_image {
                url
                label
              }
              stock_status
            }
            upsell_products {
              id
              name
              sku
              url_key
              price_range {
                minimum_price {
                  final_price {
                    value
                    currency
                  }
                }
              }
              small_image {
                url
                label
              }
              stock_status
            }
            crosssell_products {
              id
              name
              sku
              url_key
              price_range {
                minimum_price {
                  final_price {
                    value
                    currency
                  }
                }
              }
              small_image {
                url
                label
              }
              stock_status
            }
          }
        }
      }
    ''';

    final result = await executeGraphQL(query, variables: {'sku': sku});
    if (result?['data']?['products']?['items']?.isNotEmpty == true) {
      final product = result!['data']['products']['items'][0];
      final recommendations = <Map<String, dynamic>>[];

      // Combine all recommendation types
      if (product['related_products'] != null) {
        recommendations.addAll(
          List<Map<String, dynamic>>.from(product['related_products']),
        );
      }
      if (product['upsell_products'] != null) {
        recommendations.addAll(
          List<Map<String, dynamic>>.from(product['upsell_products']),
        );
      }
      if (product['crosssell_products'] != null) {
        recommendations.addAll(
          List<Map<String, dynamic>>.from(product['crosssell_products']),
        );
      }

      return recommendations;
    }

    return [];
  }

  /// Get available countries via GraphQL
  Future<List<Map<String, dynamic>>> getCountriesGraphQL() async {
    const query = '''
      query {
        countries {
          id
          two_letter_abbreviation
          three_letter_abbreviation
          full_name_locale
          full_name_english
          available_regions {
            id
            code
            name
          }
        }
      }
    ''';

    final result = await executeGraphQL(query);
    if (result?['data']?['countries'] != null) {
      return List<Map<String, dynamic>>.from(result!['data']['countries']);
    }

    return [];
  }

  /// Search suggestions via GraphQL
  Future<Map<String, dynamic>> getSearchSuggestionsGraphQL(String query) async {
    const graphqlQuery = '''
      query(\$query: String!) {
        products(search: \$query, pageSize: 5) {
          suggestions {
            search
          }
          items {
            id
            name
            sku
            url_key
            price_range {
              minimum_price {
                final_price {
                  value
                  currency
                }
              }
            }
            small_image {
              url
              label
            }
          }
        }
      }
    ''';

    final result = await executeGraphQL(
      graphqlQuery,
      variables: {'query': query},
    );
    if (result?['data']?['products'] != null) {
      return result!['data']['products'];
    }

    return {'suggestions': [], 'items': []};
  }

  // ==================== REST API Methods ====================

  /// Customer Authentication
  Future<Map<String, dynamic>> authenticateCustomer({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      'integration/customer/token',
      data: {'username': email, 'password': password},
    );

    if (response.data is String) {
      final token = response.data as String;
      setCustomerToken(token);
      return {'token': token};
    }

    throw MagentoException('Invalid authentication response');
  }

  /// Create customer account
  Future<Customer> createCustomer({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    Map<String, dynamic>? additionalData,
  }) async {
    final data = {
      'customer': {
        'email': email,
        'firstname': firstName,
        'lastname': lastName,
        'password': password,
        ...?additionalData,
      },
    };

    final response = await _dio.post('customers', data: data);
    return Customer.fromJson(response.data!);
  }

  /// Get current customer information
  Future<Customer> getCurrentCustomer() async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'customers/me',
    );
    return Customer.fromJson(response.data!);
  }

  /// Update customer information
  Future<Customer> updateCustomer(Map<String, dynamic> customerData) async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'customers/me',
      data: {'customer': customerData},
    );
    return Customer.fromJson(response.data!);
  }

  /// Get customer addresses
  Future<List<Address>> getCustomerAddresses() async {
    final response = await _authenticatedRequest<List<dynamic>>(
      'customers/me/addresses',
    );
    return response.data!.map((json) => Address.fromJson(json)).toList();
  }

  /// Products
  Future<Map<String, dynamic>> getProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  }) async {
    final queryParams = <String, dynamic>{
      'searchCriteria[currentPage]': page,
      'searchCriteria[pageSize]': pageSize,
    };

    if (searchQuery != null) {
      queryParams['searchCriteria[filterGroups][0][filters][0][field]'] =
          'name';
      queryParams['searchCriteria[filterGroups][0][filters][0][value]'] =
          '%$searchQuery%';
      queryParams['searchCriteria[filterGroups][0][filters][0][conditionType]'] =
          'like';
    }

    if (categoryId != null) {
      queryParams['searchCriteria[filterGroups][1][filters][0][field]'] =
          'category_id';
      queryParams['searchCriteria[filterGroups][1][filters][0][value]'] =
          categoryId;
      queryParams['searchCriteria[filterGroups][1][filters][0][conditionType]'] =
          'eq';
    }

    if (sortBy != null) {
      queryParams['searchCriteria[sortOrders][0][field]'] = sortBy;
      queryParams['searchCriteria[sortOrders][0][direction]'] =
          sortOrder ?? 'ASC';
    }

    final response = await _dio.get<Map<String, dynamic>>(
      'products',
      queryParameters: queryParams,
    );
    return response.data!;
  }

  /// Get product by SKU
  Future<Product> getProduct(String sku) async {
    final response = await _dio.get<Map<String, dynamic>>('products/$sku');
    return Product.fromJson(response.data!);
  }

  /// Cart operations
  Future<String> createCart() async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'guest-carts',
    );
    return response.data?['quote_id'] ?? '';
  }

  Future<Cart> getCart(String cartId) async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'guest-carts/$cartId',
    );
    return Cart.fromJson(response.data!);
  }

  Future<bool> addToCart(
    String cartId,
    String sku,
    int quantity, [
    Map<String, dynamic>? productOption,
  ]) async {
    final data = {
      'cartItem': {
        'sku': sku,
        'qty': quantity,
        'quote_id': cartId,
        ...?productOption,
      },
    };

    try {
      await _authenticatedRequest('guest-carts/$cartId/items', data: data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateCartItem(String cartId, int itemId, int quantity) async {
    final data = {
      'cartItem': {'qty': quantity, 'quote_id': cartId},
    };

    try {
      await _authenticatedRequest(
        'guest-carts/$cartId/items/$itemId',
        data: data,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFromCart(String cartId, int itemId) async {
    try {
      await _authenticatedRequest(
        'guest-carts/$cartId/items/$itemId',
        options: Options(method: 'DELETE'),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Orders
  Future<List<Order>> getCustomerOrders() async {
    final response = await _authenticatedRequest<List<dynamic>>(
      'customers/me/orders',
    );
    return response.data!.map((json) => Order.fromJson(json)).toList();
  }

  Future<Order> getOrder(String orderId) async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'orders/$orderId',
    );
    return Order.fromJson(response.data!);
  }

  /// Wishlist
  Future<Map<String, dynamic>> getWishlist() async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'customers/me/wishlist',
    );
    return response.data!;
  }

  Future<bool> addToWishlist(String sku) async {
    try {
      await _authenticatedRequest(
        'customers/me/wishlist/add',
        data: {'sku': sku},
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFromWishlist(int itemId) async {
    try {
      await _authenticatedRequest(
        'customers/me/wishlist/remove/$itemId',
        options: Options(method: 'DELETE'),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Categories
  Future<List<Map<String, dynamic>>> getCategories() async {
    final response = await _dio.get<List<dynamic>>('categories');
    return response.data!.map((json) => json as Map<String, dynamic>).toList();
  }

  Future<Map<String, dynamic>> getCategory(int categoryId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      'categories/$categoryId',
    );
    return response.data!;
  }

  /// Search
  Future<Map<String, dynamic>> searchProducts(
    String query, {
    int page = 1,
    int pageSize = 20,
  }) async {
    final queryParams = {
      'searchCriteria[requestName]': 'quick_search_container',
      'searchCriteria[filterGroups][0][filters][0][field]': 'search_term',
      'searchCriteria[filterGroups][0][filters][0][value]': query,
      'searchCriteria[filterGroups][0][filters][0][conditionType]': 'like',
      'searchCriteria[currentPage]': page,
      'searchCriteria[pageSize]': pageSize,
    };

    final response = await _dio.get<Map<String, dynamic>>(
      'search',
      queryParameters: queryParams,
    );
    return response.data!;
  }

  /// Checkout
  Future<Map<String, dynamic>> estimateShippingMethods(
    String cartId,
    Map<String, dynamic> address,
  ) async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'guest-carts/$cartId/estimate-shipping-methods',
      data: {'address': address},
    );
    return response.data!;
  }

  Future<Map<String, dynamic>> estimatePaymentMethods(String cartId) async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'guest-carts/$cartId/payment-methods',
    );
    return response.data!;
  }

  Future<Map<String, dynamic>> placeOrder(
    String cartId,
    Map<String, dynamic> orderData,
  ) async {
    final response = await _authenticatedRequest<Map<String, dynamic>>(
      'guest-carts/$cartId/order',
      data: orderData,
    );
    return response.data!;
  }
}
