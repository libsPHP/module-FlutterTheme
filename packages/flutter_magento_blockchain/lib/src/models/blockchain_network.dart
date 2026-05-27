/// Supported blockchain networks.
enum BlockchainNetwork {
  /// Internet Computer Protocol.
  icp,

  /// Ethereum mainnet.
  ethereum,

  /// Polygon (Matic).
  polygon,

  /// Binance Smart Chain.
  binance,

  /// Avalanche.
  avalanche,

  /// Arbitrum.
  arbitrum,

  /// Optimism.
  optimism,
}

/// Extension on BlockchainNetwork for utility methods.
extension BlockchainNetworkExtension on BlockchainNetwork {
  /// Creates a network from string.
  static BlockchainNetwork fromString(String value) {
    return BlockchainNetwork.values.firstWhere(
      (n) => n.name.toLowerCase() == value.toLowerCase(),
      orElse: () => BlockchainNetwork.icp,
    );
  }

  /// Whether this is an EVM-compatible network.
  bool get isEvm => this != BlockchainNetwork.icp;

  /// Native token symbol.
  String get nativeToken {
    return switch (this) {
      BlockchainNetwork.icp => 'ICP',
      BlockchainNetwork.ethereum => 'ETH',
      BlockchainNetwork.polygon => 'MATIC',
      BlockchainNetwork.binance => 'BNB',
      BlockchainNetwork.avalanche => 'AVAX',
      BlockchainNetwork.arbitrum => 'ETH',
      BlockchainNetwork.optimism => 'ETH',
    };
  }

  /// Chain ID for EVM networks (0 for non-EVM).
  int get chainId {
    return switch (this) {
      BlockchainNetwork.icp => 0,
      BlockchainNetwork.ethereum => 1,
      BlockchainNetwork.polygon => 137,
      BlockchainNetwork.binance => 56,
      BlockchainNetwork.avalanche => 43114,
      BlockchainNetwork.arbitrum => 42161,
      BlockchainNetwork.optimism => 10,
    };
  }

  /// Default RPC URL.
  String get defaultRpcUrl {
    return switch (this) {
      BlockchainNetwork.icp => 'https://ic0.app',
      BlockchainNetwork.ethereum => 'https://eth.llamarpc.com',
      BlockchainNetwork.polygon => 'https://polygon-rpc.com',
      BlockchainNetwork.binance => 'https://bsc-dataseed.binance.org',
      BlockchainNetwork.avalanche => 'https://api.avax.network/ext/bc/C/rpc',
      BlockchainNetwork.arbitrum => 'https://arb1.arbitrum.io/rpc',
      BlockchainNetwork.optimism => 'https://mainnet.optimism.io',
    };
  }

  /// Block explorer URL.
  String get explorerUrl {
    return switch (this) {
      BlockchainNetwork.icp => 'https://dashboard.internetcomputer.org',
      BlockchainNetwork.ethereum => 'https://etherscan.io',
      BlockchainNetwork.polygon => 'https://polygonscan.com',
      BlockchainNetwork.binance => 'https://bscscan.com',
      BlockchainNetwork.avalanche => 'https://snowtrace.io',
      BlockchainNetwork.arbitrum => 'https://arbiscan.io',
      BlockchainNetwork.optimism => 'https://optimistic.etherscan.io',
    };
  }
}
