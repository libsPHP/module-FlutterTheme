# Implementation Plan: flutter_magento_core

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-24
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_core is the foundation package that all other flutter_magento_* packages depend on. Implementation starts with removing plugin boilerplate, then building core abstractions layer by layer: value objects → context/storage → transport → errors → repository interfaces → extensions → client facade. No external dependencies except meta for annotations.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code and restructure for pure Dart package
- **Files**:
  - `packages/flutter_magento_core/lib/flutter_magento_core.dart` - Modify (remove plugin code)
  - `packages/flutter_magento_core/lib/flutter_magento_core_method_channel.dart` - Delete
  - `packages/flutter_magento_core/lib/flutter_magento_core_platform_interface.dart` - Delete
  - `packages/flutter_magento_core/lib/src/` - Create directory structure
  - `packages/flutter_magento_core/android/` - Delete (no native code)
  - `packages/flutter_magento_core/ios/` - Delete (no native code)
  - `packages/flutter_magento_core/linux/` - Delete
  - `packages/flutter_magento_core/macos/` - Delete
  - `packages/flutter_magento_core/windows/` - Delete
  - `packages/flutter_magento_core/test/flutter_magento_core_test.dart` - Modify
- **Dependencies**: None
- **Verification**: `flutter pub get` succeeds, no native code references
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Update package configuration for pure Dart SDK package
- **Files**:
  - `packages/flutter_magento_core/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter analyze` passes
- **Complexity**: Low

### Phase 2: Core Value Objects

#### Task 2.1: Create Money Value Object
- **Description**: Implement immutable Money class with currency and value
- **Files**:
  - `packages/flutter_magento_core/lib/src/models/money.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Unit tests pass for Money operations
- **Complexity**: Low

#### Task 2.2: Create ProductType Enum
- **Description**: Implement ProductType enum for Magento product types
- **Files**:
  - `packages/flutter_magento_core/lib/src/models/product_type.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: All product types defined, fromString works
- **Complexity**: Low

#### Task 2.3: Create MagentoEntity Base Class
- **Description**: Implement base class with custom attributes support
- **Files**:
  - `packages/flutter_magento_core/lib/src/models/magento_entity.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: attr<T>() method works correctly
- **Complexity**: Low

#### Task 2.4: Create SortDirection Enum
- **Description**: Implement SortDirection enum (asc, desc)
- **Files**:
  - `packages/flutter_magento_core/lib/src/models/sort_direction.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Enum values correct
- **Complexity**: Low

### Phase 3: Context and Storage

#### Task 3.1: Create MagentoStoreContext
- **Description**: Implement store context with storeCode, currency, locale, websiteCode
- **Files**:
  - `packages/flutter_magento_core/lib/src/context/magento_store_context.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Context creation and defaults work
- **Complexity**: Low

#### Task 3.2: Create MagentoAuthStorage Interface
- **Description**: Implement abstract interface for token/cart storage
- **Files**:
  - `packages/flutter_magento_core/lib/src/storage/magento_auth_storage.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Interface compiles, methods defined
- **Complexity**: Low

#### Task 3.3: Create MemoryMagentoAuthStorage
- **Description**: Implement in-memory auth storage for testing
- **Files**:
  - `packages/flutter_magento_core/lib/src/storage/memory_magento_auth_storage.dart` - Create
- **Dependencies**: Task 3.2
- **Verification**: All interface methods work in memory
- **Complexity**: Low

### Phase 4: Transport Layer

#### Task 4.1: Create MagentoRequestOptions
- **Description**: Implement request options (headers, timeout, cache policy)
- **Files**:
  - `packages/flutter_magento_core/lib/src/transport/magento_request_options.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Options creation works
- **Complexity**: Low

#### Task 4.2: Create MagentoResponse
- **Description**: Implement typed response wrapper with data, status, headers
- **Files**:
  - `packages/flutter_magento_core/lib/src/transport/magento_response.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Response wrapping works correctly
- **Complexity**: Low

#### Task 4.3: Create MagentoTransport Interface
- **Description**: Implement abstract transport interface with get/post/put/delete/graphql
- **Files**:
  - `packages/flutter_magento_core/lib/src/transport/magento_transport.dart` - Create
- **Dependencies**: Task 4.1, Task 4.2
- **Verification**: Interface compiles, all methods defined
- **Complexity**: Medium

### Phase 5: Error Model

