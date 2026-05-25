# Implementation Plan: flutter_magento_catalog

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_catalog implements `CatalogRepository` with product search, category tree, and product details. It transforms Magento's complex product model into clean domain entities (ProductSummary, ProductDetails). Handles configurable, bundle, grouped product types.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_catalog/lib/flutter_magento_catalog.dart` - Modify
  - `packages/flutter_magento_catalog/lib/flutter_magento_catalog_method_channel.dart` - Delete
  - `packages/flutter_magento_catalog/lib/flutter_magento_catalog_platform_interface.dart` - Delete
  - `packages/flutter_magento_catalog/android/` - Delete
  - `packages/flutter_magento_catalog/ios/` - Delete
  - `packages/flutter_magento_catalog/linux/` - Delete
  - `packages/flutter_magento_catalog/macos/` - Delete
  - `packages/flutter_magento_catalog/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependency: flutter_magento_core
- **Files**:
  - `packages/flutter_magento_catalog/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Data Models

#### Task 2.1: Create ProductSummary Model
- **Description**: List view product model (minimal fields)
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/models/product_summary.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles with MagentoEntity
- **Complexity**: Low

#### Task 2.2: Create ProductDetails Model
- **Description**: Full product with variants, options, related products
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/models/product_details.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Medium

#### Task 2.3: Create ConfigurableOption Models
- **Description**: ConfigurableOption, OptionValue, SwatchType
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/models/configurable_option.dart` - Create
  - `packages/flutter_magento_catalog/lib/src/models/product_variant.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Models compile
- **Complexity**: Low

#### Task 2.4: Create Category Model
- **Description**: Category tree with children
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/models/category.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.5: Create ProductFilter and ProductSort
- **Description**: Filter and sort parameters with toGraphQl()
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/models/product_filter.dart` - Create
  - `packages/flutter_magento_catalog/lib/src/models/product_sort.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: toGraphQl() produces correct structure
- **Complexity**: Low

#### Task 2.6: Create ProductPage and Aggregation
- **Description**: Paginated result with faceted search data
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/models/product_page.dart` - Create
  - `packages/flutter_magento_catalog/lib/src/models/aggregation.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Models compile
- **Complexity**: Low

#### Task 2.7: Create ProductImage Model
- **Description**: Product image with URL, label, position
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/models/product_image.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

### Phase 3: Mappers

#### Task 3.1: Create ProductMapper
- **Description**: Map GraphQL response to ProductSummary/ProductDetails
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/mappers/product_mapper.dart` - Create
- **Dependencies**: Task 2.1, Task 2.2, Task 2.3, Task 2.7
- **Verification**: Mapper handles all product types
- **Complexity**: High

#### Task 3.2: Create CategoryMapper
- **Description**: Map category tree response
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/mappers/category_mapper.dart` - Create
- **Dependencies**: Task 2.4
- **Verification**: Nested categories mapped correctly
- **Complexity**: Medium

### Phase 4: GraphQL and Repository

#### Task 4.1: Create GraphQL Queries
- **Description**: Product search, details, category queries with fragments
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/queries/product_queries.dart` - Create
  - `packages/flutter_magento_catalog/lib/src/queries/category_queries.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Queries syntactically correct
- **Complexity**: Medium

#### Task 4.2: Create MagentoCatalogRepository
- **Description**: Implement full CatalogRepository interface
- **Files**:
  - `packages/flutter_magento_catalog/lib/src/repository/magento_catalog_repository.dart` - Create
- **Dependencies**: Task 3.1, Task 3.2, Task 4.1
- **Verification**: All methods implemented
- **Complexity**: High

### Phase 5: Exports and Tests

#### Task 5.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_catalog/lib/flutter_magento_catalog.dart` - Modify
- **Dependencies**: Task 4.2
- **Verification**: All types accessible via single import
- **Complexity**: Low

#### Task 5.2: Create Unit Tests
- **Description**: Test mappers, filters, repository
- **Files**:
  - `packages/flutter_magento_catalog/test/product_mapper_test.dart` - Create
  - `packages/flutter_magento_catalog/test/category_mapper_test.dart` - Create
  - `packages/flutter_magento_catalog/test/product_filter_test.dart` - Create
- **Dependencies**: Task 5.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──┬──→ Task 2.6 ──┐
                        │               │               │
                        ├──→ Task 2.2 ──┤               │
                        │               │               │
                        ├──→ Task 2.3 ──┤               │
                        │               │               │
                        ├──→ Task 2.4 ──┼──→ Task 3.2 ──┤
                        │               │               │
                        ├──→ Task 2.5 ──┤               │
                        │               │               │
                        ├──→ Task 2.7 ──┴──→ Task 3.1 ──┼──→ Task 4.2 ──→ Task 5.1 ──→ Task 5.2
                        │                               │
                        └──→ Task 4.1 ──────────────────┘
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_catalog.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/models/*.dart` | Create | Domain models (10 files) |
| `lib/src/mappers/*.dart` | Create | JSON mappers |
| `lib/src/queries/*.dart` | Create | GraphQL operations |
| `lib/src/repository/*.dart` | Create | Catalog repository |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Complex product types (bundle, grouped) | Medium | Medium | Start with simple/configurable, add others |
| GraphQL response structure varies | Medium | Low | Make mappers defensive |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
