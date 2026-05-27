/// Route types supported by flutter_magento
enum MagentoRouteType {
  /// Product detail page
  product,

  /// Category listing page
  category,

  /// CMS page
  cms,

  /// Search results page
  search,

  /// Shopping cart page
  cart,

  /// Checkout page
  checkout,

  /// Customer account pages
  customer,

  /// Home page
  home,

  /// Unknown route type
  unknown;

  /// Parse route type from string value
  static MagentoRouteType fromString(String? value) {
    if (value == null) return MagentoRouteType.unknown;

    return MagentoRouteType.values.firstWhere(
      (type) => type.name == value.toLowerCase(),
      orElse: () => MagentoRouteType.unknown,
    );
  }
}
