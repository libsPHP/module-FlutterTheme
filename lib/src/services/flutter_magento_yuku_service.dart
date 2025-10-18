import 'package:flutter/foundation.dart';
import 'package:flutter_yuku/flutter_yuku.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Flutter Magento Yuku Service
/// Provides universal blockchain integration through flutter_yuku
/// Supporting multiple networks with unified interface
class FlutterMagentoYukuService {
  static FlutterMagentoYukuService? _instance;

  YukuClient? _yukuClient;

  bool _isInitialized = false;
  bool _isEnabled = false;
  String? _defaultNetwork;
  bool _enableDebug = false;
  BlockchainNetwork? _activeNetwork;

  FlutterMagentoYukuService._internal();

  static FlutterMagentoYukuService get instance {
    _instance ??= FlutterMagentoYukuService._internal();
    return _instance!;
  }

  /// Initialize Yuku service
  Future<void> initialize({
    bool? enabled,
    String? defaultNetwork,
    bool? enableDebug,
  }) async {
    try {
      if (_isInitialized) {
        _log('Yuku service already initialized');
        return;
      }

      // Load settings from environment or use provided values
      final prefs = await SharedPreferences.getInstance();
      _isEnabled = enabled ?? prefs.getBool('ENABLE_YUKU') ?? true;
      _defaultNetwork =
          defaultNetwork ?? prefs.getString('YUKU_DEFAULT_NETWORK') ?? 'icp';
      _enableDebug = enableDebug ?? prefs.getBool('YUKU_ENABLE_DEBUG') ?? false;

      if (!_isEnabled) {
        _log('Yuku service is disabled');
        _isInitialized = true;
        return;
      }

      _log('Initializing Yuku service...');
      _log('Default Network: $_defaultNetwork');

      // Initialize Yuku client
      _yukuClient = YukuClient();

      // Set active network
      _activeNetwork = _getNetwork(_defaultNetwork!);

      // Initialize client
      await _yukuClient?.initialize();

      _isInitialized = true;
      _log('Yuku service initialized successfully');
    } catch (e) {
      _log('Error initializing Yuku service: $e');
      rethrow;
    }
  }

  /// Check if Yuku service is enabled
  bool get isEnabled => _isEnabled;

  /// Check if Yuku service is initialized
  bool get isInitialized => _isInitialized;

  /// Get Yuku client
  YukuClient? get client => _yukuClient;

  /// Get active network
  BlockchainNetwork? get activeNetwork => _activeNetwork;

  /// Switch to different network
  Future<bool> switchNetwork(String network) async {
    if (!_isEnabled || !_isInitialized) return false;

    try {
      _activeNetwork = _getNetwork(network);
      _log('Switched to network: $network');
      return true;
    } catch (e) {
      _log('Error switching network: $e');
      return false;
    }
  }

  /// Get NFT provider for current network
  NFTProvider? getNFTProvider() {
    if (!_isEnabled || !_isInitialized || _activeNetwork == null) return null;
    return _yukuClient?.getNFTProvider(_activeNetwork!);
  }

  /// Get wallet provider for current network
  WalletProvider? getWalletProvider() {
    if (!_isEnabled || !_isInitialized || _activeNetwork == null) return null;
    return _yukuClient?.getWalletProvider(_activeNetwork!);
  }

  /// Get marketplace provider for current network
  MarketplaceProvider? getMarketplaceProvider() {
    if (!_isEnabled || !_isInitialized || _activeNetwork == null) return null;
    return _yukuClient?.getMarketplaceProvider(_activeNetwork!);
  }

  /// Register custom NFT provider
  void registerNFTProvider(NFTProvider provider) {
    _yukuClient?.registerNFTProvider(provider);
    _log('Registered NFT provider: ${provider.name}');
  }

  /// Register custom wallet provider
  void registerWalletProvider(WalletProvider provider) {
    _yukuClient?.registerWalletProvider(provider);
    _log('Registered wallet provider: ${provider.name}');
  }

