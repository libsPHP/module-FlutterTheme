import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Sort field for seller queries.
enum SellerSortField {
  /// Sort by name.
  name,

  /// Sort by rating.
  rating,

  /// Sort by product count.
  productCount,

  /// Sort by join date.
  joinedAt,

  /// Sort by review count.
  reviewCount,
}

/// Sort options for seller queries.
class SellerSort {
  /// Field to sort by.
  final SellerSortField field;

  /// Sort direction.
  final SortDirection direction;

  const SellerSort({
    required this.field,
    this.direction = SortDirection.asc,
  });

  /// Sort by rating descending.
  const SellerSort.byRating()
      : field = SellerSortField.rating,
        direction = SortDirection.desc;

  /// Sort by name ascending.
  const SellerSort.byName()
      : field = SellerSortField.name,
        direction = SortDirection.asc;

  /// Sort by newest first.
  const SellerSort.newest()
      : field = SellerSortField.joinedAt,
        direction = SortDirection.desc;

  /// Sort by product count descending.
  const SellerSort.byProductCount()
      : field = SellerSortField.productCount,
        direction = SortDirection.desc;
}
