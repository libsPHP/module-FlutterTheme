import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../models/seller_info.dart';

/// Extension to extract seller info from products.
///
/// Products in a marketplace have seller-related custom attributes
/// that can be extracted using this extension.
///
/// Usage:
/// ```dart
/// final extension = SellerProductExtension();
/// final sellerInfo = extension.fromProduct(product);
/// if (sellerInfo.hasSeller) {
///   print('Sold by: ${sellerInfo.sellerName}');
/// }
/// ```
class SellerProductExtension {
  /// Attribute code for seller ID.
  final String sellerIdAttr;

  /// Attribute code for seller name.
  final String sellerNameAttr;

  /// Attribute code for seller URL.
  final String sellerUrlAttr;

  /// Attribute code for seller rating.
  final String sellerRatingAttr;

  /// Attribute code for seller product count.
  final String sellerProductCountAttr;

  /// Attribute code for seller logo.
  final String sellerLogoAttr;

  const SellerProductExtension({
    this.sellerIdAttr = 'seller_id',
    this.sellerNameAttr = 'seller_name',
    this.sellerUrlAttr = 'seller_url',
    this.sellerRatingAttr = 'seller_rating',
    this.sellerProductCountAttr = 'seller_product_count',
    this.sellerLogoAttr = 'seller_logo',
  });

  /// Extracts seller info from a product.
  SellerInfo fromProduct(MagentoEntity product) {
    final sellerId = product.attr<String>(sellerIdAttr);
    final sellerName = product.attr<String>(sellerNameAttr);

    if (sellerId == null || sellerId.isEmpty) {
      return SellerInfo.none();
    }

    return SellerInfo(
      sellerId: sellerId,
      sellerName: sellerName ?? 'Unknown Seller',
      sellerUrl: product.attr<String>(sellerUrlAttr),
      rating: product.attr<double>(sellerRatingAttr),
      productCount: product.attr<int>(sellerProductCountAttr),
      logoUrl: product.attr<String>(sellerLogoAttr),
    );
  }

  /// Checks if a product has seller info.
  bool hasSellerInfo(MagentoEntity product) {
    final sellerId = product.attr<String>(sellerIdAttr);
    return sellerId != null && sellerId.isNotEmpty;
  }
}
