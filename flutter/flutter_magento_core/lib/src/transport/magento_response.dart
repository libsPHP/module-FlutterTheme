/// Wrapper for API responses with metadata.
class MagentoResponse<T> {
  /// The decoded response data.
  final T data;

  /// HTTP status code.
  final int statusCode;

  /// Response headers.
  final Map<String, String> headers;

  /// Whether this response came from cache.
  final bool fromCache;

  const MagentoResponse({
    required this.data,
    required this.statusCode,
    this.headers = const {},
    this.fromCache = false,
  });

  /// Creates a successful response.
  factory MagentoResponse.success(T data, {int statusCode = 200}) {
    return MagentoResponse(
      data: data,
      statusCode: statusCode,
    );
  }

  /// Creates a cached response.
  factory MagentoResponse.cached(T data) {
    return MagentoResponse(
      data: data,
      statusCode: 200,
      fromCache: true,
    );
  }

  /// Returns true if the response was successful (2xx status).
  bool get isSuccess => statusCode >= 200 && statusCode < 300;

  /// Maps the response data to a new type.
  MagentoResponse<R> map<R>(R Function(T data) mapper) {
    return MagentoResponse<R>(
      data: mapper(data),
      statusCode: statusCode,
      headers: headers,
      fromCache: fromCache,
    );
  }

  @override
  String toString() =>
      'MagentoResponse(status: $statusCode, fromCache: $fromCache)';
}
