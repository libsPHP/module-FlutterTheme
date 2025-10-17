/**
 * Flutter Magento Marketplace Library
 * 
 * A comprehensive Flutter library for Magento 2 Marketplace functionality
 * with multi-seller support, subdomains, ratings, messaging, and more.
 * 
 * This module has been integrated into flutter_magento package.
 * 
 * @author NativeMind <contact@nativemind.net>
 * @version 2.0.0
 * @license MIT
 */

library flutter_magento_marketplace;

// Core exports
export 'core/magento_marketplace_client.dart';
export 'core/marketplace_config.dart';
export 'core/marketplace_exceptions.dart';

// Models
export 'models/seller.dart';

// Services
export 'services/seller_service.dart';

// Providers
export 'providers/marketplace_providers.dart';

// Widgets
export 'widgets/seller_card.dart';
export 'widgets/rating_stars.dart';

// Screens
export 'screens/marketplace_home_screen.dart';

// Utils
export 'utils/marketplace_utils.dart';
