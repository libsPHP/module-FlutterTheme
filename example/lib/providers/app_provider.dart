import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Extension to add helper methods to Cart
extension CartExtension on Cart {
  int get itemsCount => items?.length ?? 0;
  double get grandTotal => totals?.grandTotal ?? 0.0;
}

// Extension to add helper methods to CartItem
extension CartItemExtension on CartItem {
  int get quantity => qty ?? 0;
}

class AppProvider extends ChangeNotifier {
  final FlutterMagento _magento = FlutterMagento();
  
  bool _isInitialized = false;
  bool _isLoading = false;
  String? _error;
  String? _baseUrl;
  
  // Auth state
  bool _isAuthenticated = false;
  Customer? _currentCustomer;
  
  // Cart state
  Cart? _currentCart;
  
  // Products state
  List<Product> _products = [];
  List<Product> _searchResults = [];
  
  // Getters
  FlutterMagento get magento => _magento;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get baseUrl => _baseUrl;
  bool get isAuthenticated => _isAuthenticated;
  Customer? get currentCustomer => _currentCustomer;
  Cart? get currentCart => _currentCart;
  List<Product> get products => _products;
  List<Product> get searchResults => _searchResults;
  
  AppProvider() {
    _loadConfiguration();
  }
  
  Future<void> _loadConfiguration() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _baseUrl = prefs.getString('magento_base_url');
      if (_baseUrl != null && _baseUrl!.isNotEmpty) {
        await initializeMagento(_baseUrl!);
      }
    } catch (e) {
      _setError('Failed to load configuration: $e');
    }
  }
  
  Future<bool> initializeMagento(String baseUrl) async {
    _setLoading(true);
    _clearError();
    
    try {
      final success = await _magento.initialize(
        baseUrl: baseUrl,
        connectionTimeout: 30,
        receiveTimeout: 30,
        enableCustomAttributesDebugLogging: true,
      );
      
      if (success) {
        _isInitialized = true;
        _baseUrl = baseUrl;
        
        // Save configuration
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('magento_base_url', baseUrl);
        
        notifyListeners();
        return true;
      } else {
        _setError('Failed to initialize Magento');
        return false;
      }
    } catch (e) {
      _setError('Initialization error: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  Future<bool> login(String email, String password) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return false;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final authResponse = await _magento.auth.login(
        email: email,
        password: password,
      );
      
      _isAuthenticated = true;
      _currentCustomer = authResponse.customer;
      notifyListeners();
      return true;
    } catch (e) {
      _setError('Login error: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  Future<bool> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return false;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final registerRequest = CustomerCreateRequest(
        email: email,
        password: password,
        firstname: firstName,
        lastname: lastName,
      );
      
      await _magento.auth.register(request: registerRequest);
      
      // After registration, automatically login
      return await login(email, password);
    } catch (e) {
      _setError('Registration error: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> logout() async {
    if (!_isInitialized) return;
    
    try {
      await _magento.auth.logout();
      _isAuthenticated = false;
      _currentCustomer = null;
      _currentCart = null;
      notifyListeners();
    } catch (e) {
      _setError('Logout error: $e');
    }
  }
  
  Future<void> loadProducts({int page = 1, int pageSize = 20}) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final result = await _magento.products.getProducts(
        page: page,
        pageSize: pageSize,
      );
      
      if (page == 1) {
        _products = result.items;
      } else {
        _products.addAll(result.items);
      }
      notifyListeners();
    } catch (e) {
      _setError('Error loading products: $e');
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> searchProducts(String query) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return;
    }
    
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final result = await _magento.products.getProducts(
        searchQuery: query,
        pageSize: 20,
      );
      
      _searchResults = result.items;
      notifyListeners();
    } catch (e) {
      _setError('Search error: $e');
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> addToCart(String productSku, int quantity) async {
    if (!_isInitialized) {
      _setError('Magento not initialized');
      return;
    }
    
    if (!_isAuthenticated) {
      _setError('Please login first');
      return;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final cart = await _magento.cart.addToCustomerCart(
        sku: productSku,
        quantity: quantity,
      );
      
      _currentCart = cart;
      notifyListeners();
    } catch (e) {
      _setError('Add to cart error: $e');
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> loadCart() async {
    if (!_isInitialized || !_isAuthenticated) return;
    
    try {
      final cart = await _magento.cart.getCustomerCart();
      
      _currentCart = cart;
      notifyListeners();
    } catch (e) {
      _setError('Error loading cart: $e');
    }
  }
  
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  void _setError(String error) {
    _error = error;
    notifyListeners();
  }
  
  void _clearError() {
    _error = null;
    notifyListeners();
  }
}
