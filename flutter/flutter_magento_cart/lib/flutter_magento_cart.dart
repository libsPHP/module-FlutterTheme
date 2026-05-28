/// Magento cart implementation.
///
/// Provides shopping cart operations: add, remove, update items, coupons.
library;

// Re-export core types
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show
        CartRepository,
        Cart,
        CartItem,
        CartTotals,
        CartDiscount,
        SelectedOption;

// Repository
export 'src/repository/magento_cart_repository.dart';

// Mapper (for extension)
export 'src/mappers/cart_mapper.dart';

// Queries (for extension)
export 'src/queries/cart_queries.dart';