  /// Register custom marketplace provider
  void registerMarketplaceProvider(MarketplaceProvider provider) {
    _yukuClient?.registerMarketplaceProvider(provider);
    _log('Registered marketplace provider: ${provider.name}');
  }

  /// Get NFTs by owner
  Future<List<NFT>> getNFTsByOwner(String ownerAddress) async {
    if (!_isEnabled || !_isInitialized) return [];

    final provider = getNFTProvider();
    if (provider == null) {
      _log('NFT provider not available for network: $_activeNetwork');
      return [];
    }

    try {
      _log('Getting NFTs for owner: $ownerAddress');
      return await provider.getNFTsByOwner(ownerAddress);
    } catch (e) {
      _log('Error getting NFTs: $e');
      return [];
    }
  }

  /// Get NFT by token ID
  Future<NFT?> getNFT(String tokenId, String contractAddress) async {
    if (!_isEnabled || !_isInitialized) return null;

    final provider = getNFTProvider();
    if (provider == null) return null;

    try {
      return await provider.getNFT(tokenId, contractAddress);
    } catch (e) {
      _log('Error getting NFT: $e');
      return null;
    }
  }

  /// Mint NFT
  Future<String?> mintNFT({
    required String toAddress,
    required NFTMetadata metadata,
    required String contractAddress,
  }) async {
    if (!_isEnabled || !_isInitialized) return null;

    final provider = getNFTProvider();
    if (provider == null) return null;

    try {
      _log('Minting NFT to: $toAddress');
      return await provider.mintNFT(
        toAddress: toAddress,
        metadata: metadata,
        contractAddress: contractAddress,
      );
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
    required String contractAddress,
  }) async {
    if (!_isEnabled || !_isInitialized) return null;

    final provider = getNFTProvider();
    if (provider == null) return null;

    try {
      _log('Transferring NFT: $tokenId');
      return await provider.transferNFT(
        tokenId: tokenId,
        fromAddress: fromAddress,
        toAddress: toAddress,
        contractAddress: contractAddress,
      );
    } catch (e) {
      _log('Error transferring NFT: $e');
      return null;
    }
  }

  /// Connect wallet
  Future<bool> connectWallet() async {
    if (!_isEnabled || !_isInitialized) return false;

    final provider = getWalletProvider();
    if (provider == null) {
      _log('Wallet provider not available for network: $_activeNetwork');
      return false;
    }

    try {
      _log('Connecting wallet...');
      await provider.connect();
      _log('Wallet connected');
      return true;
    } catch (e) {
      _log('Error connecting wallet: $e');
      return false;
    }
  }

  /// Disconnect wallet
  Future<void> disconnectWallet() async {
    if (!_isEnabled || !_isInitialized) return;

    final provider = getWalletProvider();
    if (provider == null) return;

    try {
      await provider.disconnect();
      _log('Wallet disconnected');
    } catch (e) {
      _log('Error disconnecting wallet: $e');
    }
  }

  /// Check if wallet is connected
  bool get isWalletConnected {
    final provider = getWalletProvider();
    return provider?.isConnected ?? false;
  }

  /// Get connected wallet address
  String? get connectedAddress {
    final provider = getWalletProvider();
    return provider?.currentAddress;
  }

  /// Get wallet balance
  Future<double> getWalletBalance(String address) async {
    if (!_isEnabled || !_isInitialized) return 0.0;

    final provider = getWalletProvider();
    if (provider == null) return 0.0;

    try {
      return await provider.getBalance(address);
    } catch (e) {
      _log('Error getting wallet balance: $e');
      return 0.0;
    }
  }

  /// Send transaction
  Future<String?> sendTransaction({
    required String to,
    required double amount,
    required String currency,
    String? memo,
  }) async {
    if (!_isEnabled || !_isInitialized) return null;

    final provider = getWalletProvider();
    if (provider == null) return null;

    try {
      _log('Sending transaction to: $to, amount: $amount $currency');
      return await provider.sendTransaction(
        to: to,
        amount: amount,
        currency: currency,
        memo: memo,
      );
    } catch (e) {
      _log('Error sending transaction: $e');
      return null;
    }
  }

