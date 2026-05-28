# Implementation Plan: BridgeRoutes

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Create the route metadata module that outputs flutter_magento_v1 JSON payloads. Extract route-related code from the monolith and adapt for standalone operation.

## Task Breakdown

### Phase 1: Module Foundation

#### Task 1.1: Create Module Structure
- **Description**: Create module directory and base files
- **Files**:
  - `NativeMind_BridgeRoutes/registration.php` - Create
  - `NativeMind_BridgeRoutes/composer.json` - Create
  - `NativeMind_BridgeRoutes/etc/module.xml` - Create (depends on Core)
- **Dependencies**: Core module exists
- **Verification**: Module registers
- **Complexity**: Low

#### Task 1.2: Create Configuration
- **Description**: Create config.xml and system.xml for route settings
- **Files**:
  - `etc/config.xml` - Create
  - `etc/adminhtml/system.xml` - Create
- **Dependencies**: Task 1.1
- **Verification**: Admin shows Route section
- **Complexity**: Low

### Phase 2: Models

#### Task 2.1: Create RouteType Constants
- **Description**: Create RouteType class with page type constants
- **Files**:
  - `Model/Route/RouteType.php` - Create
- **Dependencies**: Task 1.1
- **Verification**: Constants accessible
- **Complexity**: Low

#### Task 2.2: Create RoutePayload Model
- **Description**: Create RoutePayload data transfer object
- **Files**:
  - `Model/Route/RoutePayload.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: toJson() returns valid JSON
- **Complexity**: Low

### Phase 3: Helper & Block

#### Task 3.1: Create Config Helper
- **Description**: Create route-specific config helper
- **Files**:
  - `Helper/Config.php` - Create
- **Dependencies**: Task 1.2
- **Verification**: Route patterns returned correctly
- **Complexity**: Low

#### Task 3.2: Create RouteMeta Block
- **Description**: Create block with route detection and payload building
- **Files**:
  - `Block/RouteMeta.php` - Create
- **Dependencies**: Task 2.2, Task 3.1
- **Verification**: Block builds correct payload
- **Complexity**: Medium

### Phase 4: View Layer

#### Task 4.1: Create Template
- **Description**: Create route_meta.phtml template
- **Files**:
  - `view/frontend/templates/route_meta.phtml` - Create
- **Dependencies**: Task 3.2
- **Verification**: JSON script tag in output
- **Complexity**: Low

#### Task 4.2: Create Layout XML
- **Description**: Create default.xml to inject block
- **Files**:
  - `view/frontend/layout/default.xml` - Create
- **Dependencies**: Task 4.1
- **Verification**: Block appears on all pages
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─→ Task 1.2 ─→ Task 3.1 ─┐
     │                            │
     └─→ Task 2.1 ─→ Task 2.2 ────┼─→ Task 3.2 ─→ Task 4.1 ─→ Task 4.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `NativeMind_BridgeRoutes/registration.php` | Create | Module registration |
| `NativeMind_BridgeRoutes/composer.json` | Create | Composer package |
| `NativeMind_BridgeRoutes/etc/module.xml` | Create | Module declaration |
| `NativeMind_BridgeRoutes/etc/config.xml` | Create | Default route patterns |
| `NativeMind_BridgeRoutes/etc/adminhtml/system.xml` | Create | Admin UI |
| `NativeMind_BridgeRoutes/Helper/Config.php` | Create | Route config accessor |
| `NativeMind_BridgeRoutes/Model/Route/RouteType.php` | Create | Constants |
| `NativeMind_BridgeRoutes/Model/Route/RoutePayload.php` | Create | Data model |
| `NativeMind_BridgeRoutes/Block/RouteMeta.php` | Create | Route detection block |
| `NativeMind_BridgeRoutes/view/frontend/templates/route_meta.phtml` | Create | JSON output |
| `NativeMind_BridgeRoutes/view/frontend/layout/default.xml` | Create | Block injection |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Route detection misses edge cases | Medium | Low | Add comprehensive action mapping |
| Placeholder substitution fails | Low | Medium | Unit test all patterns |

## Checkpoints

- [ ] Module depends on Core correctly
- [ ] Route patterns configurable in admin
- [ ] JSON payload validates against schema
- [ ] All page types detected correctly

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
