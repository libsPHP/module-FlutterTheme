# Implementation Plan: FlutterBridgeDebug

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Create the Debug module with debug endpoints and console logging. All features gated by Core's debug_mode setting.

## Task Breakdown

### Phase 1: Module Foundation

#### Task 1.1: Create Module Structure
- **Description**: Create module directory and base files
- **Files**:
  - `NativeMind_FlutterBridgeDebug/registration.php` - Create
  - `NativeMind_FlutterBridgeDebug/composer.json` - Create
  - `NativeMind_FlutterBridgeDebug/etc/module.xml` - Create
- **Dependencies**: Core module exists
- **Verification**: Module registers
- **Complexity**: Low

#### Task 1.2: Create Routing
- **Description**: Create frontend routes for debug endpoints
- **Files**:
  - `etc/frontend/routes.xml` - Create
- **Dependencies**: Task 1.1
- **Verification**: Routes registered
- **Complexity**: Low

### Phase 2: Helper

#### Task 2.1: Create Debug Helper
- **Description**: Create helper for collecting debug data
- **Files**:
  - `Helper/DebugHelper.php` - Create
- **Dependencies**: Task 1.1
- **Verification**: Collects module status
- **Complexity**: Medium

### Phase 3: Controllers

#### Task 3.1: Create Config Endpoint
- **Description**: Create /flutterbridge/debug/config controller
- **Files**:
  - `Controller/Debug/Config.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Returns module status JSON
- **Complexity**: Low

#### Task 3.2: Create Route Endpoint
- **Description**: Create /flutterbridge/debug/route controller
- **Files**:
  - `Controller/Debug/Route.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Returns route payload JSON
- **Complexity**: Low

#### Task 3.3: Create SEO Endpoint
- **Description**: Create /flutterbridge/debug/seo controller
- **Files**:
  - `Controller/Debug/Seo.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Returns SEO data JSON
- **Complexity**: Low

#### Task 3.4: Create AppLinks Endpoint
- **Description**: Create /flutterbridge/debug/applinks controller
- **Files**:
  - `Controller/Debug/AppLinks.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Returns app links status JSON
- **Complexity**: Low

### Phase 4: Console Logging

#### Task 4.1: Create Console Logger Block
- **Description**: Create block for console debug output
- **Files**:
  - `Block/ConsoleLogger.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Block outputs debug flag
- **Complexity**: Low

#### Task 4.2: Create Console Logger Template
- **Description**: Create template with console.log script
- **Files**:
  - `view/frontend/templates/console_logger.phtml` - Create
- **Dependencies**: Task 4.1
- **Verification**: Console output in browser
- **Complexity**: Low

#### Task 4.3: Create Layout XML
- **Description**: Create default.xml for console logger
- **Files**:
  - `view/frontend/layout/default.xml` - Create
- **Dependencies**: Task 4.2
- **Verification**: Script on all pages when debug on
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─┬─→ Task 1.2 ─┬─→ Task 3.1
          │             ├─→ Task 3.2
          │             ├─→ Task 3.3
          │             └─→ Task 3.4
          │
          └─→ Task 2.1 ─→ Task 4.1 ─→ Task 4.2 ─→ Task 4.3
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `NativeMind_FlutterBridgeDebug/registration.php` | Create | Module registration |
| `NativeMind_FlutterBridgeDebug/composer.json` | Create | Composer package |
| `NativeMind_FlutterBridgeDebug/etc/module.xml` | Create | Module declaration |
| `NativeMind_FlutterBridgeDebug/etc/frontend/routes.xml` | Create | Debug routes |
| `NativeMind_FlutterBridgeDebug/Helper/DebugHelper.php` | Create | Debug data collector |
| `NativeMind_FlutterBridgeDebug/Controller/Debug/Config.php` | Create | Config endpoint |
| `NativeMind_FlutterBridgeDebug/Controller/Debug/Route.php` | Create | Route endpoint |
| `NativeMind_FlutterBridgeDebug/Controller/Debug/Seo.php` | Create | SEO endpoint |
| `NativeMind_FlutterBridgeDebug/Controller/Debug/AppLinks.php` | Create | AppLinks endpoint |
| `NativeMind_FlutterBridgeDebug/Block/ConsoleLogger.php` | Create | Console logger block |
| `NativeMind_FlutterBridgeDebug/view/frontend/templates/console_logger.phtml` | Create | Console script |
| `NativeMind_FlutterBridgeDebug/view/frontend/layout/default.xml` | Create | Block injection |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Debug endpoint exposed in production | Low | High | Check debug_mode in every controller |
| Sensitive data in output | Medium | High | Never expose fingerprints, keys, secrets |

## Security Checklist

```text
NEVER expose:
- [ ] SHA256 fingerprints (only count)
- [ ] API keys or secrets
- [ ] Customer data
- [ ] Internal file paths
- [ ] Database credentials
```

## Checkpoints

- [ ] Endpoints return 404 when debug OFF
- [ ] Endpoints return JSON when debug ON
- [ ] No sensitive data in any response
- [ ] Console logging works in browser
- [ ] Console silent when debug OFF

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
