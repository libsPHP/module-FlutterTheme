import 'dart:convert';

import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:gql/language.dart' as gql;
import 'package:http/http.dart' as http;

import 'graphql_cache_config.dart';
import 'graphql_error_mapper.dart';

/// GraphQL implementation of [MagentoTransport].
///
/// This transport handles Magento GraphQL API requests, including:
/// - Automatic header injection for store context and authentication
/// - GraphQL error parsing and mapping to [MagentoException] types
/// - Optional response caching
///
/// REST methods throw [UnsupportedError] as this transport is GraphQL-only.
/// Use [RestMagentoTransport] for REST API access.
///
/// Example:
/// ```dart
/// final transport = GraphQlMagentoTransport(
///   baseUrl: 'https://magento.example.com/graphql',
///   storeContext: MagentoStoreContext.defaults(),
///   authStorage: MemoryMagentoAuthStorage(),
/// );
///
/// final response = await transport.graphql(
///   '''
///   query GetProduct(\$sku: String!) {
///     products(filter: { sku: { eq: \$sku } }) {
///       items { sku name }
///     }
///   }
///   ''',
///   variables: {'sku': 'ABC123'},
///   decoder: (json) => json['products']['items'],
/// );
/// ```
class GraphQlMagentoTransport implements MagentoTransport {
  /// The GraphQL endpoint URL.
  final String baseUrl;

  /// Store context for multi-store headers.
  final MagentoStoreContext storeContext;

  /// Storage for authentication tokens.
  final MagentoAuthStorage authStorage;

  /// Optional cache configuration.
  final GraphQlCacheConfig? cacheConfig;

  /// Request timeout duration.
  final Duration timeout;

  /// HTTP client for requests.
  final http.Client _client;

  /// Error mapper for GraphQL errors.
  final GraphQlErrorMapper _errorMapper;

  GraphQlMagentoTransport({
    required this.baseUrl,
    required this.storeContext,
    required this.authStorage,
    this.cacheConfig,
    this.timeout = const Duration(seconds: 30),
    http.Client? client,
    GraphQlErrorMapper? errorMapper,
  })  : _client = client ?? http.Client(),
        _errorMapper = errorMapper ?? const GraphQlErrorMapper();

  @override
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    // Validate the GraphQL document
    try {
      gql.parseString(document);
    } catch (e) {
      throw MagentoValidationException('Invalid GraphQL document: $e');
    }

    final headers = await _buildHeaders(options);
    final body = jsonEncode({
      'query': document,
      'variables': ?variables,
    });

    try {
      final response = await _client
          .post(
            Uri.parse(baseUrl),
            headers: headers,
            body: body,
          )
          .timeout(options?.timeout ?? timeout);

      return _parseResponse(response, decoder);
    } on http.ClientException catch (e) {
      throw MagentoNetworkException(
        'Network error: ${e.message}',
        cause: e,
      );
    } catch (e) {
      if (e is MagentoException) rethrow;
      throw MagentoNetworkException(
        'Request failed: $e',
        cause: e,
        isTimeout: e.toString().contains('TimeoutException'),
      );
    }
  }

  Future<Map<String, String>> _buildHeaders(MagentoRequestOptions? options) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Store': storeContext.storeCode,
      'Content-Currency': storeContext.currency,
      'Accept-Language': storeContext.locale,
    };

    // Add authentication header if available and not skipped
    if (options?.skipAuth != true) {
      final token = await authStorage.getCustomerToken();
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    // Merge custom headers
    if (options?.headers != null) {
      headers.addAll(options!.headers!);
    }

    return headers;
  }

  MagentoResponse<T> _parseResponse<T>(
    http.Response response,
    T Function(dynamic json) decoder,
  ) {
    final Map<String, dynamic> json;
    try {
      json = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw MagentoServerException(
        'Invalid JSON response',
        statusCode: response.statusCode,
        cause: e,
      );
    }

    // Check for GraphQL errors
    final errors = json['errors'] as List<dynamic>?;
    if (errors != null && errors.isNotEmpty) {
      final errorMaps = errors.cast<Map<String, dynamic>>();
      throw _errorMapper.mapErrors(errorMaps);
    }

    // Check HTTP status
    if (response.statusCode >= 400) {
      throw MagentoServerException(
        'HTTP ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }

    // Decode the data
    final data = json['data'];
    if (data == null) {
      throw const MagentoServerException('No data in GraphQL response');
    }

    try {
      final decoded = decoder(data);
      return MagentoResponse(
        data: decoded,
        statusCode: response.statusCode,
        headers: response.headers,
      );
    } catch (e) {
      throw MagentoServerException(
        'Failed to decode response: $e',
        statusCode: response.statusCode,
        cause: e,
      );
    }
  }

  // REST methods are not supported by this GraphQL-only transport

  @override
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) {
    throw UnsupportedError(
      'REST GET not supported by GraphQlMagentoTransport. '
      'Use graphql() method or RestMagentoTransport.',
    );
  }

  @override
  Future<MagentoResponse<T>> post<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) {
    throw UnsupportedError(
      'REST POST not supported by GraphQlMagentoTransport. '
      'Use graphql() method or RestMagentoTransport.',
    );
  }

  @override
  Future<MagentoResponse<T>> put<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) {
    throw UnsupportedError(
      'REST PUT not supported by GraphQlMagentoTransport. '
      'Use graphql() method or RestMagentoTransport.',
    );
  }

  @override
  Future<MagentoResponse<T>> delete<T>(
    String path, {
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) {
    throw UnsupportedError(
      'REST DELETE not supported by GraphQlMagentoTransport. '
      'Use graphql() method or RestMagentoTransport.',
    );
  }
}
