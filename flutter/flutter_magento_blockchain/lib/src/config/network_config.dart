import '../models/blockchain_network.dart';

/// Configuration for a specific blockchain network.
class NetworkConfig {
  /// RPC endpoint URL.
  final String rpcUrl;

  /// Chain ID (for EVM networks).
  final int chainId;

  /// Block explorer URL.
  final String? explorerUrl;

  /// WebSocket URL (optional).
  final String? wsUrl;

  /// API key for RPC provider (optional).
  final String? apiKey;

  const NetworkConfig({
    required this.rpcUrl,
    required this.chainId,
    this.explorerUrl,
    this.wsUrl,
    this.apiKey,
  });

  /// Creates default config for a network.
  factory NetworkConfig.forNetwork(BlockchainNetwork network) {
    return NetworkConfig(
      rpcUrl: network.defaultRpcUrl,
      chainId: network.chainId,
      explorerUrl: network.explorerUrl,
    );
  }

  /// Creates testnet config for ICP.
  factory NetworkConfig.icpTestnet() {
    return const NetworkConfig(
      rpcUrl: 'https://ic0.app', // Use same endpoint, different canister
      chainId: 0,
      explorerUrl: 'https://dashboard.internetcomputer.org',
    );
  }

  /// Creates testnet config for Ethereum (Sepolia).
  factory NetworkConfig.sepoliaTestnet() {
    return const NetworkConfig(
      rpcUrl: 'https://rpc.sepolia.org',
      chainId: 11155111,
      explorerUrl: 'https://sepolia.etherscan.io',
    );
  }

  /// Creates testnet config for Polygon (Mumbai).
  factory NetworkConfig.mumbaiTestnet() {
    return const NetworkConfig(
      rpcUrl: 'https://rpc-mumbai.maticvigil.com',
      chainId: 80001,
      explorerUrl: 'https://mumbai.polygonscan.com',
    );
  }
}
