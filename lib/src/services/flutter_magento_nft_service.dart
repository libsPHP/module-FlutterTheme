import 'package:flutter/foundation.dart';
import 'package:flutter_nft/flutter_nft.dart';
import 'package:flutter_yuku/flutter_yuku.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Flutter Magento NFT Service
/// Provides NFT operations across multiple EVM-compatible blockchains
/// through the flutter_nft package
class FlutterMagentoNFTService {
  static FlutterMagentoNFTService? _instance;

  NFTProviderManager? _providerManager;
  NFTProvider? _currentNFTProvider;
  WalletProvider? _currentWalletProvider;
  MarketplaceProvider? _currentMarketplaceProvider;

  bool _isInitialized = false;
  bool _isEnabled = false;
  String? _defaultNetwork;
  String? _contractAddress;
  bool _enableDebug = false;
  BlockchainNetwork? _activeNetwork;

  FlutterMagentoNFTService._internal();

  static FlutterMagentoNFTService get instance {
    _instance ??= FlutterMagentoNFTService._internal();
    return _instance!;
  }

  /// Initialize NFT service
  Future<void> initialize({
    bool? enabled,
    String? defaultNetwork,
    String? contractAddress,
    bool? enableDebug,
  }) async {
    try {
      if (_isInitialized) {
        _log('NFT service already initialized');
        return;
      }

      // Load settings from environment or use provided values
      final prefs = await SharedPreferences.getInstance();
      _isEnabled = enabled ?? prefs.getBool('ENABLE_NFT') ?? true;
      _defaultNetwork =
          defaultNetwork ?? prefs.getString('NFT_DEFAULT_NETWORK') ?? 'polygon';
      _contractAddress =
          contractAddress ?? prefs.getString('NFT_CONTRACT_ADDRESS');
      _enableDebug = enableDebug ?? prefs.getBool('NFT_ENABLE_DEBUG') ?? false;

      if (!_isEnabled) {
        _log('NFT service is disabled');
        _isInitialized = true;
        return;
      }

      _log('Initializing NFT service...');
      _log('Default Network: $_defaultNetwork');
      _log('Contract Address: $_contractAddress');

      // Initialize NFT Provider Manager
      _providerManager = NFTProviderManager.instance;

      // Set active network
      _activeNetwork = _getNetwork(_defaultNetwork!);

      // Register default providers
      await _registerDefaultProviders();

      // Initialize all providers
      await _providerManager?.initializeAllProviders();

      // Get providers for active network
      _currentNFTProvider = _providerManager?.getNFTProviderByNetwork(
        _activeNetwork!,
      );
      _currentWalletProvider = _providerManager?.getWalletProviderByNetwork(
        _activeNetwork!,
      );
      _currentMarketplaceProvider = _providerManager
          ?.getMarketplaceProviderByNetwork(_activeNetwork!);

      _isInitialized = true;
      _log('NFT service initialized successfully');
    } catch (e) {
      _log('Error initializing NFT service: $e');
      rethrow;
    }
  }

  /// Register default providers based on network
  Future<void> _registerDefaultProviders() async {
    // Register Ethereum provider
    final ethereumProvider = EthereumNFTProvider();
    _providerManager?.registerNFTProvider(ethereumProvider);

    final ethereumWallet = EthereumWalletProvider();
    _providerManager?.registerWalletProvider(ethereumWallet);

    final openseaMarketplace = OpenseaMarketplaceProvider();
    _providerManager?.registerMarketplaceProvider(openseaMarketplace);

    // Register Polygon provider
    final polygonProvider = PolygonNFTProvider();
    _providerManager?.registerNFTProvider(polygonProvider);

    // Register BSC provider
    final bscProvider = BSCNFTProvider();
    _providerManager?.registerNFTProvider(bscProvider);

    // Register Avalanche provider
    final avalancheProvider = AvalancheNFTProvider();
    _providerManager?.registerNFTProvider(avalancheProvider);

    // Register Solana provider (if needed)
    final solanaProvider = SolanaNFTProvider();
    _providerManager?.registerNFTProvider(solanaProvider);
  }

