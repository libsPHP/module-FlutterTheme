# Requirements: BridgeCore

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

The monolithic `NativeMind_Bridge` module bundles all functionality together, forcing stores to enable everything or nothing. Stores need a base module that provides only core infrastructure shared by all other Bridge modules, without any page-visible functionality.

## User Stories

### Primary

**As a** Magento store developer
**I want** a minimal base module that provides shared configuration and utilities
**So that** I can install only the Bridge features I need without overhead

### Secondary

**As a** module developer
**I want** centralized version tracking and enabled/disabled state
**So that** dependent modules can check compatibility and status

## Acceptance Criteria

### Must Have

1. **Given** BridgeCore is installed
   **When** I access admin configuration
   **Then** I see a "Bridge" section with General settings (enabled, debug mode)

2. **Given** BridgeCore is enabled
   **When** other Bridge modules check status
   **Then** they receive correct enabled/disabled state via `Helper\Config::isEnabled()`

3. **Given** debug mode is enabled in Core
   **When** other modules need debug info
   **Then** they can check via `Helper\Config::isDebugMode()`

4. **Given** any Bridge optional module is installed
   **When** BridgeCore is not installed
   **Then** Magento reports a dependency error

### Should Have

- Version constant available for compatibility checks
- Centralized event prefix for all Bridge events

### Won't Have (This Iteration)

- Any frontend visible output
- Any page modifications
- Any route/SEO/app links functionality (those go to separate modules)
- Complex configuration beyond enabled/debug

## Constraints

- **Technical**: Must follow Magento 2.4+ module standards
- **Namespace**: `NativeMind\BridgeCore`
- **Dependencies**: Only Magento core modules (Magento_Store, Magento_Backend)
- **Minimal**: This module should be as small as possible

## Module Responsibilities

```text
Config scope: nativemind_Bridge/general/*
  - enabled (yes/no)
  - debug_mode (yes/no)
  - version (read-only)

Helper\Config provides:
  - isEnabled()
  - isDebugMode()
  - getVersion()

ACL resource:
  - NativeMind_BridgeCore::config
```

## Open Questions

- [x] Should Core own the entire config path prefix? → Yes, `nativemind_Bridge/`
- [x] Should each submodule extend the admin section or create separate? → Extend Core's section

## References

- Original monolith: `NativeMind_Bridge/`
- Module split spec from user

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
