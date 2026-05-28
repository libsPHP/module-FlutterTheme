import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Seller statistics and performance metrics.
class SellerStatistics {
  /// Total number of orders.
  final int totalOrders;

  /// Number of completed orders.
  final int completedOrders;

  /// Order fulfillment rate (0-1).
  final double fulfillmentRate;

  /// Average shipping time.
  final Duration avgShippingTime;

  /// Total sales amount.
  final Money totalSales;

  /// Commission rate (0-1).
  final double commissionRate;

  /// Return rate (0-1).
  final double returnRate;

  /// Response time to customer inquiries.
  final Duration? responseTime;

  const SellerStatistics({
    required this.totalOrders,
    required this.completedOrders,
    required this.fulfillmentRate,
    required this.avgShippingTime,
    required this.totalSales,
    required this.commissionRate,
    this.returnRate = 0.0,
    this.responseTime,
  });

  /// Whether seller has good performance (fulfillment > 95%).
  bool get hasGoodPerformance => fulfillmentRate >= 0.95;

  /// Fulfillment rate as percentage.
  double get fulfillmentPercent => fulfillmentRate * 100;
}
