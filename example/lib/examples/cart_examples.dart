/// Cart Examples
///
/// This file contains runnable examples for cart operations.
/// Run: flutter run lib/examples/cart_examples.dart
///
/// Based on: https://luma-demo.scandipwa.com/

import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  runApp(const CartExamplesApp());
}

class CartExamplesApp extends StatelessWidget {
  const CartExamplesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cart Examples',
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
      home: const CartExamplesScreen(),
    );
  }
}

class CartExamplesScreen extends StatefulWidget {
  const CartExamplesScreen({super.key});

  @override
  State<CartExamplesScreen> createState() => _CartExamplesScreenState();
}

class _CartExamplesScreenState extends State<CartExamplesScreen> {
  final _magento = FlutterMagentoCore.instance;
  String _output = 'Ready to run cart examples...';
  bool _isLoading = false;
  bool _isInitialized = false;
  String? _currentCartId;

  @override
  void initState() {
    super.initState();
    _initializeMagento();
  }

  Future<void> _initializeMagento() async {
    setState(() {
      _isLoading = true;
      _output = 'Initializing Magento API...';
    });

    try {
      await _magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');
      setState(() {
        _isInitialized = true;
        _output = '✅ Magento API initialized!\n\nReady to run cart examples.';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Initialization error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 1: Create Guest Cart
  ///
  /// Demonstrates creating a cart for guest users
  Future<void> example1_createGuestCart() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Create Guest Cart...';
    });

    try {
      final cart = await _magento.createGuestCart();
      _currentCartId = cart.id;

      setState(() {
        _output =
            '''
✅ Guest Cart Created!

Cart ID: ${cart.id}
Items Count: ${cart.itemsCount ?? 0}
Is Active: ${cart.isActive}
Currency: ${cart.currency?.baseCurrencyCode ?? 'N/A'}

Cart saved for future operations.
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 2: Add Item to Cart
  ///
  /// Demonstrates adding a product to cart
  Future<void> example2_addItemToCart() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    if (_currentCartId == null) {
      setState(() => _output = '❌ Please create a cart first (Example 1)');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Add Item to Cart...\n\nFetching product...';
    });

    try {
      // First get a product to add
      final products = await _magento.getProducts(page: 1, pageSize: 1);

      if (products.isEmpty) {
        setState(() {
          _output = '❌ No products found to add';
        });
        return;
      }

      final product = products.first;

      // Add to cart
      final updatedCart = await _magento.addToGuestCart(
        cartId: _currentCartId!,
        sku: product.sku,
        quantity: 1,
      );

      setState(() {
        _output =
            '''
✅ Item Added to Cart!

Product: ${product.name}
SKU: ${product.sku}
Quantity: 1

Cart Status:
- Total Items: ${updatedCart.itemsCount ?? 0}
- Items: ${updatedCart.items?.length ?? 0}
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 3: Get Cart Totals
  ///
  /// Demonstrates fetching cart totals
  Future<void> example3_getCartTotals() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    if (_currentCartId == null) {
      setState(() => _output = '❌ Please create a cart first (Example 1)');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Get Cart Totals...';
    });

    try {
      final totals = await _magento.getGuestCartTotals(_currentCartId!);

      setState(() {
        _output =
            '''
✅ Cart Totals Retrieved!

Grand Total: \$${totals.grandTotal?.toStringAsFixed(2) ?? 'N/A'}
Subtotal: \$${totals.subtotal?.toStringAsFixed(2) ?? 'N/A'}
Items Count: ${totals.itemsQty ?? 0}

Currency: ${totals.baseCurrencyCode ?? 'N/A'}
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 4: Get Cart Items
  ///
  /// Demonstrates fetching all items in cart
  Future<void> example4_getCartItems() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    if (_currentCartId == null) {
      setState(() => _output = '❌ Please create a cart first (Example 1)');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Get Cart Items...';
    });

    try {
      final cart = await _magento.getGuestCart(_currentCartId!);
      final items = cart.items ?? [];

      final buffer = StringBuffer();
      buffer.writeln('✅ Cart Items Retrieved!');
      buffer.writeln('\nTotal Items: ${items.length}');
      buffer.writeln('\n--- Items ---\n');

      if (items.isEmpty) {
        buffer.writeln('Cart is empty');
      } else {
        for (var i = 0; i < items.length; i++) {
          final item = items[i];
          buffer.writeln('${i + 1}. ${item.name}');
          buffer.writeln('   SKU: ${item.sku}');
          buffer.writeln('   Qty: ${item.qty}');
          buffer.writeln(
            '   Price: \$${item.price?.toStringAsFixed(2) ?? 'N/A'}',
          );
          buffer.writeln('');
        }
      }

      setState(() {
        _output = buffer.toString();
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 5: Clear Cart
  ///
  /// Demonstrates clearing all items from cart
  Future<void> example5_clearCart() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Clear Cart...\n\nCreating new cart...';
    });

    try {
      // Create a new cart (effectively clearing the old one)
      final cart = await _magento.createGuestCart();
      _currentCartId = cart.id;

      setState(() {
        _output =
            '''
✅ Cart Cleared!

New Cart ID: ${cart.id}
Items: 0

Ready for new items.
''';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Examples'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Current cart info
          if (_currentCartId != null)
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.shopping_cart, color: Colors.orange.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Cart ID: ${_currentCartId!.substring(0, 20)}...',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange.shade700,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Output area
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: SingleChildScrollView(
                child: Text(
                  _output,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
                ),
              ),
            ),
          ),

          // Example buttons
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: example1_createGuestCart,
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('1. Create Cart'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example2_addItemToCart,
                    icon: const Icon(Icons.add),
                    label: const Text('2. Add Item'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example3_getCartTotals,
                    icon: const Icon(Icons.calculate),
                    label: const Text('3. Get Totals'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example4_getCartItems,
                    icon: const Icon(Icons.list_alt),
                    label: const Text('4. Get Items'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example5_clearCart,
                    icon: const Icon(Icons.delete_sweep),
                    label: const Text('5. Clear Cart'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ============================================================================
// Standalone Functions (for testing and quick reference)
// ============================================================================

/// Standalone example functions that can be called from tests
class CartExamples {
  final FlutterMagentoCore magento;

  CartExamples(this.magento);

  /// Example: Create guest cart
  Future<Cart> createGuestCart() async {
    return await magento.createGuestCart();
  }

  /// Example: Add item to cart
  Future<Cart> addToCart({
    required String cartId,
    required String sku,
    int quantity = 1,
  }) async {
    return await magento.addToGuestCart(
      cartId: cartId,
      sku: sku,
      quantity: quantity,
    );
  }

  /// Example: Get cart totals
  Future<CartTotals> getCartTotals(String cartId) async {
    return await magento.getGuestCartTotals(cartId);
  }

  /// Example: Get cart items
  Future<Cart> getCart(String cartId) async {
    return await magento.getGuestCart(cartId);
  }
}