  /// Get transaction history
  Future<List<Map<String, dynamic>>> getTransactionHistory({
    String? address,
    int? limit,
  }) async {
    if (!_isEnabled || !_isInitialized) return [];

    final provider = getWalletProvider();
    if (provider == null) return [];

    try {
      return await provider.getTransactionHistory(
        address: address,
        limit: limit,
      );
    } catch (e) {
      _log('Error getting transaction history: $e');
      return [];
    }
  }

  /// Get active marketplace listings
  Future<List<NFTListing>> getActiveListings() async {
    if (!_isEnabled || !_isInitialized) return [];

    final provider = getMarketplaceProvider();
    if (provider == null) {
      _log('Marketplace provider not available for network: $_activeNetwork');
      return [];
    }

    try {
      _log('Getting active listings');
      return await provider.getActiveListings();
    } catch (e) {
      _log('Error getting listings: $e');
      return [];
    }
  }

  /// Get user listings
  Future<List<NFTListing>> getUserListings(String userAddress) async {
    if (!_isEnabled || !_isInitialized) return [];

    final provider = getMarketplaceProvider();
    if (provider == null) return [];

    try {
      return await provider.getUserListings(userAddress);
    } catch (e) {
      _log('Error getting user listings: $e');
      return [];
    }
  }

  /// Create listing
  Future<String?> createListing({
    required String nftId,
    required String contractAddress,
    required double price,
    required String currency,
    int? expirationDays,
  }) async {
    if (!_isEnabled || !_isInitialized) return null;

    final provider = getMarketplaceProvider();
    if (provider == null) return null;

    if (!isWalletConnected) {
      _log('Wallet not connected');
      return null;
    }

    try {
      _log('Creating listing for NFT: $nftId at price: $price $currency');
      return await provider.createListing(
        nftId: nftId,
        contractAddress: contractAddress,
        price: price,
        currency: currency,
        sellerAddress: connectedAddress!,
        expirationDays: expirationDays,
      );
    } catch (e) {
      _log('Error creating listing: $e');
      return null;
    }
  }

  /// Cancel listing
  Future<bool> cancelListing(String listingId) async {
    if (!_isEnabled || !_isInitialized) return false;

    final provider = getMarketplaceProvider();
    if (provider == null) return false;

    try {
      _log('Cancelling listing: $listingId');
      return await provider.cancelListing(listingId);
    } catch (e) {
      _log('Error cancelling listing: $e');
      return false;
    }
  }

  /// Buy NFT
  Future<String?> buyNFT(String listingId) async {
    if (!_isEnabled || !_isInitialized) return null;

    final provider = getMarketplaceProvider();
    if (provider == null) return null;

    if (!isWalletConnected) {
      _log('Wallet not connected');
      return null;
    }

    try {
      _log('Buying NFT from listing: $listingId');
      return await provider.buyNFT(
        listingId: listingId,
        buyerAddress: connectedAddress!,
      );
    } catch (e) {
      _log('Error buying NFT: $e');
      return null;
    }
  }

  /// Make offer
  Future<String?> makeOffer({
    required String nftId,
    required String contractAddress,
    required double amount,
    required String currency,
    int? expirationDays,
  }) async {
    if (!_isEnabled || !_isInitialized) return null;

    final provider = getMarketplaceProvider();
    if (provider == null) return null;

    if (!isWalletConnected) {
      _log('Wallet not connected');
      return null;
    }

    try {
      _log('Making offer for NFT: $nftId with amount: $amount $currency');
      return await provider.makeOffer(
        nftId: nftId,
        contractAddress: contractAddress,
        amount: amount,
        currency: currency,
        buyerAddress: connectedAddress!,
        expirationDays: expirationDays,
      );
    } catch (e) {
      _log('Error making offer: $e');
      return null;
    }
  }

  /// Get offers for NFT
  Future<List<NFTOffer>> getNFTOffers(
    String nftId,
    String contractAddress,
  ) async {
    if (!_isEnabled || !_isInitialized) return [];

    final provider = getMarketplaceProvider();
    if (provider == null) return [];

    try {
      return await provider.getNFTOffers(nftId, contractAddress);
    } catch (e) {
      _log('Error getting offers: $e');
      return [];
    }
  }

