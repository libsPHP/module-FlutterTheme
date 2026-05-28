import 'package:flutter_magento_core/flutter_magento_core.dart';

/// A transport decorator that retries failed requests.
///
/// Wraps another [MagentoTransport] and retries GraphQL operations
/// that fail with transient errors (network issues, timeouts, server errors).
///
/// Does NOT retry:
/// - Authentication errors (401/403)
/// - Validation errors (400)
/// - Not found errors (404)
///
/// Example:
/// ```dart
/// final transport = RetryMagentoTransport(
///   inner: GraphQlMagentoTransport(...),
///   maxRetries: 3,
///   retryDelay: Duration(seconds: 1),
/// );
/// ```
class RetryMagentoTransport implements MagentoTransport {
  /// The wrapped transport.
  final MagentoTransport inner;

  /// Maximum number of retry attempts.
  final int maxRetries;

  /// Delay between retry attempts.
  final Duration retryDelay;

  /// Whether to use exponential backoff.
  final bool useExponentialBackoff;

  const RetryMagentoTransport({
    required this.inner,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
    this.useExponentialBackoff = true,
  });

  @override
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    var attempt = 0;
    MagentoException? lastException;

    while (attempt <= maxRetries) {
      try {
        return await inner.graphql(
          document,
          variables: variables,
          options: options,
          decoder: decoder,
        );
      } on MagentoException catch (e) {
        lastException = e;

        // Don't retry non-transient errors
        if (!_isRetryable(e)) {
          rethrow;
        }

        attempt++;
        if (attempt > maxRetries) {
          break;
        }

        // Wait before retrying
        final delay = useExponentialBackoff
            ? retryDelay * (1 << (attempt - 1)) // 1s, 2s, 4s, ...
            : retryDelay;
        await Future.delayed(delay);
      }
    }

    // All retries exhausted
    throw lastException ?? const MagentoNetworkException('Request failed after retries');
  }

  bool _isRetryable(MagentoException exception) {
    return switch (exception) {
      MagentoNetworkException() => true,
      MagentoServerException(statusCode: final code) =>
        code == null || code >= 500,
      MagentoRateLimitException() => true,
      _ => false,
    };
  }

  @override
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.get(path, query: query, options: options, decoder: decoder);

  @override
  Future<MagentoResponse<T>> post<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.post(path, body: body, options: options, decoder: decoder);

  @override
  Future<MagentoResponse<T>> put<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.put(path, body: body, options: options, decoder: decoder);

  @override
  Future<MagentoResponse<T>> delete<T>(
    String path, {
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) =>
      inner.delete(path, options: options, decoder: decoder);
}
