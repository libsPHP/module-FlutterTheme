import '../models/cart.dart';
import '../models/address.dart';
import '../models/shipping_method.dart';
import '../models/payment_method.dart';
import '../models/order_result.dart';

/// Repository interface for checkout operations.
abstract interface class CheckoutRepository {
  /// Sets the shipping address for the cart.
  ///
  /// Returns the updated [Cart] with shipping address applied.
  Future<Cart> setShippingAddress(ShippingAddress address);

  /// Gets available shipping methods for the cart.
  ///
  /// Requires a shipping address to be set first.
  Future<List<ShippingMethod>> getAvailableShippingMethods();

  /// Sets the selected shipping method.
  ///
  /// Returns the updated [Cart] with shipping costs calculated.
  Future<Cart> setShippingMethod(ShippingMethodCode method);

  /// Sets the billing address for the cart.
  ///
  /// Returns the updated [Cart].
  Future<Cart> setBillingAddress(BillingAddress address);

  /// Gets available payment methods for the cart.
  ///
  /// Requires shipping address and method to be set first.
  Future<List<PaymentMethod>> getAvailablePaymentMethods();

  /// Places the order with the selected payment method.
  ///
  /// Returns an [OrderResult] with order confirmation details.
  /// Throws [MagentoPaymentException] if payment fails.
  Future<OrderResult> placeOrder({
    required String paymentMethodCode,
    Map<String, dynamic>? paymentData,
  });

  /// Estimates shipping costs for a given address.
  ///
  /// Returns available shipping methods with estimated costs
  /// without actually setting the address.
  Future<List<ShippingMethod>> estimateShippingCosts(ShippingAddress address);
}

/// Identifies a shipping method.
class ShippingMethodCode {
  /// The carrier code (e.g., 'flatrate', 'freeshipping').
  final String carrierCode;

  /// The method code (e.g., 'flatrate').
  final String methodCode;

  const ShippingMethodCode({
    required this.carrierCode,
    required this.methodCode,
  });

  @override
  String toString() => '${carrierCode}_$methodCode';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingMethodCode &&
          carrierCode == other.carrierCode &&
          methodCode == other.methodCode;

  @override
  int get hashCode => Object.hash(carrierCode, methodCode);
}
