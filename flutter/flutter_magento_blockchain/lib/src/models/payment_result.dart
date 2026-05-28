import 'blockchain_network.dart';

/// Result of a blockchain payment.
class BlockchainPaymentResult {
  /// Whether payment was successful.
  final bool success;

  /// Transaction hash/ID.
  final String? transactionId;

  /// Block number (if confirmed).
  final int? blockNumber;

  /// Blockchain network used.
  final BlockchainNetwork network;

  /// Error message (if failed).
  final String? errorMessage;

  /// Error code (if failed).
  final String? errorCode;

  /// Gas/fee used.
  final BigInt? feeUsed;

  /// Timestamp of transaction.
  final DateTime? timestamp;

  const BlockchainPaymentResult({
    required this.success,
    this.transactionId,
    this.blockNumber,
    required this.network,
    this.errorMessage,
    this.errorCode,
    this.feeUsed,
    this.timestamp,
  });

  /// Creates a successful result.
  factory BlockchainPaymentResult.success({
    required String transactionId,
    required BlockchainNetwork network,
    int? blockNumber,
    BigInt? feeUsed,
  }) {
    return BlockchainPaymentResult(
      success: true,
      transactionId: transactionId,
      network: network,
      blockNumber: blockNumber,
      feeUsed: feeUsed,
      timestamp: DateTime.now(),
    );
  }

  /// Creates a failed result.
  factory BlockchainPaymentResult.failure({
    required BlockchainNetwork network,
    required String errorMessage,
    String? errorCode,
  }) {
    return BlockchainPaymentResult(
      success: false,
      network: network,
      errorMessage: errorMessage,
      errorCode: errorCode,
      timestamp: DateTime.now(),
    );
  }

  /// Gets explorer URL for transaction.
  String? get explorerUrl {
    if (transactionId == null) return null;
    final baseUrl = network.explorerUrl;
    if (network == BlockchainNetwork.icp) {
      return '$baseUrl/transaction/$transactionId';
    }
    return '$baseUrl/tx/$transactionId';
  }
}
