# Specifications: flutter_magento_blockchain

> Version: 1.1
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_blockchain provides extension architecture for blockchain integrations: ICP payments, NFT products, and Yuku marketplace. Uses MagentoExtensionRegistry from core package for plugin registration.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| ICPPaymentAdapter | Create | MagentoPaymentAdapter implementation |
| NFTProductExtension | Create | MagentoProductExtension implementation |
| YukuMarketplaceExtension | Create | Custom extension for Yuku |
| BlockchainConfig | Create | Multi-network configuration |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                 flutter_magento_blockchain                   │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │            Payment Adapters                         │     │
│  │  ┌──────────────┐  ┌──────────────┐               │     │
│  │  │ ICPPayment   │  │ EVMPayment   │               │     │
│  │  │   Adapter    │  │   Adapter    │               │     │
│  │  └──────────────┘  └──────────────┘               │     │
│  └────────────────────────────────────────────────────┘     │
│                                                              │
│  ┌────────────────────────────────────────────────────┐     │
│  │            Product Extensions                       │     │
│  │  ┌──────────────┐  ┌──────────────┐               │     │
│  │  │ NFTProduct   │  │ DigitalOwner │               │     │
│  │  │  Extension   │  │   ship Ext   │               │     │
│  │  └──────────────┘  └──────────────┘               │     │
│  └────────────────────────────────────────────────────┘     │
│                                                              │
│  ┌────────────────────────────────────────────────────┐     │
│  │            Marketplace Extensions                   │     │
│  │  ┌──────────────┐                                  │     │
│  │  │ YukuMarket   │                                  │     │
│  │  │  Extension   │                                  │     │
│  │  └──────────────┘                                  │     │
│  └────────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
           │
           ▼
┌─────────────────────────────────────────────────────────────┐
│                   flutter_magento_core                       │
│   MagentoExtensionRegistry, MagentoPaymentAdapter            │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### ICPPaymentAdapter

```dart
class ICPPaymentAdapter implements MagentoPaymentAdapter {
  final FlutterICPClient icpClient;
  final BlockchainConfig config;

  ICPPaymentAdapter({
    required this.icpClient,
    required this.config,
  });

  @override
  String get methodCode => 'icp_payment';

  @override
  Future<PaymentResult> pay({
    required Cart cart,
    required PaymentContext context,
  }) async {
    // 1. Connect wallet if needed
    // 2. Get ICP equivalent of cart total
    // 3. Execute transfer to merchant canister
    // 4. Return success/failure
  }

  Future<ICPBalance> getWalletBalance();
  Future<void> connectWallet();
  Future<void> disconnectWallet();
}
```

### NFTProductExtension

```dart
class NFTProductExtension implements MagentoProductExtension<NFTMetadata> {
  final FlutterNFTClient nftClient;

  @override
  String get code => 'nft';

  @override
  NFTMetadata fromProduct(ProductDetails product) {
    final tokenId = product.attr<String>('nft_token_id');
    final contractAddress = product.attr<String>('nft_contract');
    final chain = product.attr<String>('nft_chain');

    if (tokenId == null) return NFTMetadata.none();

    return NFTMetadata(
      tokenId: tokenId,
      contractAddress: contractAddress ?? '',
      chain: BlockchainNetwork.fromString(chain ?? 'icp'),
      ownerAddress: null, // Fetched lazily
    );
  }

  Future<NFTMetadata> fetchFullMetadata(NFTMetadata partial) async {
    // Fetch on-chain data
  }

  Future<String> mintForProduct(ProductDetails product) async {
    // Mint NFT for product
  }
}

class NFTMetadata {
  final String tokenId;
  final String contractAddress;
  final BlockchainNetwork chain;
  final String? ownerAddress;
  final String? metadataUri;
  final Map<String, dynamic>? attributes;

  const NFTMetadata({...});

  factory NFTMetadata.none() => NFTMetadata(tokenId: '', ...);

  bool get hasNFT => tokenId.isNotEmpty;
}
```

### YukuMarketplaceExtension

```dart
class YukuMarketplaceExtension {
  final FlutterYukuClient yukuClient;
  final MagentoTransport transport;

  YukuMarketplaceExtension({
    required this.yukuClient,
    required this.transport,
  });

  /// Sync Magento products to Yuku
  Future<SyncResult> syncProducts(List<ProductDetails> products);

  /// List product on Yuku marketplace
  Future<YukuListing> listProduct({
    required String sku,
    required Money price,
    required String category,
  });

  /// Get Yuku listings for vendor
  Future<List<YukuListing>> getVendorListings();

  /// Handle Yuku order webhook
  Future<void> handleYukuOrder(Map<String, dynamic> webhookData);
}
```

### BlockchainConfig

```dart
class BlockchainConfig {
  final BlockchainNetwork defaultNetwork;
  final Map<BlockchainNetwork, NetworkConfig> networks;
  final String? icpCanisterId;
  final String? merchantWalletAddress;
  final bool testMode;

  const BlockchainConfig({...});

  factory BlockchainConfig.mainnet() => BlockchainConfig(
    defaultNetwork: BlockchainNetwork.icp,
    testMode: false,
    ...
  );

  factory BlockchainConfig.testnet() => BlockchainConfig(
    defaultNetwork: BlockchainNetwork.icp,
    testMode: true,
    ...
  );
}

enum BlockchainNetwork {
  icp,
  ethereum,
  polygon,
  binance,
  avalanche,
  arbitrum,
  optimism,
}

class NetworkConfig {
  final String rpcUrl;
  final int chainId;
  final String? explorerUrl;

  const NetworkConfig({...});
}
```

## Registration

```dart
// In app initialization
final magento = MagentoClient(...);

// Register blockchain extensions
magento.extensions.register<ICPPaymentAdapter>(
  ICPPaymentAdapter(
    icpClient: FlutterICPClient(),
    config: BlockchainConfig.mainnet(),
  ),
);

magento.extensions.register<NFTProductExtension>(
  NFTProductExtension(
    nftClient: FlutterNFTClient(),
  ),
);

magento.extensions.register<YukuMarketplaceExtension>(
  YukuMarketplaceExtension(
    yukuClient: FlutterYukuClient(),
    transport: magento.transport,
  ),
);
```

## Usage

```dart
// Check if product has NFT
final nftExt = magento.extensions.get<NFTProductExtension>();
final metadata = nftExt.fromProduct(product);
if (metadata.hasNFT) {
  // Show NFT badge, ownership info
}

// Pay with ICP
final icpPayment = magento.extensions.get<ICPPaymentAdapter>();
final result = await icpPayment.pay(
  cart: cart,
  context: PaymentContext(...),
);
```

## Dependencies

### Requires

- flutter_magento_core
- flutter_icp (local package)
- flutter_nft (local package)
- flutter_yuku (local package)

## Package Structure

```
lib/
├── flutter_magento_blockchain.dart
└── src/
    ├── config/
    │   └── blockchain_config.dart
    ├── payment/
    │   ├── icp_payment_adapter.dart
    │   └── evm_payment_adapter.dart
    ├── extensions/
    │   ├── nft_product_extension.dart
    │   └── yuku_marketplace_extension.dart
    └── models/
        ├── nft_metadata.dart
        ├── blockchain_network.dart
        └── yuku_listing.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
