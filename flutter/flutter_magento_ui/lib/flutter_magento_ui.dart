/// Reusable UI widgets for Magento Flutter apps.
///
/// Provides themed widgets for products, cart, forms, and utilities.
library;

// Re-export core types
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show ProductSummary, ProductDetails, Money, CartItem, CartTotals;

// Theme
export 'src/theme/magento_theme.dart';
export 'src/theme/magento_theme_data.dart';

// Product widgets
export 'src/widgets/product/magento_price.dart';
export 'src/widgets/product/magento_product_card.dart';

// Cart widgets
export 'src/widgets/cart/magento_cart_badge.dart';

// Utility widgets
export 'src/widgets/utility/magento_rating_stars.dart';
export 'src/widgets/utility/magento_quantity_selector.dart';
export 'src/widgets/utility/magento_stock_status.dart';
