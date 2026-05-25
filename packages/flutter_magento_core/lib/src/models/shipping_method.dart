import 'money.dart';

/// Represents an available shipping method.
class ShippingMethod {
  /// Carrier code.
  final String carrierCode;

  /// Method code.
  final String methodCode;

  /// Carrier title.
  final String carrierTitle;

  /// Method title.
  final String methodTitle;

  /// Shipping price.
  final Money amount;

  /// Whether this method is available.
  final bool available;

  /// Error message if not available.
  final String? errorMessage;

  /// Estimated delivery time.
  final String? deliveryEstimate;

  const ShippingMethod({
    required this.carrierCode,
    required this.methodCode,
    required this.carrierTitle,
    required this.methodTitle,
    required this.amount,
    this.available = true,
    this.errorMessage,
    this.deliveryEstimate,
  });

  /// Combined carrier and method code.
  String get code => '${carrierCode}_$methodCode';
}
