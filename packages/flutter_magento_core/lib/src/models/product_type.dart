/// Magento product types.
enum ProductType {
  simple,
  configurable,
  bundle,
  grouped,
  virtual,
  downloadable,
  giftCard;

  /// Creates ProductType from string value.
  static ProductType fromString(String value) {
    return ProductType.values.firstWhere(
      (type) => type.name == value.toLowerCase(),
      orElse: () => ProductType.simple,
    );
  }

  /// Returns true if this product type has variants.
  bool get hasVariants => this == ProductType.configurable;

  /// Returns true if this is a physical product.
  bool get isPhysical =>
      this == ProductType.simple ||
      this == ProductType.configurable ||
      this == ProductType.bundle ||
      this == ProductType.grouped;

  /// Returns true if this is a digital product.
  bool get isDigital =>
      this == ProductType.virtual ||
      this == ProductType.downloadable ||
      this == ProductType.giftCard;
}
