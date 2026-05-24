/// Example demonstrating blockchain integration with flutter_magento
///
/// This example shows how to use ICP, NFT, and Yuku services
/// integrated into flutter_magento for e-commerce applications

import 'package:flutter/material.dart';
import '../services/flutter_magento_icp_service.dart';
import '../services/flutter_magento_nft_service.dart';
import '../services/flutter_magento_yuku_service.dart';

/// Example: Initialize blockchain services
Future<void> initializeBlockchainServices() async {
  // Initialize ICP Service
  final icpService = FlutterMagentoICPService.instance;
  await icpService.initialize(
    enabled: true,
    network: 'testnet', // or 'mainnet'
    enableDebug: true,
  );

  // Initialize NFT Service
  final nftService = FlutterMagentoNFTService.instance;
  await nftService.initialize(
    enabled: true,
    defaultNetwork: 'polygon', // ethereum, polygon, bsc, avalanche, solana
    enableDebug: true,
  );

  // Initialize Yuku Service (Universal blockchain interface)
  final yukuService = FlutterMagentoYukuService.instance;
  await yukuService.initialize(
    enabled: true,
    defaultNetwork: 'icp',
    enableDebug: true,
  );

  debugPrint('All blockchain services initialized');
}

/// Example: ICP Wallet Operations
class ICPWalletExample {
  final icpService = FlutterMagentoICPService.instance;

  /// Connect to Plug Wallet
  Future<bool> connectWallet() async {
    final connected = await icpService.connectWallet();
    if (connected) {
      debugPrint('Wallet connected');
      debugPrint('Principal: ${icpService.walletPrincipal}');
      debugPrint('Account ID: ${icpService.walletAccountId}');
    }
    return connected;
  }

  /// Get wallet balance
  Future<void> checkBalance() async {
    final balances = await icpService.getWalletBalance();
    debugPrint('Wallet balances:');
    balances.forEach((currency, amount) {
      debugPrint('  $currency: ${icpService.formatBalance(amount, currency)}');
    });
  }

  /// Send ICP transaction
  Future<bool> sendICP(String toAddress, double amount) async {
    final success = await icpService.sendTransaction(
      to: toAddress,
      amount: amount,
      currency: 'ICP',
      memo: 'Payment from flutter_magento app',
    );

    if (success) {
      debugPrint('Transaction sent successfully');
    } else {
      debugPrint('Transaction failed: ${icpService.error}');
    }

    return success;
  }

  /// Get transaction history
  Future<void> getHistory() async {
    final history = await icpService.getTransactionHistory();
    debugPrint('Transaction history (${history.length} transactions):');
    for (final tx in history) {
      debugPrint(
        '  ${tx['type']}: ${tx['amount']} ${tx['currency']} - ${tx['status']}',
      );
    }
  }

  /// Get NFTs from wallet
  Future<void> getWalletNFTs() async {
    final nfts = await icpService.getNFTBalances();
    debugPrint('Wallet NFTs (${nfts.length} NFTs):');
    for (final nft in nfts) {
      debugPrint('  ${nft['name']}: ${nft['id']}');
    }
  }
}

/// Example: NFT Operations (EVM chains)
class NFTOperationsExample {
  final nftService = FlutterMagentoNFTService.instance;

  /// Connect wallet (MetaMask, WalletConnect, etc.)
  Future<bool> connectWallet() async {
    final connected = await nftService.connectWallet();
    if (connected) {
      debugPrint('Wallet connected');
      debugPrint('Address: ${nftService.connectedAddress}');
    }
    return connected;
  }

  /// Get user's NFTs
  Future<void> getUserNFTs(String ownerAddress) async {
    final nfts = await nftService.getNFTsByOwner(ownerAddress);
    debugPrint('User NFTs (${nfts.length} NFTs):');
    for (final nft in nfts) {
      debugPrint('  ${nft.name} (${nft.id})');
    }
  }

  /// Mint NFT for product
  Future<String?> mintProductNFT({
    required String toAddress,
    required String productName,
    required String productImage,
    required Map<String, dynamic> productAttributes,
  }) async {
    // Create NFT metadata for product
    final metadata = NFTMetadata(
      name: productName,
      description: 'NFT Certificate for $productName',
      image: productImage,
      attributes: productAttributes,
    );

    final tokenId = await nftService.mintNFT(
      toAddress: toAddress,
      metadata: metadata,
      contractAddress: '0x...', // Your NFT contract
    );

    if (tokenId != null) {
      debugPrint('NFT minted successfully: $tokenId');
    }

    return tokenId;
  }

