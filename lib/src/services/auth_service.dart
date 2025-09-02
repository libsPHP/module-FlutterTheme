import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import '../models/customer.dart';
import '../exceptions/magento_exception.dart';
import 'magento_api_service.dart';

/// Service for managing customer authentication
class AuthService {
  final MagentoApiService _apiService;
  final FlutterSecureStorage _secureStorage;
  
  Customer? _currentCustomer;
  String? _customerToken;
  bool _isInitialized = false;
  
  // Storage keys
  static const String _tokenKey = 'magento_customer_token';
  static const String _customerDataKey = 'magento_customer_data';
  
  AuthService(this._apiService) : _secureStorage = const FlutterSecureStorage();
  
  /// Get current customer
  Customer? get currentCustomer => _currentCustomer;
  
  /// Get customer token
  String? get customerToken => _customerToken;
  
  /// Check if customer is authenticated
  bool get isAuthenticated => _customerToken != null && _currentCustomer != null;
  
  /// Check if service is initialized
  bool get isInitialized => _isInitialized;
  
  /// Initialize the authentication service
  Future<bool> initialize() async {
    try {
      // Try to restore session from secure storage
      await _restoreSession();
      _isInitialized = true;
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to initialize AuthService: $e');
      }
      return false;
    }
  }
  
  /// Restore session from secure storage
  Future<void> _restoreSession() async {
    try {
      final token = await _secureStorage.read(key: _tokenKey);
      if (token != null) {
        _customerToken = token;
        _apiService.setCustomerToken(token);
        
        // Try to get current customer info
        try {
          _currentCustomer = await _apiService.getCurrentCustomer();
        } catch (e) {
          // Token might be expired, clear it
          await _clearSession();
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to restore session: $e');
      }
      await _clearSession();
    }
  }
  
  /// Authenticate customer with email and password
  Future<Customer> authenticate({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.authenticateCustomer(
        email: email,
        password: password,
      );
      
      if (response.containsKey('token')) {
        _customerToken = response['token'];
        await _secureStorage.write(key: _tokenKey, value: _customerToken);
        
        // Get customer information
        _currentCustomer = await _apiService.getCurrentCustomer();
        await _secureStorage.write(
          key: _customerDataKey,
          value: _currentCustomer!.toJson().toString(),
        );
        
        return _currentCustomer!;
      } else {
        throw MagentoException.authenticationError('Invalid response format');
      }
    } catch (e) {
      if (e is MagentoException) {
        rethrow;
      }
      throw MagentoException.authenticationError(e.toString());
    }
  }
  
  /// Create new customer account
  Future<Customer> createAccount({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    Map<String, dynamic>? additionalData,
  }) async {
    try {
      final customer = await _apiService.createCustomer(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        additionalData: additionalData,
      );
      
      // Automatically authenticate after account creation
      return await authenticate(email: email, password: password);
    } catch (e) {
      if (e is MagentoException) {
        rethrow;
      }
      throw MagentoException('Failed to create account: $e');
    }
  }
  
  /// Update customer information
  Future<Customer> updateProfile(Map<String, dynamic> customerData) async {
    if (!isAuthenticated) {
      throw MagentoException.authenticationError('User not authenticated');
    }
    
    try {
      final updatedCustomer = await _apiService.updateCustomer(customerData);
      _currentCustomer = updatedCustomer;
      
      // Update stored customer data
      await _secureStorage.write(
        key: _customerDataKey,
        value: _currentCustomer!.toJson().toString(),
      );
      
      return _currentCustomer!;
    } catch (e) {
      if (e is MagentoException) {
        rethrow;
      }
      throw MagentoException('Failed to update profile: $e');
    }
  }
  
  /// Get customer addresses
  Future<List<Address>> getAddresses() async {
    if (!isAuthenticated) {
      throw MagentoException.authenticationError('User not authenticated');
    }
    
    try {
      return await _apiService.getCustomerAddresses();
    } catch (e) {
      if (e is MagentoException) {
        rethrow;
      }
      throw MagentoException('Failed to get addresses: $e');
    }
  }
  
  /// Logout customer
  Future<void> logout() async {
    try {
      await _clearSession();
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error during logout: $e');
      }
    }
  }
  
  /// Clear session data
  Future<void> _clearSession() async {
    _customerToken = null;
    _currentCustomer = null;
    _apiService.clearCustomerToken();
    
    try {
      await _secureStorage.delete(key: _tokenKey);
      await _secureStorage.delete(key: _customerDataKey);
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to clear secure storage: $e');
      }
    }
  }
  
  /// Refresh customer information
  Future<Customer> refreshProfile() async {
    if (!isAuthenticated) {
      throw MagentoException.authenticationError('User not authenticated');
    }
    
    try {
      _currentCustomer = await _apiService.getCurrentCustomer();
      await _secureStorage.write(
        key: _customerDataKey,
        value: _currentCustomer!.toJson().toString(),
      );
      return _currentCustomer!;
    } catch (e) {
      if (e is MagentoException) {
        rethrow;
      }
      throw MagentoException('Failed to refresh profile: $e');
    }
  }
  
  /// Check if token is expired
  Future<bool> isTokenExpired() async {
    if (!isAuthenticated) return true;
    
    try {
      await _apiService.getCurrentCustomer();
      return false;
    } catch (e) {
      if (e is MagentoException && e.isAuthenticationError) {
        return true;
      }
      return false;
    }
  }
  
  /// Get stored customer data
  Future<Customer?> getStoredCustomer() async {
    try {
      final customerData = await _secureStorage.read(key: _customerDataKey);
      if (customerData != null) {
        final json = Map<String, dynamic>.from(
          jsonDecode(customerData) as Map,
        );
        return Customer.fromJson(json);
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to parse stored customer data: $e');
      }
    }
    return null;
  }
}
