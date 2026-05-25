import 'money.dart';

/// Filter criteria for product searches.
class ProductFilter {
  /// Category IDs to filter by.
  final List<String>? categoryIds;

  /// Attribute filters.
  final Map<String, List<String>>? attributes;

  /// Minimum price.
  final Money? priceMin;

  /// Maximum price.
  final Money? priceMax;

  /// Only in-stock products.
  final bool? inStock;

  /// Only products on sale.
  final bool? onSale;

  /// Only new products.
  final bool? isNew;

  const ProductFilter({
    this.categoryIds,
    this.attributes,
    this.priceMin,
    this.priceMax,
    this.inStock,
    this.onSale,
    this.isNew,
  });

  /// Creates an empty filter.
  const ProductFilter.empty()
      : categoryIds = null,
        attributes = null,
        priceMin = null,
        priceMax = null,
        inStock = null,
        onSale = null,
        isNew = null;

  /// Creates a copy with updated fields.
  ProductFilter copyWith({
    List<String>? categoryIds,
    Map<String, List<String>>? attributes,
    Money? priceMin,
    Money? priceMax,
    bool? inStock,
    bool? onSale,
    bool? isNew,
  }) {
    return ProductFilter(
      categoryIds: categoryIds ?? this.categoryIds,
      attributes: attributes ?? this.attributes,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      inStock: inStock ?? this.inStock,
      onSale: onSale ?? this.onSale,
      isNew: isNew ?? this.isNew,
    );
  }

  /// Whether any filters are applied.
  bool get isEmpty =>
      categoryIds == null &&
      (attributes == null || attributes!.isEmpty) &&
      priceMin == null &&
      priceMax == null &&
      inStock == null &&
      onSale == null &&
      isNew == null;
}
