import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_magento_marketplace/src/providers/marketplace_providers.dart';
import 'package:flutter_magento_marketplace/src/widgets/seller_card.dart';
import 'package:flutter_magento_marketplace/src/models/seller.dart';

/// Main marketplace home screen
class MarketplaceHomeScreen extends ConsumerStatefulWidget {
  const MarketplaceHomeScreen({super.key});

  @override
  ConsumerState<MarketplaceHomeScreen> createState() =>
      _MarketplaceHomeScreenState();
}

class _MarketplaceHomeScreenState extends ConsumerState<MarketplaceHomeScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildAppBar(context),
            _buildSearchBar(context),
            _buildTabBar(context),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildFeaturedSellers(context),
            _buildRecentProducts(context),
            _buildTopRatedSellers(context),
            _buildCategories(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to search screen
        },
        icon: const Icon(Icons.search),
        label: const Text('Search'),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Marketplace'),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.storefront, size: 48, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  'Discover Amazing Sellers',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Navigate to notifications
          },
          icon: const Icon(Icons.notifications_outlined),
        ),
        IconButton(
          onPressed: () {
            // Navigate to messages
          },
          icon: const Icon(Icons.message_outlined),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search sellers, products...',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () {
                // Clear search
                _searchController.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surfaceVariant,
          ),
          onSubmitted: (value) {
            // Perform search
          },
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
          tabs: const [
            Tab(text: 'Featured'),
            Tab(text: 'Products'),
            Tab(text: 'Top Rated'),
            Tab(text: 'Categories'),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedSellers(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final sellerService = ref.watch(sellerServiceProvider);

        return FutureBuilder<List<Seller>>(
          future: sellerService.getFeaturedSellers(limit: 10),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load featured sellers',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            final sellers = snapshot.data ?? [];

            if (sellers.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.storefront_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No featured sellers available',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                final seller = sellers[index];
                return SellerCard(
                  seller: seller,
                  onTap: () {
                    // Navigate to seller profile
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildRecentProducts(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text('Recent products will be displayed here'),
      ),
    );
  }

  Widget _buildTopRatedSellers(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final sellerService = ref.watch(sellerServiceProvider);

        return FutureBuilder<List<Seller>>(
          future: sellerService
              .getSellers(
                filters: SellerSearchFilters(
                  sortBy: SellerSortBy.rating,
                  sortDirection: SortDirection.descending,
                ),
                pageSize: 10,
              )
              .then((result) => result.items),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load top rated sellers',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            final sellers = snapshot.data ?? [];

            if (sellers.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No top rated sellers available',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                final seller = sellers[index];
                return SellerCard(
                  seller: seller,
                  onTap: () {
                    // Navigate to seller profile
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildCategories(BuildContext context) {
    final categories = [
      {
        'name': 'Electronics',
        'icon': Icons.electrical_services,
        'color': Colors.blue,
      },
      {'name': 'Fashion', 'icon': Icons.checkroom, 'color': Colors.pink},
      {'name': 'Home & Garden', 'icon': Icons.home, 'color': Colors.green},
      {'name': 'Sports', 'icon': Icons.sports, 'color': Colors.orange},
      {'name': 'Books', 'icon': Icons.book, 'color': Colors.purple},
      {'name': 'Toys', 'icon': Icons.toys, 'color': Colors.red},
      {
        'name': 'Automotive',
        'icon': Icons.directions_car,
        'color': Colors.grey,
      },
      {'name': 'Health', 'icon': Icons.health_and_safety, 'color': Colors.teal},
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              // Navigate to category
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    (category['color'] as Color).withOpacity(0.1),
                    (category['color'] as Color).withOpacity(0.05),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'] as IconData,
                    size: 48,
                    color: category['color'] as Color,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    category['name'] as String,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

