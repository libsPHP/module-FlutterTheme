import '../models/product.dart';

/// Interface for product extensions.
///
/// Allows custom Magento modules to extend product data
/// without modifying the core SDK.
///
/// Example:
/// ```dart
/// class MarketplaceExtension implements MagentoProductExtension<SellerInfo> {
///   @override
///   String get code => 'marketplace';
///
///   @override
///   SellerInfo fromProduct(ProductDetails product) {
///     return SellerInfo(
///       id: product.attr<String>('seller_id'),
///       name: product.attr<String>('seller_name'),
///       rating: product.attr<double>('seller_rating'),
///     );
///   }
/// }
/// ```
abstract interface class MagentoProductExtension<T> {
  /// The extension code (unique identifier).
  String get code;

  /// Extracts extension data from a product.
  T fromProduct(ProductDetails product);
}