#### Task 5.1: Create MagentoException Sealed Hierarchy
- **Description**: Implement sealed class hierarchy for all Magento error types
- **Files**:
  - `packages/flutter_magento_core/lib/src/errors/magento_exception.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: All exception types defined, inheritance correct
- **Complexity**: Medium

### Phase 6: Repository Interfaces

#### Task 6.1: Create Domain Model Stubs
- **Description**: Create stub domain models used by repository interfaces
- **Files**:
  - `packages/flutter_magento_core/lib/src/models/customer.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/customer_session.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/product.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/product_page.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/product_filter.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/product_sort.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/category.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/cart.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/cart_item.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/address.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/shipping_method.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/payment_method.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/order.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/order_result.dart` - Create
  - `packages/flutter_magento_core/lib/src/models/wishlist.dart` - Create
- **Dependencies**: Task 2.1, Task 2.2, Task 2.3
- **Verification**: All models compile, extend MagentoEntity where appropriate
- **Complexity**: High

#### Task 6.2: Create AuthRepository Interface
- **Description**: Define auth repository interface
- **Files**:
  - `packages/flutter_magento_core/lib/src/repositories/auth_repository.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles with correct method signatures
- **Complexity**: Low

#### Task 6.3: Create CatalogRepository Interface
- **Description**: Define catalog repository interface
- **Files**:
  - `packages/flutter_magento_core/lib/src/repositories/catalog_repository.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles with correct method signatures
- **Complexity**: Low

#### Task 6.4: Create CartRepository Interface
- **Description**: Define cart repository interface
- **Files**:
  - `packages/flutter_magento_core/lib/src/repositories/cart_repository.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles with correct method signatures
- **Complexity**: Low

#### Task 6.5: Create CheckoutRepository Interface
- **Description**: Define checkout repository interface
- **Files**:
  - `packages/flutter_magento_core/lib/src/repositories/checkout_repository.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles with correct method signatures
- **Complexity**: Low

#### Task 6.6: Create CustomerRepository Interface
- **Description**: Define customer repository interface
- **Files**:
  - `packages/flutter_magento_core/lib/src/repositories/customer_repository.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles with correct method signatures
- **Complexity**: Low

#### Task 6.7: Create OrderRepository Interface
- **Description**: Define order repository interface
- **Files**:
  - `packages/flutter_magento_core/lib/src/repositories/order_repository.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles with correct method signatures
- **Complexity**: Low

#### Task 6.8: Create WishlistRepository Interface
- **Description**: Define wishlist repository interface
- **Files**:
  - `packages/flutter_magento_core/lib/src/repositories/wishlist_repository.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles with correct method signatures
- **Complexity**: Low

### Phase 7: Logging Interface

#### Task 7.1: Create MagentoLogger Interface
- **Description**: Define logger interface with log levels
- **Files**:
  - `packages/flutter_magento_core/lib/src/logging/magento_logger.dart` - Create
  - `packages/flutter_magento_core/lib/src/logging/magento_log_level.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Interface compiles
- **Complexity**: Low

#### Task 7.2: Create ConsoleMagentoLogger
- **Description**: Implement simple console logger
- **Files**:
  - `packages/flutter_magento_core/lib/src/logging/console_magento_logger.dart` - Create
- **Dependencies**: Task 7.1
- **Verification**: Logs appear in console
- **Complexity**: Low

### Phase 8: Extension Architecture

#### Task 8.1: Create MagentoProductExtension Interface
- **Description**: Define product extension interface for custom product data
- **Files**:
  - `packages/flutter_magento_core/lib/src/extensions/magento_product_extension.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: Interface compiles
- **Complexity**: Low

#### Task 8.2: Create MagentoExtensionRegistry
- **Description**: Implement extension registry for plugin architecture
- **Files**:
  - `packages/flutter_magento_core/lib/src/extensions/magento_extension_registry.dart` - Create
- **Dependencies**: Task 8.1
- **Verification**: Register/get/maybeGet work correctly
- **Complexity**: Low

### Phase 9: Client Facade

#### Task 9.1: Create MagentoObserver Interface
- **Description**: Define observer interface for transport events
- **Files**:
  - `packages/flutter_magento_core/lib/src/client/magento_observer.dart` - Create
- **Dependencies**: Task 4.3
- **Verification**: Interface compiles
- **Complexity**: Low

#### Task 9.2: Create MagentoClient Facade
- **Description**: Implement main client facade class
- **Files**:
  - `packages/flutter_magento_core/lib/src/client/magento_client.dart` - Create
