import '../models/blockchain_network.dart';
import 'network_config.dart';

/// Main configuration for blockchain integrations.
class BlockchainConfig {
  /// Default network for payments.
  final BlockchainNetwork defaultNetwork;

  /// Network-specific configurations.
  final Map<BlockchainNetwork, NetworkConfig> networks;

  /// ICP canister ID for payments.
  final String? icpCanisterId;

  /// Merchant wallet address for receiving payments.
  final String? merchantWalletAddress;

  /// Whether in test mode.
  final bool testMode;

  /// Timeout for blockchain operations.
  final Duration operationTimeout;

  /// Number of confirmation blocks to wait.
  final int confirmationBlocks;

  const BlockchainConfig({
    required this.defaultNetwork,
    required this.networks,
    this.icpCanisterId,
    this.merchantWalletAddress,
    this.testMode = false,
    this.operationTimeout = const Duration(minutes: 5),
    this.confirmationBlocks = 1,
  });

  /// Creates mainnet configuration.
  factory BlockchainConfig.mainnet({
    String? icpCanisterId,
    String? merchantWalletAddress,
  }) {
    return BlockchainConfig(
      defaultNetwork: BlockchainNetwork.icp,
      networks: {
        BlockchainNetwork.icp: NetworkConfig.forNetwork(BlockchainNetwork.icp),
        BlockchainNetwork.ethereum:
            NetworkConfig.forNetwork(BlockchainNetwork.ethereum),
        BlockchainNetwork.polygon:
            NetworkConfig.forNetwork(BlockchainNetwork.polygon),
      },
      icpCanisterId: icpCanisterId,
      merchantWalletAddress: merchantWalletAddress,
      testMode: false,
    );
  }

  /// Creates testnet configuration.
  factory BlockchainConfig.testnet({
    String? icpCanisterId,
    String? merchantWalletAddress,
  }) {
    return BlockchainConfig(
      defaultNetwork: BlockchainNetwork.icp,
      networks: {
        BlockchainNetwork.icp: NetworkConfig.icpTestnet(),
        BlockchainNetwork.ethereum: NetworkConfig.sepoliaTestnet(),
        BlockchainNetwork.polygon: NetworkConfig.mumbaiTestnet(),
      },
      icpCanisterId: icpCanisterId,
      merchantWalletAddress: merchantWalletAddress,
      testMode: true,
    );
  }

  /// Gets config for a specific network.
  NetworkConfig? getNetworkConfig(BlockchainNetwork network) {
    return networks[network];
  }

  /// Gets config for the default network.
  NetworkConfig? get defaultNetworkConfig {
    return networks[defaultNetwork];
  }

  /// Whether ICP is configured.
  bool get hasIcpConfig =>
      networks.containsKey(BlockchainNetwork.icp) && icpCanisterId != null;

  /// Whether any EVM network is configured.
  bool get hasEvmConfig =>
      networks.keys.any((n) => n != BlockchainNetwork.icp);
}
