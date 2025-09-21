import '../models/product_models.dart';
import 'validation_result.dart';

/// Universal adapter for working with custom product attributes.
///
/// This abstract class provides a flexible framework for handling custom product
/// attributes in Magento. It allows each application to define its own attribute
/// schema and provides methods for conversion, validation, and filtering.
///
/// ## Features
///
/// - **Type Safety**: Generic type parameter ensures type safety for custom models
/// - **Bidirectional Conversion**: Convert between Magento attributes and typed models
/// - **Validation**: Built-in validation system for custom attributes
/// - **Search Integration**: Create search filters from custom attribute values
/// - **Extensibility**: Support for custom attribute metadata and transformations
/// - **Compatibility**: Version tracking for adapter compatibility
///
/// ## Usage
///
/// ```dart
/// class MyCustomAdapter extends CustomAttributesAdapter<MyProductModel> {
///   @override
///   MyProductModel fromCustomAttributes(List<CustomAttribute> attributes) {
///     // Convert Magento attributes to your custom model
///   }
///
///   @override
///   List<CustomAttribute> toCustomAttributes(MyProductModel model) {
///     // Convert your model back to Magento attributes
///   }
/// }
/// ```
abstract class CustomAttributesAdapter<T> {
  /// Convert list of Magento CustomAttribute to typed model.
  ///
  /// This method should parse the raw Magento attributes and create an instance
  /// of your custom model type [T].
  ///
  /// [attributes] the list of custom attributes from Magento
  /// Returns an instance of your custom model type
  T fromCustomAttributes(List<CustomAttribute> attributes);

  /// Convert typed model back to list of Magento CustomAttribute.
  ///
  /// This method should convert your custom model instance back to the
  /// format expected by Magento's API.
  ///
  /// [model] your custom model instance
  /// Returns a list of CustomAttribute objects for Magento API
  List<CustomAttribute> toCustomAttributes(T model);

  /// Returns list of attribute codes that this adapter handles.
  ///
  /// This list defines which Magento custom attribute codes this adapter
  /// is responsible for processing.
  List<String> get supportedAttributeCodes;

  /// Validate the custom model instance.
  ///
  /// Performs validation on the custom model and returns a validation result
  /// indicating whether the model is valid and any error messages.
  ///
  /// [model] the custom model instance to validate
  /// Returns a [ValidationResult] with validation status and messages
  ValidationResult validate(T model);

  /// Get attribute value by code with type casting.
  ///
  /// Safely extracts an attribute value from the list and casts it to the
  /// specified type [U].
  ///
  /// [attributes] the list of custom attributes
  /// [code] the attribute code to look for
  /// Returns the attribute value cast to type [U], or null if not found
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code);

  /// Create search filters for custom attributes.
  ///
  /// Builds a map of search criteria that can be used with Magento's
  /// product search API to filter by custom attribute values.
  ///
  /// [model] the custom model instance to create filters from
  /// Returns a map of search filter parameters
  Map<String, dynamic> buildSearchFilters(T model);

  /// Get unique identifier for this adapter.
  ///
  /// This identifier is used to register and manage the adapter in the
  /// CustomAttributesManager.
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
        .map(
          (word) =>
              word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
        )
        .join(' ');
  }
}
