# Requirements: flutter_magento (Umbrella Package)

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24

## Problem Statement

Developers need a single, easy-to-use entry point for the entire Magento SDK. The umbrella package re-exports all sub-packages and provides a unified `MagentoSdk` factory for quick setup while allowing advanced users to import specific packages for tree-shaking.

## User Stories

### Primary

**As a** Flutter developer (beginner)
**I want** a single import for all Magento functionality
**So that** I can get started quickly without understanding package structure

**As a** Flutter developer (advanced)
**I want** factory methods for common configurations
**So that** I can set up GraphQL or REST transport with one line

### Secondary

**As a** Flutter developer
**I want** backward compatibility layer
**So that** existing code using older API still works

## Acceptance Criteria

### Must Have

1. **Given** developer adds `flutter_magento` dependency
   **When** they import the package
   **Then** all core types (models, repositories, exceptions) are available

2. **Given** developer wants GraphQL setup
   **When** `MagentoSdkFactory.graphql()` is called
   **Then** fully configured MagentoClient is returned

3. **Given** developer wants REST setup
   **When** `MagentoSdkFactory.rest()` is called
   **Then** fully configured MagentoClient with Dio is returned

4. **Given** existing code uses deprecated API
   **When** running with new package
   **Then** warnings are shown but code works

### Should Have

- Example configurations for common setups
- Migration guide from old API
- Debug mode with logging

### Won't Have (This Iteration)

- Auto-discovery of transport type
- Remote configuration
- Multi-client support

## Constraints

- **Technical**: Re-export all sub-packages cleanly
- **Backward Compatibility**: Maintain old API with @Deprecated annotations

## References

- flutter_magento_core
- All sub-packages
