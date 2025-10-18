import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/seller.dart';
import '../providers/marketplace_provider.dart';
import '../widgets/seller_card.dart';
import 'seller_detail_screen.dart';

class SellerSearchScreen extends StatefulWidget {
  const SellerSearchScreen({super.key});

  @override
  State<SellerSearchScreen> createState() => _SellerSearchScreenState();
}

class _SellerSearchScreenState extends State<SellerSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _showFeaturedOnly = false;
  bool _showPremiumOnly = false;
  double _minRating = 0.0;
  String _sortBy = 'rating';

  List<Seller> _filteredSellers = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<MarketplaceProvider>();
      if (provider.sellers.isEmpty) {
        provider.loadSellers();
      }
      _applyFilters();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    final provider = context.read<MarketplaceProvider>();
    var sellers = List<Seller>.from(provider.sellers);

    // Apply search query
    if (_searchQuery.isNotEmpty) {
      sellers = sellers.where((s) {
        return s.companyName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            (s.description?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
                false);
      }).toList();
    }

    // Apply featured filter
    if (_showFeaturedOnly) {
      sellers = sellers.where((s) => s.featured).toList();
    }

    // Apply premium filter
    if (_showPremiumOnly) {
      sellers = sellers.where((s) => s.premium).toList();
    }

    // Apply rating filter
    if (_minRating > 0) {
      sellers = sellers.where((s) => s.rating >= _minRating).toList();
    }

    // Apply sorting
    switch (_sortBy) {
      case 'rating':
        sellers.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'reviews':
        sellers.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
        break;
      case 'products':
        sellers.sort((a, b) => b.productCount.compareTo(a.productCount));
        break;
      case 'name':
        sellers.sort((a, b) => a.companyName.compareTo(b.companyName));
        break;
    }

    setState(() {
      _filteredSellers = sellers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Sellers'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: _showFiltersBottomSheet,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or description...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                          _applyFilters();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value);
                _applyFilters();
              },
            ),
          ),

          // Active Filters
          if (_showFeaturedOnly || _showPremiumOnly || _minRating > 0)
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  if (_showFeaturedOnly)
                    _buildFilterChip('Featured', () {
                      setState(() => _showFeaturedOnly = false);
                      _applyFilters();
                    }),
                  if (_showPremiumOnly)
                    _buildFilterChip('Premium', () {
                      setState(() => _showPremiumOnly = false);
                      _applyFilters();
                    }),
                  if (_minRating > 0)
                    _buildFilterChip('${_minRating.toStringAsFixed(1)}+ stars', () {
                      setState(() => _minRating = 0);
                      _applyFilters();
                    }),
                ],
              ),
            ),

          // Sort By
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text('Sort by:', style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _sortBy,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: 'rating', child: Text('Rating')),
                    DropdownMenuItem(value: 'reviews', child: Text('Reviews')),
                    DropdownMenuItem(value: 'products', child: Text('Products')),
                    DropdownMenuItem(value: 'name', child: Text('Name')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _sortBy = value);
                      _applyFilters();
                    }
                  },
                ),
                const Spacer(),
                Text(
                  '${_filteredSellers.length} sellers',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),

          const Divider(),

          // Results
          Expanded(
            child: Consumer<MarketplaceProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_filteredSellers.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'No sellers found',
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _filteredSellers.length,
                  itemBuilder: (context, index) {
                    final seller = _filteredSellers[index];
                    return SellerCard(
                      seller: seller,
                      onTap: () {
                        provider.selectSeller(seller);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerDetailScreen(seller: seller),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, VoidCallback onDeleted) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        deleteIcon: const Icon(Icons.close, size: 18),
        onDeleted: onDeleted,
      ),
    );
  }

  void _showFiltersBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Filters',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      setModalState(() {
                        _showFeaturedOnly = false;
                        _showPremiumOnly = false;
                        _minRating = 0;
                      });
                    },
                    child: const Text('Clear All'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text('Featured Sellers Only'),
                value: _showFeaturedOnly,
                onChanged: (value) {
                  setModalState(() => _showFeaturedOnly = value);
                },
              ),
              SwitchListTile(
                title: const Text('Premium Sellers Only'),
                value: _showPremiumOnly,
                onChanged: (value) {
                  setModalState(() => _showPremiumOnly = value);
                },
              ),
              const SizedBox(height: 16),
              Text(
                'Minimum Rating: ${_minRating.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Slider(
                value: _minRating,
                min: 0,
                max: 5,
                divisions: 10,
                label: _minRating.toStringAsFixed(1),
                onChanged: (value) {
                  setModalState(() => _minRating = value);
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    _applyFilters();
                    Navigator.pop(context);
                  },
                  child: const Text('Apply Filters'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

