# Implementation Plan: FlutterBridgeCore

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Create the foundation module that all other FlutterBridge modules depend on. Minimal implementation: registration, config helper, admin UI.

## Task Breakdown

### Phase 1: Module Foundation

#### Task 1.1: Create Module Directory Structure
- **Description**: Create NativeMind_FlutterBridgeCore directory and base files
- **Files**:
  - `magento/NativeMind_FlutterBridgeCore/` - Create directory
  - `registration.php` - Create
  - `composer.json` - Create
- **Dependencies**: None
- **Verification**: Directory exists with files
- **Complexity**: Low

#### Task 1.2: Create Module Declaration
- **Description**: Create module.xml with sequence dependencies
- **Files**:
  - `etc/module.xml` - Create
- **Dependencies**: Task 1.1
- **Verification**: `bin/magento module:status` shows module
- **Complexity**: Low

### Phase 2: Configuration

#### Task 2.1: Create Default Configuration
- **Description**: Create config.xml with default values
- **Files**:
  - `etc/config.xml` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config values accessible
- **Complexity**: Low

#### Task 2.2: Create ACL Resources
- **Description**: Create acl.xml for admin permissions
- **Files**:
  - `etc/acl.xml` - Create
- **Dependencies**: Task 1.2
- **Verification**: ACL resource visible in admin roles
- **Complexity**: Low

#### Task 2.3: Create Admin System Configuration
- **Description**: Create system.xml with General section
- **Files**:
  - `etc/adminhtml/system.xml` - Create
- **Dependencies**: Task 2.1, Task 2.2
- **Verification**: Admin panel shows FlutterBridge section
- **Complexity**: Low

### Phase 3: Config Helper

#### Task 3.1: Create Config Helper
- **Description**: Create Helper\Config with isEnabled(), isDebugMode(), getVersion()
- **Files**:
  - `Helper/Config.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Unit test passes
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─→ Task 1.2 ─┬─→ Task 2.1 ─→ Task 2.3
                      │              ↗
                      └─→ Task 2.2 ─┘

Task 2.1 ─→ Task 3.1
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `NativeMind_FlutterBridgeCore/registration.php` | Create | Module registration |
| `NativeMind_FlutterBridgeCore/composer.json` | Create | Composer package |
| `NativeMind_FlutterBridgeCore/etc/module.xml` | Create | Module declaration |
| `NativeMind_FlutterBridgeCore/etc/config.xml` | Create | Default config |
| `NativeMind_FlutterBridgeCore/etc/acl.xml` | Create | ACL resources |
| `NativeMind_FlutterBridgeCore/etc/adminhtml/system.xml` | Create | Admin UI |
| `NativeMind_FlutterBridgeCore/Helper/Config.php` | Create | Config accessor |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Config path conflict with old monolith | Low | Medium | Use same paths for compatibility |

## Rollback Strategy

1. Delete `NativeMind_FlutterBridgeCore/` directory
2. Run `bin/magento setup:upgrade`

## Checkpoints

- [ ] Module registers successfully
- [ ] Admin config section visible
- [ ] Config helper returns correct values

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
