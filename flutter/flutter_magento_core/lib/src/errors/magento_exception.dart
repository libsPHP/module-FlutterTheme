/// Base class for all Magento SDK exceptions.
///
/// Uses sealed classes for exhaustive pattern matching.
sealed class MagentoException implements Exception {
  /// Human-readable error message.
  final String message;

  /// Original error that caused this exception (if any).
  final Object? cause;

  /// Stack trace at the point of error (if available).
  final StackTrace? stackTrace;

  const MagentoException(
    this.message, {
    this.cause,
    this.stackTrace,
  });

  @override
  String toString() => '$runtimeType: $message';
}

/// Network-related errors (timeout, no connection, etc.).
class MagentoNetworkException extends MagentoException {
  /// Whether the device appears to be offline.
  final bool isOffline;

  /// Whether this was a timeout error.
  final bool isTimeout;

  const MagentoNetworkException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.isOffline = false,
    this.isTimeout = false,
  });
}

/// Authentication errors (invalid credentials, expired token, etc.).
class MagentoAuthException extends MagentoException {
  /// Whether the token has expired.
  final bool isTokenExpired;

  /// Whether credentials were invalid.
  final bool isInvalidCredentials;

  const MagentoAuthException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.isTokenExpired = false,
    this.isInvalidCredentials = false,
  });
}

/// Validation errors with field-level details.
class MagentoValidationException extends MagentoException {
  /// Map of field names to error messages.
  final Map<String, List<String>> fieldErrors;

  const MagentoValidationException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.fieldErrors = const {},
  });

  /// Returns errors for a specific field.
  List<String> errorsFor(String field) => fieldErrors[field] ?? [];

  /// Returns true if there are errors for the given field.
  bool hasErrorsFor(String field) => fieldErrors.containsKey(field);

  /// Returns all field names that have errors.
  Iterable<String> get errorFields => fieldErrors.keys;
}

/// Cart-specific errors (item not found, out of stock, etc.).
class MagentoCartException extends MagentoException {
  /// The cart ID if available.
  final String? cartId;

  /// Whether the cart was not found.
  final bool isCartNotFound;

  /// Whether an item is out of stock.
  final bool isOutOfStock;

  const MagentoCartException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.cartId,
    this.isCartNotFound = false,
    this.isOutOfStock = false,
  });
}

/// Payment processing errors.
class MagentoPaymentException extends MagentoException {
  /// Payment method code that failed.
  final String? paymentMethod;

  /// Whether the payment was declined.
  final bool isDeclined;

  const MagentoPaymentException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.paymentMethod,
    this.isDeclined = false,
  });
}

/// Server-side errors (5xx responses).
class MagentoServerException extends MagentoException {
  /// HTTP status code if available.
  final int? statusCode;

  const MagentoServerException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.statusCode,
  });
}

/// Resource not found errors (404).
class MagentoNotFoundException extends MagentoException {
  /// The resource type that was not found.
  final String? resourceType;

  /// The resource identifier.
  final String? resourceId;

  const MagentoNotFoundException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.resourceType,
    this.resourceId,
  });
}

/// Rate limiting errors (429).
class MagentoRateLimitException extends MagentoException {
  /// Seconds until rate limit resets.
  final int? retryAfterSeconds;

  const MagentoRateLimitException(
    super.message, {
    super.cause,
    super.stackTrace,
    this.retryAfterSeconds,
  });
}

/// Unknown or unexpected errors.
class MagentoUnknownException extends MagentoException {
  const MagentoUnknownException(
    super.message, {
    super.cause,
    super.stackTrace,
  });
}
