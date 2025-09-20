/// Flutter Magento - A comprehensive Flutter plugin for Magento e-commerce integration
library flutter_magento;
///
/// This library provides a complete solution for integrating Flutter applications
/// with Magento e-commerce platforms, including support for universal custom attributes.

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
export 'src/models/cart_models.dart' hide ShippingMethod, PaymentMethod;
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
// Note: Example adapters are excluded from package distribution
// They are available in the source repository for reference

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
export 'src/providers/magento_provider.dart';

// Widgets
export 'src/widgets/product_card.dart';

// Exceptions
export 'src/exceptions/magento_exception.dart';
