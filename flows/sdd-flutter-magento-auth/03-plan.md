# Implementation Plan: flutter_magento_auth

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_auth implements `AuthRepository` with login, register, password reset flows. It provides multiple `MagentoAuthStorage` implementations (secure, shared prefs, memory). The repository handles cart merge on login automatically.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_auth/lib/flutter_magento_auth.dart` - Modify
  - `packages/flutter_magento_auth/lib/flutter_magento_auth_method_channel.dart` - Delete
  - `packages/flutter_magento_auth/lib/flutter_magento_auth_platform_interface.dart` - Delete
  - `packages/flutter_magento_auth/android/` - Delete
  - `packages/flutter_magento_auth/ios/` - Delete
  - `packages/flutter_magento_auth/linux/` - Delete
  - `packages/flutter_magento_auth/macos/` - Delete
  - `packages/flutter_magento_auth/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, flutter_secure_storage, shared_preferences
- **Files**:
  - `packages/flutter_magento_auth/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Data Models

#### Task 2.1: Create CustomerSession Model
- **Description**: Login result with token, customer, expiration
- **Files**:
  - `packages/flutter_magento_auth/lib/src/models/customer_session.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 2.2: Create Customer Model
- **Description**: Full customer entity (extends core stub if needed)
- **Files**:
  - `packages/flutter_magento_auth/lib/src/models/customer.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles with MagentoEntity
- **Complexity**: Low

#### Task 2.3: Create CustomerMapper
- **Description**: Map JSON to Customer domain model
- **Files**:
  - `packages/flutter_magento_auth/lib/src/mappers/customer_mapper.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Mapper handles GraphQL response
- **Complexity**: Medium

### Phase 3: Storage Implementations

#### Task 3.1: Create SecureMagentoAuthStorage
- **Description**: flutter_secure_storage implementation
- **Files**:
  - `packages/flutter_magento_auth/lib/src/storage/secure_magento_auth_storage.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Token/cart ID persist securely
- **Complexity**: Low

#### Task 3.2: Create SharedPrefsMagentoAuthStorage
- **Description**: SharedPreferences implementation (less secure alternative)
- **Files**:
  - `packages/flutter_magento_auth/lib/src/storage/shared_prefs_auth_storage.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Token/cart ID persist
- **Complexity**: Low

### Phase 4: Repository Implementation

#### Task 4.1: Create GraphQL Queries/Mutations
- **Description**: Define auth-related GraphQL operations
- **Files**:
  - `packages/flutter_magento_auth/lib/src/graphql/auth_mutations.dart` - Create
  - `packages/flutter_magento_auth/lib/src/graphql/auth_queries.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Queries syntactically correct
- **Complexity**: Low

#### Task 4.2: Create MagentoAuthRepository
- **Description**: Implement full AuthRepository interface
- **Files**:
  - `packages/flutter_magento_auth/lib/src/repository/magento_auth_repository.dart` - Create
- **Dependencies**: Task 2.3, Task 3.1, Task 4.1
- **Verification**: All methods implemented
- **Complexity**: High

### Phase 5: Exports and Tests

#### Task 5.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_auth/lib/flutter_magento_auth.dart` - Modify
- **Dependencies**: Task 4.2
- **Verification**: All types accessible via single import
- **Complexity**: Low

#### Task 5.2: Create Unit Tests
- **Description**: Test auth flows, storage, mappers
- **Files**:
  - `packages/flutter_magento_auth/test/auth_repository_test.dart` - Create
  - `packages/flutter_magento_auth/test/secure_storage_test.dart` - Create
  - `packages/flutter_magento_auth/test/customer_mapper_test.dart` - Create
- **Dependencies**: Task 5.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──┐
                        │               │
                        ├──→ Task 2.2 ──┴──→ Task 2.3 ──┐
                        │                               │
                        ├──→ Task 3.1 ──────────────────┤
                        ├──→ Task 3.2                   │
                        │                               │
                        └──→ Task 4.1 ──────────────────┴──→ Task 4.2 ──→ Task 5.1 ──→ Task 5.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_auth.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/models/*.dart` | Create | Domain models |
| `lib/src/storage/*.dart` | Create | Storage implementations |
| `lib/src/repository/*.dart` | Create | Auth repository |
| `lib/src/graphql/*.dart` | Create | GraphQL operations |
| `lib/src/mappers/*.dart` | Create | JSON mappers |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| flutter_secure_storage platform issues | Low | Medium | SharedPrefs fallback available |
| Token expiration handling | Medium | Medium | Add refresh logic if needed |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
