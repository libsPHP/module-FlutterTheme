# Implementation Plan: flutter_magento_localizations

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_localizations provides MagentoFormatters for currency/date/number formatting and generated localizations (ARB) for UI strings. Maps MagentoStoreContext to Locale with RTL support.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_localizations/lib/flutter_magento_localizations.dart` - Modify
  - `packages/flutter_magento_localizations/lib/flutter_magento_localizations_method_channel.dart` - Delete
  - `packages/flutter_magento_localizations/lib/flutter_magento_localizations_platform_interface.dart` - Delete
  - `packages/flutter_magento_localizations/android/` - Delete
  - `packages/flutter_magento_localizations/ios/` - Delete
  - `packages/flutter_magento_localizations/linux/` - Delete
  - `packages/flutter_magento_localizations/macos/` - Delete
  - `packages/flutter_magento_localizations/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, intl, flutter_localizations
- **Files**:
  - `packages/flutter_magento_localizations/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Formatters

#### Task 2.1: Create MagentoFormatters
- **Description**: Currency, date, number formatting class
- **Files**:
  - `packages/flutter_magento_localizations/lib/src/formatters/magento_formatters.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Format methods work for various locales
- **Complexity**: Medium

#### Task 2.2: Create StoreLocaleResolver
- **Description**: Map store context to Locale, detect RTL
- **Files**:
  - `packages/flutter_magento_localizations/lib/src/locale/store_locale_resolver.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Resolves common Magento locale codes
- **Complexity**: Low

### Phase 3: ARB Localizations

#### Task 3.1: Create English ARB File
- **Description**: Base English translations
- **Files**:
  - `packages/flutter_magento_localizations/lib/l10n/magento_en.arb` - Create
- **Dependencies**: Task 1.2
- **Verification**: Valid ARB syntax
- **Complexity**: Low

#### Task 3.2: Create Additional ARB Files
- **Description**: Spanish, German, French, Arabic translations
- **Files**:
  - `packages/flutter_magento_localizations/lib/l10n/magento_es.arb` - Create
  - `packages/flutter_magento_localizations/lib/l10n/magento_de.arb` - Create
  - `packages/flutter_magento_localizations/lib/l10n/magento_fr.arb` - Create
  - `packages/flutter_magento_localizations/lib/l10n/magento_ar.arb` - Create
- **Dependencies**: Task 3.1
- **Verification**: Valid ARB syntax
- **Complexity**: Low

#### Task 3.3: Configure l10n.yaml
- **Description**: Set up localization generation
- **Files**:
  - `packages/flutter_magento_localizations/l10n.yaml` - Create
- **Dependencies**: Task 3.1
- **Verification**: Generation config valid
- **Complexity**: Low

#### Task 3.4: Generate Localizations
- **Description**: Run flutter gen-l10n
- **Files**:
  - `packages/flutter_magento_localizations/lib/src/generated/magento_localizations.dart` - Generate
  - `packages/flutter_magento_localizations/lib/src/generated/magento_localizations_en.dart` - Generate
  - `packages/flutter_magento_localizations/lib/src/generated/magento_localizations_*.dart` - Generate
- **Dependencies**: Task 3.2, Task 3.3
- **Verification**: Generated code compiles
- **Complexity**: Low

### Phase 4: Exports and Tests

#### Task 4.1: Create Public Export File
- **Description**: Export formatters, localizations, resolver
- **Files**:
  - `packages/flutter_magento_localizations/lib/flutter_magento_localizations.dart` - Modify
- **Dependencies**: Task 2.1, Task 2.2, Task 3.4
- **Verification**: All types accessible
- **Complexity**: Low

#### Task 4.2: Create Unit Tests
- **Description**: Test formatters for various locales
- **Files**:
  - `packages/flutter_magento_localizations/test/magento_formatters_test.dart` - Create
  - `packages/flutter_magento_localizations/test/store_locale_resolver_test.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──────────────────┐
                        │                               │
                        ├──→ Task 2.2 ──────────────────┤
                        │                               │
                        └──→ Task 3.1 ──→ Task 3.2 ──┐  │
                                     │               │  │
                                     └──→ Task 3.3 ──┴──→ Task 3.4 ──┴──→ Task 4.1 ──→ Task 4.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_localizations.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/formatters/*.dart` | Create | Formatting utilities |
| `lib/src/locale/*.dart` | Create | Locale resolution |
| `lib/l10n/*.arb` | Create | Translation files |
| `l10n.yaml` | Create | Generation config |
| `lib/src/generated/*.dart` | Generate | Localization code |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Missing translations | Medium | Low | Fall back to English |
| Locale parsing issues | Low | Low | Handle gracefully |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Localizations generate correctly

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
