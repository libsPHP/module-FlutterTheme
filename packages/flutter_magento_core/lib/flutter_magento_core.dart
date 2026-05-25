/// Core abstractions for flutter_magento SDK.
///
/// This package provides the foundation for all flutter_magento packages:
/// - Transport abstraction for REST/GraphQL
/// - Repository interfaces for domain operations
/// - Domain models and value objects
/// - Error handling with sealed classes
/// - Store context and auth storage interfaces
/// - Extension registry for custom modules
library;

// Models - Core
export 'src/models/money.dart';
export 'src/models/product_type.dart';
export 'src/models/sort_direction.dart';
export 'src/models/magento_entity.dart';

// Models - Domain
export 'src/models/customer.dart';
export 'src/models/customer_session.dart';
export 'src/models/product.dart';
export 'src/models/product_page.dart';
export 'src/models/product_filter.dart';
export 'src/models/product_sort.dart';
export 'src/models/category.dart';
export 'src/models/cart.dart';
export 'src/models/address.dart';
export 'src/models/shipping_method.dart';
export 'src/models/payment_method.dart';
export 'src/models/order.dart';
export 'src/models/order_page.dart';
export 'src/models/order_result.dart';
export 'src/models/wishlist.dart';

// Context
export 'src/context/magento_store_context.dart';

// Storage
export 'src/storage/magento_auth_storage.dart';
export 'src/storage/memory_magento_auth_storage.dart';

// Transport
export 'src/transport/magento_transport.dart';
export 'src/transport/magento_response.dart';
export 'src/transport/magento_request_options.dart';

// Errors
export 'src/errors/magento_exception.dart';

// Repositories
export 'src/repositories/auth_repository.dart';
export 'src/repositories/catalog_repository.dart';
export 'src/repositories/cart_repository.dart';
export 'src/repositories/checkout_repository.dart';
export 'src/repositories/customer_repository.dart';
export 'src/repositories/order_repository.dart';
export 'src/repositories/wishlist_repository.dart';

// Logging
export 'src/logging/magento_logger.dart';
export 'src/logging/magento_log_level.dart';
export 'src/logging/console_magento_logger.dart';

// Extensions
export 'src/extensions/magento_extension_registry.dart';
export 'src/extensions/magento_product_extension.dart';

// Client
export 'src/client/magento_client.dart';
export 'src/client/magento_observer.dart';
