# flutter_magento_blockchain

[![pub package](https://img.shields.io/pub/v/flutter_magento_blockchain.svg)](https://pub.dev/packages/flutter_magento_blockchain)

Blockchain integrations for Flutter Magento SDK - ICP, EVM payments, NFT products, and Yuku marketplace.

## Features

- ICP (Internet Computer) payments
- EVM chain payments (Ethereum, Polygon, BSC, etc.)
- NFT-backed products
- Yuku marketplace integration
- Wallet connection and balance
- Transaction tracking

## Installation

```yaml
dependencies:
  flutter_magento_blockchain: ^1.0.0
```

## Usage

### ICP Payments

```dart
import 'package:flutter_magento_blockchain/flutter_magento_blockchain.dart';

// Implement ICPClient with your SDK (e.g., agent_dart)
class MyICPClient implements ICPClient {
  @override
  Future<String> connect() async { ... }

  @override
  Future<ICPBalance> getBalance() async { ... }

  @override
  Future<String> transfer({
    required String to,
    required BigInt amount,
    List<int>? memo,
  }) async { ... }
}

// Create adapter
final icpAdapter = ICPPaymentAdapter(
  icpClient: MyICPClient(),
  config: BlockchainConfig.mainnet(
    merchantWalletAddress: 'your-principal-id',
  ),
);

// Connect wallet
await icpAdapter.connectWallet();
print('Connected: ${icpAdapter.walletAddress}');

// Check balance
final balance = await icpAdapter.getWalletBalance();
print('Balance: ${balance.formatted}');

// Process payment
final result = await icpAdapter.pay(
  cart: cart,
  context: PaymentContext(orderId: 'ORD-123'),
);

if (result.success) {
  print('Transaction: ${result.transactionId}');
  print('Explorer: ${result.explorerUrl}');
} else {
  print('Error: ${result.errorMessage}');
}
```

### EVM Payments (Ethereum, Polygon, etc.)

```dart
// Implement EVMClient with your SDK (e.g., web3dart, walletconnect)
class MyEVMClient implements EVMClient {
  @override
  Future<String> connect() async { ... }

  @override
  Future<WalletBalance> getBalance() async { ... }

  @override
  Future<String> sendTransaction({
    required String to,
    required BigInt value,
    String? data,
    BigInt? gasLimit,
    BigInt? gasPrice,
  }) async { ... }
}

// Create adapter for specific network
final polygonAdapter = EVMPaymentAdapter(
  evmClient: MyEVMClient(),
  config: BlockchainConfig.mainnet(
    merchantWalletAddress: '0x...',
  ),
  network: BlockchainNetwork.polygon,
);

// Estimate gas fees
final fee = await polygonAdapter.estimateFee(cart: cart);
print('Estimated fee: $fee wei');

// Process payment
final result = await polygonAdapter.pay(
  cart: cart,
  context: PaymentContext(orderId: 'ORD-123'),
);
```

### NFT Products

```dart
final nftExtension = NFTProductExtension(
  nftClient: myNftClient, // optional, for on-chain data
);

// Check if product has NFT
if (nftExtension.isNFTProduct(product)) {
  final nftData = nftExtension.getNFTMetadata(product);

  print('Token ID: ${nftData.tokenId}');
  print('Contract: ${nftData.contractAddress}');
  print('Chain: ${nftData.chain.name}');
  print('Explorer: ${nftData.explorerUrl}');
}

// Fetch on-chain metadata
final enriched = await nftExtension.fetchOnChainMetadata(product);
print('NFT Name: ${enriched.name}');
print('Owner: ${enriched.ownerAddress}');

// Verify ownership
final isOwner = await nftExtension.verifyOwnership(
  product: product,
  walletAddress: userWallet,
);
```

### Yuku Marketplace

```dart
final yuku = YukuMarketplaceExtension(
  yukuClient: myYukuClient,
);

// Sync product to Yuku
final listing = await yuku.syncProduct(product);
print('Listed on Yuku: ${listing.listingUrl}');

// Bulk sync
final result = await yuku.syncProducts(products);
print('Synced: ${result.synced}, Failed: ${result.failed}');

// Get seller listings
final listings = await yuku.getSellerListings();
```

## Supported Networks

| Network | Chain ID | Native Token |
|---------|----------|--------------|
| ICP | - | ICP |
| Ethereum | 1 | ETH |
| Polygon | 137 | MATIC |
| BSC | 56 | BNB |
| Avalanche | 43114 | AVAX |
| Arbitrum | 42161 | ETH |
| Optimism | 10 | ETH |

## API Reference

| Class | Description |
|-------|-------------|
| `BlockchainPaymentAdapter` | Payment adapter interface |
| `ICPPaymentAdapter` | ICP payments |
| `EVMPaymentAdapter` | EVM chain payments |
| `ICPClient` | ICP client interface |
| `EVMClient` | EVM client interface |
| `NFTProductExtension` | NFT product support |
| `YukuMarketplaceExtension` | Yuku integration |
| `BlockchainNetwork` | Network configuration |
| `BlockchainPaymentResult` | Payment result |
| `NFTMetadata` | NFT data |
| `WalletBalance` | Balance with formatting |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_cart](https://pub.dev/packages/flutter_magento_cart) - Shopping cart
