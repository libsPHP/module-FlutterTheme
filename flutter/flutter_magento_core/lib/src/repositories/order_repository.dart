import '../models/order.dart';
import '../models/order_page.dart';

/// Repository interface for order history operations.
abstract interface class OrderRepository {
  /// Gets paginated order history.
  ///
  /// Returns an [OrderPage] with orders sorted by date (newest first).
  Future<OrderPage> getOrders({
    required int page,
    required int pageSize,
  });

  /// Gets detailed information for a specific order.
  ///
  /// Returns an [Order] with full details including items.
  /// Throws [MagentoNotFoundException] if order doesn't exist.
  Future<Order> getOrder(String orderId);

  /// Gets all items for a specific order.
  ///
  /// Returns a list of [OrderItem] with product details.
  Future<List<OrderItem>> getOrderItems(String orderId);

  /// Reorders all items from a previous order.
  ///
  /// Adds all available items from the specified order to the cart.
  /// Returns the updated cart.
  /// Items that are out of stock or unavailable are skipped.
  Future<void> reorder(String orderId);

  /// Gets order by increment ID (order number).
  ///
  /// The increment ID is the human-readable order number (e.g., "100000001").
  Future<Order> getOrderByIncrementId(String incrementId);
}
