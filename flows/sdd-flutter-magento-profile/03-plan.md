# Implementation Plan: flutter_magento_profile

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_profile implements `CustomerRepository`, `OrderRepository`, and `WishlistRepository`. It manages customer account data including addresses, order history with tracking, and wishlist operations.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_profile/lib/flutter_magento_profile.dart` - Modify
  - `packages/flutter_magento_profile/lib/flutter_magento_profile_method_channel.dart` - Delete
  - `packages/flutter_magento_profile/lib/flutter_magento_profile_platform_interface.dart` - Delete
  - `packages/flutter_magento_profile/android/` - Delete
  - `packages/flutter_magento_profile/ios/` - Delete
  - `packages/flutter_magento_profile/linux/` - Delete
  - `packages/flutter_magento_profile/macos/` - Delete
  - `packages/flutter_magento_profile/windows/` - Delete
- **Dependencies**: flutter_magento_core, flutter_magento_auth implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, flutter_magento_auth
- **Files**:
  - `packages/flutter_magento_profile/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Data Models

#### Task 2.1: Create Address Model
- **Description**: Shipping/billing address with defaults
- **Files**:
  - `packages/flutter_magento_profile/lib/src/models/address.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.2: Create Order Model
- **Description**: Order with status, totals, items, addresses
- **Files**:
  - `packages/flutter_magento_profile/lib/src/models/order.dart` - Create
  - `packages/flutter_magento_profile/lib/src/models/order_status.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Medium

#### Task 2.3: Create OrderItem Model
- **Description**: Line item with quantities (ordered, shipped, refunded)
- **Files**:
  - `packages/flutter_magento_profile/lib/src/models/order_item.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.4: Create OrderPage Model
- **Description**: Paginated order list
- **Files**:
  - `packages/flutter_magento_profile/lib/src/models/order_page.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.5: Create Wishlist Models
- **Description**: Wishlist and WishlistItem
- **Files**:
  - `packages/flutter_magento_profile/lib/src/models/wishlist.dart` - Create
  - `packages/flutter_magento_profile/lib/src/models/wishlist_item.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Models compile
- **Complexity**: Low

#### Task 2.6: Create CustomerUpdate Model
- **Description**: Customer profile update DTO
- **Files**:
  - `packages/flutter_magento_profile/lib/src/models/customer_update.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

### Phase 3: Mappers

#### Task 3.1: Create AddressMapper
- **Description**: Map address JSON to/from domain model
- **Files**:
  - `packages/flutter_magento_profile/lib/src/mappers/address_mapper.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Bidirectional mapping works
- **Complexity**: Low

#### Task 3.2: Create OrderMapper
- **Description**: Map order response to domain model
- **Files**:
  - `packages/flutter_magento_profile/lib/src/mappers/order_mapper.dart` - Create
- **Dependencies**: Task 2.2, Task 2.3
- **Verification**: Mapper handles full order response
- **Complexity**: Medium

#### Task 3.3: Create WishlistMapper
- **Description**: Map wishlist response
- **Files**:
  - `packages/flutter_magento_profile/lib/src/mappers/wishlist_mapper.dart` - Create
- **Dependencies**: Task 2.5
- **Verification**: Mapper handles wishlist items
- **Complexity**: Low

### Phase 4: Repositories

#### Task 4.1: Create GraphQL Queries/Mutations
- **Description**: Customer, address, order, wishlist operations
- **Files**:
  - `packages/flutter_magento_profile/lib/src/graphql/customer_queries.dart` - Create
  - `packages/flutter_magento_profile/lib/src/graphql/order_queries.dart` - Create
  - `packages/flutter_magento_profile/lib/src/graphql/wishlist_queries.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Queries syntactically correct
- **Complexity**: Medium

#### Task 4.2: Create MagentoCustomerRepository
- **Description**: Implement CustomerRepository interface
- **Files**:
  - `packages/flutter_magento_profile/lib/src/repositories/magento_customer_repository.dart` - Create
- **Dependencies**: Task 3.1, Task 4.1
- **Verification**: All methods implemented
- **Complexity**: Medium

#### Task 4.3: Create MagentoOrderRepository
- **Description**: Implement OrderRepository interface
- **Files**:
  - `packages/flutter_magento_profile/lib/src/repositories/magento_order_repository.dart` - Create
- **Dependencies**: Task 3.2, Task 4.1
- **Verification**: All methods implemented
- **Complexity**: Medium

#### Task 4.4: Create MagentoWishlistRepository
- **Description**: Implement WishlistRepository interface
- **Files**:
  - `packages/flutter_magento_profile/lib/src/repositories/magento_wishlist_repository.dart` - Create
- **Dependencies**: Task 3.3, Task 4.1
- **Verification**: All methods implemented
- **Complexity**: Medium

### Phase 5: Exports and Tests

#### Task 5.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_profile/lib/flutter_magento_profile.dart` - Modify
- **Dependencies**: Task 4.2, Task 4.3, Task 4.4
- **Verification**: All types accessible via single import
- **Complexity**: Low

#### Task 5.2: Create Unit Tests
- **Description**: Test repositories and mappers
- **Files**:
  - `packages/flutter_magento_profile/test/address_mapper_test.dart` - Create
  - `packages/flutter_magento_profile/test/order_repository_test.dart` - Create
  - `packages/flutter_magento_profile/test/wishlist_repository_test.dart` - Create
- **Dependencies**: Task 5.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──→ Task 3.1 ──┐
                        │                            │
                        ├──→ Task 2.2 ──┐            │
                        │               │            │
                        ├──→ Task 2.3 ──┴──→ Task 3.2│
                        │                            │
                        ├──→ Task 2.4                │
                        │                            │
                        ├──→ Task 2.5 ──→ Task 3.3 ──┤
                        │                            │
                        ├──→ Task 2.6                │
                        │                            │
                        └──→ Task 4.1 ───────────────┴──→ Task 4.2 ──┐
                                                     │               │
                                                     ├──→ Task 4.3 ──┼──→ Task 5.1 ──→ Task 5.2
                                                     │               │
                                                     └──→ Task 4.4 ──┘
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_profile.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/models/*.dart` | Create | Domain models |
| `lib/src/mappers/*.dart` | Create | JSON mappers |
| `lib/src/graphql/*.dart` | Create | GraphQL operations |
| `lib/src/repositories/*.dart` | Create | 3 repositories |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Order status names vary | Low | Low | Map unknown to generic status |
| Wishlist disabled on store | Low | Low | Handle gracefully |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
