# flutter_magento_catalog

[![pub package](https://img.shields.io/pub/v/flutter_magento_catalog.svg)](https://pub.dev/packages/flutter_magento_catalog)

Catalog module for Flutter Magento SDK - products, categories, search, and filters.

## Features

- Product listing with pagination
- Product search with filters and facets
- Category tree navigation
- Product details with variants
- Configurable product support (size, color swatches)
- Customizable GraphQL queries and mappers

## Installation

```yaml
dependencies:
  flutter_magento_catalog: ^1.0.0
```

## Usage

### Setup

```dart
import 'package:flutter_magento_catalog/flutter_magento_catalog.dart';

final catalogRepository = MagentoCatalogRepository(
  transport: myGraphQLTransport,
);
```

### Get Products

```dart
final page = await catalogRepository.getProducts(
  page: 1,
  pageSize: 20,
  filter: ProductFilter(
    categoryId: 5,
    priceRange: PriceRange(min: 10, max: 100),
    inStock: true,
  ),
  sort: ProductSort(
    field: ProductSortField.price,
    direction: SortDirection.asc,
  ),
);

for (final product in page.items) {
  print('${product.name}: ${product.price.formatted}');
}
```

### Search Products

```dart
final results = await catalogRepository.searchProducts(
  query: 'blue shirt',
  page: 1,
  pageSize: 20,
);

// Access facets/aggregations
for (final agg in results.aggregations) {
  print('${agg.label}: ${agg.options.length} options');
}
```

### Get Product Details

```dart
final product = await catalogRepository.getProductBySku('SHIRT-001');

print(product.name);
print(product.description);

// Configurable options
for (final option in product.configurableOptions ?? []) {
  print('${option.label}: ${option.values.map((v) => v.label).join(', ')}');
}

// Images
for (final image in product.images) {
  print(image.url);
}
```

### Get Categories

```dart
final categories = await catalogRepository.getCategories();

void printTree(Category cat, [int indent = 0]) {
  print('${'  ' * indent}${cat.name}');
  for (final child in cat.children) {
    printTree(child, indent + 1);
  }
}

for (final cat in categories) {
  printTree(cat);
}
```

## Customization

### Custom Product Mapper

```dart
class MyProductMapper extends ProductMapper {
  @override
  ProductDetails mapProductDetails(Map<String, dynamic> data) {
    final product = super.mapProductDetails(data);
    // Add custom attributes
    return product;
  }
}

final repository = MagentoCatalogRepository(
  transport: transport,
  productMapper: MyProductMapper(),
);
```

### Custom Queries

```dart
class MyProductQueries extends ProductQueries {
  @override
  String get productDetailsQuery => '''
    query GetProduct(\$sku: String!) {
      products(filter: { sku: { eq: \$sku } }) {
        items {
          sku
          name
          # your custom fields
          my_custom_attribute
        }
      }
    }
  ''';
}
```

## API Reference

| Class | Description |
|-------|-------------|
| `MagentoCatalogRepository` | Main repository implementation |
| `ProductMapper` | Maps GraphQL responses to models |
| `CategoryMapper` | Maps category data |
| `ProductQueries` | GraphQL query definitions |
| `CategoryQueries` | Category query definitions |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_ui](https://pub.dev/packages/flutter_magento_ui) - Product widgets
- [flutter_magento_riverpod](https://pub.dev/packages/flutter_magento_riverpod) - State management
