import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../models/blockchain_network.dart';
import '../models/payment_result.dart';
import '../models/wallet_balance.dart';

/// Abstract interface for blockchain payment adapters.
///
/// Implement this to add new blockchain payment methods.
abstract interface class BlockchainPaymentAdapter {
  /// Payment method code for Magento.
  String get methodCode;

  /// Blockchain network.
  BlockchainNetwork get network;

  /// Whether wallet is connected.
  bool get isConnected;

  /// Connected wallet address (if any).
  String? get walletAddress;

  /// Connects to the user's wallet.
  Future<void> connectWallet();

  /// Disconnects from the wallet.
  Future<void> disconnectWallet();

  /// Gets the current wallet balance.
  Future<WalletBalance> getWalletBalance();

  /// Processes a payment for the cart.
  Future<BlockchainPaymentResult> pay({
    required Cart cart,
    required PaymentContext context,
  });

  /// Estimates fee for a payment.
  Future<BigInt> estimateFee({
    required Cart cart,
  });
}

/// Payment context with additional information.
class PaymentContext {
  /// Order increment ID (if available).
  final String? orderId;

  /// Customer email.
  final String? email;

  /// Billing address.
  final CustomerAddress? billingAddress;

  /// Additional metadata.
  final Map<String, dynamic>? metadata;

  const PaymentContext({
    this.orderId,
    this.email,
    this.billingAddress,
    this.metadata,
  });
}
