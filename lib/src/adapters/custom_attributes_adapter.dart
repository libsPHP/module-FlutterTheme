import '../models/product_models.dart';
import 'validation_result.dart';

/// Universal adapter for working with custom product attributes
/// Allows each application to define its own attribute schema
abstract class CustomAttributesAdapter<T> {
  /// Convert list of CustomAttribute to typed model
  T fromCustomAttributes(List<CustomAttribute> attributes);

  /// Convert typed model back to list of CustomAttribute
  List<CustomAttribute> toCustomAttributes(T model);

  /// Returns list of attribute codes that this adapter handles
  List<String> get supportedAttributeCodes;

  /// Validate attributes
  ValidationResult validate(T model);

  /// Get attribute value by code with type casting
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code);

  /// Create search filters for custom attributes
  Map<String, dynamic> buildSearchFilters(T model);

  /// Get adapter identifier
  String get adapterId;

  /// Get adapter version for compatibility checking
  String get version => '1.0.0';

  /// Check if this adapter can handle the given attributes
  bool canHandle(List<CustomAttribute> attributes) {
    final attributeCodes = attributes.map((attr) => attr.attributeCode).toSet();
    final supportedCodes = supportedAttributeCodes.toSet();

    // Check if at least one supported attribute is present
    return attributeCodes.intersection(supportedCodes).isNotEmpty;
  }

  /// Get attribute metadata (optional)
  Map<String, dynamic> getAttributeMetadata(String attributeCode) {
    return {};
  }

  /// Transform raw attribute value based on type
  dynamic transformAttributeValue(String attributeCode, String rawValue) {
    return rawValue;
  }

  /// Get default value for an attribute (optional)
  dynamic getDefaultValue(String attributeCode) {
    return null;
  }

  /// Check if attribute is required
  bool isRequired(String attributeCode) {
    return false;
  }

  /// Get attribute display name
  String getAttributeDisplayName(String attributeCode) {
    return attributeCode
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) =>
            word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
