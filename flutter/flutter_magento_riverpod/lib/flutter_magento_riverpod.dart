/// Riverpod providers and controllers for Magento Flutter apps.
///
/// Provides reactive state management for auth, cart, catalog, and profile.
library;

// Re-export riverpod
export 'package:flutter_riverpod/flutter_riverpod.dart';

// Re-export core types commonly used
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show
        Customer,
        Cart,
        CartItem,
        ProductSummary,
        ProductDetails,
        ProductPage,
        Category,
        CustomerAddress;

// Config
export 'src/config/magento_config.dart';

// State
export 'src/state/auth_state.dart';

// Params
export 'src/params/query_params.dart';

// Providers
export 'src/providers/core_providers.dart';
export 'src/providers/catalog_providers.dart';
export 'src/providers/profile_providers.dart';

// Controllers
export 'src/controllers/auth_controller.dart';
export 'src/controllers/cart_controller.dart';
