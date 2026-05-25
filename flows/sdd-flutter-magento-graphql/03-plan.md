# Implementation Plan: flutter_magento_graphql

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_graphql implements `MagentoTransport` for GraphQL APIs. It uses the `gql` package for GraphQL operations, handles Magento-specific headers, maps GraphQL errors to `MagentoException`, and provides decorator transports for logging, retry, and caching.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_graphql/lib/flutter_magento_graphql.dart` - Modify
  - `packages/flutter_magento_graphql/lib/flutter_magento_graphql_method_channel.dart` - Delete
  - `packages/flutter_magento_graphql/lib/flutter_magento_graphql_platform_interface.dart` - Delete
  - `packages/flutter_magento_graphql/android/` - Delete
  - `packages/flutter_magento_graphql/ios/` - Delete
  - `packages/flutter_magento_graphql/linux/` - Delete
  - `packages/flutter_magento_graphql/macos/` - Delete
  - `packages/flutter_magento_graphql/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, gql, gql_http_link, http
- **Files**:
  - `packages/flutter_magento_graphql/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Core Transport

#### Task 2.1: Create GraphQlCacheConfig
- **Description**: Implement cache configuration class
- **Files**:
  - `packages/flutter_magento_graphql/lib/src/graphql_cache_config.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config instantiation works
- **Complexity**: Low

#### Task 2.2: Create GraphQlErrorMapper
- **Description**: Map GraphQL errors to MagentoException types
- **Files**:
  - `packages/flutter_magento_graphql/lib/src/graphql_error_mapper.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: All error categories mapped correctly
- **Complexity**: Medium

#### Task 2.3: Create GraphQlMagentoTransport
- **Description**: Implement main transport class with graphql() method
- **Files**:
  - `packages/flutter_magento_graphql/lib/src/graphql_magento_transport.dart` - Create
- **Dependencies**: Task 2.1, Task 2.2
- **Verification**: GraphQL queries execute against test endpoint
- **Complexity**: High

### Phase 3: Decorator Transports

#### Task 3.1: Create LoggingMagentoTransport
- **Description**: Transport decorator that logs requests/responses
- **Files**:
  - `packages/flutter_magento_graphql/lib/src/decorators/logging_transport.dart` - Create
- **Dependencies**: Task 2.3
- **Verification**: Logs appear for wrapped transport
- **Complexity**: Low

#### Task 3.2: Create RetryMagentoTransport
- **Description**: Transport decorator with retry logic for transient failures
- **Files**:
  - `packages/flutter_magento_graphql/lib/src/decorators/retry_transport.dart` - Create
- **Dependencies**: Task 2.3
- **Verification**: Retries on network errors, respects max retries
- **Complexity**: Medium

#### Task 3.3: Create CachedMagentoTransport
- **Description**: Transport decorator with response caching
- **Files**:
  - `packages/flutter_magento_graphql/lib/src/decorators/cached_transport.dart` - Create
- **Dependencies**: Task 2.3
- **Verification**: Cache hits work, mutations not cached
- **Complexity**: Medium

### Phase 4: Exports and Tests

#### Task 4.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_graphql/lib/flutter_magento_graphql.dart` - Modify
- **Dependencies**: Task 3.1, Task 3.2, Task 3.3
- **Verification**: All types accessible via single import
- **Complexity**: Low

#### Task 4.2: Create Unit Tests
- **Description**: Test error mapping, header injection, cache logic
- **Files**:
  - `packages/flutter_magento_graphql/test/graphql_error_mapper_test.dart` - Create
  - `packages/flutter_magento_graphql/test/graphql_transport_test.dart` - Create
  - `packages/flutter_magento_graphql/test/retry_transport_test.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──┐
                        │               │
                        └──→ Task 2.2 ──┴──→ Task 2.3 ──┬──→ Task 3.1
                                                        ├──→ Task 3.2
                                                        └──→ Task 3.3
                                                               │
                                                               ▼
                                                        Task 4.1 ──→ Task 4.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_graphql.dart` | Modify | Public exports |
| `lib/*_method_channel.dart`, `lib/*_platform_interface.dart` | Delete | Plugin boilerplate |
| `android/`, `ios/`, etc. | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/graphql_magento_transport.dart` | Create | Main transport |
| `lib/src/graphql_error_mapper.dart` | Create | Error mapping |
| `lib/src/graphql_cache_config.dart` | Create | Cache config |
| `lib/src/decorators/*.dart` | Create | Decorator transports |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| gql package API changes | Low | Medium | Pin specific version |
| GraphQL error format varies | Medium | Medium | Make mapper extensible |

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

- [x] Reviewed by: User
- [x] Approved on: 2026-05-25
