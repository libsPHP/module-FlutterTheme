# Blockchain Integration Guide - flutter_magento 4.4.0

## Overview

Starting with version 4.4.0, flutter_magento includes integrated blockchain support through three specialized packages:

- **flutter_icp**: Internet Computer Protocol (ICP) blockchain operations
- **flutter_nft**: Multi-chain NFT operations (Ethereum, Polygon, BSC, Avalanche, Solana)
- **flutter_yuku**: Universal blockchain interface for cross-chain compatibility

## Features

### ICP Support (flutter_icp)
- Plug Wallet integration
- ICP token transfers
- Transaction history
- Canister interactions
- NFT management on IC
- Real-time balance tracking

### NFT Support (flutter_nft)
- Multi-chain NFT operations
- Mint, transfer, burn NFTs
- Marketplace integration (OpenSea, etc.)
- Wallet connections (MetaMask, WalletConnect)
- NFT metadata management
- Search and discovery

### Universal Interface (flutter_yuku)
- Cross-chain abstraction layer
- Unified API for all blockchains
- Provider-based architecture
- Custom network support
- Marketplace operations
- Wallet management

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_magento: ^4.4.0
```

The blockchain packages are included as dependencies and don't need separate installation.

## Configuration

### Environment Variables

Add to your `.env` file:

```env
# Blockchain Integration Settings
ENABLE_ICP=true
ENABLE_NFT=true
ENABLE_YUKU=true

# ICP Configuration
ICP_NETWORK=testnet
ICP_CANISTER_ID=your-canister-id
ICP_ENABLE_DEBUG=true

# NFT Configuration
NFT_DEFAULT_NETWORK=polygon
NFT_CONTRACT_ADDRESS=your-contract-address

# Yuku Marketplace Configuration
YUKU_API_URL=https://api.yuku.app
YUKU_MARKETPLACE_URL=https://yuku.app
```

## Usage Examples

### Basic Initialization

```dart
import 'package:flutter_magento/flutter_magento.dart';

// Initialize ICP Service
final icpService = FlutterMagentoICPService.instance;
await icpService.initialize(
  enabled: true,
  network: 'testnet',
  enableDebug: true,
);

// Initialize NFT Service
final nftService = FlutterMagentoNFTService.instance;
await nftService.initialize(
  enabled: true,
  defaultNetwork: 'polygon',
  enableDebug: true,
);

// Initialize Yuku Service
final yukuService = FlutterMagentoYukuService.instance;
await yukuService.initialize(
  enabled: true,
  defaultNetwork: 'icp',
  enableDebug: true,
);
```

### ICP Wallet Operations

```dart
// Connect Plug Wallet
final connected = await icpService.connectWallet();

if (connected) {
  // Get wallet balance
  final balances = await icpService.getWalletBalance();
  print('ICP Balance: ${balances['ICP']}');

  // Send ICP
  await icpService.sendTransaction(
    to: 'recipient-address',
    amount: 10.0,
    currency: 'ICP',
    memo: 'Payment for product',
  );

  // Get transaction history
  final history = await icpService.getTransactionHistory();
}
```

### NFT Operations

```dart
// Connect wallet
await nftService.connectWallet();

// Mint NFT
final metadata = NFTMetadata(
  name: 'Product Certificate',
  description: 'Ownership certificate',
  image: 'https://example.com/image.jpg',
  attributes: {
    'product_id': '12345',
    'purchase_date': DateTime.now().toIso8601String(),
  },
);

final tokenId = await nftService.mintNFT(
  toAddress: 'buyer-address',
  metadata: metadata,
);

// Get user's NFTs
final nfts = await nftService.getNFTsByOwner('user-address');

// List NFT on marketplace
final listingId = await nftService.createListing(
  tokenId: tokenId!,
  price: 100.0,
);

// Buy NFT
await nftService.buyNFT(listingId!);
```

### Universal Yuku Interface

```dart
// Works across all supported blockchains
await yukuService.connectWallet();

// Get NFTs (any chain)
final nfts = await yukuService.getNFTsByOwner('user-address');

// Create listing (universal)
final listingId = await yukuService.createListing(
  nftId: 'nft-id',
  contractAddress: 'contract-address',
  price: 50.0,
  currency: 'ICP',
);

// Make offer
await yukuService.makeOffer(
  nftId: 'nft-id',
  contractAddress: 'contract-address',
  amount: 45.0,
  currency: 'ICP',
);

