import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Maps GraphQL errors to typed [MagentoException] instances.
///
/// Magento GraphQL errors include a `category` field in extensions that
/// indicates the type of error. This mapper translates those categories
/// to appropriate exception types.
class GraphQlErrorMapper {
  const GraphQlErrorMapper();

  /// Maps a list of GraphQL errors to a [MagentoException].
  ///
  /// Uses the first error's category to determine the exception type.
  /// If multiple errors exist, all messages are combined.
  MagentoException mapErrors(List<Map<String, dynamic>> errors) {
    if (errors.isEmpty) {
      return const MagentoUnknownException('Unknown GraphQL error');
    }

    final firstError = errors.first;
    final message = _combineMessages(errors);
    final category = _extractCategory(firstError);

    return _mapCategoryToException(category, message, errors);
  }

  String _combineMessages(List<Map<String, dynamic>> errors) {
    return errors.map((e) => e['message'] as String? ?? 'Unknown error').join('; ');
  }

  String? _extractCategory(Map<String, dynamic> error) {
    final extensions = error['extensions'] as Map<String, dynamic>?;
    return extensions?['category'] as String?;
  }

  MagentoException _mapCategoryToException(
    String? category,
    String message,
    List<Map<String, dynamic>> errors,
  ) {
    return switch (category) {
      'graphql-authentication' => MagentoAuthException(
          message,
          isTokenExpired: message.toLowerCase().contains('expired'),
          isInvalidCredentials: message.toLowerCase().contains('invalid'),
        ),
      'graphql-authorization' => const MagentoAuthException(
          'Not authorized to access this resource',
        ),
      'graphql-input' => MagentoValidationException(
          message,
          fieldErrors: _extractFieldErrors(errors),
        ),
      'graphql-no-such-entity' => MagentoNotFoundException(message),
      'graphql-already-exists' => MagentoValidationException(message),
      'internal' => MagentoServerException(message),
      _ => MagentoServerException(message),
    };
  }

  Map<String, List<String>> _extractFieldErrors(
    List<Map<String, dynamic>> errors,
  ) {
    final fieldErrors = <String, List<String>>{};

    for (final error in errors) {
      final extensions = error['extensions'] as Map<String, dynamic>?;
      final field = extensions?['field'] as String?;
      final message = error['message'] as String? ?? 'Invalid value';

      if (field != null) {
        fieldErrors.putIfAbsent(field, () => []).add(message);
      }
    }

    return fieldErrors;
  }
}
