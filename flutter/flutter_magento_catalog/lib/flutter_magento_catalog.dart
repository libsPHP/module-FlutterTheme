/// Magento catalog repository implementation.
///
/// Provides product search, category browsing, and product details.
library;

// Re-export core types used by this package
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show
        ProductSummary,
        ProductDetails,
        ProductImage,
        ProductVariant,
        ConfigurableOption,
        ConfigurableOptionValue,
        SwatchType,
        ProductPage,
        ProductFilter,
        ProductSort,
        ProductSortField,
        Category,
        Aggregation,
        AggregationOption,
        ProductType,
        Money,
        SortDirection,
        CatalogRepository;

// Repository
export 'src/repository/magento_catalog_repository.dart';

// Mappers (for extension/customization)
export 'src/mappers/product_mapper.dart';
export 'src/mappers/category_mapper.dart';

// Queries (for extension/customization)
export 'src/queries/product_queries.dart';
export 'src/queries/category_queries.dart';
