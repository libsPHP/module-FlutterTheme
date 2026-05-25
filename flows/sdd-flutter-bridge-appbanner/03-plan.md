# Implementation Plan: FlutterBridgeAppBanner

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Create the App Banner module with "Open in App" visual banner. Vanilla JS for behavior, namespaced CSS for styling, FPC-compatible.

## Task Breakdown

### Phase 1: Module Foundation

#### Task 1.1: Create Module Structure
- **Description**: Create module directory and base files
- **Files**:
  - `NativeMind_FlutterBridgeAppBanner/registration.php` - Create
  - `NativeMind_FlutterBridgeAppBanner/composer.json` - Create
  - `NativeMind_FlutterBridgeAppBanner/etc/module.xml` - Create
- **Dependencies**: Core module exists
- **Verification**: Module registers
- **Complexity**: Low

#### Task 1.2: Create Configuration
- **Description**: Create config.xml and system.xml for banner settings
- **Files**:
  - `etc/config.xml` - Create
  - `etc/adminhtml/system.xml` - Create
- **Dependencies**: Task 1.1
- **Verification**: Admin shows App Banner section
- **Complexity**: Low

### Phase 2: Helper & Block

#### Task 2.1: Create Config Helper
- **Description**: Create banner config helper
- **Files**:
  - `Helper/Config.php` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config values accessible
- **Complexity**: Low

#### Task 2.2: Create Banner Block
- **Description**: Create Banner block with page type detection
- **Files**:
  - `Block/Banner.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Block checks page visibility
- **Complexity**: Medium

### Phase 3: View Layer

#### Task 3.1: Create Banner Template
- **Description**: Create banner.phtml with inline JS
- **Files**:
  - `view/frontend/templates/banner.phtml` - Create
- **Dependencies**: Task 2.2
- **Verification**: HTML renders correctly
- **Complexity**: Medium

#### Task 3.2: Create Banner CSS
- **Description**: Create namespaced CSS for banner
- **Files**:
  - `view/frontend/web/css/banner.css` - Create
- **Dependencies**: Task 3.1
- **Verification**: Banner styled correctly
- **Complexity**: Low

#### Task 3.3: Create Layout XML
- **Description**: Create default.xml to inject banner and CSS
- **Files**:
  - `view/frontend/layout/default.xml` - Create
- **Dependencies**: Task 3.1, Task 3.2
- **Verification**: Banner and CSS on pages
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─→ Task 1.2 ─→ Task 2.1 ─→ Task 2.2 ─→ Task 3.1 ─┬─→ Task 3.3
                                                          │
                                              Task 3.2 ───┘
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `NativeMind_FlutterBridgeAppBanner/registration.php` | Create | Module registration |
| `NativeMind_FlutterBridgeAppBanner/composer.json` | Create | Composer package |
| `NativeMind_FlutterBridgeAppBanner/etc/module.xml` | Create | Module declaration |
| `NativeMind_FlutterBridgeAppBanner/etc/config.xml` | Create | Default config |
| `NativeMind_FlutterBridgeAppBanner/etc/adminhtml/system.xml` | Create | Admin UI |
| `NativeMind_FlutterBridgeAppBanner/Helper/Config.php` | Create | Config accessor |
| `NativeMind_FlutterBridgeAppBanner/Block/Banner.php` | Create | Banner block |
| `NativeMind_FlutterBridgeAppBanner/view/frontend/templates/banner.phtml` | Create | Banner HTML/JS |
| `NativeMind_FlutterBridgeAppBanner/view/frontend/web/css/banner.css` | Create | Banner styles |
| `NativeMind_FlutterBridgeAppBanner/view/frontend/layout/default.xml` | Create | Block injection |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| CSS conflicts with theme | Low | Low | Namespaced classes (nm-flutterbridge-*) |
| Cookie not set correctly | Low | Low | Test across browsers |
| Z-index conflicts | Medium | Low | Use high z-index (9999) |

## Checkpoints

- [ ] Banner appears on mobile
- [ ] Banner hidden on desktop
- [ ] Close button sets cookie
- [ ] Cookie persists for configured days
- [ ] Page type visibility works

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
