import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../config/blockchain_config.dart';
import '../models/blockchain_network.dart';
import '../models/payment_result.dart';
import '../models/wallet_balance.dart';
import 'blockchain_payment_adapter.dart';

/// Abstract interface for ICP client.
///
/// Implement this with your ICP SDK (e.g., agent_dart).
abstract interface class ICPClient {
  /// Connects to Internet Identity or other wallet.
  Future<String> connect();

  /// Disconnects from wallet.
  Future<void> disconnect();

  /// Gets the connected principal.
  String? get principal;

  /// Gets ICP balance for the connected wallet.
  Future<ICPBalance> getBalance();

  /// Transfers ICP to another address.
  Future<String> transfer({
    required String to,
    required BigInt amount,
    List<int>? memo,
  });

  /// Gets the current exchange rate (ICP/USD).
  Future<double> getExchangeRate();
}

/// ICP payment adapter for Magento.
///
/// Usage:
/// ```dart
/// final adapter = ICPPaymentAdapter(
///   icpClient: MyICPClientImpl(),
///   config: BlockchainConfig.mainnet(
///     merchantWalletAddress: 'your-principal-id',
///   ),
/// );
///
/// await adapter.connectWallet();
/// final result = await adapter.pay(cart: cart, context: context);
/// ```
class ICPPaymentAdapter implements BlockchainPaymentAdapter {
  final ICPClient _icpClient;
  final BlockchainConfig config;

  ICPPaymentAdapter({
    required ICPClient icpClient,
    required this.config,
  }) : _icpClient = icpClient;

  @override
  String get methodCode => 'icp_payment';

  @override
  BlockchainNetwork get network => BlockchainNetwork.icp;

  @override
  bool get isConnected => _icpClient.principal != null;

  @override
  String? get walletAddress => _icpClient.principal;

  @override
  Future<void> connectWallet() async {
    await _icpClient.connect();
  }

  @override
  Future<void> disconnectWallet() async {
    await _icpClient.disconnect();
  }

  @override
  Future<WalletBalance> getWalletBalance() async {
    return _icpClient.getBalance();
  }

  @override
  Future<BlockchainPaymentResult> pay({
    required Cart cart,
    required PaymentContext context,
  }) async {
    if (!isConnected) {
      return BlockchainPaymentResult.failure(
        network: network,
        errorMessage: 'Wallet not connected',
        errorCode: 'NOT_CONNECTED',
      );
    }

    final merchantAddress = config.merchantWalletAddress;
    if (merchantAddress == null) {
      return BlockchainPaymentResult.failure(
        network: network,
        errorMessage: 'Merchant wallet not configured',
        errorCode: 'NO_MERCHANT',
      );
    }

    try {
      // Get ICP equivalent of cart total
      final exchangeRate = await _icpClient.getExchangeRate();
      final usdAmount = cart.totals.grandTotal.value;
      final icpAmount = usdAmount / exchangeRate;

      // Convert to e8s (ICP has 8 decimals)
      final e8sAmount = BigInt.from((icpAmount * 1e8).round());

      // Check balance
      final balance = await _icpClient.getBalance();
      if (balance.rawBalance < e8sAmount) {
        return BlockchainPaymentResult.failure(
          network: network,
          errorMessage: 'Insufficient ICP balance',
          errorCode: 'INSUFFICIENT_FUNDS',
        );
      }

      // Create memo from order ID
      final memo = context.orderId?.codeUnits;

      // Execute transfer
      final txId = await _icpClient.transfer(
        to: merchantAddress,
        amount: e8sAmount,
        memo: memo,
      );

      return BlockchainPaymentResult.success(
        transactionId: txId,
        network: network,
      );
    } catch (e) {
      return BlockchainPaymentResult.failure(
        network: network,
        errorMessage: e.toString(),
        errorCode: 'TRANSFER_FAILED',
      );
    }
  }

  @override
  Future<BigInt> estimateFee({required Cart cart}) async {
    // ICP transfer fee is fixed at 10000 e8s (0.0001 ICP)
    return BigInt.from(10000);
  }

  /// Gets the current ICP price in USD.
  Future<double> getIcpPrice() async {
    return _icpClient.getExchangeRate();
  }

  /// Converts USD amount to ICP.
  Future<double> usdToIcp(double usdAmount) async {
    final rate = await _icpClient.getExchangeRate();
    return usdAmount / rate;
  }
}
