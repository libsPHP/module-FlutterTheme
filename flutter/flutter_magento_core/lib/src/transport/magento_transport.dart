import 'magento_request_options.dart';
import 'magento_response.dart';

/// Abstract interface for Magento API transport.
///
/// Implementations handle the actual HTTP communication with Magento.
/// The SDK provides two main implementations:
/// - `GraphQlMagentoTransport` - For GraphQL API
/// - `RestMagentoTransport` - For REST API
///
/// The transport can be decorated for additional functionality:
/// - `LoggingMagentoTransport` - Logs requests/responses
/// - `RetryMagentoTransport` - Retries failed requests
/// - `CachedMagentoTransport` - Caches responses
abstract interface class MagentoTransport {
  /// Performs a GET request.
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  /// Performs a POST request.
  Future<MagentoResponse<T>> post<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  /// Performs a PUT request.
  Future<MagentoResponse<T>> put<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  /// Performs a DELETE request.
  Future<MagentoResponse<T>> delete<T>(
    String path, {
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  /// Performs a GraphQL query or mutation.
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });
}
