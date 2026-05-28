# Implementation Plan: BridgeSeo

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Create the SEO module with canonical resolution, robots meta, JSON-LD, and OpenGraph. Extract SEO-related code from monolith.

## Task Breakdown

### Phase 1: Module Foundation

#### Task 1.1: Create Module Structure
- **Description**: Create module directory and base files
- **Files**:
  - `NativeMind_BridgeSeo/registration.php` - Create
  - `NativeMind_BridgeSeo/composer.json` - Create
  - `NativeMind_BridgeSeo/etc/module.xml` - Create
- **Dependencies**: Core module exists
- **Verification**: Module registers
- **Complexity**: Low

#### Task 1.2: Create Configuration
- **Description**: Create config.xml and system.xml for SEO settings
- **Files**:
  - `etc/config.xml` - Create
  - `etc/adminhtml/system.xml` - Create
- **Dependencies**: Task 1.1
- **Verification**: Admin shows Canonical/Robots/JSON-LD/OpenGraph sections
- **Complexity**: Medium (many fields)

### Phase 2: Config Source Models

#### Task 2.1: Create Source Models
- **Description**: Create dropdown source models for admin selects
- **Files**:
  - `Model/Config/Source/ProductCanonicalMode.php` - Create
  - `Model/Config/Source/CategoryFilteredMode.php` - Create
  - `Model/Config/Source/TwitterCardType.php` - Create
- **Dependencies**: Task 1.1
- **Verification**: Dropdowns show options
- **Complexity**: Low

### Phase 3: Resolvers

#### Task 3.1: Create Config Helper
- **Description**: Create SEO config helper
- **Files**:
  - `Helper/Config.php` - Create
- **Dependencies**: Task 1.2
- **Verification**: Config values accessible
- **Complexity**: Low

#### Task 3.2: Create CanonicalResolver
- **Description**: Create canonical URL resolver with mode support
- **Files**:
  - `Model/Canonical/CanonicalResolver.php` - Create
- **Dependencies**: Task 3.1
- **Verification**: Correct URLs for product/category/cms
- **Complexity**: Medium

#### Task 3.3: Create RobotsResolver
- **Description**: Create robots meta resolver
- **Files**:
  - `Model/Robots/RobotsResolver.php` - Create
- **Dependencies**: Task 3.1
- **Verification**: Correct directives per page type
- **Complexity**: Low

### Phase 4: JSON-LD Builders

#### Task 4.1: Create ProductBuilder
- **Description**: Create Product schema.org JSON-LD builder
- **Files**:
  - `Model/JsonLd/ProductBuilder.php` - Create
- **Dependencies**: Task 3.1
- **Verification**: Valid Product schema
- **Complexity**: Medium

#### Task 4.2: Create BreadcrumbBuilder
- **Description**: Create BreadcrumbList JSON-LD builder
- **Files**:
  - `Model/JsonLd/BreadcrumbBuilder.php` - Create
- **Dependencies**: Task 3.1
- **Verification**: Valid BreadcrumbList schema
- **Complexity**: Medium

### Phase 5: Blocks & Templates

#### Task 5.1: Create JsonLd Block
- **Description**: Create block for JSON-LD output
- **Files**:
  - `Block/JsonLd.php` - Create
- **Dependencies**: Task 4.1, Task 4.2
- **Verification**: Block builds JSON-LD
- **Complexity**: Low

#### Task 5.2: Create Templates
- **Description**: Create phtml templates
- **Files**:
  - `view/frontend/templates/jsonld.phtml` - Create
- **Dependencies**: Task 5.1
- **Verification**: Script tag in output
- **Complexity**: Low

#### Task 5.3: Create Layout Files
- **Description**: Create layout XML for block injection
- **Files**:
  - `view/frontend/layout/catalog_product_view.xml` - Create
  - `view/frontend/layout/catalog_category_view.xml` - Create
- **Dependencies**: Task 5.2
- **Verification**: JSON-LD on product/category pages
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─→ Task 1.2 ─→ Task 2.1
     │           │
     │           └─→ Task 3.1 ─┬─→ Task 3.2
     │                         ├─→ Task 3.3
     │                         ├─→ Task 4.1 ─┐
     │                         └─→ Task 4.2 ─┼─→ Task 5.1 ─→ Task 5.2 ─→ Task 5.3
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `NativeMind_BridgeSeo/registration.php` | Create | Module registration |
| `NativeMind_BridgeSeo/composer.json` | Create | Composer package |
| `NativeMind_BridgeSeo/etc/module.xml` | Create | Module declaration |
| `NativeMind_BridgeSeo/etc/config.xml` | Create | Default SEO settings |
| `NativeMind_BridgeSeo/etc/adminhtml/system.xml` | Create | Admin UI |
| `NativeMind_BridgeSeo/Helper/Config.php` | Create | SEO config accessor |
| `NativeMind_BridgeSeo/Model/Config/Source/*.php` | Create | Admin dropdowns |
| `NativeMind_BridgeSeo/Model/Canonical/CanonicalResolver.php` | Create | URL resolver |
| `NativeMind_BridgeSeo/Model/Robots/RobotsResolver.php` | Create | Robots resolver |
| `NativeMind_BridgeSeo/Model/JsonLd/ProductBuilder.php` | Create | Product schema |
| `NativeMind_BridgeSeo/Model/JsonLd/BreadcrumbBuilder.php` | Create | Breadcrumb schema |
| `NativeMind_BridgeSeo/Block/JsonLd.php` | Create | JSON-LD block |
| `NativeMind_BridgeSeo/view/frontend/templates/jsonld.phtml` | Create | Output template |
| `NativeMind_BridgeSeo/view/frontend/layout/*.xml` | Create | Block injection |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| JSON-LD validation fails | Medium | Medium | Test with Google Rich Results |
| Canonical conflicts with theme | Low | Low | Document as override |

## Checkpoints

- [ ] Canonical URLs resolve correctly
- [ ] JSON-LD validates in Google tool
- [ ] Robots meta correct per page type
- [ ] Admin config sections work

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