  /// Accept offer
  Future<bool> acceptOffer(String offerId) async {
    if (!_isEnabled || !_isInitialized) return false;

    final provider = getMarketplaceProvider();
    if (provider == null) return false;

    try {
      _log('Accepting offer: $offerId');
      return await provider.acceptOffer(offerId);
    } catch (e) {
      _log('Error accepting offer: $e');
      return false;
    }
  }

  /// Reject offer
  Future<bool> rejectOffer(String offerId) async {
    if (!_isEnabled || !_isInitialized) return false;

    final provider = getMarketplaceProvider();
    if (provider == null) return false;

    try {
      _log('Rejecting offer: $offerId');
      return await provider.rejectOffer(offerId);
    } catch (e) {
      _log('Error rejecting offer: $e');
      return false;
    }
  }

  /// Cancel offer
  Future<bool> cancelOffer(String offerId) async {
    if (!_isEnabled || !_isInitialized) return false;

    final provider = getMarketplaceProvider();
    if (provider == null) return false;

    try {
      _log('Cancelling offer: $offerId');
      return await provider.cancelOffer(offerId);
    } catch (e) {
      _log('Error cancelling offer: $e');
      return false;
    }
  }

  /// Search listings
  Future<List<NFTListing>> searchListings({
    String? name,
    String? description,
    double? minPrice,
    double? maxPrice,
    String? currency,
    String? contractAddress,
    int? limit,
  }) async {
    if (!_isEnabled || !_isInitialized) return [];

    final provider = getMarketplaceProvider();
    if (provider == null) return [];

    try {
      return await provider.searchListings(
        name: name,
        description: description,
        minPrice: minPrice,
        maxPrice: maxPrice,
        currency: currency,
        contractAddress: contractAddress,
        limit: limit,
      );
    } catch (e) {
      _log('Error searching listings: $e');
      return [];
    }
  }

  /// Get marketplace statistics
  Future<Map<String, dynamic>> getMarketplaceStats() async {
    if (!_isEnabled || !_isInitialized) return {};

    final provider = getMarketplaceProvider();
    if (provider == null) return {};

    try {
      return await provider.getMarketplaceStats();
    } catch (e) {
      _log('Error getting marketplace stats: $e');
      return {};
    }
  }

  /// Get collection statistics
  Future<Map<String, dynamic>> getCollectionStats(
    String contractAddress,
  ) async {
    if (!_isEnabled || !_isInitialized) return {};

    final provider = getMarketplaceProvider();
    if (provider == null) return {};

    try {
      return await provider.getCollectionStats(contractAddress);
    } catch (e) {
      _log('Error getting collection stats: $e');
      return {};
    }
  }

  /// Get supported networks
  Set<BlockchainNetwork> getSupportedNetworks() {
    return _yukuClient?.getSupportedNetworks() ?? {};
  }

  /// Check if network is supported
  bool isNetworkSupported(String network) {
    final blockchainNetwork = _getNetwork(network);
    return _yukuClient?.isNetworkSupported(blockchainNetwork) ?? false;
  }

  /// Get client information
  Map<String, dynamic> getClientInfo() {
    return _yukuClient?.getClientInfo() ?? {};
  }

  /// Get provider statistics
  Map<String, dynamic> getProviderStats() {
    return _yukuClient?.getProviderStats() ?? {};
  }

  /// Get network enum from string
  BlockchainNetwork _getNetwork(String network) {
    switch (network.toLowerCase()) {
      case 'icp':
      case 'internet-computer':
        return BlockchainNetwork.icp;
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
      default:
        return BlockchainNetwork.icp;
    }
  }

  /// Get default network
  String? get defaultNetwork => _defaultNetwork;

  /// Dispose resources
  Future<void> dispose() async {
    await _yukuClient?.dispose();
    _isInitialized = false;
  }

  void _log(String message) {
    if (_enableDebug && kDebugMode) {
      debugPrint('[FlutterMagento-Yuku] $message');
    }
  }
}
