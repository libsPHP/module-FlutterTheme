/// Flutter Magento - A comprehensive Flutter plugin for Magento e-commerce integration
///
/// This library provides a complete solution for integrating Flutter applications
/// with Magento e-commerce platforms, including support for universal custom attributes.
library flutter_magento;

// Core plugin
export 'flutter_magento_platform_interface.dart';
export 'flutter_magento_method_channel.dart';

// Main plugin class
export 'src/flutter_magento_plugin.dart';
export 'src/flutter_magento_core.dart';

// API clients and services
export 'src/api/magento_api_client.dart';
export 'src/api/auth_api.dart';
export 'src/api/product_api.dart';
export 'src/api/enhanced_product_api.dart';
export 'src/api/cart_api.dart';
export 'src/api/order_api.dart';
export 'src/api/wishlist_api.dart';
export 'src/api/search_api.dart';
export 'src/api/checkout_api.dart';
export 'src/api/customer_api.dart';

// Models
export 'src/models/auth_models.dart' hide Address;
export 'src/models/product_models.dart';
export 'src/models/enhanced_product.dart';
export 'src/models/cart_models.dart';
export 'src/models/order_models.dart';
export 'src/models/wishlist_models.dart';
export 'src/models/search_models.dart';
export 'src/models/checkout_models.dart';
export 'src/models/customer_models.dart';
export 'src/models/result_models.dart';

// Universal Custom Attributes System
export 'src/adapters/custom_attributes_adapter.dart';
export 'src/adapters/custom_attributes_manager.dart';
export 'src/adapters/validation_result.dart';

// Example adapters (for reference and extension)
export 'src/examples/ar_attributes_adapter.dart';
export 'src/examples/fashion_attributes_adapter.dart';

// Services
export 'src/services/auth_service.dart';
export 'src/services/cart_service.dart';
export 'src/services/cache_service.dart';
export 'src/services/cloud_feature_service.dart';
export 'src/services/localization_service.dart';
export 'src/services/network_service.dart';
export 'src/services/notification_service.dart';
export 'src/services/offline_service.dart';
export 'src/services/service_manager.dart';
export 'src/services/sync_service.dart';

// Providers
export 'src/providers/auth_provider.dart';
export 'src/providers/cart_provider.dart';
export 'src/providers/magento_provider.dart';

// Widgets
export 'src/widgets/adaptive_image.dart';
export 'src/widgets/cart_badge.dart';
export 'src/widgets/loading_overlay.dart';
export 'src/widgets/magento_app.dart';
export 'src/widgets/network_image_with_fallback.dart';
export 'src/widgets/product_card.dart';
export 'src/widgets/product_grid.dart';
export 'src/widgets/search_bar.dart';

// Utils
export 'src/utils/extensions.dart';

// Exceptions
export 'src/exceptions/magento_exception.dart';

// Constants
export 'src/constants/api_constants.dart';
