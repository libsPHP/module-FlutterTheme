import 'product.dart';

/// Paginated product results.
class ProductPage {
  /// Products in this page.
  final List<ProductSummary> items;

  /// Total number of products matching the query.
  final int totalCount;

  /// Current page number (1-indexed).
  final int page;

  /// Number of items per page.
  final int pageSize;

  /// Available aggregations/facets for filtering.
  final List<Aggregation> aggregations;

  const ProductPage({
    required this.items,
    required this.totalCount,
    required this.page,
    required this.pageSize,
    this.aggregations = const [],
  });

  /// Total number of pages.
  int get totalPages => (totalCount / pageSize).ceil();

  /// Whether there are more pages.
  bool get hasNextPage => page < totalPages;

  /// Whether there are previous pages.
  bool get hasPreviousPage => page > 1;
}

/// A filter aggregation/facet.
class Aggregation {
  /// Attribute code.
  final String attributeCode;

  /// Display label.
  final String label;

  /// Available filter options.
  final List<AggregationOption> options;

  /// Number of options.
  final int count;

  const Aggregation({
    required this.attributeCode,
    required this.label,
    required this.options,
    required this.count,
  });
}

/// An option within an aggregation.
class AggregationOption {
  /// Value for filtering.
  final String value;

  /// Display label.
  final String label;

  /// Number of products with this value.
  final int count;

  const AggregationOption({
    required this.value,
    required this.label,
    required this.count,
  });
}
