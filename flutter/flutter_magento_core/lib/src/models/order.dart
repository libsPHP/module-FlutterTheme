import 'magento_entity.dart';
import 'money.dart';
import 'address.dart';

/// Represents a placed order.
class Order extends MagentoEntity {
  /// Order entity ID.
  final String id;

  /// Order increment ID (order number).
  final String incrementId;

  /// Order status.
  final OrderStatus status;

  /// Order state.
  final String state;

  /// Order creation date.
  final DateTime createdAt;

  /// Grand total.
  final Money grandTotal;

  /// Subtotal.
  final Money subtotal;

  /// Discount amount.
  final Money? discount;

  /// Shipping amount.
  final Money? shipping;

  /// Tax amount.
  final Money tax;

  /// Total quantity of items.
  final int totalItemCount;

  /// Order items.
  final List<OrderItem> items;

  /// Shipping address.
  final Address? shippingAddress;

  /// Billing address.
  final Address billingAddress;

  /// Payment method.
  final String paymentMethod;

  /// Shipping method.
  final String? shippingMethod;

  /// Shipping description.
  final String? shippingDescription;

  /// Applied coupon code.
  final String? couponCode;

  const Order({
    required this.id,
    required this.incrementId,
    required this.status,
    required this.state,
    required this.createdAt,
    required this.grandTotal,
    required this.subtotal,
    this.discount,
    this.shipping,
    required this.tax,
    required this.totalItemCount,
    required this.items,
    this.shippingAddress,
    required this.billingAddress,
    required this.paymentMethod,
    this.shippingMethod,
    this.shippingDescription,
    this.couponCode,
    super.customAttributes,
  });
}

/// An item within an order.
class OrderItem {
  /// Item ID.
  final String id;

  /// Product SKU.
  final String sku;

  /// Product name.
  final String name;

  /// Quantity ordered.
  final int quantityOrdered;

  /// Quantity shipped.
  final int quantityShipped;

  /// Quantity refunded.
  final int quantityRefunded;

  /// Quantity canceled.
  final int quantityCanceled;

  /// Price per unit.
  final Money price;

  /// Row total.
  final Money rowTotal;

  /// Discount amount.
  final Money? discount;

  /// Product image URL.
  final String? imageUrl;

  /// Selected options.
  final List<OrderItemOption> options;

  const OrderItem({
    required this.id,
    required this.sku,
    required this.name,
    required this.quantityOrdered,
    this.quantityShipped = 0,
    this.quantityRefunded = 0,
    this.quantityCanceled = 0,
    required this.price,
    required this.rowTotal,
    this.discount,
    this.imageUrl,
    this.options = const [],
  });
}

/// A selected option for an order item.
class OrderItemOption {
  /// Option label.
  final String label;

  /// Selected value.
  final String value;

  const OrderItemOption({
    required this.label,
    required this.value,
  });
}

/// Order status.
enum OrderStatus {
  pending,
  processing,
  complete,
  closed,
  canceled,
  holded,
  paymentReview;

  static OrderStatus fromString(String value) {
    return OrderStatus.values.firstWhere(
      (status) => status.name == value.toLowerCase(),
      orElse: () => OrderStatus.pending,
    );
  }
}
