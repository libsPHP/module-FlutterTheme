import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:flutter_magento_marketplace/src/core/magento_marketplace_client.dart';
import 'package:flutter_magento_marketplace/src/core/marketplace_config.dart';
import 'package:flutter_magento_marketplace/src/services/seller_service.dart';

/// Provider for marketplace configuration
final marketplaceConfigProvider = Provider<MarketplaceConfig>((ref) {
  throw UnimplementedError('MarketplaceConfig must be provided');
});

/// Provider for Magento client
final magentoClientProvider = Provider<FlutterMagentoCore>((ref) {
  throw UnimplementedError('FlutterMagentoCore must be provided');
});

/// Provider for marketplace client
final marketplaceClientProvider = Provider<MagentoMarketplaceClient>((ref) {
  final config = ref.watch(marketplaceConfigProvider);
  final magentoClient = ref.watch(magentoClientProvider);

  return MagentoMarketplaceClient(config: config, magentoCore: magentoClient);
});

/// Provider for seller service
final sellerServiceProvider = Provider<SellerService>((ref) {
  final client = ref.watch(marketplaceClientProvider);
  return SellerService(client);
});


/// Provider for marketplace initialization
final marketplaceInitializationProvider = FutureProvider<bool>((ref) async {
  final client = ref.watch(marketplaceClientProvider);

  try {
    // Test connection to marketplace API
    await client.get('/health');
    return true;
  } catch (e) {
    return false;
  }
});

/// Provider for marketplace statistics
final marketplaceStatisticsProvider = FutureProvider<Map<String, dynamic>>((
  ref,
) async {
  final client = ref.watch(marketplaceClientProvider);

  try {
    final response = await client.get('/statistics');
    return response.data as Map<String, dynamic>;
  } catch (e) {
    return {};
  }
});

/// Provider for marketplace settings
final marketplaceSettingsProvider = FutureProvider<Map<String, dynamic>>((
  ref,
) async {
  final client = ref.watch(marketplaceClientProvider);

  try {
    final response = await client.get('/settings');
    return response.data as Map<String, dynamic>;
  } catch (e) {
    return {};
  }
});

/// Provider for marketplace features
final marketplaceFeaturesProvider = Provider<Map<String, bool>>((ref) {
  final config = ref.watch(marketplaceConfigProvider);

  return {
    'subdomains': config.enableSubdomains,
    'subdirectories': config.enableSubdirectories,
    'messaging': config.enableMessaging,
    'notifications': config.enableNotifications,
    'offlineMode': config.enableOfflineMode,
    'caching': config.enableCaching,
  };
});

/// Provider for marketplace theme settings
final marketplaceThemeProvider = Provider<Map<String, dynamic>>((ref) {
  return {
    'primaryColor': 0xFF2196F3,
    'secondaryColor': 0xFF03DAC6,
    'accentColor': 0xFFFF9800,
    'backgroundColor': 0xFFF5F5F5,
    'surfaceColor': 0xFFFFFFFF,
    'errorColor': 0xFFB00020,
    'textColor': 0xFF212121,
    'hintColor': 0xFF757575,
    'dividerColor': 0xFFBDBDBD,
    'cardColor': 0xFFFFFFFF,
    'shadowColor': 0xFF000000,
  };
});

/// Provider for marketplace localization
final marketplaceLocalizationProvider = Provider<Map<String, String>>((ref) {
  return {
    'appName': 'Marketplace',
    'sellers': 'Sellers',
    'products': 'Products',
    'reviews': 'Reviews',
    'messages': 'Messages',
    'search': 'Search',
    'filter': 'Filter',
    'sort': 'Sort',
    'price': 'Price',
    'rating': 'Rating',
    'condition': 'Condition',
    'new': 'New',
    'used': 'Used',
    'refurbished': 'Refurbished',
    'forParts': 'For Parts',
    'addToCart': 'Add to Cart',
    'buyNow': 'Buy Now',
    'contactSeller': 'Contact Seller',
    'viewProfile': 'View Profile',
    'writeReview': 'Write Review',
    'sendMessage': 'Send Message',
    'loadMore': 'Load More',
    'noResults': 'No results found',
    'error': 'Error',
    'retry': 'Retry',
    'cancel': 'Cancel',
    'save': 'Save',
    'delete': 'Delete',
    'edit': 'Edit',
    'close': 'Close',
    'back': 'Back',
    'next': 'Next',
    'previous': 'Previous',
    'loading': 'Loading...',
    'refreshing': 'Refreshing...',
    'pulling': 'Pulling...',
    'releasing': 'Releasing...',
    'completed': 'Completed',
    'failed': 'Failed',
    'success': 'Success',
    'warning': 'Warning',
    'info': 'Info',
  };
});

/// Provider for marketplace navigation
final marketplaceNavigationProvider = Provider<Map<String, String>>((ref) {
  return {
    'home': '/marketplace',
    'sellers': '/marketplace/sellers',
    'products': '/marketplace/products',
    'categories': '/marketplace/categories',
    'search': '/marketplace/search',
    'profile': '/marketplace/profile',
    'messages': '/marketplace/messages',
    'orders': '/marketplace/orders',
    'settings': '/marketplace/settings',
    'help': '/marketplace/help',
    'about': '/marketplace/about',
  };
});

/// Provider for marketplace permissions
final marketplacePermissionsProvider = Provider<Map<String, bool>>((ref) {
  return {
    'canViewSellers': true,
    'canViewProducts': true,
    'canViewReviews': true,
    'canSendMessages': true,
    'canCreateReviews': true,
    'canRegisterAsSeller': true,
    'canManageProducts': false,
    'canManageOrders': false,
    'canManageMessages': false,
    'canManageReviews': false,
    'canManageCommissions': false,
    'canAccessAdmin': false,
  };
});

/// Provider for marketplace cache settings
final marketplaceCacheProvider = Provider<Map<String, dynamic>>((ref) {
  final config = ref.watch(marketplaceConfigProvider);

  return {
    'enabled': config.enableCaching,
    'duration': config.cacheDuration,
    'maxSize': 100 * 1024 * 1024, // 100MB
    'strategies': {
      'sellers': 'memory',
      'products': 'disk',
      'reviews': 'memory',
      'messages': 'memory',
      'images': 'disk',
    },
  };
});

/// Provider for marketplace offline settings
final marketplaceOfflineProvider = Provider<Map<String, dynamic>>((ref) {
  final config = ref.watch(marketplaceConfigProvider);

  return {
    'enabled': config.enableOfflineMode,
    'syncInterval': 300, // 5 minutes
    'maxRetries': config.maxRetries,
    'retryDelay': config.retryDelay,
    'queues': {
      'sellers': 'marketplace.sellers',
      'products': 'marketplace.products',
      'reviews': 'marketplace.reviews',
      'messages': 'marketplace.messages',
    },
  };
});