  /// Check if NFT service is enabled
  bool get isEnabled => _isEnabled;

  /// Check if NFT service is initialized
  bool get isInitialized => _isInitialized;

  /// Get provider manager
  NFTProviderManager? get providerManager => _providerManager;

  /// Get current NFT provider
  NFTProvider? get nftProvider => _currentNFTProvider;

  /// Get current wallet provider
  WalletProvider? get walletProvider => _currentWalletProvider;

  /// Get current marketplace provider
  MarketplaceProvider? get marketplaceProvider => _currentMarketplaceProvider;

  /// Switch to different network
  Future<bool> switchNetwork(String network) async {
    if (!_isEnabled || !_isInitialized) return false;

    try {
      final blockchainNetwork = _getNetwork(network);
      _activeNetwork = blockchainNetwork;

      // Get providers for new network
      _currentNFTProvider = _providerManager?.getNFTProviderByNetwork(
        blockchainNetwork,
      );
      _currentWalletProvider = _providerManager?.getWalletProviderByNetwork(
        blockchainNetwork,
      );
      _currentMarketplaceProvider = _providerManager
          ?.getMarketplaceProviderByNetwork(blockchainNetwork);

      _log('Switched to network: $network');
      return true;
    } catch (e) {
      _log('Error switching network: $e');
      return false;
    }
  }

  /// Get NFTs owned by address
  Future<List<NFT>> getNFTsByOwner(String ownerAddress) async {
    if (!_isEnabled || !_isInitialized || _currentNFTProvider == null)
      return [];

    try {
      _log('Getting NFTs for owner: $ownerAddress');
      final nfts = await _currentNFTProvider!.getNFTsByOwner(ownerAddress);
      return nfts;
    } catch (e) {
      _log('Error getting NFTs by owner: $e');
      return [];
    }
  }

  /// Get NFT by token ID
  Future<NFT?> getNFT(String tokenId, String contractAddress) async {
    if (!_isEnabled || !_isInitialized || _currentNFTProvider == null)
      return null;

    try {
      _log('Getting NFT with token ID: $tokenId');
      final nft = await _currentNFTProvider!.getNFT(tokenId, contractAddress);
      return nft;
    } catch (e) {
      _log('Error getting NFT: $e');
      return null;
    }
  }

  /// Mint NFT
  Future<String?> mintNFT({
    required String toAddress,
    required NFTMetadata metadata,
    String? contractAddress,
  }) async {
    if (!_isEnabled || !_isInitialized || _currentNFTProvider == null) {
      _log('NFT service is not enabled or not initialized');
      return null;
    }

    try {
      _log('Minting NFT to $toAddress');
      final tokenId = await _currentNFTProvider!.mintNFT(
        toAddress: toAddress,
        metadata: metadata,
        contractAddress: contractAddress ?? _contractAddress ?? '',
      );
      _log('NFT minted with token ID: $tokenId');
      return tokenId;
    } catch (e) {
      _log('Error minting NFT: $e');
      return null;
    }
  }

  /// Transfer NFT
  Future<String?> transferNFT({
    required String tokenId,
    required String fromAddress,
    required String toAddress,
    String? contractAddress,
  }) async {
    if (!_isEnabled || !_isInitialized || _currentNFTProvider == null) {
      _log('NFT service is not enabled or not initialized');
      return null;
    }

    try {
      _log('Transferring NFT $tokenId from $fromAddress to $toAddress');
      final transactionHash = await _currentNFTProvider!.transferNFT(
        tokenId: tokenId,
        fromAddress: fromAddress,
        toAddress: toAddress,
        contractAddress: contractAddress ?? _contractAddress ?? '',
      );
      _log('Transfer completed: $transactionHash');
      return transactionHash;
    } catch (e) {
      _log('Error transferring NFT: $e');
      return null;
    }
  }

