import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/marketplace_provider.dart';
import '../widgets/seller_card.dart';
import 'seller_detail_screen.dart';

class SellersScreen extends StatefulWidget {
  const SellersScreen({super.key});

  @override
  State<SellersScreen> createState() => _SellersScreenState();
}

class _SellersScreenState extends State<SellersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MarketplaceProvider>().loadSellers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sellers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterDialog();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search sellers...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Quick filters
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('All'),
                _buildFilterChip('Featured'),
                _buildFilterChip('Premium'),
                _buildFilterChip('Top Rated'),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Sellers list
          Expanded(
            child: Consumer<MarketplaceProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${provider.error}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => provider.loadSellers(),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                final sellers = _searchQuery.isEmpty
                    ? provider.sellers
                    : provider.sellers
                          .where(
                            (s) =>
                                s.companyName.toLowerCase().contains(
                                  _searchQuery.toLowerCase(),
                                ) ||
                                (s.description?.toLowerCase().contains(
                                      _searchQuery.toLowerCase(),
                                    ) ??
                                    false),
                          )
                          .toList();

                if (sellers.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.store_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty
                              ? 'No sellers found'
                              : 'No sellers match your search',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => provider.loadSellers(),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: sellers.length,
                    itemBuilder: (context, index) {
                      final seller = sellers[index];
                      return SellerCard(
                        seller: seller,
                        onTap: () {
                          provider.selectSeller(seller);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SellerDetailScreen(seller: seller),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        onSelected: (selected) {
          // Implement filter logic
        },
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Sellers'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              title: const Text('Featured Only'),
              value: false,
              onChanged: (value) {},
            ),
            CheckboxListTile(
              title: const Text('Premium Only'),
              value: false,
              onChanged: (value) {},
            ),
            const Divider(),
            const Text('Minimum Rating:'),
            Slider(
              value: 0,
              min: 0,
              max: 5,
              divisions: 10,
              label: '0.0',
              onChanged: (value) {},
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Apply filters
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