  /// Transfer NFT (e.g., after purchase)
  Future<bool> transferProductNFT({
    required String tokenId,
    required String fromAddress,
    required String toAddress,
  }) async {
    final txHash = await nftService.transferNFT(
      tokenId: tokenId,
      fromAddress: fromAddress,
      toAddress: toAddress,
    );

    return txHash != null;
  }

  /// Get marketplace listings
  Future<void> getMarketplaceListings() async {
    final listings = await nftService.getActiveListings();
    debugPrint('Marketplace listings (${listings.length} listings):');
    for (final listing in listings) {
      debugPrint('  ${listing.id}: ${listing.price}');
    }
  }

  /// List NFT for sale
  Future<String?> listNFTForSale({
    required String tokenId,
    required double price,
  }) async {
    return await nftService.createListing(tokenId: tokenId, price: price);
  }

  /// Buy NFT from marketplace
  Future<bool> buyNFT(String listingId) async {
    final txHash = await nftService.buyNFT(listingId);
    return txHash != null;
  }

  /// Switch blockchain network
  Future<void> switchNetwork(String network) async {
    final switched = await nftService.switchNetwork(network);
    if (switched) {
      debugPrint('Switched to network: $network');
      debugPrint('Supported networks: ${nftService.getSupportedNetworks()}');
    }
  }
}

/// Example: Yuku Universal Blockchain Operations
class YukuUniversalExample {
  final yukuService = FlutterMagentoYukuService.instance;

  /// Connect wallet (works across all networks)
  Future<bool> connectWallet() async {
    final connected = await yukuService.connectWallet();
    if (connected) {
      debugPrint('Wallet connected');
      debugPrint('Address: ${yukuService.connectedAddress}');
      debugPrint('Network: ${yukuService.activeNetwork}');
    }
    return connected;
  }

  /// Get NFTs (universal across chains)
  Future<void> getUserNFTs(String ownerAddress) async {
    final nfts = await yukuService.getNFTsByOwner(ownerAddress);
    debugPrint('User NFTs (${nfts.length} NFTs):');
    for (final nft in nfts) {
      debugPrint('  ${nft.name} on ${nft.contractAddress}');
    }
  }

  /// Create marketplace listing
  Future<String?> createListing({
    required String nftId,
    required String contractAddress,
    required double price,
    String currency = 'ICP',
  }) async {
    return await yukuService.createListing(
      nftId: nftId,
      contractAddress: contractAddress,
      price: price,
      currency: currency,
      expirationDays: 30,
    );
  }

  /// Make offer on NFT
  Future<String?> makeOffer({
    required String nftId,
    required String contractAddress,
    required double amount,
    String currency = 'ICP',
  }) async {
    return await yukuService.makeOffer(
      nftId: nftId,
      contractAddress: contractAddress,
      amount: amount,
      currency: currency,
      expirationDays: 7,
    );
  }

  /// Search marketplace
  Future<void> searchMarketplace(String query) async {
    final listings = await yukuService.searchListings(name: query, limit: 20);

    debugPrint('Search results (${listings.length} listings):');
    for (final listing in listings) {
      debugPrint('  ${listing.nftId}: ${listing.price} ${listing.currency}');
    }
  }

  /// Get marketplace statistics
  Future<void> getMarketStats() async {
    final stats = await yukuService.getMarketplaceStats();
    debugPrint('Marketplace Statistics:');
    debugPrint('  ${stats}');
  }

  /// Switch blockchain network
  Future<void> switchNetwork(String network) async {
    final switched = await yukuService.switchNetwork(network);
    if (switched) {
      debugPrint('Switched to: $network');
      debugPrint('Supported networks: ${yukuService.getSupportedNetworks()}');
    }
  }

  /// Get provider information
  void getProviderInfo() {
    final clientInfo = yukuService.getClientInfo();
    final stats = yukuService.getProviderStats();

    debugPrint('Yuku Client Info:');
    debugPrint('  $clientInfo');
    debugPrint('Provider Stats:');
    debugPrint('  $stats');
  }
}

