import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../repositories/seller_repository.dart';
import 'marketplace_cart_extension.dart';

/// Extension for marketplace checkout functionality.
///
/// Handles multi-vendor checkout with per-seller shipping options
/// and split order placement.
///
/// Usage:
/// ```dart
/// final extension = MarketplaceCheckoutExtension(
///   transport: transport,
///   sellerRepository: sellerRepo,
/// );
///
/// final shippingMethods = await extension.getShippingMethodsBySeller(cart);
/// // Set shipping for each seller...
/// final orders = await extension.placeSplitOrder(paymentMethodCode: 'checkmo');
/// ```
class MarketplaceCheckoutExtension {
  final MagentoTransport _transport;
  final SellerRepository sellerRepository;
  final MarketplaceCartExtension _cartExtension;

  MarketplaceCheckoutExtension({
    required MagentoTransport transport,
    required this.sellerRepository,
    SellerIdExtractor? sellerIdExtractor,
  })  : _transport = transport,
        _cartExtension = MarketplaceCartExtension(
          sellerRepository: sellerRepository,
          sellerIdExtractor: sellerIdExtractor,
        );

  /// Gets available shipping methods per seller.
  Future<Map<String, List<ShippingMethod>>> getShippingMethodsBySeller(
    Cart cart,
  ) async {
    final sellerIds = _cartExtension.getSellerIds(cart);
    final result = <String, List<ShippingMethod>>{};

    for (final sellerId in sellerIds) {
      final response = await _transport.graphql(
        _getSellerShippingMethodsQuery,
        variables: {'sellerId': sellerId},
        decoder: (json) {
          final data = json as Map<String, dynamic>;
          final methods = data['marketplace_seller_shipping_methods'] as List?;
          return methods
                  ?.map((m) =>
                      _parseShippingMethod(m as Map<String, dynamic>))
                  .toList() ??
              [];
        },
      );

      result[sellerId] = response.data;
    }

    return result;
  }

  /// Sets shipping method for a specific seller.
  Future<Cart> setSellerShippingMethod({
    required String sellerId,
    required String carrierCode,
    required String methodCode,
  }) async {
    final response = await _transport.graphql(
      _setSellerShippingMethodMutation,
      variables: {
        'sellerId': sellerId,
        'carrierCode': carrierCode,
        'methodCode': methodCode,
      },
      decoder: (json) {
        final data = json as Map<String, dynamic>;
        final cartData =
            data['setMarketplaceSellerShippingMethod']['cart'] as Map<String, dynamic>;
        return _parseCart(cartData);
      },
    );

    return response.data;
  }

  /// Places a split order (one order per seller).
  ///
  /// Returns a list of order results, one per seller.
  Future<List<SplitOrderResult>> placeSplitOrder({
    required String paymentMethodCode,
    Map<String, dynamic>? paymentData,
  }) async {
    final response = await _transport.graphql(
      _placeSplitOrderMutation,
      variables: {
        'paymentMethodCode': paymentMethodCode,
        'paymentData': paymentData,
      },
      decoder: (json) {
        final data = json as Map<String, dynamic>;
        final orders = data['placeMarketplaceSplitOrder']['orders'] as List;
        return orders
            .map((o) => _parseOrderResult(o as Map<String, dynamic>))
            .toList();
      },
    );

    return response.data;
  }

  ShippingMethod _parseShippingMethod(Map<String, dynamic> json) {
    return ShippingMethod(
      carrierCode: json['carrier_code'] as String,
      methodCode: json['method_code'] as String,
      carrierTitle: json['carrier_title'] as String,
      methodTitle: json['method_title'] as String,
      amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
    );
  }

  Cart _parseCart(Map<String, dynamic> json) {
    // Simplified cart parsing - actual implementation would use CartMapper
    return Cart(
      id: json['id'] as String,
      items: [],
      totals: CartTotals(
        subtotal: const Money(value: 0, currency: 'USD'),
        discount: const Money(value: 0, currency: 'USD'),
        tax: const Money(value: 0, currency: 'USD'),
        grandTotal: const Money(value: 0, currency: 'USD'),
      ),
      isGuest: json['is_guest'] as bool? ?? false,
      currency: json['currency'] as String? ?? 'USD',
    );
  }

  SplitOrderResult _parseOrderResult(Map<String, dynamic> json) {
    return SplitOrderResult(
      orderId: json['order_id'] as String,
      orderNumber: json['order_number'] as String,
      sellerId: json['seller_id'] as String,
      sellerName: json['seller_name'] as String?,
      status: json['status'] as String,
    );
  }

  static const String _getSellerShippingMethodsQuery = r'''
    query GetSellerShippingMethods($sellerId: String!) {
      marketplace_seller_shipping_methods(seller_id: $sellerId) {
        carrier_code
        method_code
        carrier_title
        method_title
        amount {
          value
          currency
        }
      }
    }
  ''';

  static const String _setSellerShippingMethodMutation = r'''
    mutation SetSellerShippingMethod(
      $sellerId: String!
      $carrierCode: String!
      $methodCode: String!
    ) {
      setMarketplaceSellerShippingMethod(
        input: {
          seller_id: $sellerId
          carrier_code: $carrierCode
          method_code: $methodCode
        }
      ) {
        cart {
          id
          is_guest
          currency
        }
      }
    }
  ''';

  static const String _placeSplitOrderMutation = r'''
    mutation PlaceSplitOrder(
      $paymentMethodCode: String!
      $paymentData: JSON
    ) {
      placeMarketplaceSplitOrder(
        input: {
          payment_method_code: $paymentMethodCode
          payment_data: $paymentData
        }
      ) {
        orders {
          order_id
          order_number
          seller_id
          seller_name
          status
        }
      }
    }
  ''';
}

/// Shipping method.
class ShippingMethod {
  final String carrierCode;
  final String methodCode;
  final String carrierTitle;
  final String methodTitle;
  final Money amount;

  const ShippingMethod({
    required this.carrierCode,
    required this.methodCode,
    required this.carrierTitle,
    required this.methodTitle,
    required this.amount,
  });

  /// Full method code (carrier_method).
  String get code => '${carrierCode}_$methodCode';
}

/// Result of placing a split order.
class SplitOrderResult {
  /// Order ID.
  final String orderId;

  /// Order number for display.
  final String orderNumber;

  /// Seller ID.
  final String sellerId;

  /// Seller name.
  final String? sellerName;

  /// Order status.
  final String status;

  const SplitOrderResult({
    required this.orderId,
    required this.orderNumber,
    required this.sellerId,
    this.sellerName,
    required this.status,
  });
}
