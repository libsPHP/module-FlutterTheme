# Requirements: FlutterBridgeCore

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

The monolithic `NativeMind_FlutterBridge` module bundles all functionality together, forcing stores to enable everything or nothing. Stores need a base module that provides only core infrastructure shared by all other FlutterBridge modules, without any page-visible functionality.

## User Stories

### Primary

**As a** Magento store developer
**I want** a minimal base module that provides shared configuration and utilities
**So that** I can install only the FlutterBridge features I need without overhead

### Secondary

**As a** module developer
**I want** centralized version tracking and enabled/disabled state
**So that** dependent modules can check compatibility and status

## Acceptance Criteria

### Must Have

1. **Given** FlutterBridgeCore is installed
   **When** I access admin configuration
   **Then** I see a "FlutterBridge" section with General settings (enabled, debug mode)

2. **Given** FlutterBridgeCore is enabled
   **When** other FlutterBridge modules check status
   **Then** they receive correct enabled/disabled state via `Helper\Config::isEnabled()`

3. **Given** debug mode is enabled in Core
   **When** other modules need debug info
   **Then** they can check via `Helper\Config::isDebugMode()`

4. **Given** any FlutterBridge optional module is installed
   **When** FlutterBridgeCore is not installed
   **Then** Magento reports a dependency error

### Should Have

- Version constant available for compatibility checks
- Centralized event prefix for all FlutterBridge events

### Won't Have (This Iteration)

- Any frontend visible output
- Any page modifications
- Any route/SEO/app links functionality (those go to separate modules)
- Complex configuration beyond enabled/debug

## Constraints

- **Technical**: Must follow Magento 2.4+ module standards
- **Namespace**: `NativeMind\FlutterBridgeCore`
- **Dependencies**: Only Magento core modules (Magento_Store, Magento_Backend)
- **Minimal**: This module should be as small as possible

## Module Responsibilities

```text
Config scope: nativemind_flutterbridge/general/*
  - enabled (yes/no)
  - debug_mode (yes/no)
  - version (read-only)

Helper\Config provides:
  - isEnabled()
  - isDebugMode()
  - getVersion()

ACL resource:
  - NativeMind_FlutterBridgeCore::config
```

## Open Questions

- [x] Should Core own the entire config path prefix? → Yes, `nativemind_flutterbridge/`
- [x] Should each submodule extend the admin section or create separate? → Extend Core's section

## References

- Original monolith: `NativeMind_FlutterBridge/`
- Module split spec from user

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
