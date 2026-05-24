# Requirements: flutter_magento_core

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24

## Problem Statement

Flutter applications need a transport-agnostic SDK for Magento/Adobe Commerce that allows switching between GraphQL, REST, BFF, or custom backends without changing UI code. The core package must provide the foundational abstractions that all other packages depend on.

## User Stories

### Primary

**As a** Flutter developer
**I want** a single `MagentoClient` entry point
**So that** I can access all Magento functionality through one unified interface

**As a** Flutter developer
**I want** swappable transport layer
**So that** I can switch from GraphQL to REST or BFF without rewriting my app

**As a** Flutter developer
**I want** multi-store context support
**So that** I can build apps for multi-language, multi-currency Magento stores

### Secondary

**As a** Flutter developer
**I want** composable transport decorators (logging, retry, cache)
**So that** I can add cross-cutting concerns without modifying core code

**As a** Flutter developer
**I want** type-safe error handling
**So that** I can properly handle different failure scenarios in UI

## Acceptance Criteria

### Must Have

1. **Given** a Flutter app needs Magento integration
   **When** developer creates `MagentoClient`
   **Then** they get access to all domain repositories (catalog, cart, auth, checkout, customer, orders)

2. **Given** multiple transport implementations exist
   **When** developer swaps `GraphQlMagentoTransport` for `RestMagentoTransport`
   **Then** all repository code works unchanged

3. **Given** a multi-store Magento setup
   **When** `MagentoStoreContext` is configured
   **Then** all requests include proper store/currency/locale headers

4. **Given** network errors, auth failures, or validation errors occur
   **When** SDK catches them
   **Then** they are converted to typed `MagentoException` subclasses

5. **Given** auth tokens need secure storage
   **When** `MagentoAuthStorage` interface is implemented
   **Then** tokens/cart IDs can be stored in flutter_secure_storage, Hive, or memory

### Should Have

- Observable transport for analytics/Sentry integration
- Extension registry for custom Magento modules

### Won't Have (This Iteration)

- Concrete transport implementations (those go in graphql/rest packages)
- UI components
- State management adapters

## Constraints

- **Technical**: Must be pure Dart, no Flutter SDK dependency
- **Platform**: Must work on iOS, Android, Web, macOS, Windows, Linux
- **Dependencies**: Minimal - only meta, equatable for core types

## Open Questions

- [x] Should `MagentoClient` be immutable or allow runtime transport swapping? → Immutable, create new client
- [x] Should domain repositories be abstract interfaces or concrete? → Abstract interfaces in core

## References

- Architecture plan in command args
- Clean Architecture principles for layer separation
