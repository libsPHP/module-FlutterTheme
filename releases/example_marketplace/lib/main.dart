import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'providers/marketplace_provider.dart';
import 'screens/sellers_screen.dart';
import 'screens/seller_registration_screen.dart';
import 'screens/seller_dashboard_screen.dart';
import 'screens/seller_search_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  runApp(const MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MarketplaceProvider())],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const MarketplaceHomePage(),
      ),
    );
  }
}

class MarketplaceHomePage extends StatelessWidget {
  const MarketplaceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final marketplaceEnabled = dotenv.env['MARKETPLACE'] == 'true';
    final apiUrl = dotenv.env['MAGENTO_API_URL'] ?? 'Not configured';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Magento Marketplace Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showAboutDialog(context),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Configuration Status Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        marketplaceEnabled ? Icons.check_circle : Icons.cancel,
                        color: marketplaceEnabled ? Colors.green : Colors.red,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Marketplace Mode',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              marketplaceEnabled ? "ENABLED ✓" : "DISABLED",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: marketplaceEnabled
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  _buildInfoRow('API URL', apiUrl),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    'Seller Registration',
                    dotenv.env['ENABLE_SELLER_REGISTRATION'] ?? 'Not set',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    'Seller Dashboard',
                    dotenv.env['ENABLE_SELLER_DASHBOARD'] ?? 'Not set',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Marketplace Features
          Text(
            'Marketplace Features',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          _buildFeatureCard(
            context,
            title: 'Browse Sellers',
            description: 'Explore all sellers and their stores',
            icon: Icons.store,
            color: Colors.blue,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SellersScreen()),
            ),
          ),
          _buildFeatureCard(
            context,
            title: 'Become a Seller',
            description: 'Register as a new seller and start selling',
            icon: Icons.person_add,
            color: Colors.green,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SellerRegistrationScreen(),
              ),
            ),
          ),
          _buildFeatureCard(
            context,
            title: 'Seller Dashboard',
            description: 'Manage your products, orders and sales',
            icon: Icons.dashboard,
            color: Colors.orange,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SellerDashboardScreen(),
              ),
            ),
          ),
          _buildFeatureCard(
            context,
            title: 'Search Sellers',
            description: 'Find sellers by name, category or rating',
            icon: Icons.search,
            color: Colors.teal,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SellerSearchScreen(),
              ),
            ),
          ),
          _buildFeatureCard(
            context,
            title: 'Seller Reviews',
            description: 'Read and manage seller reviews',
            icon: Icons.star_rate,
            color: Colors.amber,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SellersScreen()),
            ),
          ),

          const SizedBox(height: 24),

          // Statistics Card
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem(context, '8', 'Sellers'),
                      _buildStatItem(context, '1.2K', 'Products'),
                      _buildStatItem(context, '4.7', 'Avg Rating'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Demo marketplace with sample data',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // Documentation Links
          Text(
            'Documentation',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildDocLink(
            context,
            icon: Icons.book,
            title: 'Marketplace API Reference',
            subtitle: 'Complete API documentation',
          ),
          _buildDocLink(
            context,
            icon: Icons.code,
            title: 'Integration Guide',
            subtitle: 'How to integrate marketplace features',
          ),
          _buildDocLink(
            context,
            icon: Icons.extension,
            title: 'Magento Module',
            subtitle: 'Backend module installation guide',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
        ),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
      ],
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }

  Widget _buildDocLink(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.open_in_new, size: 20),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Opening $title - Coming Soon!')),
        );
      },
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Marketplace'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.appName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text('Version: ${AppConstants.appVersion}'),
              const SizedBox(height: 8),
              Text(AppConstants.appDescription),
              const SizedBox(height: 16),
              const Text(
                'Features:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('• Seller Management'),
              const Text('• Seller Registration'),
              const Text('• Seller Dashboard'),
              const Text('• Product Management'),
              const Text('• Ratings & Reviews'),
              const Text('• Advanced Search'),
              const Text('• Analytics & Insights'),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Support:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('📧 ${AppConstants.supportEmail}'),
              Text('📞 ${AppConstants.supportPhone}'),
              Text('🕐 ${AppConstants.supportHours}'),
              const SizedBox(height: 16),
              const Text(
                'This is a demo application with sample data.',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
