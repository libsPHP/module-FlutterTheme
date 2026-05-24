/// Result of custom attributes validation.
///
/// This class represents the result of validating custom attribute data,
/// including validation status, error messages, warnings, and optional metadata.
/// It provides a standardized way to communicate validation results throughout
/// the custom attributes system.
///
/// ## Features
///
/// - **Validation Status**: Boolean flag indicating whether validation passed
/// - **Error Messages**: List of validation error messages
/// - **Warnings**: List of validation warning messages
/// - **Metadata**: Optional additional validation information
/// - **Factory Constructors**: Convenient factory methods for common scenarios
/// - **JSON Serialization**: Support for JSON serialization/deserialization
/// - **Equality Support**: Proper equality comparison and hashCode implementation
///
/// ## Usage
///
/// ```dart
/// // Create successful validation result
/// final success = ValidationResult.success();
///
/// // Create failed validation result
/// final failure = ValidationResult.failure(['Invalid email format']);
///
/// // Create result with warnings
/// final withWarnings = ValidationResult.withWarnings(['Price seems high']);
///
/// // Check validation status
/// if (result.isValid) {
///   // Proceed with valid data
/// } else {
///   // Handle validation errors
///   for (final error in result.errors) {
///     print('Error: $error');
///   }
/// }
/// ```
class ValidationResult {
  final bool isValid;
  final List<String> errors;
  final List<String> warnings;
  final Map<String, dynamic>? metadata;

  const ValidationResult({
    required this.isValid,
    this.errors = const [],
    this.warnings = const [],
    this.metadata,
  });

  /// Create a successful validation result
  factory ValidationResult.success() => const ValidationResult(isValid: true);

  /// Create a failed validation result with errors
  factory ValidationResult.failure(List<String> errors) =>
      ValidationResult(isValid: false, errors: errors);

  /// Create a validation result with warnings
  factory ValidationResult.withWarnings(List<String> warnings) =>
      ValidationResult(isValid: true, warnings: warnings);

  /// Check if validation has any issues (errors or warnings)
  bool get hasIssues => errors.isNotEmpty || warnings.isNotEmpty;

  /// Get all issues as a single list
  List<String> get allIssues => [...errors, ...warnings];

  /// Convert to JSON
  Map<String, dynamic> toJson() => {
    'isValid': isValid,
    'errors': errors,
    'warnings': warnings,
    if (metadata != null) 'metadata': metadata,
  };

  /// Create from JSON
  factory ValidationResult.fromJson(Map<String, dynamic> json) {
    return ValidationResult(
      isValid: json['isValid'] as bool,
      errors: List<String>.from(json['errors'] ?? []),
      warnings: List<String>.from(json['warnings'] ?? []),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValidationResult &&
          runtimeType == other.runtimeType &&
          isValid == other.isValid &&
          _listEquals(errors, other.errors) &&
          _listEquals(warnings, other.warnings);

  @override
  int get hashCode =>
      isValid.hashCode ^
      errors.hashCode ^
      warnings.hashCode ^
      metadata.hashCode;

  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int index = 0; index < a.length; index += 1) {
      if (a[index] != b[index]) return false;
    }
    return true;
  }

  @override
  String toString() =>
      'ValidationResult(isValid: $isValid, errors: $errors, warnings: $warnings)';
}
