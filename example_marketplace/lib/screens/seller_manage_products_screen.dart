import 'package:flutter/material.dart';

class SellerManageProductsScreen extends StatefulWidget {
  const SellerManageProductsScreen({super.key});

  @override
  State<SellerManageProductsScreen> createState() =>
      _SellerManageProductsScreenState();
}

class _SellerManageProductsScreenState
    extends State<SellerManageProductsScreen> {
  String _filterStatus = 'all';

  @override
  Widget build(BuildContext context) {
    final products = _getDemoProducts();
    final filteredProducts = _filterStatus == 'all'
        ? products
        : products.where((p) => p['status'] == _filterStatus).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterMenu,
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats Summary
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatChip('All', products.length, Colors.blue),
                _buildStatChip('Active', 10, Colors.green),
                _buildStatChip('Pending', 3, Colors.orange),
                _buildStatChip('Draft', 2, Colors.grey),
              ],
            ),
          ),

          // Products List
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        const Text('No products found'),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return _buildProductItem(context, product);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddProductDialog(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Product'),
      ),
    );
  }

  Widget _buildStatChip(String label, int count, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _filterStatus = label.toLowerCase();
        });
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _filterStatus == label.toLowerCase()
                  ? color
                  : color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: _filterStatus == label.toLowerCase()
                    ? Colors.white
                    : color,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Map<String, dynamic> product) {
    final statusColor = _getStatusColor(product['status']);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.image, color: Colors.grey[400]),
        ),
        title: Text(
          product['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text('SKU: ${product['sku']}'),
            const SizedBox(height: 4),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product['status'].toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text('Stock: ${product['stock']}', style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 20),
                  SizedBox(width: 8),
                  Text('Edit'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'duplicate',
              child: Row(
                children: [
                  Icon(Icons.copy, size: 20),
                  SizedBox(width: 8),
                  Text('Duplicate'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 20, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$value: ${product['name']}')),
            );
          },
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'active':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'draft':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  List<Map<String, dynamic>> _getDemoProducts() {
    return [
      {
        'name': 'Premium Wireless Headphones',
        'sku': 'WH-1000XM4',
        'price': 349.99,
        'stock': 25,
        'status': 'active',
      },
      {
        'name': 'Smart Watch Series 8',
        'sku': 'SW-8-BLK',
        'price': 299.00,
        'stock': 15,
        'status': 'active',
      },
      {
        'name': 'Bluetooth Speaker',
        'sku': 'BS-FLIP-5',
        'price': 89.99,
        'stock': 0,
        'status': 'pending',
      },
      {
        'name': 'USB-C Cable 2m',
        'sku': 'CB-USBC-2M',
        'price': 19.99,
        'stock': 100,
        'status': 'active',
      },
      {
        'name': 'Laptop Stand Aluminum',
        'sku': 'LS-ALU-001',
        'price': 45.00,
        'stock': 30,
        'status': 'active',
      },
      {
        'name': 'Mechanical Keyboard RGB',
        'sku': 'KB-RGB-MEC',
        'price': 129.99,
        'stock': 12,
        'status': 'active',
      },
      {
        'name': 'Wireless Mouse',
        'sku': 'MS-WRL-001',
        'price': 39.99,
        'stock': 5,
        'status': 'pending',
      },
      {
        'name': '4K Webcam',
        'sku': 'WC-4K-PRO',
        'price': 159.00,
        'stock': 8,
        'status': 'active',
      },
      {
        'name': 'Phone Case Premium',
        'sku': 'PC-PREM-14',
        'price': 24.99,
        'stock': 50,
        'status': 'active',
      },
      {
        'name': 'Screen Protector Glass',
        'sku': 'SP-GLASS-14',
        'price': 14.99,
        'stock': 0,
        'status': 'draft',
      },
      {
        'name': 'Portable Charger 20000mAh',
        'sku': 'PB-20K-001',
        'price': 49.99,
        'stock': 20,
        'status': 'active',
      },
      {
        'name': 'HDMI Cable 4K 3m',
        'sku': 'HDMI-4K-3M',
        'price': 29.99,
        'stock': 0,
        'status': 'pending',
      },
      {
        'name': 'Gaming Mouse Pad XXL',
        'sku': 'MP-XXL-RGB',
        'price': 34.99,
        'stock': 18,
        'status': 'active',
      },
      {
        'name': 'Monitor Arm Mount',
        'sku': 'MA-DUAL-001',
        'price': 79.99,
        'stock': 0,
        'status': 'draft',
      },
      {
        'name': 'LED Desk Lamp',
        'sku': 'DL-LED-001',
        'price': 44.99,
        'stock': 22,
        'status': 'active',
      },
    ];
  }

  void _showFilterMenu() {
    // Filter menu implementation would go here
  }

  void _showAddProductDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Product'),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'SKU',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                  prefixText: '\$ ',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Stock Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Product created successfully!')),
              );
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}

