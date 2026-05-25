# Implementation Plan: flutter_magento_rest

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_rest implements `MagentoTransport` for REST APIs using Dio. It provides Magento-specific interceptors for authentication, store context, and error handling. Path building follows Magento's `/rest/{store}/V1/` convention.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_rest/lib/flutter_magento_rest.dart` - Modify
  - `packages/flutter_magento_rest/lib/flutter_magento_rest_method_channel.dart` - Delete
  - `packages/flutter_magento_rest/lib/flutter_magento_rest_platform_interface.dart` - Delete
  - `packages/flutter_magento_rest/android/` - Delete
  - `packages/flutter_magento_rest/ios/` - Delete
  - `packages/flutter_magento_rest/linux/` - Delete
  - `packages/flutter_magento_rest/macos/` - Delete
  - `packages/flutter_magento_rest/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, dio
- **Files**:
  - `packages/flutter_magento_rest/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Dio Interceptors

#### Task 2.1: Create MagentoAuthInterceptor
- **Description**: Interceptor that adds Authorization header from auth storage
- **Files**:
  - `packages/flutter_magento_rest/lib/src/interceptors/magento_auth_interceptor.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Token added to requests when available
- **Complexity**: Low

#### Task 2.2: Create MagentoStoreInterceptor
- **Description**: Interceptor that prefixes paths and adds store headers
- **Files**:
  - `packages/flutter_magento_rest/lib/src/interceptors/magento_store_interceptor.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Paths correctly prefixed with /rest/{store}/V1/
- **Complexity**: Low

#### Task 2.3: Create MagentoErrorInterceptor
- **Description**: Interceptor that converts DioException to MagentoException
- **Files**:
  - `packages/flutter_magento_rest/lib/src/interceptors/magento_error_interceptor.dart` - Create
- **Dependencies**: Task 2.4
- **Verification**: All HTTP status codes mapped correctly
- **Complexity**: Medium

#### Task 2.4: Create RestErrorMapper
- **Description**: Maps Dio errors to MagentoException types
- **Files**:
  - `packages/flutter_magento_rest/lib/src/rest_error_mapper.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: All error types mapped
- **Complexity**: Medium

### Phase 3: Core Transport

#### Task 3.1: Create RestMagentoTransport
- **Description**: Implement main transport class with get/post/put/delete methods
- **Files**:
  - `packages/flutter_magento_rest/lib/src/rest_magento_transport.dart` - Create
- **Dependencies**: Task 2.1, Task 2.2, Task 2.3
- **Verification**: REST calls execute against test endpoint
- **Complexity**: High

### Phase 4: Exports and Tests

#### Task 4.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_rest/lib/flutter_magento_rest.dart` - Modify
- **Dependencies**: Task 3.1
- **Verification**: All types accessible via single import
- **Complexity**: Low

#### Task 4.2: Create Unit Tests
- **Description**: Test interceptors, error mapping
- **Files**:
  - `packages/flutter_magento_rest/test/rest_error_mapper_test.dart` - Create
  - `packages/flutter_magento_rest/test/interceptors_test.dart` - Create
  - `packages/flutter_magento_rest/test/rest_transport_test.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──────────────┐
                        ├──→ Task 2.2 ──────────────┤
                        │                           │
                        └──→ Task 2.4 ──→ Task 2.3 ─┴──→ Task 3.1 ──→ Task 4.1 ──→ Task 4.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_rest.dart` | Modify | Public exports |
| `lib/*_method_channel.dart`, `lib/*_platform_interface.dart` | Delete | Plugin boilerplate |
| `android/`, `ios/`, etc. | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/rest_magento_transport.dart` | Create | Main transport |
| `lib/src/rest_error_mapper.dart` | Create | Error mapping |
| `lib/src/interceptors/*.dart` | Create | Dio interceptors |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Dio major version changes | Low | Medium | Pin dio ^5.0.0 |
| REST error response format varies | Medium | Low | Make mapper handle multiple formats |

## Rollback Strategy

1. Restore original plugin boilerplate from git
2. Remove all `lib/src/` files
3. Restore original `pubspec.yaml`

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
