import 'package:flutter_magento_core/flutter_magento_core.dart';

/// A transport decorator that logs all requests and responses.
///
/// Wraps another [MagentoTransport] and logs GraphQL operations
/// using the provided [MagentoLogger].
///
/// Example:
/// ```dart
/// final transport = LoggingMagentoTransport(
///   inner: GraphQlMagentoTransport(...),
///   logger: ConsoleMagentoLogger(),
/// );
/// ```
class LoggingMagentoTransport implements MagentoTransport {
  /// The wrapped transport.
  final MagentoTransport inner;

  /// Logger for request/response logging.
  final MagentoLogger logger;

  /// Whether to log request variables (may contain sensitive data).
  final bool logVariables;

  /// Whether to log response data.
  final bool logResponseData;

  const LoggingMagentoTransport({
    required this.inner,
    required this.logger,
    this.logVariables = false,
    this.logResponseData = false,
  });

  @override
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    final operationName = _extractOperationName(document);
    final startTime = DateTime.now();

    logger.debug(
      'GraphQL Request: $operationName'
      '${logVariables && variables != null ? ' variables: $variables' : ''}',
    );

    try {
      final response = await inner.graphql(
        document,
        variables: variables,
        options: options,
        decoder: decoder,
      );

      final duration = DateTime.now().difference(startTime);
      logger.debug(
        'GraphQL Response: $operationName '
        '[${response.statusCode}] '
        '${response.fromCache ? '(cached) ' : ''}'
        '${duration.inMilliseconds}ms'
        '${logResponseData ? ' data: ${response.data}' : ''}',
      );

      return response;
    } catch (e, stackTrace) {
      final duration = DateTime.now().difference(startTime);
      logger.error(
        'GraphQL Error: $operationName '
        '${duration.inMilliseconds}ms',
        e,
        stackTrace,
      );
      rethrow;
    }
  }

  String _extractOperationName(String document) {
    // Simple regex to extract operation name from GraphQL document
    final match = RegExp(r'(query|mutation|subscription)\s+(\w+)')
        .firstMatch(document);
    return match?.group(2) ?? 'anonymous';
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
