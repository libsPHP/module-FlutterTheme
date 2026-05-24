/**
 * Flutter Magento Marketplace Library
 * 
 * ⚠️ DEPRECATED: This package has been merged into the main flutter_magento package.
 * Please use flutter_magento ^3.6.0 instead.
 * 
 * Migration:
 * - Replace: import 'package:flutter_magento_marketplace/flutter_magento_marketplace.dart';
 * - With:    import 'package:flutter_magento/flutter_magento.dart';
 * 
 * All functionality remains exactly the same, only the import changes.
 * 
 * @deprecated Use flutter_magento ^3.6.0 instead
 * @author NativeMind <contact@nativemind.net>
 * @version 1.2.0
 * @license MIT
 */

@Deprecated(
  'Use flutter_magento ^3.6.0 instead. This package has been merged into flutter_magento.',
)
library flutter_magento_marketplace;

// Core exports
export 'src/core/magento_marketplace_client.dart';
export 'src/core/marketplace_config.dart';
export 'src/core/marketplace_exceptions.dart';

// Models
export 'src/models/seller.dart';

// Services
export 'src/services/seller_service.dart';

// Providers
export 'src/providers/marketplace_providers.dart';

// Widgets
export 'src/widgets/seller_card.dart';

// Screens
export 'src/screens/marketplace_home_screen.dart';

// Utils
export 'src/utils/marketplace_utils.dart';
