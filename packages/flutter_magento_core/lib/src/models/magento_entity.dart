/// Base class for all Magento entities.
///
/// Provides access to custom attributes that may be defined
/// by Magento extensions or custom modules.
abstract class MagentoEntity {
  /// Custom attributes from Magento extensions.
  final Map<String, dynamic> customAttributes;

  const MagentoEntity({
    this.customAttributes = const {},
  });

  /// Gets a custom attribute value by code.
  ///
  /// Returns null if the attribute doesn't exist or
  /// if the value cannot be cast to type [T].
  ///
  /// Example:
  /// ```dart
  /// final sellerId = product.attr<String>('seller_id');
  /// final rating = product.attr<double>('seller_rating');
  /// ```
  T? attr<T>(String code) {
    final value = customAttributes[code];
    return value is T ? value : null;
  }

  /// Gets a custom attribute value with a default fallback.
  T attrOr<T>(String code, T defaultValue) {
    return attr<T>(code) ?? defaultValue;
  }

  /// Returns true if a custom attribute exists.
  bool hasAttr(String code) => customAttributes.containsKey(code);
}
