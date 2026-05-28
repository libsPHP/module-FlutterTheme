/// Result of a successful order placement.
class OrderResult {
  /// Order entity ID.
  final String orderId;

  /// Order increment ID (order number).
  final String orderNumber;

  /// Confirmation message.
  final String? message;

  const OrderResult({
    required this.orderId,
    required this.orderNumber,
    this.message,
  });
}
