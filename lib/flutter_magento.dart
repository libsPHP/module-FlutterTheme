/// Flutter Magento - A comprehensive Flutter plugin for Magento e-commerce integration
///
/// This library provides a complete solution for integrating Flutter applications
/// with Magento e-commerce platforms, including support for universal custom attributes.
///
/// Modernized for 2025 with:
/// - Dart 3+ base classes for better type safety
/// - Result pattern for improved error handling
/// - Pigeon for type-safe platform communication
/// - Comprehensive testing and monitoring

// Modern Core Platform Interface (New Architecture)
export 'src/core/result.dart';
export 'src/implementations/method_channel_implementation.dart'
    hide MethodChannelFlutterMagento;
export 'src/examples/modern_usage_example.dart'
    hide ResultExtensions, ResultUtils;

// Legacy exports for backward compatibility
export 'flutter_magento_platform_interface.dart';
export 'flutter_magento_method_channel.dart';
export 'src/flutter_magento_core.dart';
export 'src/flutter_magento.dart'
    hide FlutterMagento, MagentoProvider, MagentoException;

// Unified API (React-style interface)
export 'src/flutter_magento_unified.dart';
export 'src/models/unified_models.dart' hide AuthResult;
export 'src/api/enhanced_product_api_unified.dart';
export 'src/examples/unified_api_example.dart';

// API clients and services
export 'src/api/magento_api_client.dart';
export 'src/api/auth_api.dart';
export 'src/api/product_api.dart';
export 'src/api/enhanced_product_api.dart' hide EnhancedProductApi;
export 'src/api/cart_api.dart';
export 'src/api/order_api.dart';
export 'src/api/wishlist_api.dart';
export 'src/api/search_api.dart';
export 'src/api/checkout_api.dart';
export 'src/api/customer_api.dart';

// Models
export 'src/models/auth_models.dart';
export 'src/models/product_models.dart';
export 'src/models/enhanced_product.dart' hide EnhancedProductListResponse;
export 'src/models/cart_models.dart' hide ShippingMethod, PaymentMethod;
export 'src/models/order_models.dart';
export 'src/models/wishlist_models.dart';
export 'src/models/search_models.dart';
export 'src/models/checkout_models.dart';
export 'src/models/customer_models.dart';
export 'src/models/result_models.dart';
export 'src/models/device_info_model.dart';
export 'src/models/rada_models.dart';

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
export 'src/services/image_cache_service.dart';
export 'src/services/localization_service.dart';
export 'src/services/network_service.dart';
export 'src/services/notification_service.dart';
export 'src/services/offline_service.dart';
export 'src/services/service_manager.dart';
export 'src/services/sync_service.dart';
export 'src/services/device_info_service.dart';
export 'src/services/profile_service.dart';
export 'src/services/enhanced_http_client.dart';
export 'src/services/socket_manager.dart';

// RADA Format Services
export 'src/services/rada_service.dart';
export 'src/services/rada_exporter.dart';
export 'src/services/rada_importer.dart';
export 'src/services/rada_preload_service.dart';

// Demo Data System
export 'src/demo_data/demo_data_provider.dart';
export 'src/demo_data/demo_data_manager.dart';

// Providers
export 'src/providers/auth_provider.dart';
export 'src/providers/magento_provider.dart';
export 'src/providers/device_info_provider.dart';
export 'src/providers/profile_provider.dart';

// Widgets
export 'src/widgets/product_card.dart';
export 'src/widgets/device_info_widget.dart';

// Utils
export 'src/utils/device_utils.dart';

// Exceptions
export 'src/exceptions/magento_exception.dart';