  /// Burn NFT
  Future<String?> burnNFT({
    required String tokenId,
    required String ownerAddress,
    String? contractAddress,
  }) async {
    if (!_isEnabled || !_isInitialized || _currentNFTProvider == null) {
      _log('NFT service is not enabled or not initialized');
      return null;
    }

    try {
      _log('Burning NFT: $tokenId');
      final transactionHash = await _currentNFTProvider!.burnNFT(
        tokenId: tokenId,
        ownerAddress: ownerAddress,
        contractAddress: contractAddress ?? _contractAddress ?? '',
      );
      _log('Burn completed: $transactionHash');
      return transactionHash;
    } catch (e) {
      _log('Error burning NFT: $e');
      return null;
    }
  }

  /// Get NFT metadata
  Future<NFTMetadata?> getNFTMetadata({
    required String tokenId,
    String? contractAddress,
  }) async {
    if (!_isEnabled || !_isInitialized || _currentNFTProvider == null)
      return null;

    try {
      return await _currentNFTProvider!.getNFTMetadata(
        tokenId: tokenId,
        contractAddress: contractAddress ?? _contractAddress ?? '',
      );
    } catch (e) {
      _log('Error getting NFT metadata: $e');
      return null;
    }
  }

  /// Connect wallet
  Future<bool> connectWallet() async {
    if (!_isEnabled || !_isInitialized || _currentWalletProvider == null) {
      _log('NFT service is not enabled or not initialized');
      return false;
    }

    try {
      _log('Connecting wallet...');
      await _currentWalletProvider!.connect();
      _log('Wallet connected');
      return true;
    } catch (e) {
      _log('Error connecting wallet: $e');
      return false;
    }
  }

  /// Disconnect wallet
  Future<void> disconnectWallet() async {
    if (!_isEnabled || !_isInitialized || _currentWalletProvider == null)
      return;

    try {
      _log('Disconnecting wallet...');
      await _currentWalletProvider!.disconnect();
      _log('Wallet disconnected');
    } catch (e) {
      _log('Error disconnecting wallet: $e');
    }
  }

  /// Check if wallet is connected
  bool get isWalletConnected => _currentWalletProvider?.isConnected ?? false;

  /// Get connected wallet address
  String? get connectedAddress => _currentWalletProvider?.connectedAddress;

  /// Get wallet balance
  Future<double> getWalletBalance() async {
    if (!_isEnabled || !_isInitialized || _currentWalletProvider == null)
      return 0.0;

    try {
      return await _currentWalletProvider!.getBalance();
    } catch (e) {
      _log('Error getting wallet balance: $e');
      return 0.0;
    }
  }

  /// Get transaction history
  Future<List<Transaction>> getTransactionHistory() async {
    if (!_isEnabled || !_isInitialized || _currentWalletProvider == null)
      return [];

    try {
      return await _currentWalletProvider!.getTransactionHistory();
    } catch (e) {
      _log('Error getting transaction history: $e');
      return [];
    }
  }