- **Dependencies**: Task 4.3, Task 6.2-6.8, Task 7.1, Task 8.2, Task 9.1
- **Verification**: Client instantiation works, all repositories accessible
- **Complexity**: Medium

### Phase 10: Exports and Tests

#### Task 10.1: Create Public Export File
- **Description**: Create main export file with all public APIs
- **Files**:
  - `packages/flutter_magento_core/lib/flutter_magento_core.dart` - Modify
- **Dependencies**: All previous tasks
- **Verification**: `flutter analyze` passes
- **Complexity**: Low

#### Task 10.2: Create Unit Tests
- **Description**: Implement unit tests for all components
- **Files**:
  - `packages/flutter_magento_core/test/models/money_test.dart` - Create
  - `packages/flutter_magento_core/test/models/magento_entity_test.dart` - Create
  - `packages/flutter_magento_core/test/context/magento_store_context_test.dart` - Create
  - `packages/flutter_magento_core/test/storage/memory_auth_storage_test.dart` - Create
  - `packages/flutter_magento_core/test/extensions/extension_registry_test.dart` - Create
  - `packages/flutter_magento_core/test/errors/magento_exception_test.dart` - Create
- **Dependencies**: Task 10.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──┐
                        ├──→ Task 2.2 ──┼──→ Task 6.1 ──┬──→ Task 6.2
                        ├──→ Task 2.3 ──┘               ├──→ Task 6.3
                        ├──→ Task 2.4                   ├──→ Task 6.4
                        │                               ├──→ Task 6.5
                        ├──→ Task 3.1                   ├──→ Task 6.6
                        ├──→ Task 3.2 ──→ Task 3.3      ├──→ Task 6.7
                        │                               └──→ Task 6.8
                        ├──→ Task 4.1 ──┐                       │
                        └──→ Task 4.2 ──┴──→ Task 4.3 ──────────┤
                                                                │
                        ┌──→ Task 5.1 ──────────────────────────┤
                        │                                       │
                        ├──→ Task 7.1 ──→ Task 7.2 ─────────────┤
                        │                                       │
                        ├──→ Task 8.1 ──→ Task 8.2 ─────────────┤
                        │                                       │
                        └──→ Task 9.1 ──────────────────────────┴──→ Task 9.2 ──→ Task 10.1 ──→ Task 10.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_core.dart` | Modify | Remove plugin code, add exports |
| `lib/flutter_magento_core_method_channel.dart` | Delete | Plugin boilerplate |
| `lib/flutter_magento_core_platform_interface.dart` | Delete | Plugin boilerplate |
| `android/`, `ios/`, `linux/`, `macos/`, `windows/` | Delete | No native code needed |
| `pubspec.yaml` | Modify | Pure Dart package config |
| `lib/src/models/*.dart` | Create | Domain models |
| `lib/src/context/*.dart` | Create | Store context |
| `lib/src/storage/*.dart` | Create | Auth storage |
| `lib/src/transport/*.dart` | Create | Transport layer |
| `lib/src/errors/*.dart` | Create | Error model |
| `lib/src/repositories/*.dart` | Create | Repository interfaces |
| `lib/src/logging/*.dart` | Create | Logger interface |
| `lib/src/extensions/*.dart` | Create | Extension architecture |
| `lib/src/client/*.dart` | Create | Client facade |
| `test/*.dart` | Create/Modify | Unit tests |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Interface changes needed later | Medium | Medium | Keep interfaces minimal, use extension methods for additions |
| Model fields incomplete | Medium | Low | Models are stubs, implementations fill details |
| Breaking changes to dependents | Low | High | All dependent packages built against these interfaces |

## Rollback Strategy

If implementation fails or needs to be reverted:

1. Restore original plugin boilerplate from git
2. Remove all created `lib/src/` files
3. Restore original `pubspec.yaml`

## Checkpoints

After each phase, verify:

- [ ] All tests pass (`flutter test`)
- [ ] No analyzer warnings (`flutter analyze`)
- [ ] Package resolves (`flutter pub get`)

## Open Implementation Questions

- [ ] Should MagentoClient accept repository implementations directly or create them from transport?
- [ ] Should domain models use freezed for immutability? (Decided: No, keep simple for now)
- [ ] Should we include copyWith on models in core or leave to implementations?

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
- [ ] Notes: [any conditions or clarifications]
