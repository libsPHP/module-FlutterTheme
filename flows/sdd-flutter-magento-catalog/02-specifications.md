# Specifications: flutter_magento_catalog

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_catalog provides `CatalogRepository` implementation with domain models for products, categories, and search. It transforms Magento's complex product model into clean, UI-ready entities.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| MagentoCatalogRepository | Create | Implements CatalogRepository |
| ProductSummary | Create | List view product model |
| ProductDetails | Create | Full product with variants |
| Category | Create | Category tree model |
| ProductFilter/Sort | Create | Query parameters |
| Product mappers | Create | DTO to domain transformers |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                  flutter_magento_catalog                     │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │         MagentoCatalogRepository                    │     │
│  │         implements CatalogRepository                │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌──────────┐  ┌─────────▼───────┐  ┌──────────────────┐   │
│  │  Domain  │  │    Mappers      │  │   GraphQL        │   │
│  │  Models  │  │  (DTO→Domain)   │  │   Fragments      │   │
│  └──────────┘  └─────────────────┘  └──────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### MagentoCatalogRepository

```dart
class MagentoCatalogRepository implements CatalogRepository {
  final MagentoTransport transport;
  final ProductMapper _mapper;

  MagentoCatalogRepository(this.transport) : _mapper = ProductMapper();

  @override
  Future<ProductPage> searchProducts({
    String? query,
    ProductFilter? filter,
    ProductSort? sort,
    required int page,
    required int pageSize,
  }) async {
    final response = await transport.graphql(
      ProductQueries.search,
      variables: {
        'search': query,
        'filter': filter?.toGraphQl(),
        'sort': sort?.toGraphQl(),
        'pageSize': pageSize,
        'currentPage': page,
      },
      decoder: (json) => _mapper.mapProductPage(json['products']),
    );
    return response.data;
  }

  @override
  Future<ProductDetails> getProductBySku(String sku);

  @override
  Future<List<Category>> getCategoryTree();

  @override
  Future<ProductPage> getProductsByCategory({
    required String categoryId,
    required int page,
    required int pageSize,
    ProductSort? sort,
    ProductFilter? filter,
  });
}
```

## Data Models

### ProductSummary (List View)

```dart
class ProductSummary extends MagentoEntity {
  final String id;
  final String sku;
  final String name;
  final Money price;
  final Money? regularPrice;   // For showing discounts
  final Money? specialPrice;
  final String? thumbnailUrl;
  final bool inStock;
  final ProductType type;
  final double? rating;
  final int? reviewCount;

  const ProductSummary({...});

  bool get hasDiscount => regularPrice != null && price.value < regularPrice!.value;
  double get discountPercent => hasDiscount
      ? ((regularPrice!.value - price.value) / regularPrice!.value * 100)
      : 0;
}
```

### ProductDetails (Detail View)

```dart
class ProductDetails extends MagentoEntity {
  final String id;
  final String sku;
  final String name;
  final String? description;
  final String? shortDescription;
  final Money price;
  final Money? regularPrice;
  final PriceRange? priceRange;     // For configurables
  final List<ProductImage> images;
  final bool inStock;
  final int? stockQty;
  final ProductType type;
  final List<ProductVariant>? variants;       // For configurable
  final List<ConfigurableOption>? options;    // Size, Color etc.
  final List<BundleOption>? bundleOptions;    // For bundle
  final List<GroupedItem>? groupedItems;      // For grouped
  final double? weight;
  final List<ProductSummary>? relatedProducts;
  final List<ProductSummary>? upsellProducts;
  final List<ProductSummary>? crosssellProducts;

  const ProductDetails({...});
}
```

### ConfigurableOption

```dart
class ConfigurableOption {
  final String attributeCode;
  final String label;
  final List<OptionValue> values;

  const ConfigurableOption({...});
}

class OptionValue {
  final String uid;
  final String label;
  final String? swatchValue;    // Color hex or image URL
  final SwatchType? swatchType;

  const OptionValue({...});
}

enum SwatchType { color, image, text }
```

### ProductVariant

```dart
class ProductVariant {
  final String sku;
  final Money price;
  final bool inStock;
  final int? stockQty;
  final Map<String, String> attributes; // color: 'Red', size: 'XL'

  const ProductVariant({...});
}
```

### Category

```dart
class Category {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final int productCount;
  final List<Category> children;
  final int level;
  final String? urlPath;

  const Category({...});
}
```

### ProductFilter

```dart
class ProductFilter {
  final Money? priceMin;
  final Money? priceMax;
  final List<String>? categoryIds;
  final Map<String, List<String>>? attributes; // color: ['Red', 'Blue']
  final bool? inStockOnly;

  const ProductFilter({...});

  Map<String, dynamic> toGraphQl() => {...};
}

enum ProductSortField { name, price, position, relevance, createdAt }
enum SortDirection { asc, desc }

class ProductSort {
  final ProductSortField field;
  final SortDirection direction;

  const ProductSort({...});

  Map<String, dynamic> toGraphQl() => {...};
}
```

### ProductPage

```dart
class ProductPage {
  final List<ProductSummary> items;
  final int totalCount;
  final int currentPage;
  final int pageSize;
  final List<Aggregation>? aggregations;  // For faceted search

  const ProductPage({...});

  bool get hasMore => currentPage * pageSize < totalCount;
  int get totalPages => (totalCount / pageSize).ceil();
}

class Aggregation {
  final String attributeCode;
  final String label;
  final List<AggregationOption> options;

  const Aggregation({...});
}
```

## GraphQL Queries

```graphql
fragment ProductSummaryFields on ProductInterface {
  id sku name
  thumbnail { url label }
  price_range {
    minimum_price {
      regular_price { value currency }
      final_price { value currency }
    }
  }
  stock_status
  review_count rating_summary
  __typename
}

query SearchProducts($search: String, $filter: ProductAttributeFilterInput,
                     $sort: ProductAttributeSortInput, $pageSize: Int!, $currentPage: Int!) {
  products(search: $search, filter: $filter, sort: $sort,
           pageSize: $pageSize, currentPage: $currentPage) {
    items { ...ProductSummaryFields }
    total_count
    page_info { current_page page_size total_pages }
    aggregations { attribute_code label options { label value count } }
  }
}
```

## Dependencies

### Requires

- flutter_magento_core

### Blocks

- flutter_magento_riverpod (catalog providers)
- flutter_magento_offline (catalog caching)

## Package Structure

```
lib/
├── flutter_magento_catalog.dart
└── src/
    ├── repository/
    │   └── magento_catalog_repository.dart
    ├── models/
    │   ├── product_summary.dart
    │   ├── product_details.dart
    │   ├── product_variant.dart
    │   ├── configurable_option.dart
    │   ├── category.dart
    │   ├── product_filter.dart
    │   ├── product_sort.dart
    │   └── product_page.dart
    ├── mappers/
    │   ├── product_mapper.dart
    │   └── category_mapper.dart
    └── queries/
        └── product_queries.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
