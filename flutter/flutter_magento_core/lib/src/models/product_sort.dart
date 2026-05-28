import 'sort_direction.dart';

/// Sorting options for product searches.
class ProductSort {
  /// Field to sort by.
  final ProductSortField field;

  /// Sort direction.
  final SortDirection direction;

  const ProductSort({
    required this.field,
    this.direction = SortDirection.asc,
  });

  /// Sort by relevance (default for searches).
  const ProductSort.relevance()
      : field = ProductSortField.relevance,
        direction = SortDirection.desc;

  /// Sort by name A-Z.
  const ProductSort.nameAsc()
      : field = ProductSortField.name,
        direction = SortDirection.asc;

  /// Sort by name Z-A.
  const ProductSort.nameDesc()
      : field = ProductSortField.name,
        direction = SortDirection.desc;

  /// Sort by price low to high.
  const ProductSort.priceLowToHigh()
      : field = ProductSortField.price,
        direction = SortDirection.asc;

  /// Sort by price high to low.
  const ProductSort.priceHighToLow()
      : field = ProductSortField.price,
        direction = SortDirection.desc;

  /// Sort by newest first.
  const ProductSort.newest()
      : field = ProductSortField.createdAt,
        direction = SortDirection.desc;

  /// Sort by best selling.
  const ProductSort.bestSelling()
      : field = ProductSortField.position,
        direction = SortDirection.asc;
}

/// Fields available for sorting.
enum ProductSortField {
  relevance,
  name,
  price,
  createdAt,
  position,
}