  /// Get active marketplace listings
  Future<List<NFTListing>> getActiveListings() async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null)
      return [];

    try {
      _log('Getting active marketplace listings');
      final listings = await _currentMarketplaceProvider!.getActiveListings();
      return listings;
    } catch (e) {
      _log('Error getting active listings: $e');
      return [];
    }
  }

  /// Create listing
  Future<String?> createListing({
    required String tokenId,
    required double price,
    String? contractAddress,
  }) async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null) {
      _log('NFT service is not enabled or not initialized');
      return null;
    }

    try {
      _log('Creating listing for NFT: $tokenId at price: $price');
      final listingId = await _currentMarketplaceProvider!.createListing(
        tokenId: tokenId,
        price: price,
        contractAddress: contractAddress ?? _contractAddress ?? '',
      );
      _log('Listing created with ID: $listingId');
      return listingId;
    } catch (e) {
      _log('Error creating listing: $e');
      return null;
    }
  }

  /// Buy NFT from marketplace
  Future<String?> buyNFT(String listingId) async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null) {
      _log('NFT service is not enabled or not initialized');
      return null;
    }

    try {
      _log('Buying NFT from listing: $listingId');
      final transactionHash = await _currentMarketplaceProvider!.buyNFT(
        listingId: listingId,
        buyerAddress: connectedAddress ?? '',
      );
      _log('Buy completed: $transactionHash');
      return transactionHash;
    } catch (e) {
      _log('Error buying NFT: $e');
      return null;
    }
  }

  /// Cancel listing
  Future<bool> cancelListing(String listingId) async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null)
      return false;

    try {
      _log('Cancelling listing: $listingId');
      final result = await _currentMarketplaceProvider!.cancelListing(
        listingId,
      );
      return result;
    } catch (e) {
      _log('Error cancelling listing: $e');
      return false;
    }
  }

  /// Make offer
  Future<String?> makeOffer({
    required String nftId,
    required double amount,
  }) async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null) {
      _log('NFT service is not enabled or not initialized');
      return null;
    }

    try {
      _log('Making offer for NFT: $nftId with amount: $amount');
      final offerId = await _currentMarketplaceProvider!.makeOffer(
        nftId: nftId,
        amount: amount,
        buyerAddress: connectedAddress ?? '',
      );
      _log('Offer created with ID: $offerId');
      return offerId;
    } catch (e) {
      _log('Error making offer: $e');
      return null;
    }
  }

  /// Get offers for NFT
  Future<List<NFTOffer>> getOffersForNFT(String nftId) async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null)
      return [];

    try {
      return await _currentMarketplaceProvider!.getActiveOffers();
    } catch (e) {
      _log('Error getting offers: $e');
      return [];
    }
  }

  /// Accept offer
  Future<bool> acceptOffer(String offerId) async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null)
      return false;

    try {
      _log('Accepting offer: $offerId');
      final result = await _currentMarketplaceProvider!.acceptOffer(offerId);
      return result;
    } catch (e) {
      _log('Error accepting offer: $e');
      return false;
    }
  }

  /// Reject offer
  Future<bool> rejectOffer(String offerId) async {
    if (!_isEnabled || !_isInitialized || _currentMarketplaceProvider == null)
      return false;

    try {
      _log('Rejecting offer: $offerId');
      final result = await _currentMarketplaceProvider!.rejectOffer(offerId);
      return result;
    } catch (e) {
      _log('Error rejecting offer: $e');
      return false;
    }
  }

  /// Search NFTs
  Future<List<NFT>> searchNFTs({
    String? name,
    String? description,
    String? contractAddress,
    int? limit,
  }) async {
    if (!_isEnabled || !_isInitialized || _currentNFTProvider == null)
      return [];

    try {
      _log('Searching NFTs');
      return await _currentNFTProvider!.searchNFTs(
        name: name,
        description: description,
        contractAddress: contractAddress,
        limit: limit,
      );
    } catch (e) {
      _log('Error searching NFTs: $e');
      return [];
    }
  }

  /// Get supported networks
  Set<BlockchainNetwork> getSupportedNetworks() {
    return _providerManager?.getSupportedNetworks() ?? {};
  }

  /// Check if network is supported
  bool isNetworkSupported(BlockchainNetwork network) {
    return _providerManager?.isNetworkSupported(network) ?? false;
  }

  /// Get provider statistics
  Map<String, dynamic> getProviderStats() {
    return _providerManager?.getProviderStats() ?? {};
  }

  /// Get network enum from string
  BlockchainNetwork _getNetwork(String network) {
    switch (network.toLowerCase()) {
      case 'ethereum':
        return BlockchainNetwork.ethereum;
      case 'polygon':
        return BlockchainNetwork.polygon;
      case 'bsc':
      case 'binance':
        return BlockchainNetwork.bsc;
      case 'avalanche':
        return BlockchainNetwork.avalanche;
      case 'solana':
        return BlockchainNetwork.solana;
      case 'icp':
      case 'internet-computer':
        return BlockchainNetwork.icp;
      default:
        return BlockchainNetwork.polygon;
    }
  }

  /// Get default network
  String? get defaultNetwork => _defaultNetwork;

  /// Get active network
  BlockchainNetwork? get activeNetwork => _activeNetwork;

  /// Get contract address
  String? get contractAddress => _contractAddress;

  /// Dispose resources
  Future<void> dispose() async {
    await _providerManager?.disposeAllProviders();
    _isInitialized = false;
  }

  void _log(String message) {
    if (_enableDebug && kDebugMode) {
      debugPrint('[FlutterMagento-NFT] $message');
    }
  }
}
