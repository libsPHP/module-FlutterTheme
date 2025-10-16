/// Product Examples
///
/// This file contains runnable examples for product operations.
/// Run: flutter run lib/examples/product_examples.dart
///
/// Based on: https://luma-demo.scandipwa.com/

import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  runApp(const ProductExamplesApp());
}

class ProductExamplesApp extends StatelessWidget {
  const ProductExamplesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Examples',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const ProductExamplesScreen(),
    );
  }
}

class ProductExamplesScreen extends StatefulWidget {
  const ProductExamplesScreen({super.key});

  @override
  State<ProductExamplesScreen> createState() => _ProductExamplesScreenState();
}

class _ProductExamplesScreenState extends State<ProductExamplesScreen> {
  final _magento = FlutterMagentoCore.instance;
  String _output = 'Ready to run product examples...';
  bool _isLoading = false;
  bool _isInitialized = false;

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
        _output =
            '✅ Magento API initialized!\n\nReady to run product examples.';
      });
    } catch (e) {
      setState(() {
        _output = '❌ Initialization error: $e';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  /// Example 1: Get Products with Pagination
  ///
  /// Demonstrates fetching products with pagination
  Future<void> example1_getProducts() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Get Products...';
    });

    try {
      final products = await _magento.getProducts(page: 1, pageSize: 5);

      final buffer = StringBuffer();
      buffer.writeln('✅ Products Retrieved!');
      buffer.writeln('\nTotal: ${products.length} products');
      buffer.writeln('\n--- Products ---\n');

      for (var i = 0; i < products.length && i < 5; i++) {
        final product = products[i];
        buffer.writeln('${i + 1}. ${product.name}');
        buffer.writeln('   SKU: ${product.sku}');
        buffer.writeln(
          '   Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
        );
        buffer.writeln('');
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

  /// Example 2: Search Products
  ///
  /// Demonstrates product search functionality
  Future<void> example2_searchProducts() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Search Products (query: "bag")...';
    });

    try {
      final searchResults = await _magento.searchProducts(
        'bag',
        page: 1,
        pageSize: 5,
      );

      final buffer = StringBuffer();
      buffer.writeln('✅ Search Completed!');
      buffer.writeln('\nQuery: "bag"');
      buffer.writeln('Found: ${searchResults.length} results');
      buffer.writeln('\n--- Results ---\n');

      for (var i = 0; i < searchResults.length && i < 5; i++) {
        final product = searchResults[i];
        buffer.writeln('${i + 1}. ${product.name}');
        buffer.writeln('   SKU: ${product.sku}');
        buffer.writeln(
          '   Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
        );
        buffer.writeln('');
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

  /// Example 3: Get Single Product by SKU
  ///
  /// Demonstrates fetching a single product details
  Future<void> example3_getProductBySku() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Get Product by SKU...';
    });

    try {
      // First get some products to find a valid SKU
      final products = await _magento.getProducts(page: 1, pageSize: 1);

      if (products.isEmpty) {
        setState(() {
          _output = '❌ No products found to demonstrate';
        });
        return;
      }

      final sku = products.first.sku;
      final product = await _magento.getProduct(sku);

      setState(() {
        _output =
            '''
✅ Product Retrieved!

Name: ${product.name}
SKU: ${product.sku}
Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}
Type: ${product.typeId}
Status: ${product.status == 1 ? 'Enabled' : 'Disabled'}
Visibility: ${product.visibility}
Created: ${product.createdAt}
Updated: ${product.updatedAt}
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

  /// Example 4: Get Products by Category
  ///
  /// Demonstrates filtering products by category
  Future<void> example4_getProductsByCategory() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Get Products by Category...';
    });

    try {
      // Get categories first
      final categories = await _magento.getCategories();

      if (categories.isEmpty) {
        setState(() {
          _output = '❌ No categories found';
        });
        return;
      }

      final category = categories.first;
      final products = await _magento.getProducts(
        categoryId: category.id.toString(),
        page: 1,
        pageSize: 3,
      );

      final buffer = StringBuffer();
      buffer.writeln('✅ Products Retrieved by Category!');
      buffer.writeln('\nCategory: ${category.name}');
      buffer.writeln('Found: ${products.length} products');
      buffer.writeln('\n--- Products ---\n');

      for (var i = 0; i < products.length; i++) {
        final product = products[i];
        buffer.writeln('${i + 1}. ${product.name}');
        buffer.writeln(
          '   Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
        );
        buffer.writeln('');
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

  /// Example 5: Get Product with Filters
  ///
  /// Demonstrates advanced product filtering
  Future<void> example5_getProductsWithFilters() async {
    if (!_isInitialized) {
      setState(() => _output = '❌ Magento not initialized');
      return;
    }

    setState(() {
      _isLoading = true;
      _output = 'Running: Get Products with Filters...';
    });

    try {
      final products = await _magento.getProducts(
        page: 1,
        pageSize: 5,
        sortBy: 'price',
        sortOrder: 'asc',
      );

      final buffer = StringBuffer();
      buffer.writeln('✅ Filtered Products Retrieved!');
      buffer.writeln('\nFilters:');
      buffer.writeln('- Sort by: price');
      buffer.writeln('- Order: ascending');
      buffer.writeln('\nTotal: ${products.length} products');
      buffer.writeln('\n--- Products ---\n');

      for (var i = 0; i < products.length; i++) {
        final product = products[i];
        buffer.writeln('${i + 1}. ${product.name}');
        buffer.writeln(
          '   Price: \$${product.price?.toStringAsFixed(2) ?? 'N/A'}',
        );
        buffer.writeln('');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Examples'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
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
                    onPressed: example1_getProducts,
                    icon: const Icon(Icons.list),
                    label: const Text('1. Get Products'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example2_searchProducts,
                    icon: const Icon(Icons.search),
                    label: const Text('2. Search'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example3_getProductBySku,
                    icon: const Icon(Icons.qr_code),
                    label: const Text('3. By SKU'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example4_getProductsByCategory,
                    icon: const Icon(Icons.category),
                    label: const Text('4. By Category'),
                  ),
                  ElevatedButton.icon(
                    onPressed: example5_getProductsWithFilters,
                    icon: const Icon(Icons.filter_list),
                    label: const Text('5. With Filters'),
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
class ProductExamples {
  final FlutterMagentoCore magento;

  ProductExamples(this.magento);

  /// Example: Get products with pagination
  Future<List<MagentoProduct>> getProducts({
    int page = 1,
    int pageSize = 20,
  }) async {
    return await magento.getProducts(page: page, pageSize: pageSize);
  }

  /// Example: Search products
  Future<List<MagentoProduct>> searchProducts(String query) async {
    return await magento.searchProducts(query, page: 1, pageSize: 20);
  }

  /// Example: Get single product by SKU
  Future<MagentoProduct> getProduct(String sku) async {
    return await magento.getProduct(sku);
  }

  /// Example: Get products with filters
  Future<List<MagentoProduct>> getFilteredProducts({
    String? categoryId,
    String? sortBy,
    String? sortOrder,
  }) async {
    return await magento.getProducts(
      categoryId: categoryId,
      sortBy: sortBy,
      sortOrder: sortOrder,
      page: 1,
      pageSize: 20,
    );
  }
}
