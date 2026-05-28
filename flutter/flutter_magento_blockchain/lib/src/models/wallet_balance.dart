import 'blockchain_network.dart';

/// Wallet balance on a blockchain.
class WalletBalance {
  /// Wallet address.
  final String address;

  /// Blockchain network.
  final BlockchainNetwork network;

  /// Balance in native token (wei/e8s).
  final BigInt rawBalance;

  /// Number of decimals for the token.
  final int decimals;

  /// Token symbol.
  final String symbol;

  const WalletBalance({
    required this.address,
    required this.network,
    required this.rawBalance,
    this.decimals = 8,
    required this.symbol,
  });

  /// Balance as a double value.
  double get balance {
    final divisor = BigInt.from(10).pow(decimals);
    return rawBalance / divisor;
  }

  /// Formatted balance string.
  String get formatted => '${balance.toStringAsFixed(4)} $symbol';

  /// Whether balance is zero.
  bool get isEmpty => rawBalance == BigInt.zero;

  /// Whether balance is greater than amount.
  bool hasEnough(double amount) {
    final amountRaw =
        BigInt.from((amount * BigInt.from(10).pow(decimals).toDouble()).round());
    return rawBalance >= amountRaw;
  }
}

/// ICP-specific balance.
class ICPBalance extends WalletBalance {
  /// Account identifier (ICP-specific).
  final String? accountId;

  /// Subaccount (optional).
  final List<int>? subaccount;

  const ICPBalance({
    required super.address,
    required super.rawBalance,
    this.accountId,
    this.subaccount,
  }) : super(
          network: BlockchainNetwork.icp,
          decimals: 8,
          symbol: 'ICP',
        );

  /// Balance in e8s.
  BigInt get e8s => rawBalance;
}
