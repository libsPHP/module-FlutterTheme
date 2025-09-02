import 'package:dio/dio.dart';

/// Custom exception for Magento API errors
class MagentoException implements Exception {
  final String message;
  final int? statusCode;
  final String? errorCode;
  final Map<String, dynamic>? details;

  const MagentoException(
    this.message, {
    this.statusCode,
    this.errorCode,
    this.details,
  });

  /// Create exception from DioException
  factory MagentoException.fromDioException(DioException e) {
    String message = 'Network error occurred';
    int? statusCode;
    String? errorCode;
    Map<String, dynamic>? details;

    if (e.response != null) {
      statusCode = e.response!.statusCode;
      
      try {
        final responseData = e.response!.data;
        if (responseData is Map<String, dynamic>) {
          if (responseData.containsKey('message')) {
            message = responseData['message'];
          }
          if (responseData.containsKey('error_code')) {
            errorCode = responseData['error_code'];
          }
          details = responseData;
        } else if (responseData is String) {
          message = responseData;
        }
      } catch (_) {
        // Ignore parsing errors
      }
    } else if (e.type == DioExceptionType.connectionTimeout) {
      message = 'Connection timeout';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      message = 'Receive timeout';
    } else if (e.type == DioExceptionType.connectionError) {
      message = 'Connection error';
    } else if (e.type == DioExceptionType.badResponse) {
      message = 'Bad response from server';
    } else if (e.type == DioExceptionType.cancel) {
      message = 'Request was cancelled';
    }

    return MagentoException(
      message,
      statusCode: statusCode,
      errorCode: errorCode,
      details: details,
    );
  }

  /// Create exception for authentication errors
  factory MagentoException.authenticationError([String? details]) {
    return MagentoException(
      'Authentication failed',
      statusCode: 401,
      errorCode: 'AUTH_ERROR',
      details: details != null ? {'details': details} : null,
    );
  }

  /// Create exception for authorization errors
  factory MagentoException.authorizationError([String? details]) {
    return MagentoException(
      'Access denied',
      statusCode: 403,
      errorCode: 'AUTHZ_ERROR',
      details: details != null ? {'details': details} : null,
    );
  }

  /// Create exception for validation errors
  factory MagentoException.validationError(Map<String, dynamic> validationErrors) {
    return MagentoException(
      'Validation failed',
      statusCode: 400,
      errorCode: 'VALIDATION_ERROR',
      details: validationErrors,
    );
  }

  /// Create exception for not found errors
  factory MagentoException.notFoundError(String resource) {
    return MagentoException(
      '$resource not found',
      statusCode: 404,
      errorCode: 'NOT_FOUND',
      details: {'resource': resource},
    );
  }

  /// Create exception for server errors
  factory MagentoException.serverError([String? details]) {
    return MagentoException(
      'Internal server error',
      statusCode: 500,
      errorCode: 'SERVER_ERROR',
      details: details != null ? {'details': details} : null,
    );
  }

  /// Create exception for rate limiting errors
  factory MagentoException.rateLimitError([String? details]) {
    return MagentoException(
      'Rate limit exceeded',
      statusCode: 429,
      errorCode: 'RATE_LIMIT',
      details: details != null ? {'details': details} : null,
    );
  }

  @override
  String toString() {
    final buffer = StringBuffer('MagentoException: $message');
    
    if (statusCode != null) {
      buffer.write(' (Status: $statusCode)');
    }
    
    if (errorCode != null) {
      buffer.write(' [Code: $errorCode]');
    }
    
    if (details != null && details!.isNotEmpty) {
      buffer.write('\nDetails: $details');
    }
    
    return buffer.toString();
  }

  /// Check if this is an authentication error
  bool get isAuthenticationError => statusCode == 401;

  /// Check if this is an authorization error
  bool get isAuthorizationError => statusCode == 403;

  /// Check if this is a validation error
  bool get isValidationError => statusCode == 400;

  /// Check if this is a not found error
  bool get isNotFoundError => statusCode == 404;

  /// Check if this is a server error
  bool get isServerError => statusCode != null && statusCode! >= 500;

  /// Check if this is a rate limit error
  bool get isRateLimitError => statusCode == 429;

  /// Check if this is a network error
  bool get isNetworkError => statusCode == null;
}