// Switch networks easily
await yukuService.switchNetwork('polygon');
await yukuService.switchNetwork('ethereum');
```

### E-Commerce Integration Example

```dart
// Purchase with ICP and receive NFT certificate
Future<bool> purchaseWithBlockchain({
  required String productName,
  required double price,
  required String sellerAddress,
  required String buyerAddress,
  required Map<String, dynamic> productData,
}) async {
  // 1. Connect ICP wallet and pay
  await icpService.connectWallet();
  final paymentSuccess = await icpService.sendTransaction(
    to: sellerAddress,
    amount: price,
    currency: 'ICP',
  );

  if (!paymentSuccess) return false;

  // 2. Mint NFT certificate on Polygon
  await nftService.switchNetwork('polygon');
  await nftService.connectWallet();

  final metadata = NFTMetadata(
    name: 'Certificate: $productName',
    description: 'Ownership certificate',
    image: productData['image'],
    attributes: productData,
  );

  final tokenId = await nftService.mintNFT(
    toAddress: buyerAddress,
    metadata: metadata,
  );

  return tokenId != null;
}
```

## Example Applications

### ICP, NFT, and Yuku Examples

Comprehensive examples are available in:
- `lib/src/examples/blockchain_integration_example.dart`

These examples demonstrate:
- Wallet connection and management
- Token transfers and payments
- NFT minting, transferring, and marketplace operations
- Cross-chain operations
- E-commerce integration patterns
- UI widget integration

### Example Projects

1. **example/**: Basic flutter_magento example
2. **example_marketplace/**: Marketplace with NFT support

## API Reference

### FlutterMagentoICPService

| Method | Description |
|--------|-------------|
| `initialize()` | Initialize ICP service |
| `connectWallet()` | Connect to Plug Wallet |
| `disconnectWallet()` | Disconnect wallet |
| `getWalletBalance()` | Get wallet balances |
| `sendTransaction()` | Send ICP tokens |
| `getTransactionHistory()` | Get transaction history |
| `getNFTBalances()` | Get NFTs from wallet |
| `signMessage()` | Sign a message |

### FlutterMagentoNFTService

| Method | Description |
|--------|-------------|
| `initialize()` | Initialize NFT service |
| `switchNetwork()` | Switch blockchain network |
| `connectWallet()` | Connect wallet (MetaMask, etc.) |
| `getNFTsByOwner()` | Get NFTs owned by address |
| `mintNFT()` | Mint new NFT |
| `transferNFT()` | Transfer NFT to another address |
| `burnNFT()` | Burn (destroy) NFT |
| `getActiveListings()` | Get marketplace listings |
| `createListing()` | List NFT for sale |
| `buyNFT()` | Buy NFT from marketplace |

### FlutterMagentoYukuService

| Method | Description |
|--------|-------------|
| `initialize()` | Initialize Yuku service |
| `switchNetwork()` | Switch blockchain network |
| `connectWallet()` | Connect wallet (universal) |
| `getNFTsByOwner()` | Get NFTs (any chain) |
| `mintNFT()` | Mint NFT (any chain) |
| `createListing()` | Create marketplace listing |
| `makeOffer()` | Make offer on NFT |
| `acceptOffer()` | Accept an offer |
| `searchListings()` | Search marketplace |
| `getMarketplaceStats()` | Get marketplace statistics |

## Supported Networks

### ICP Service
- Internet Computer Mainnet
- Internet Computer Testnet

### NFT Service
- Ethereum
- Polygon
- Binance Smart Chain (BSC)
- Avalanche
- Solana

### Yuku Service
- All networks supported by ICP and NFT services
- Custom network support via providers

## Best Practices

1. **Initialize Once**: Initialize blockchain services once at app startup
2. **Error Handling**: Always handle connection and transaction errors
3. **User Feedback**: Show loading states during blockchain operations
4. **Network Awareness**: Check network before operations
5. **Balance Checks**: Verify sufficient balance before transactions
6. **Gas Estimation**: Estimate fees before user confirmation
7. **Testing**: Use testnets during development
8. **Security**: Never expose private keys in your code

## Troubleshooting

### Common Issues

**ICP Wallet won't connect**
- Ensure Plug Wallet extension is installed
- Check network settings (testnet vs mainnet)
- Verify canister whitelisting

**NFT operations fail**
- Check wallet is connected
- Verify sufficient balance for gas fees
- Ensure correct network is selected
- Check contract address is valid

**Yuku marketplace errors**
- Verify network is supported
- Check listing/offer is still active
- Ensure sufficient balance for purchase

## Migration from Mocks

If you were using mock classes (e.g., from `lib/core/mocks/nft_mocks.dart`), migration is straightforward:

### Before (using mocks):
```dart
import 'package:your_app/core/mocks/nft_mocks.dart';

final mockClient = NFTClient();
```

### After (using flutter_magento):
```dart
import 'package:flutter_magento/flutter_magento.dart';

final nftService = FlutterMagentoNFTService.instance;
await nftService.initialize();
```

## Support

- Documentation: [GitLab Wiki](https://gitlab.com/libsFlutter/flutter_magento/-/wikis)
- Issues: [GitLab Issues](https://gitlab.com/libsFlutter/flutter_magento/-/issues)
- Repository: [GitLab](https://gitlab.com/libsFlutter/flutter_magento)

## License

See LICENSE file in the repository.

## Contributing

Contributions are welcome! Please see CONTRIBUTING.md for guidelines.

