import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../config/blockchain_config.dart';
import '../models/blockchain_network.dart';
import '../models/payment_result.dart';
import '../models/wallet_balance.dart';
import 'blockchain_payment_adapter.dart';

/// Abstract interface for EVM client.
///
/// Implement this with your Web3 SDK (e.g., web3dart, walletconnect).
abstract interface class EVMClient {
  /// Connects to wallet (MetaMask, WalletConnect, etc.).
  Future<String> connect();

  /// Disconnects from wallet.
  Future<void> disconnect();

  /// Gets the connected address.
  String? get address;

  /// Gets the current chain ID.
  int? get chainId;

  /// Switches to a different chain.
  Future<void> switchChain(int chainId);

  /// Gets native token balance.
  Future<WalletBalance> getBalance();

  /// Sends native token.
  Future<String> sendTransaction({
    required String to,
    required BigInt value,
    String? data,
    BigInt? gasLimit,
    BigInt? gasPrice,
  });

  /// Estimates gas for a transaction.
  Future<BigInt> estimateGas({
    required String to,
    required BigInt value,
    String? data,
  });

  /// Gets current gas price.
  Future<BigInt> getGasPrice();
}

/// EVM payment adapter for Ethereum-compatible chains.
///
/// Usage:
/// ```dart
/// final adapter = EVMPaymentAdapter(
///   evmClient: MyEVMClientImpl(),
///   config: BlockchainConfig.mainnet(
///     merchantWalletAddress: '0x...',
///   ),
///   network: BlockchainNetwork.ethereum,
/// );
///
/// await adapter.connectWallet();
/// final result = await adapter.pay(cart: cart, context: context);
/// ```
class EVMPaymentAdapter implements BlockchainPaymentAdapter {
  final EVMClient _evmClient;
  final BlockchainConfig config;

  @override
  final BlockchainNetwork network;

  EVMPaymentAdapter({
    required EVMClient evmClient,
    required this.config,
    required this.network,
  }) : _evmClient = evmClient {
    if (!network.isEvm) {
      throw ArgumentError('Network $network is not EVM-compatible');
    }
  }

  @override
  String get methodCode => '${network.name}_payment';

  @override
  bool get isConnected => _evmClient.address != null;

  @override
  String? get walletAddress => _evmClient.address;

  @override
  Future<void> connectWallet() async {
    await _evmClient.connect();

    // Switch to correct chain if needed
    final currentChainId = _evmClient.chainId;
    if (currentChainId != network.chainId) {
      await _evmClient.switchChain(network.chainId);
    }
  }

  @override
  Future<void> disconnectWallet() async {
    await _evmClient.disconnect();
  }

  @override
  Future<WalletBalance> getWalletBalance() async {
    return _evmClient.getBalance();
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
      // For EVM, we assume the price is already in the native token
      // In production, you'd use an oracle or price feed
      final weiAmount = BigInt.from(
        (cart.totals.grandTotal.value * 1e18).round(),
      );

      // Check balance
      final balance = await _evmClient.getBalance();
      final gasEstimate = await estimateFee(cart: cart);
      final totalNeeded = weiAmount + gasEstimate;

      if (balance.rawBalance < totalNeeded) {
        return BlockchainPaymentResult.failure(
          network: network,
          errorMessage: 'Insufficient balance',
          errorCode: 'INSUFFICIENT_FUNDS',
        );
      }

      // Execute transaction
      final txHash = await _evmClient.sendTransaction(
        to: merchantAddress,
        value: weiAmount,
      );

      return BlockchainPaymentResult.success(
        transactionId: txHash,
        network: network,
      );
    } catch (e) {
      return BlockchainPaymentResult.failure(
        network: network,
        errorMessage: e.toString(),
        errorCode: 'TRANSACTION_FAILED',
      );
    }
  }

  @override
  Future<BigInt> estimateFee({required Cart cart}) async {
    final merchantAddress = config.merchantWalletAddress;
    if (merchantAddress == null) {
      return BigInt.zero;
    }

    final weiAmount = BigInt.from(
      (cart.totals.grandTotal.value * 1e18).round(),
    );

    final gasEstimate = await _evmClient.estimateGas(
      to: merchantAddress,
      value: weiAmount,
    );

    final gasPrice = await _evmClient.getGasPrice();
    return gasEstimate * gasPrice;
  }
}
