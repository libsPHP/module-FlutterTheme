/// Multi-vendor marketplace support for Flutter Magento SDK.
///
/// Provides seller management, product-seller relationships,
/// and split checkout for multi-vendor orders.
library;

// Models
export 'src/models/seller.dart';
export 'src/models/seller_filter.dart';
export 'src/models/seller_info.dart';
export 'src/models/seller_location.dart';
export 'src/models/seller_review.dart';
export 'src/models/seller_sort.dart';
export 'src/models/seller_statistics.dart';

// Repositories
export 'src/repositories/seller_repository.dart';
export 'src/repositories/magento_seller_repository.dart';

// Extensions
export 'src/extensions/seller_product_extension.dart';
export 'src/extensions/marketplace_cart_extension.dart';
export 'src/extensions/marketplace_checkout_extension.dart';

// Mappers (for custom implementations)
export 'src/mappers/seller_mapper.dart';

// Queries (for custom implementations)
export 'src/queries/seller_queries.dart';
