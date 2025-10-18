import 'package:flutter/foundation.dart';
import 'package:flutter_icp/flutter_icp.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Flutter Magento ICP Service
/// Provides integration with Internet Computer Protocol (ICP) blockchain
/// through the flutter_icp package
class FlutterMagentoICPService {
  static FlutterMagentoICPService? _instance;

  PlugWalletService? _walletService;
  IcpService? _icpService;
  YukuService? _yukuService;

  bool _isInitialized = false;
  bool _isEnabled = false;
  String? _network;
  String? _canisterId;
  bool _enableDebug = false;

  FlutterMagentoICPService._internal();

  static FlutterMagentoICPService get instance {
    _instance ??= FlutterMagentoICPService._internal();
    return _instance!;
  }

  /// Initialize ICP service
  Future<void> initialize({
    bool? enabled,
    String? network,
    String? canisterId,
    bool? enableDebug,
  }) async {
    try {
      if (_isInitialized) {
        _log('ICP service already initialized');
        return;
      }

      // Load settings from environment or use provided values
      final prefs = await SharedPreferences.getInstance();
      _isEnabled = enabled ?? prefs.getBool('ENABLE_ICP') ?? true;
      _network = network ?? prefs.getString('ICP_NETWORK') ?? 'testnet';
      _canisterId = canisterId ?? prefs.getString('ICP_CANISTER_ID');
      _enableDebug = enableDebug ?? prefs.getBool('ICP_ENABLE_DEBUG') ?? false;

      if (!_isEnabled) {
        _log('ICP service is disabled');
        _isInitialized = true;
        return;
      }

      _log('Initializing ICP service...');
      _log('Network: $_network');
      _log('Canister ID: $_canisterId');

      // Initialize Plug Wallet Service
      _walletService = PlugWalletService();
      await _walletService?.initialize();

      // Initialize ICP Service with config
      final config = _network == 'mainnet'
          ? ICPConfig.mainnet()
          : ICPConfig.testnet();

      _icpService = IcpService(config: config);

      // Initialize Yuku Service for marketplace
      _yukuService = YukuService();

      _isInitialized = true;
      _log('ICP service initialized successfully');
    } catch (e) {
      _log('Error initializing ICP service: $e');
      rethrow;
    }
  }

  /// Check if ICP service is enabled
  bool get isEnabled => _isEnabled;

  /// Check if ICP service is initialized
  bool get isInitialized => _isInitialized;

  /// Get Plug Wallet service
  PlugWalletService? get walletService => _walletService;

  /// Get ICP service
  IcpService? get icpService => _icpService;

  /// Get Yuku service
  YukuService? get yukuService => _yukuService;

  /// Connect to Plug Wallet
  Future<bool> connectWallet() async {
    if (!_isEnabled || !_isInitialized) {
      _log('ICP service is not enabled or not initialized');
      return false;
    }

    try {
      _log('Connecting to Plug Wallet...');
      final result = await _walletService?.connect();
      _log('Wallet connection result: $result');
      return result ?? false;
    } catch (e) {
      _log('Error connecting wallet: $e');
      return false;
    }
  }

  /// Disconnect wallet
  Future<bool> disconnectWallet() async {
    if (!_isEnabled || !_isInitialized) return false;

    try {
      _log('Disconnecting wallet...');
      final result = await _walletService?.disconnect();
      _log('Wallet disconnected');
      return result ?? false;
    } catch (e) {
      _log('Error disconnecting wallet: $e');
      return false;
    }
  }

  /// Check if wallet is connected
  bool get isWalletConnected => _walletService?.isConnected ?? false;

  /// Get wallet principal ID
  String? get walletPrincipal => _walletService?.principalId;

  /// Get wallet account ID
  String? get walletAccountId => _walletService?.accountId;

  /// Get wallet balance
  Future<Map<String, double>> getWalletBalance() async {
    if (!_isEnabled || !_isInitialized) return {};

    try {
      final balance = await _walletService?.getBalance();
      return balance ?? {};
    } catch (e) {
      _log('Error getting wallet balance: $e');
      return {};
    }
  }

  /// Get balance for specific address
  Future<double> getBalance(String address) async {
    if (!_isEnabled || !_isInitialized) return 0.0;

    try {
      final balance = await _icpService?.getBalance(address);
      return balance ?? 0.0;
    } catch (e) {
      _log('Error getting balance: $e');
      return 0.0;
    }
  }

  /// Transfer ICP tokens
  Future<String?> transfer({
    required String to,
    required double amount,
    String? memo,
  }) async {
    if (!_isEnabled || !_isInitialized) {
      _log('ICP service is not enabled or not initialized');
      return null;
    }

    if (!isWalletConnected) {
      _log('Wallet is not connected');
      return null;
    }

    try {
      _log('Transferring $amount ICP to $to');
      final result = await _icpService?.transfer(
        to: to,
        amount: amount,
        memo: memo,
      );
      _log('Transfer completed with transaction ID: $result');
      return result;
    } catch (e) {
      _log('Error transferring ICP: $e');
      return null;
    }
  }

