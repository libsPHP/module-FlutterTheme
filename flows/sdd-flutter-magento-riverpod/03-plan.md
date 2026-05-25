# Implementation Plan: flutter_magento_riverpod

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_riverpod wraps SDK repositories in Riverpod providers and controllers. Provides reactive state management with automatic caching, error handling, and cross-feature coordination (auth→cart merge). Requires all domain packages to be implemented first.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_riverpod/lib/flutter_magento_riverpod.dart` - Modify
  - `packages/flutter_magento_riverpod/lib/flutter_magento_riverpod_method_channel.dart` - Delete
  - `packages/flutter_magento_riverpod/lib/flutter_magento_riverpod_platform_interface.dart` - Delete
  - `packages/flutter_magento_riverpod/android/` - Delete
  - `packages/flutter_magento_riverpod/ios/` - Delete
  - `packages/flutter_magento_riverpod/linux/` - Delete
  - `packages/flutter_magento_riverpod/macos/` - Delete
  - `packages/flutter_magento_riverpod/windows/` - Delete
- **Dependencies**: All domain packages implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add all Magento packages and flutter_riverpod
- **Files**:
  - `packages/flutter_magento_riverpod/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Configuration

#### Task 2.1: Create MagentoConfig
- **Description**: Configuration holder for client setup
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/config/magento_config.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config instantiation works
- **Complexity**: Low

#### Task 2.2: Create Query Params Classes
- **Description**: ProductQueryParams, CategoryProductsParams, OrderQueryParams
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/params/query_params.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Params immutable with equality
- **Complexity**: Low

### Phase 3: State Classes

#### Task 3.1: Create AuthState
- **Description**: Sealed class for auth states
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/state/auth_state.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: States compile
- **Complexity**: Low

#### Task 3.2: Create CheckoutState
- **Description**: Checkout flow state
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/state/checkout_state.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: States compile
- **Complexity**: Low

### Phase 4: Core Providers

#### Task 4.1: Create Core Providers
- **Description**: magentoClientProvider, repository providers
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/providers/core_providers.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Providers compile
- **Complexity**: Medium

### Phase 5: Controllers

#### Task 5.1: Create AuthController
- **Description**: AsyncNotifier for auth with login/logout/register
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/controllers/auth_controller.dart` - Create
- **Dependencies**: Task 3.1, Task 4.1
- **Verification**: Auth flow works
- **Complexity**: High

#### Task 5.2: Create CartController
- **Description**: AsyncNotifier for cart operations
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/controllers/cart_controller.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: Cart mutations work
- **Complexity**: Medium

#### Task 5.3: Create CheckoutController
- **Description**: AsyncNotifier for checkout flow
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/controllers/checkout_controller.dart` - Create
- **Dependencies**: Task 3.2, Task 4.1
- **Verification**: Checkout steps work
- **Complexity**: High

### Phase 6: Feature Providers

#### Task 6.1: Create Auth Providers
- **Description**: authControllerProvider, isLoggedInProvider
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/providers/auth_providers.dart` - Create
- **Dependencies**: Task 5.1
- **Verification**: Auth state reactive
- **Complexity**: Low

#### Task 6.2: Create Catalog Providers
- **Description**: productsProvider, productDetailsProvider, categoryTreeProvider
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/providers/catalog_providers.dart` - Create
- **Dependencies**: Task 4.1, Task 2.2
- **Verification**: Catalog queries work
- **Complexity**: Medium

#### Task 6.3: Create Cart Providers
- **Description**: cartControllerProvider, cartItemCountProvider
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/providers/cart_providers.dart` - Create
- **Dependencies**: Task 5.2
- **Verification**: Cart state reactive
- **Complexity**: Low

#### Task 6.4: Create Profile Providers
- **Description**: customerProvider, addressesProvider, ordersProvider, wishlistProvider
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/providers/profile_providers.dart` - Create
- **Dependencies**: Task 4.1, Task 2.2
- **Verification**: Profile queries work
- **Complexity**: Medium

#### Task 6.5: Create Checkout Providers
- **Description**: checkoutControllerProvider, shippingMethodsProvider
- **Files**:
  - `packages/flutter_magento_riverpod/lib/src/providers/checkout_providers.dart` - Create
- **Dependencies**: Task 5.3
- **Verification**: Checkout state reactive
- **Complexity**: Low

### Phase 7: Exports and Tests

#### Task 7.1: Create Public Export File
- **Description**: Export all providers, controllers, states
- **Files**:
  - `packages/flutter_magento_riverpod/lib/flutter_magento_riverpod.dart` - Modify
- **Dependencies**: All Phase 6 tasks
- **Verification**: All types accessible
- **Complexity**: Low

#### Task 7.2: Create Unit Tests
- **Description**: Test controllers with mock repositories
- **Files**:
  - `packages/flutter_magento_riverpod/test/auth_controller_test.dart` - Create
  - `packages/flutter_magento_riverpod/test/cart_controller_test.dart` - Create
  - `packages/flutter_magento_riverpod/test/providers_test.dart` - Create
- **Dependencies**: Task 7.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──→ Task 4.1 ──┬──→ Task 5.1 ──→ Task 6.1 ──┐
                        │                            │                            │
                        ├──→ Task 2.2 ───────────────┼──→ Task 5.2 ──→ Task 6.3 ──┤
                        │                            │                            │
                        ├──→ Task 3.1 ───────────────┤                            │
                        │                            │                            │
                        └──→ Task 3.2 ───────────────┴──→ Task 5.3 ──→ Task 6.5 ──┤
                                                     │                            │
                                                     ├──→ Task 6.2 ───────────────┤
                                                     │                            │
                                                     └──→ Task 6.4 ───────────────┴──→ Task 7.1 ──→ Task 7.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_riverpod.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/config/*.dart` | Create | Configuration |
| `lib/src/params/*.dart` | Create | Query params |
| `lib/src/state/*.dart` | Create | State classes |
| `lib/src/providers/*.dart` | Create | All providers |
| `lib/src/controllers/*.dart` | Create | Controllers |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Cross-feature coordination bugs | Medium | Medium | Test auth→cart integration |
| Provider circular dependencies | Low | High | Keep provider graph clean |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
