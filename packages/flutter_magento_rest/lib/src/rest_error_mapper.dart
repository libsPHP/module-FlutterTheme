import 'package:dio/dio.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Maps Dio errors to typed [MagentoException] instances.
///
/// Parses Magento REST API error responses and maps HTTP status codes
/// to appropriate exception types.
class RestErrorMapper {
  /// Maps a [DioException] to a [MagentoException].
  static MagentoException map(DioException error) {
    // Handle connection/timeout errors
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return MagentoNetworkException(
        'Connection timeout',
        cause: error,
        isTimeout: true,
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return MagentoNetworkException(
        'Connection error',
        cause: error,
        isOffline: true,
      );
    }

    // Handle HTTP errors
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    final message = _extractMessage(data);

    return switch (statusCode) {
      401 => MagentoAuthException(
          message ?? 'Unauthorized',
          cause: error,
          isTokenExpired: _isTokenExpired(data),
          isInvalidCredentials: _isInvalidCredentials(data),
        ),
      403 => MagentoAuthException(
          message ?? 'Forbidden',
          cause: error,
        ),
      404 => MagentoNotFoundException(
          message ?? 'Not found',
          cause: error,
        ),
      400 => MagentoValidationException(
          message ?? 'Bad request',
          cause: error,
          fieldErrors: _extractFieldErrors(data),
        ),
      422 => MagentoValidationException(
          message ?? 'Validation failed',
          cause: error,
          fieldErrors: _extractFieldErrors(data),
        ),
      429 => MagentoRateLimitException(
          message ?? 'Rate limit exceeded',
          cause: error,
          retryAfterSeconds: _extractRetryAfter(error.response?.headers),
        ),
      final code? when code >= 500 && code < 600 => MagentoServerException(
          message ?? 'Server error',
          cause: error,
          statusCode: code,
        ),
      _ => MagentoNetworkException(
          message ?? 'Unknown error',
          cause: error,
        ),
    };
  }

  /// Extracts error message from Magento REST response.
  ///
  /// Magento REST errors typically have format:
  /// ```json
  /// {"message": "Error message", "parameters": [...]}
  /// ```
  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String) {
        // Replace parameter placeholders like %1, %fieldName
        final params = data['parameters'];
        if (params is List && params.isNotEmpty) {
          var result = message;
          for (var i = 0; i < params.length; i++) {
            result = result.replaceAll('%${i + 1}', params[i].toString());
          }
          return result;
        }
        if (params is Map) {
          var result = message;
          params.forEach((key, value) {
            result = result.replaceAll('%$key', value.toString());
          });
          return result;
        }
        return message;
      }
    }
    if (data is String) {
      return data;
    }
    return null;
  }

  /// Extracts field-level errors from validation response.
  static Map<String, List<String>> _extractFieldErrors(dynamic data) {
    final errors = <String, List<String>>{};

    if (data is Map<String, dynamic>) {
      // Check for Magento's validation error format
      final parameters = data['parameters'];
      if (parameters is Map<String, dynamic>) {
        parameters.forEach((key, value) {
          if (value is String) {
            errors[key] = [value];
          } else if (value is List) {
            errors[key] = value.map((e) => e.toString()).toList();
          }
        });
      }

      // Check for errors array format
      final errorsData = data['errors'];
      if (errorsData is List) {
        for (final error in errorsData) {
          if (error is Map<String, dynamic>) {
            final field = error['field'] as String?;
            final message = error['message'] as String?;
            if (field != null && message != null) {
              errors.putIfAbsent(field, () => []).add(message);
            }
          }
        }
      }
    }

    return errors;
  }

  /// Checks if error indicates token expiration.
  static bool _isTokenExpired(dynamic data) {
    final message = _extractMessage(data)?.toLowerCase() ?? '';
    return message.contains('expired') || message.contains('invalid token');
  }

  /// Checks if error indicates invalid credentials.
  static bool _isInvalidCredentials(dynamic data) {
    final message = _extractMessage(data)?.toLowerCase() ?? '';
    return message.contains('invalid') &&
        (message.contains('password') ||
            message.contains('email') ||
            message.contains('credentials'));
  }

  /// Extracts retry-after seconds from rate limit response.
  static int? _extractRetryAfter(Headers? headers) {
    final retryAfter = headers?.value('retry-after');
    if (retryAfter != null) {
      return int.tryParse(retryAfter);
    }
    return null;
  }
}
