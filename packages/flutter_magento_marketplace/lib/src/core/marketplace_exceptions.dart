/// Base exception for all marketplace-related errors
abstract class MarketplaceException implements Exception {
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;

  const MarketplaceException(this.message, {this.error, this.stackTrace});

  @override
  String toString() {
    return 'MarketplaceException: $message';
  }
}

/// Exception for connection timeouts
class MarketplaceTimeoutException extends MarketplaceException {
  const MarketplaceTimeoutException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceTimeoutException: $message';
  }
}

/// Exception for connection errors
class MarketplaceConnectionException extends MarketplaceException {
  const MarketplaceConnectionException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceConnectionException: $message';
  }
}

/// Exception for cancelled requests
class MarketplaceCancelledException extends MarketplaceException {
  const MarketplaceCancelledException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceCancelledException: $message';
  }
}

/// Exception for bad requests (400)
class MarketplaceBadRequestException extends MarketplaceException {
  const MarketplaceBadRequestException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceBadRequestException: $message';
  }
}

/// Exception for unauthorized access (401)
class MarketplaceUnauthorizedException extends MarketplaceException {
  const MarketplaceUnauthorizedException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceUnauthorizedException: $message';
  }
}

/// Exception for forbidden access (403)
class MarketplaceForbiddenException extends MarketplaceException {
  const MarketplaceForbiddenException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceForbiddenException: $message';
  }
}

/// Exception for not found resources (404)
class MarketplaceNotFoundException extends MarketplaceException {
  const MarketplaceNotFoundException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceNotFoundException: $message';
  }
}

/// Exception for validation errors (422)
class MarketplaceValidationException extends MarketplaceException {
  final Map<String, List<String>>? validationErrors;

  const MarketplaceValidationException(
    super.message, {
    this.validationErrors,
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceValidationException: $message';
  }
}

/// Exception for rate limiting (429)
class MarketplaceRateLimitException extends MarketplaceException {
  final int? retryAfter;

  const MarketplaceRateLimitException(
    super.message, {
    this.retryAfter,
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceRateLimitException: $message';
  }
}

/// Exception for server errors (500+)
class MarketplaceServerException extends MarketplaceException {
  const MarketplaceServerException(
    super.message, {
    super.error,
    super.stackTrace,
  });

  @override
  String toString() {
    return 'MarketplaceServerException: $message';
  }
}

/// Exception for seller-related errors
class SellerException extends MarketplaceException {
  const SellerException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'SellerException: $message';
  }
}

/// Exception for product-related errors
class ProductException extends MarketplaceException {
  const ProductException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'ProductException: $message';
  }
}

/// Exception for review-related errors
class ReviewException extends MarketplaceException {
  const ReviewException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'ReviewException: $message';
  }
}

/// Exception for message-related errors
class MessageException extends MarketplaceException {
  const MessageException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'MessageException: $message';
  }
}

/// Exception for commission-related errors
class CommissionException extends MarketplaceException {
  const CommissionException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'CommissionException: $message';
  }
}

/// Exception for subdomain-related errors
class SubdomainException extends MarketplaceException {
  const SubdomainException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'SubdomainException: $message';
  }
}

/// Exception for authentication errors
class AuthenticationException extends MarketplaceException {
  const AuthenticationException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'AuthenticationException: $message';
  }
}

/// Exception for authorization errors
class AuthorizationException extends MarketplaceException {
  const AuthorizationException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'AuthorizationException: $message';
  }
}

/// Exception for network errors
class NetworkException extends MarketplaceException {
  const NetworkException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'NetworkException: $message';
  }
}

/// Exception for cache errors
class CacheException extends MarketplaceException {
  const CacheException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'CacheException: $message';
  }
}

/// Exception for offline mode errors
class OfflineException extends MarketplaceException {
  const OfflineException(super.message, {super.error, super.stackTrace});

  @override
  String toString() {
    return 'OfflineException: $message';
  }
}

