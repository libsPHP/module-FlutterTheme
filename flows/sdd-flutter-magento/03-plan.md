# Implementation Plan: flutter_magento (Umbrella Package)

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento is the umbrella package that re-exports all sub-packages and provides MagentoSdkFactory for easy setup. Also includes legacy compatibility layer for gradual migration. Must be implemented last after all sub-packages.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Verify Package Structure
- **Description**: Ensure package directory exists with minimal pubspec
- **Files**:
  - `packages/flutter_magento/pubspec.yaml` - Modify
- **Dependencies**: All sub-packages implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Add All Sub-Package Dependencies
- **Description**: Add dependencies for all flutter_magento_* packages
- **Files**:
  - `packages/flutter_magento/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: All packages resolve
- **Complexity**: Low

### Phase 2: Factory Implementation

#### Task 2.1: Create MagentoSdkFactory
- **Description**: Factory methods for GraphQL, REST, mock, custom configurations
- **Files**:
  - `packages/flutter_magento/lib/src/factory/magento_sdk_factory.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Factory methods create valid clients
- **Complexity**: Medium

### Phase 3: Legacy Compatibility

#### Task 3.1: Create LegacyFlutterMagento Class
- **Description**: Deprecated wrapper for backward compatibility
- **Files**:
  - `packages/flutter_magento/lib/src/legacy/legacy_flutter_magento.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Legacy methods map to new API
- **Complexity**: Medium

### Phase 4: Exports

#### Task 4.1: Create Public Export File
- **Description**: Re-export all sub-packages plus factory and legacy
- **Files**:
  - `packages/flutter_magento/lib/flutter_magento.dart` - Create/Modify
- **Dependencies**: Task 3.1
- **Verification**: Single import provides access to all APIs
- **Complexity**: Low

### Phase 5: Testing and Documentation

#### Task 5.1: Create Integration Tests
- **Description**: Test full SDK setup and basic operations
- **Files**:
  - `packages/flutter_magento/test/integration_test.dart` - Create
  - `packages/flutter_magento/test/factory_test.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: All tests pass
- **Complexity**: Medium

#### Task 5.2: Update Package README
- **Description**: Quick start guide and migration notes
- **Files**:
  - `packages/flutter_magento/README.md` - Modify
- **Dependencies**: Task 4.1
- **Verification**: README accurate
- **Complexity**: Low

## Dependency Graph

```
All sub-packages
       │
       ▼
Task 1.1 ──→ Task 1.2 ──→ Task 2.1 ──→ Task 3.1 ──→ Task 4.1 ──┬──→ Task 5.1
                                                                │
                                                                └──→ Task 5.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `pubspec.yaml` | Modify | Add all sub-package deps |
| `lib/flutter_magento.dart` | Modify | Main export file |
| `lib/src/factory/magento_sdk_factory.dart` | Create | Factory methods |
| `lib/src/legacy/legacy_flutter_magento.dart` | Create | Backward compat |
| `README.md` | Modify | Quick start guide |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Version conflicts between sub-packages | Low | High | Pin exact versions |
| Export conflicts | Low | Medium | Explicit exports |
| Legacy API incompatibilities | Medium | Medium | Document breaking changes |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

## Pre-Implementation Checklist

Before starting implementation, ensure:

- [ ] flutter_magento_core implemented
- [ ] flutter_magento_graphql implemented
- [ ] flutter_magento_rest implemented
- [ ] flutter_magento_auth implemented
- [ ] flutter_magento_catalog implemented
- [ ] flutter_magento_cart implemented
- [ ] flutter_magento_profile implemented
- [ ] flutter_magento_riverpod implemented
- [ ] flutter_magento_ui implemented
- [ ] flutter_magento_offline implemented
- [ ] flutter_magento_localizations implemented
- [ ] flutter_magento_blockchain implemented
- [ ] flutter_magento_marketplace implemented

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
