import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Magento Example'),
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Magento Connection Status',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              provider.isInitialized ? Icons.check_circle : Icons.error,
                              color: provider.isInitialized ? Colors.green : Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              provider.isInitialized ? 'Connected' : 'Not Connected',
                              style: TextStyle(
                                color: provider.isInitialized ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        if (provider.baseUrl != null) ...[
                          const SizedBox(height: 8),
                          Text('Base URL: ${provider.baseUrl}'),
                        ],
                        if (provider.error != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Error: ${provider.error}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Authentication Status
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Authentication Status',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              provider.isAuthenticated ? Icons.person : Icons.person_outline,
                              color: provider.isAuthenticated ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              provider.isAuthenticated ? 'Logged In' : 'Not Logged In',
                              style: TextStyle(
                                color: provider.isAuthenticated ? Colors.green : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        if (provider.currentCustomer != null) ...[
                          const SizedBox(height: 8),
                          Text('Welcome, ${provider.currentCustomer!.firstName} ${provider.currentCustomer!.lastName}!'),
                          Text('Email: ${provider.currentCustomer!.email}'),
                        ],
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Cart Status
                if (provider.isAuthenticated)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cart Status',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text('Items in cart: ${provider.currentCart.itemsCount}'),
                          Text('Total: \$${provider.currentCart.grandTotal.toStringAsFixed(2)}'),
                        ],
                      ),
                    ),
                  ),
                
                const SizedBox(height: 24),
                
                // Quick Actions
                Text(
                  'Quick Actions',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.5,
                    children: [
                      _QuickActionCard(
                        icon: Icons.settings,
                        title: 'Configure API',
                        subtitle: 'Set Magento URL',
                        onTap: () => _navigateToTab(context, 4),
                      ),
                      _QuickActionCard(
                        icon: Icons.person,
                        title: 'Authentication',
                        subtitle: 'Login or Register',
                        onTap: () => _navigateToTab(context, 1),
                      ),
                      _QuickActionCard(
                        icon: Icons.shopping_bag,
                        title: 'Browse Products',
                        subtitle: 'View catalog',
                        onTap: () => _navigateToTab(context, 2),
                      ),
                      _QuickActionCard(
                        icon: Icons.shopping_cart,
                        title: 'View Cart',
                        subtitle: 'Manage items',
                        onTap: () => _navigateToTab(context, 3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  void _navigateToTab(BuildContext context, int index) {
    final mainScreenState = context.findAncestorStateOfType<State<StatefulWidget>>();
    if (mainScreenState != null && mainScreenState.mounted) {
      (mainScreenState as dynamic).setState(() {
        (mainScreenState as dynamic)._currentIndex = index;
      });
    }
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  
  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