/// Complete e-commerce example combining all services
class BlockchainECommerceExample {
  final icpService = FlutterMagentoICPService.instance;
  final nftService = FlutterMagentoNFTService.instance;
  final yukuService = FlutterMagentoYukuService.instance;

  /// Purchase product with ICP and receive NFT certificate
  Future<bool> purchaseWithICPAndMintNFT({
    required String productName,
    required double price,
    required String sellerAddress,
    required String buyerAddress,
    required Map<String, dynamic> productData,
  }) async {
    try {
      // 1. Connect ICP wallet
      final icpConnected = await icpService.connectWallet();
      if (!icpConnected) {
        debugPrint('Failed to connect ICP wallet');
        return false;
      }

      // 2. Send ICP payment
      final paymentSuccess = await icpService.sendTransaction(
        to: sellerAddress,
        amount: price,
        currency: 'ICP',
        memo: 'Purchase: $productName',
      );

      if (!paymentSuccess) {
        debugPrint('Payment failed');
        return false;
      }

      // 3. Mint NFT certificate on Polygon
      await nftService.switchNetwork('polygon');
      final nftConnected = await nftService.connectWallet();

      if (!nftConnected) {
        debugPrint('Failed to connect NFT wallet');
        return false;
      }

      final metadata = NFTMetadata(
        name: 'Certificate: $productName',
        description: 'Ownership certificate for $productName',
        image: productData['image'] as String,
        attributes: productData,
      );

      final tokenId = await nftService.mintNFT(
        toAddress: buyerAddress,
        metadata: metadata,
      );

      if (tokenId != null) {
        debugPrint('Purchase completed! NFT Certificate: $tokenId');
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('Error during purchase: $e');
      return false;
    }
  }

  /// List product NFT on marketplace
  Future<String?> listProductOnMarketplace({
    required String nftId,
    required String contractAddress,
    required double price,
    String network = 'icp',
  }) async {
    // Use Yuku for universal marketplace
    await yukuService.switchNetwork(network);

    final connected = await yukuService.connectWallet();
    if (!connected) return null;

    return await yukuService.createListing(
      nftId: nftId,
      contractAddress: contractAddress,
      price: price,
      currency: 'ICP',
    );
  }

  /// Get wallet info across all services
  Future<Map<String, dynamic>> getWalletInfo() async {
    return {
      'icp': {
        'connected': icpService.isWalletConnected,
        'principal': icpService.walletPrincipal,
        'balances': await icpService.getWalletBalance(),
      },
      'nft': {
        'connected': nftService.isWalletConnected,
        'address': nftService.connectedAddress,
        'network': nftService.activeNetwork?.name,
      },
      'yuku': {
        'connected': yukuService.isWalletConnected,
        'address': yukuService.connectedAddress,
        'network': yukuService.activeNetwork?.name,
      },
    };
  }
}

/// Widget example showing UI integration
class BlockchainIntegrationWidget extends StatefulWidget {
  const BlockchainIntegrationWidget({super.key});

  @override
  State<BlockchainIntegrationWidget> createState() =>
      _BlockchainIntegrationWidgetState();
}

class _BlockchainIntegrationWidgetState
    extends State<BlockchainIntegrationWidget> {
  final icpService = FlutterMagentoICPService.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blockchain Integration')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ICP Wallet Section
          Card(
            child: ListTile(
              title: const Text('ICP Wallet'),
              subtitle: Text(
                icpService.isWalletConnected
                    ? 'Connected: ${icpService.formatPrincipal(icpService.walletPrincipal!)}'
                    : 'Not connected',
              ),
              trailing: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        setState(() => isLoading = true);
                        if (icpService.isWalletConnected) {
                          await icpService.disconnectWallet();
                        } else {
                          await icpService.connectWallet();
                        }
                        setState(() => isLoading = false);
                      },
                child: Text(
                  icpService.isWalletConnected ? 'Disconnect' : 'Connect',
                ),
              ),
            ),
          ),

          // Balance Display
          if (icpService.isWalletConnected)
            FutureBuilder<Map<String, double>>(
              future: icpService.getWalletBalance(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Balances:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ...snapshot.data!.entries.map(
                          (e) => Text(
                            '${e.key}: ${icpService.formatBalance(e.value, e.key)}',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
