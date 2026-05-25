# Implementation Plan: flutter_magento_cart

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_cart implements `CartRepository` with guest/customer cart management. `CartSessionManager` handles automatic cart lifecycle including guest-to-customer merge on login. Supports simple and configurable products, coupons, and full cart totals.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_cart/lib/flutter_magento_cart.dart` - Modify
  - `packages/flutter_magento_cart/lib/flutter_magento_cart_method_channel.dart` - Delete
  - `packages/flutter_magento_cart/lib/flutter_magento_cart_platform_interface.dart` - Delete
  - `packages/flutter_magento_cart/android/` - Delete
  - `packages/flutter_magento_cart/ios/` - Delete
  - `packages/flutter_magento_cart/linux/` - Delete
  - `packages/flutter_magento_cart/macos/` - Delete
  - `packages/flutter_magento_cart/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependency: flutter_magento_core
- **Files**:
  - `packages/flutter_magento_cart/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Data Models

#### Task 2.1: Create Cart Model
- **Description**: Full cart with items, totals, addresses, coupon
- **Files**:
  - `packages/flutter_magento_cart/lib/src/models/cart.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Medium

#### Task 2.2: Create CartItem Model
- **Description**: Line item with product info, quantity, options
- **Files**:
  - `packages/flutter_magento_cart/lib/src/models/cart_item.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.3: Create CartTotals Model
- **Description**: Subtotal, tax, discount, shipping, grand total
- **Files**:
  - `packages/flutter_magento_cart/lib/src/models/cart_totals.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles with Money
- **Complexity**: Low

#### Task 2.4: Create CartDiscount Model
- **Description**: Applied discount code and amount
- **Files**:
  - `packages/flutter_magento_cart/lib/src/models/cart_discount.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

### Phase 3: Mappers and GraphQL

#### Task 3.1: Create CartMapper
- **Description**: Map GraphQL response to Cart domain model
- **Files**:
  - `packages/flutter_magento_cart/lib/src/mappers/cart_mapper.dart` - Create
- **Dependencies**: Task 2.1, Task 2.2, Task 2.3, Task 2.4
- **Verification**: Mapper handles full cart response
- **Complexity**: High

#### Task 3.2: Create GraphQL Mutations
- **Description**: Cart operations (create, add, update, remove, coupon)
- **Files**:
  - `packages/flutter_magento_cart/lib/src/mutations/cart_mutations.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Mutations syntactically correct
- **Complexity**: Medium

### Phase 4: Repository and Services

#### Task 4.1: Create MagentoCartRepository
- **Description**: Implement full CartRepository interface
- **Files**:
  - `packages/flutter_magento_cart/lib/src/repository/magento_cart_repository.dart` - Create
- **Dependencies**: Task 3.1, Task 3.2
- **Verification**: All methods implemented
- **Complexity**: High

#### Task 4.2: Create CartSessionManager
- **Description**: Automatic cart lifecycle (create, merge on login)
- **Files**:
  - `packages/flutter_magento_cart/lib/src/services/cart_session_manager.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: Guest-to-customer merge works
- **Complexity**: Medium

### Phase 5: Exports and Tests

#### Task 5.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_cart/lib/flutter_magento_cart.dart` - Modify
- **Dependencies**: Task 4.2
- **Verification**: All types accessible via single import
- **Complexity**: Low

#### Task 5.2: Create Unit Tests
- **Description**: Test cart operations, mapper, session manager
- **Files**:
  - `packages/flutter_magento_cart/test/cart_mapper_test.dart` - Create
  - `packages/flutter_magento_cart/test/cart_repository_test.dart` - Create
  - `packages/flutter_magento_cart/test/cart_session_manager_test.dart` - Create
- **Dependencies**: Task 5.1
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
                        └──→ Task 3.2 ──────────────────┴──→ Task 4.1 ──→ Task 4.2 ──→ Task 5.1 ──→ Task 5.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_cart.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/models/*.dart` | Create | Domain models |
| `lib/src/mappers/*.dart` | Create | JSON mappers |
| `lib/src/mutations/*.dart` | Create | GraphQL operations |
| `lib/src/repository/*.dart` | Create | Cart repository |
| `lib/src/services/*.dart` | Create | Session manager |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Cart merge edge cases | Medium | Medium | Test logged-in without guest cart |
| Stock validation errors | Medium | Low | Handle errors gracefully in UI |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
