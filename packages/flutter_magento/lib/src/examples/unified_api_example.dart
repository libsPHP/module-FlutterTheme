/// Example usage of the unified Flutter Magento API
///
/// This example demonstrates how to use the new React-style API interface
/// that matches the React Native and React Web versions.

import 'package:flutter/material.dart';
import '../flutter_magento_unified.dart';
import '../models/unified_models.dart';

class UnifiedApiExample extends StatefulWidget {
  const UnifiedApiExample({Key? key}) : super(key: key);

  @override
  State<UnifiedApiExample> createState() => _UnifiedApiExampleState();
}

class _UnifiedApiExampleState extends State<UnifiedApiExample> {
  bool _isInitialized = false;
  bool _isLoading = false;
  String _status = 'Not initialized';
  List<dynamic> _products = [];
  Map<String, dynamic>? _currentCustomer;

  @override
  void initState() {
    super.initState();
    _initializeMagento();
  }

  /// Initialize Magento library (React-style)
  Future<void> _initializeMagento() async {
    setState(() {
      _isLoading = true;
      _status = 'Initializing...';
    });

    try {
      final success = await FlutterMagento.initialize(
        baseUrl: 'https://your-magento-store.com',
        headers: {'Content-Type': 'application/json'},
        supportedLanguages: ['en', 'ru', 'de'],
      );

      if (success) {
        setState(() {
          _isInitialized = true;
          _status = 'Initialized successfully';
        });
      } else {
        setState(() {
          _status = 'Initialization failed';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Login user (React-style)
  Future<void> _login() async {
    if (!_isInitialized) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await FlutterMagento.login(
        'user@example.com',
        'password123',
        true, // rememberMe
      );

      if (result.success) {
        setState(() {
          _currentCustomer = result.customer as Map<String, dynamic>?;
          _status = 'Logged in successfully';
        });
      } else {
        setState(() {
          _status = 'Login failed: ${result.message}';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Login error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Get products (React-style)
  Future<void> _getProducts() async {
    if (!_isInitialized) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final products = await FlutterMagento.getProducts(
        page: 1,
        pageSize: 20,
        searchQuery: 'laptop',
        sortBy: 'price',
        sortOrder: 'asc',
      );

      setState(() {
        _products = products['items'] ?? [];
        _status = 'Loaded ${_products.length} products';
      });
    } catch (e) {
      setState(() {
        _status = 'Error loading products: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Add to cart (React-style)
  Future<void> _addToCart(String sku) async {
    if (!_isInitialized) return;

    try {
      final success = await FlutterMagento.addToCart(
        sku: sku,
        quantity: 1,
        productOptions: {'color': 'black', 'size': 'M'},
      );

      if (success) {
        setState(() {
          _status = 'Added to cart successfully';
        });
      } else {
        setState(() {
          _status = 'Failed to add to cart';
        });
      }
    } catch (e) {
      setState(() {
        _status = 'Error adding to cart: $e';
      });
    }
  }

  /// Get cart (React-style)
  Future<void> _getCart() async {
    if (!_isInitialized) return;

    try {
      final cart = await FlutterMagento.getCart();
      setState(() {
        _status = 'Cart loaded: ${cart['items_count']} items';
      });
    } catch (e) {
      setState(() {
        _status = 'Error loading cart: $e';
      });
    }
  }

  /// Search products (React-style)
  Future<void> _searchProducts(String query) async {
    if (!_isInitialized) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final results = await FlutterMagento.searchProducts(
        query,
        page: 1,
        pageSize: 10,
      );

      setState(() {
        _products = results['items'] ?? [];
        _status = 'Found ${_products.length} products for "$query"';
      });
    } catch (e) {
      setState(() {
        _status = 'Error searching: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Get service status (React-style)
  void _getServiceStatus() {
    final status = FlutterMagento.serviceStatus;
    setState(() {
      _status = 'Status: ${status.toString()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unified Flutter Magento API'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status: $_status',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text('Initialized: $_isInitialized'),
                    Text('Authenticated: ${FlutterMagento.isAuthenticated}'),
                    Text('Online: ${FlutterMagento.isOnline}'),
                    Text('Cart Items: ${FlutterMagento.cartItemsCount}'),
                    Text(
                      'Cart Total: \$${FlutterMagento.cartTotal.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Action buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: _isLoading ? null : _getProducts,
                  child: const Text('Get Products'),
                ),
                ElevatedButton(
                  onPressed: _isLoading ? null : _getCart,
                  child: const Text('Get Cart'),
                ),
                ElevatedButton(
                  onPressed: _isLoading ? null : _getServiceStatus,
                  child: const Text('Service Status'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Products list
            if (_products.isNotEmpty) ...[
              const Text(
                'Products:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return Card(
                      child: ListTile(
                        title: Text(product['name'] ?? 'Unknown Product'),
                        subtitle: Text('SKU: ${product['sku']}'),
                        trailing: ElevatedButton(
                          onPressed: () => _addToCart(product['sku']),
                          child: const Text('Add to Cart'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],

            // Loading indicator
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}

/// Example of using Enhanced Product API
class EnhancedProductExample {
  static Future<void> demonstrateEnhancedProducts() async {
    try {
      // Initialize Magento
      await FlutterMagento.initialize(
        baseUrl: 'https://your-magento-store.com',
        headers: {'Content-Type': 'application/json'},
      );

      // Get enhanced products with custom adapter
      final products = await FlutterMagento.enhancedProducts
          .getEnhancedProducts<Map<String, dynamic>>(
            adapterId: 'my_custom_adapter',
            page: 1,
            pageSize: 20,
            customFilters: {
              'brand': 'Apple',
              'price': {'gt': '100'},
            },
          );

      print('Enhanced products: ${products.items.length}');
      for (final product in products.items) {
        print('Product: ${product.toString()}');
      }

      // Get single enhanced product
      final singleProduct = await FlutterMagento.enhancedProducts
          .getEnhancedProduct<Map<String, dynamic>>(
            'SKU123',
            adapterId: 'my_custom_adapter',
          );

      print('Single enhanced product: ${singleProduct.product}');

      // Search enhanced products
      final searchResults = await FlutterMagento.enhancedProducts
          .searchEnhancedProducts<Map<String, dynamic>>(
            'smartphone',
            adapterId: 'my_custom_adapter',
            page: 1,
            pageSize: 10,
          );

      print('Search results: ${searchResults.items.length}');
    } catch (e) {
      print('Error in enhanced product example: $e');
    }
  }
}
