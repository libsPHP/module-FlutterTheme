import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/seller.dart';
import '../providers/marketplace_provider.dart';
import '../widgets/rating_stars.dart';
import 'seller_products_screen.dart';

class SellerDetailScreen extends StatefulWidget {
  final Seller seller;

  const SellerDetailScreen({super.key, required this.seller});

  @override
  State<SellerDetailScreen> createState() => _SellerDetailScreenState();
}

class _SellerDetailScreenState extends State<SellerDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<MarketplaceProvider>().loadSellerReviews(widget.seller.id);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with cover image
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: widget.seller.coverImageUrl != null
                  ? Image.network(
                      widget.seller.coverImageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.store,
                            size: 80,
                            color: Colors.grey[600],
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.store,
                        size: 80,
                        color: Colors.grey[600],
                      ),
                    ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Seller info header
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Logo
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: widget.seller.logoUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  widget.seller.logoUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.store,
                                      size: 40,
                                      color: Colors.grey[600],
                                    );
                                  },
                                ),
                              )
                            : Icon(
                                Icons.store,
                                size: 40,
                                color: Colors.grey[600],
                              ),
                      ),
                      const SizedBox(width: 16),

                      // Name and badges
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.seller.companyName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                if (widget.seller.featured)
                                  _buildBadge('FEATURED', Colors.orange),
                                const SizedBox(width: 8),
                                if (widget.seller.premium)
                                  _buildBadge('PREMIUM', Colors.amber),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Rating and stats
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      RatingStars(rating: widget.seller.rating, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        widget.seller.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${widget.seller.reviewCount} reviews)',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Stats cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.inventory_2,
                          label: 'Products',
                          value: widget.seller.productCount.toString(),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          icon: Icons.calendar_today,
                          label: 'Joined',
                          value: _formatDate(widget.seller.createdAt),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                if (widget.seller.description != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.seller.description!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),

                const Divider(),

                // Tabs
                TabBar(
                  controller: _tabController,
                  labelColor: Theme.of(context).primaryColor,
                  tabs: const [
                    Tab(text: 'Products'),
                    Tab(text: 'Reviews'),
                    Tab(text: 'Info'),
                  ],
                ),
              ],
            ),
          ),

          // Tab content
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProductsTab(),
                _buildReviewsTab(),
                _buildInfoTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SellerProductsScreen(seller: widget.seller),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text('View Products'),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Contact Seller - Coming Soon!'),
                    ),
                  );
                },
                icon: const Icon(Icons.message),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsTab() {
    // Generate sample products for preview
    final sampleProducts = List.generate(
      6,
      (i) => {
        'name': 'Product ${i + 1}',
        'price': (20 + i * 5).toStringAsFixed(2),
        'image': 'https://via.placeholder.com/150',
      },
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.seller.productCount} Products',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SellerProductsScreen(seller: widget.seller),
                    ),
                  );
                },
                child: const Text('View All'),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: sampleProducts.length,
            itemBuilder: (context, index) {
              final product = sampleProducts[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: Icon(Icons.image, size: 48, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$${product['price']}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsTab() {
    return Consumer<MarketplaceProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.reviews.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.rate_review_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  'No reviews yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: provider.reviews.length,
          separatorBuilder: (context, index) => const Divider(height: 24),
          itemBuilder: (context, index) {
            final review = provider.reviews[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: Text(review.customerName[0])),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.customerName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          RatingStars(rating: review.rating, size: 14),
                        ],
                      ),
                    ),
                    Text(
                      _formatDate(review.createdAt),
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(review.comment),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildInfoTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(
            Icons.calendar_today,
            'Joined',
            _formatDate(widget.seller.createdAt),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.inventory_2,
            'Total Products',
            widget.seller.productCount.toString(),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.star,
            'Rating',
            widget.seller.rating.toStringAsFixed(1),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.rate_review,
            'Reviews',
            widget.seller.reviewCount.toString(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        const SizedBox(width: 12),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
