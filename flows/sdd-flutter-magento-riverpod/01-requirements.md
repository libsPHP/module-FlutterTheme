# Requirements: flutter_magento_riverpod

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24

## Problem Statement

The core SDK provides repositories that are state-management agnostic. For Riverpod users, we need providers that wrap repositories and handle reactive state, caching, and automatic refetch. This package bridges SDK and Riverpod.

## User Stories

### Primary

**As a** Flutter/Riverpod developer
**I want** ready-to-use providers for all Magento features
**So that** I can use Riverpod patterns without boilerplate

**As a** Flutter/Riverpod developer
**I want** reactive cart state
**So that** cart updates across all widgets automatically

**As a** Flutter/Riverpod developer
**I want** auth state that triggers cart merge
**So that** login flow works correctly

### Secondary

**As a** Flutter/Riverpod developer
**I want** cached product queries
**So that** repeated views don't refetch

**As a** Flutter/Riverpod developer
**I want** error states and loading indicators
**So that** I can show proper UI feedback

## Acceptance Criteria

### Must Have

1. **Given** `magentoClientProvider` is configured
   **When** any feature provider is watched
   **Then** correct repository is used

2. **Given** user logs in
   **When** `authControllerProvider` completes login
   **Then** cart automatically merges via `cartControllerProvider`

3. **Given** product is added to cart
   **When** `cartControllerProvider.addProduct()` is called
   **Then** all widgets watching cart update

4. **Given** product list is requested
   **When** `productsProvider(params)` is watched
   **Then** AsyncValue with loading/data/error states returned

### Should Have

- Product query caching with TTL
- Optimistic cart updates
- Auth state persistence
- Provider scoping for multi-store

### Won't Have (This Iteration)

- BLoC adapters (separate package if needed)
- Provider adapters (deprecated)
- GetX adapters

## Constraints

- **Technical**: Depend on flutter_magento_core + flutter_riverpod
- **Platform**: Flutter only (has widget dependencies)

## References

- Riverpod documentation
- flutter_magento_core repositories
