# Implementation Plan: FlutterBridgeAppLinks

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Create the App Links module with custom router for .well-known endpoints. Serves Android assetlinks.json and iOS apple-app-site-association.

## Task Breakdown

### Phase 1: Module Foundation

#### Task 1.1: Create Module Structure
- **Description**: Create module directory and base files
- **Files**:
  - `NativeMind_FlutterBridgeAppLinks/registration.php` - Create
  - `NativeMind_FlutterBridgeAppLinks/composer.json` - Create
  - `NativeMind_FlutterBridgeAppLinks/etc/module.xml` - Create
- **Dependencies**: Core module exists
- **Verification**: Module registers
- **Complexity**: Low

#### Task 1.2: Create Configuration
- **Description**: Create config.xml and system.xml for app links settings
- **Files**:
  - `etc/config.xml` - Create
  - `etc/adminhtml/system.xml` - Create
- **Dependencies**: Task 1.1
- **Verification**: Admin shows App Links section
- **Complexity**: Low

### Phase 2: Config & Builders

#### Task 2.1: Create Config Helper
- **Description**: Create app links config helper
- **Files**:
  - `Helper/Config.php` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config values accessible
- **Complexity**: Low

#### Task 2.2: Create AssetLinksBuilder
- **Description**: Create Android assetlinks.json builder
- **Files**:
  - `Model/AssetLinksBuilder.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Valid assetlinks.json output
- **Complexity**: Low

#### Task 2.3: Create AppleAppSiteAssociationBuilder
- **Description**: Create iOS AASA builder
- **Files**:
  - `Model/AppleAppSiteAssociationBuilder.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Valid AASA output
- **Complexity**: Low

### Phase 3: Routing & Controllers

#### Task 3.1: Create Custom Router
- **Description**: Create router for .well-known paths
- **Files**:
  - `Controller/Router.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Router matches .well-known paths
- **Complexity**: Medium

#### Task 3.2: Create AssetLinks Controller
- **Description**: Create controller for assetlinks.json
- **Files**:
  - `Controller/WellKnown/AssetLinks.php` - Create
- **Dependencies**: Task 2.2, Task 3.1
- **Verification**: Endpoint returns JSON
- **Complexity**: Low

#### Task 3.3: Create AASA Controller
- **Description**: Create controller for apple-app-site-association
- **Files**:
  - `Controller/WellKnown/AppleAppSiteAssociation.php` - Create
- **Dependencies**: Task 2.3, Task 3.1
- **Verification**: Endpoint returns JSON
- **Complexity**: Low

### Phase 4: DI Wiring

#### Task 4.1: Register Router in DI
- **Description**: Add router to RouterList
- **Files**:
  - `etc/di.xml` - Create
- **Dependencies**: Task 3.1
- **Verification**: Router active
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─→ Task 1.2 ─→ Task 2.1 ─┬─→ Task 2.2 ─→ Task 3.2
                                  ├─→ Task 2.3 ─→ Task 3.3
                                  └─→ Task 3.1 ─→ Task 4.1
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `NativeMind_FlutterBridgeAppLinks/registration.php` | Create | Module registration |
| `NativeMind_FlutterBridgeAppLinks/composer.json` | Create | Composer package |
| `NativeMind_FlutterBridgeAppLinks/etc/module.xml` | Create | Module declaration |
| `NativeMind_FlutterBridgeAppLinks/etc/config.xml` | Create | Default config |
| `NativeMind_FlutterBridgeAppLinks/etc/adminhtml/system.xml` | Create | Admin UI |
| `NativeMind_FlutterBridgeAppLinks/etc/di.xml` | Create | Router registration |
| `NativeMind_FlutterBridgeAppLinks/Helper/Config.php` | Create | Config accessor |
| `NativeMind_FlutterBridgeAppLinks/Model/AssetLinksBuilder.php` | Create | Android JSON |
| `NativeMind_FlutterBridgeAppLinks/Model/AppleAppSiteAssociationBuilder.php` | Create | iOS JSON |
| `NativeMind_FlutterBridgeAppLinks/Controller/Router.php` | Create | Custom router |
| `NativeMind_FlutterBridgeAppLinks/Controller/WellKnown/AssetLinks.php` | Create | Android endpoint |
| `NativeMind_FlutterBridgeAppLinks/Controller/WellKnown/AppleAppSiteAssociation.php` | Create | iOS endpoint |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Router conflicts with other modules | Low | High | Use unique router name, low sortOrder |
| Webserver blocks .well-known | Medium | High | Document nginx/apache config needed |

## Checkpoints

- [ ] `/.well-known/assetlinks.json` returns valid JSON
- [ ] `/.well-known/apple-app-site-association` returns valid JSON
- [ ] Disabled feature returns 404
- [ ] Android App Links verification passes

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
