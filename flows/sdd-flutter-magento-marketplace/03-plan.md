# Implementation Plan: flutter_magento_marketplace

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_marketplace provides multi-vendor marketplace support. Implements SellerRepository for vendor management, SellerProductExtension for product-seller mapping, and split checkout extensions for multi-vendor orders.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code (if any)
- **Files**:
  - `packages/flutter_magento_marketplace/lib/flutter_magento_marketplace.dart` - Modify
  - Native directories if present - Delete
- **Dependencies**: flutter_magento_core, flutter_magento_cart implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, flutter_magento_cart, flutter_magento_catalog
- **Files**:
  - `packages/flutter_magento_marketplace/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Data Models

#### Task 2.1: Create Seller Model
- **Description**: Seller entity with profile, rating, location
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/models/seller.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model extends MagentoEntity
- **Complexity**: Medium

#### Task 2.2: Create SellerLocation Model
- **Description**: Seller location (city, region, country)
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/models/seller_location.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.3: Create SellerStatistics Model
- **Description**: Seller stats (orders, fulfillment rate, sales)
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/models/seller_statistics.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.4: Create SellerReview Model
- **Description**: Seller review with rating
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/models/seller_review.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.5: Create SellerFilter and SellerSort
- **Description**: Query parameters for seller search
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/models/seller_filter.dart` - Create
  - `packages/flutter_magento_marketplace/lib/src/models/seller_sort.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: toGraphQl() works
- **Complexity**: Low

#### Task 2.6: Create SellerInfo Model
- **Description**: Lightweight seller info for products
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/models/seller_info.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

### Phase 3: Mappers

#### Task 3.1: Create SellerMapper
- **Description**: Map GraphQL response to Seller models
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/mappers/seller_mapper.dart` - Create
- **Dependencies**: Task 2.1, Task 2.2, Task 2.3, Task 2.4
- **Verification**: Mapper handles full seller response
- **Complexity**: Medium

### Phase 4: Repository

#### Task 4.1: Create GraphQL Queries
- **Description**: Seller queries and mutations
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/graphql/seller_queries.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Queries syntactically correct
- **Complexity**: Medium

#### Task 4.2: Create MagentoSellerRepository
- **Description**: Implement SellerRepository interface
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/repositories/magento_seller_repository.dart` - Create
- **Dependencies**: Task 3.1, Task 4.1
- **Verification**: All methods implemented
- **Complexity**: High

### Phase 5: Extensions

#### Task 5.1: Create SellerProductExtension
- **Description**: MagentoProductExtension for seller data on products
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/extensions/seller_product_extension.dart` - Create
- **Dependencies**: Task 2.6
- **Verification**: Extension extracts seller info from products
- **Complexity**: Medium

#### Task 5.2: Create MarketplaceCartExtension
- **Description**: Group cart items by seller, split subtotals
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/extensions/marketplace_cart_extension.dart` - Create
- **Dependencies**: Task 4.2
- **Verification**: Cart grouping works
- **Complexity**: Medium

#### Task 5.3: Create MarketplaceCheckoutExtension
- **Description**: Multi-vendor checkout with per-seller shipping
- **Files**:
  - `packages/flutter_magento_marketplace/lib/src/extensions/marketplace_checkout_extension.dart` - Create
- **Dependencies**: Task 5.2
- **Verification**: Split checkout works
- **Complexity**: High

### Phase 6: Exports and Tests

#### Task 6.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_marketplace/lib/flutter_magento_marketplace.dart` - Modify
- **Dependencies**: All previous tasks
- **Verification**: All types accessible
- **Complexity**: Low

#### Task 6.2: Create Unit Tests
- **Description**: Test repository and extensions
- **Files**:
  - `packages/flutter_magento_marketplace/test/seller_repository_test.dart` - Create
  - `packages/flutter_magento_marketplace/test/cart_extension_test.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──┐
                        │               │
                        ├──→ Task 2.2 ──┤
                        │               │
                        ├──→ Task 2.3 ──┼──→ Task 3.1 ──┐
                        │               │               │
                        ├──→ Task 2.4 ──┘               │
                        │                               │
                        ├──→ Task 2.5                   │
                        │                               │
                        ├──→ Task 2.6 ──────────────────┼──→ Task 5.1 ──┐
                        │                               │               │
                        └──→ Task 4.1 ──────────────────┴──→ Task 4.2 ──┼──→ Task 5.2 ──→ Task 5.3 ──┐
                                                                        │                           │
                                                                        └───────────────────────────┴──→ Task 6.1 ──→ Task 6.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_marketplace.dart` | Modify | Public exports |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/models/*.dart` | Create | Domain models |
| `lib/src/mappers/*.dart` | Create | JSON mappers |
| `lib/src/graphql/*.dart` | Create | GraphQL operations |
| `lib/src/repositories/*.dart` | Create | Seller repository |
| `lib/src/extensions/*.dart` | Create | Cart/checkout extensions |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Marketplace module not installed | Medium | Medium | Graceful fallback |
| Split order API variations | Medium | Medium | Abstract order creation |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
