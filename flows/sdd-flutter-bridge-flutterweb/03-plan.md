# Implementation Plan: BridgeFlutterWeb

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Create the Flutter Web progressive enhancement module. Load Flutter Web on top of Magento HTML, same HTML for everyone (no bot detection), graceful degradation on failure.

## Task Breakdown

### Phase 1: Module Foundation

#### Task 1.1: Create Module Structure
- **Description**: Create module directory and base files
- **Files**:
  - `NativeMind_BridgeFlutterWeb/registration.php` - Create
  - `NativeMind_BridgeFlutterWeb/composer.json` - Create
  - `NativeMind_BridgeFlutterWeb/etc/module.xml` - Create
- **Dependencies**: Core module exists
- **Verification**: Module registers
- **Complexity**: Low

#### Task 1.2: Create Configuration
- **Description**: Create config.xml and system.xml for Flutter Web settings
- **Files**:
  - `etc/config.xml` - Create
  - `etc/adminhtml/system.xml` - Create
- **Dependencies**: Task 1.1
- **Verification**: Admin shows Flutter Web section
- **Complexity**: Medium (many options)

### Phase 2: Config Source Models

#### Task 2.1: Create Source Models
- **Description**: Create dropdown source models
- **Files**:
  - `Model/Config/Source/Renderer.php` - Create (auto/html/canvaskit)
  - `Model/Config/Source/LoadTrigger.php` - Create (immediate/domready/idle/interaction)
  - `Model/Config/Source/HideMagentoAfter.php` - Create
  - `Model/Config/Source/FallbackOnError.php` - Create
- **Dependencies**: Task 1.1
- **Verification**: Dropdowns show options
- **Complexity**: Low

### Phase 3: Helper & Blocks

#### Task 3.1: Create Config Helper
- **Description**: Create Flutter Web config helper
- **Files**:
  - `Helper/Config.php` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config values accessible
- **Complexity**: Low

#### Task 3.2: Create Container Block
- **Description**: Create block for Flutter container div
- **Files**:
  - `Block/Container.php` - Create
- **Dependencies**: Task 3.1
- **Verification**: Container ID configurable
- **Complexity**: Low

#### Task 3.3: Create Loader Block
- **Description**: Create block for Flutter loader script
- **Files**:
  - `Block/Loader.php` - Create
- **Dependencies**: Task 3.1
- **Verification**: Config JSON output correct
- **Complexity**: Medium

### Phase 4: View Layer

#### Task 4.1: Create Container Template
- **Description**: Create container.phtml
- **Files**:
  - `view/frontend/templates/container.phtml` - Create
- **Dependencies**: Task 3.2
- **Verification**: Container div in output
- **Complexity**: Low

#### Task 4.2: Create Loader Template
- **Description**: Create loader.phtml with Flutter bootstrap JS
- **Files**:
  - `view/frontend/templates/loader.phtml` - Create
- **Dependencies**: Task 3.3
- **Verification**: Config JSON and loader script
- **Complexity**: Medium

#### Task 4.3: Create Flutter Loader JS
- **Description**: Create flutter-loader.js with progressive enhancement logic
- **Files**:
  - `view/frontend/web/js/flutter-loader.js` - Create
- **Dependencies**: Task 4.2
- **Verification**: Flutter loads and transitions
- **Complexity**: High

#### Task 4.4: Create Flutter CSS
- **Description**: Create CSS for container and transitions
- **Files**:
  - `view/frontend/web/css/flutter.css` - Create
- **Dependencies**: Task 4.1
- **Verification**: Transitions work correctly
- **Complexity**: Medium

#### Task 4.5: Create Layout XML
- **Description**: Create default.xml to inject container, loader, CSS
- **Files**:
  - `view/frontend/layout/default.xml` - Create
- **Dependencies**: Task 4.1, Task 4.2, Task 4.4
- **Verification**: All components on page
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─→ Task 1.2 ─→ Task 2.1
                │
                └─→ Task 3.1 ─┬─→ Task 3.2 ─→ Task 4.1 ─┐
                              │                         │
                              └─→ Task 3.3 ─→ Task 4.2 ─┼─→ Task 4.5
                                                        │
                                         Task 4.3 ──────┤
                                         Task 4.4 ──────┘
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `NativeMind_BridgeFlutterWeb/registration.php` | Create | Module registration |
| `NativeMind_BridgeFlutterWeb/composer.json` | Create | Composer package |
| `NativeMind_BridgeFlutterWeb/etc/module.xml` | Create | Module declaration |
| `NativeMind_BridgeFlutterWeb/etc/config.xml` | Create | Default config |
| `NativeMind_BridgeFlutterWeb/etc/adminhtml/system.xml` | Create | Admin UI |
| `NativeMind_BridgeFlutterWeb/Model/Config/Source/*.php` | Create | Admin dropdowns |
| `NativeMind_BridgeFlutterWeb/Helper/Config.php` | Create | Config accessor |
| `NativeMind_BridgeFlutterWeb/Block/Container.php` | Create | Container block |
| `NativeMind_BridgeFlutterWeb/Block/Loader.php` | Create | Loader block |
| `NativeMind_BridgeFlutterWeb/view/frontend/templates/container.phtml` | Create | Container HTML |
| `NativeMind_BridgeFlutterWeb/view/frontend/templates/loader.phtml` | Create | Config + script |
| `NativeMind_BridgeFlutterWeb/view/frontend/web/js/flutter-loader.js` | Create | Bootstrap logic |
| `NativeMind_BridgeFlutterWeb/view/frontend/web/css/flutter.css` | Create | Transition styles |
| `NativeMind_BridgeFlutterWeb/view/frontend/layout/default.xml` | Create | Block injection |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Flutter fails to load | Medium | Medium | Graceful fallback to Magento |
| CORS issues with CDN | Medium | High | Document CORS config needed |
| Memory issues on mobile | Low | Medium | Test on low-end devices |
| Route handoff fails | Medium | Medium | Fallback to home route |

## Critical Verification

```text
MUST verify no bot detection:
1. curl with default UA
2. curl with Googlebot UA
3. Both must return IDENTICAL HTML
```

## Checkpoints

- [ ] Container div renders
- [ ] Config JSON correct
- [ ] Flutter loads from configured URL
- [ ] Magento hidden after Flutter ready
- [ ] Graceful fallback on error
- [ ] Same HTML for all user agents (critical!)

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
