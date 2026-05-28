import 'order.dart';

/// Paginated order history results.
class OrderPage {
  /// Orders in this page.
  final List<Order> items;

  /// Total number of orders.
  final int totalCount;

  /// Current page number (1-indexed).
  final int page;

  /// Number of items per page.
  final int pageSize;

  const OrderPage({
    required this.items,
    required this.totalCount,
    required this.page,
    required this.pageSize,
  });

  /// Total number of pages.
  int get totalPages => (totalCount / pageSize).ceil();

  /// Whether there are more pages.
  bool get hasNextPage => page < totalPages;

  /// Whether there are previous pages.
  bool get hasPreviousPage => page > 1;
}