  /// Send transaction through Plug Wallet
  Future<bool> sendTransaction({
    required String to,
    required double amount,
    required String currency,
    String? memo,
  }) async {
    if (!_isEnabled || !_isInitialized) return false;

    try {
      final result = await _walletService?.sendTransaction(
        to: to,
        amount: amount,
        currency: currency,
        memo: memo,
      );
      return result ?? false;
    } catch (e) {
      _log('Error sending transaction: $e');
      return false;
    }
  }

  /// Get transaction history
  Future<List<Map<String, dynamic>>> getTransactionHistory({
    String? address,
  }) async {
    if (!_isEnabled || !_isInitialized) return [];

    try {
      if (isWalletConnected) {
        // Get from wallet
        return await _walletService?.getTransactionHistory() ?? [];
      } else if (address != null) {
        // Get from ICP service
        return await _icpService?.getTransactionHistory(address) ?? [];
      }
      return [];
    } catch (e) {
      _log('Error getting transaction history: $e');
      return [];
    }
  }

  /// Get NFT balances from wallet
  Future<List<Map<String, dynamic>>> getNFTBalances() async {
    if (!_isEnabled || !_isInitialized) return [];

    try {
      return await _walletService?.getNFTBalances() ?? [];
    } catch (e) {
      _log('Error getting NFT balances: $e');
      return [];
    }
  }

  /// Sign message with Plug Wallet
  Future<bool> signMessage(String message) async {
    if (!_isEnabled || !_isInitialized) return false;

    try {
      return await _walletService?.signMessage(message) ?? false;
    } catch (e) {
      _log('Error signing message: $e');
      return false;
    }
  }

  /// Approve transaction
  Future<bool> approveTransaction({
    required String canisterId,
    required String method,
    required Map<String, dynamic> args,
  }) async {
    if (!_isEnabled || !_isInitialized) return false;

    try {
      return await _walletService?.approveTransaction(
            canisterId: canisterId,
            method: method,
            args: args,
          ) ??
          false;
    } catch (e) {
      _log('Error approving transaction: $e');
      return false;
    }
  }

  /// Get wallet information
  Map<String, dynamic>? get walletInfo => _walletService?.walletInfo;

  /// Get wallet statistics
  Future<Map<String, dynamic>> getWalletStats() async {
    if (!_isEnabled || !_isInitialized) return {};

    try {
      return await _walletService?.getWalletStats() ?? {};
    } catch (e) {
      _log('Error getting wallet stats: $e');
      return {};
    }
  }

  /// Import NFT to wallet
  Future<bool> importNFT({
    required String canisterId,
    required String tokenId,
  }) async {
    if (!_isEnabled || !_isInitialized) return false;

    try {
      return await _walletService?.importNFT(
            canisterId: canisterId,
            tokenId: tokenId,
          ) ??
          false;
    } catch (e) {
      _log('Error importing NFT: $e');
      return false;
    }
  }

  /// Get transaction details
  Future<Map<String, dynamic>?> getTransactionDetails(
    String transactionId,
  ) async {
    if (!_isEnabled || !_isInitialized) return null;

    try {
      return await _walletService?.getTransactionDetails(transactionId);
    } catch (e) {
      _log('Error getting transaction details: $e');
      return null;
    }
  }

  /// Format principal ID for display
  String formatPrincipal(String principal) {
    return _walletService?.formatPrincipal(principal) ?? principal;
  }

  /// Format account ID for display
  String formatAccountId(String accountId) {
    return _walletService?.formatAccountId(accountId) ?? accountId;
  }

  /// Format balance for display
  String formatBalance(double amount, String currency) {
    return _walletService?.formatBalance(amount, currency) ??
        '$amount $currency';
  }

  /// Get current network
  String? get network => _network;

  /// Get canister ID
  String? get canisterId => _canisterId;

  /// Get Plug Wallet URL
  Future<String> getPlugWalletUrl() async {
    return await _walletService?.getPlugWalletUrl() ?? 'https://plugwallet.ooo';
  }

  /// Get network URL
  Future<String> getNetworkUrl() async {
    return await _walletService?.getNetworkUrl() ?? '';
  }

  /// Switch network
  Future<void> switchNetwork(bool isTestnet) async {
    if (_walletService != null) {
      await _walletService!.switchNetwork(isTestnet);
      _network = isTestnet ? 'testnet' : 'mainnet';
    }
  }

  /// Get loading state
  bool get isLoading => _walletService?.isLoading ?? false;

  /// Get error message
  String? get error => _walletService?.error;

  /// Clear error
  void clearError() {
    _walletService?.clearError();
  }

  /// Dispose resources
  void dispose() {
    _isInitialized = false;
  }

  void _log(String message) {
    if (_enableDebug && kDebugMode) {
      debugPrint('[FlutterMagento-ICP] $message');
    }
  }
}
