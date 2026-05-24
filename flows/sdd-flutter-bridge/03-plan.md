# Implementation Plan: NativeMind Flutter Bridge

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-24
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Transform `NativeMind_FlutterTheme` into `NativeMind_FlutterBridge` - a theme-agnostic Magento 2 module. Implementation follows 12 phases from cleanup through testing.

**Total tasks**: 67
**Estimated complexity**: High (significant refactoring + new features)

## Task Breakdown

### Phase 0: Cleanup & Rename (Foundation)

#### Task 0.1: Delete obsolete files
- **Description**: Remove Flutter theme-specific files that won't be used
- **Files**:
  - `Block/Root.php` - Delete
  - `Block/Fallback/Product.php` - Delete
  - `Block/Fallback/Category.php` - Delete
  - `Helper/DataInterface.php` - Delete
  - `view/frontend/templates/root.phtml` - Delete
  - `view/frontend/templates/fallback/product.phtml` - Delete
  - `view/frontend/templates/fallback/category.phtml` - Delete
  - `view/frontend/templates/fallback/page.phtml` - Delete
  - `view/frontend/web/js/flutter-loader.js` - Delete
  - `view/frontend/web/flutter/.gitkeep` - Delete
  - `view/frontend/web/css/fallback.css` - Delete
  - `view/frontend/web/css/vishakha-devi-a.css` - Delete
  - `view/frontend/web/css/vishakha-devi-b.css` - Delete
  - `view/frontend/web/css/vishakha-devi-c.css` - Delete
  - `VISHAKHA_DEVI_STYLES.md` - Delete
- **Dependencies**: None
- **Verification**: Files no longer exist
- **Complexity**: Low

#### Task 0.2: Rename module registration
- **Description**: Update registration.php to register as NativeMind_FlutterBridge
- **Files**:
  - `registration.php` - Modify
- **Dependencies**: Task 0.1
- **Verification**: `grep -r "FlutterBridge" registration.php`
- **Complexity**: Low

#### Task 0.3: Update composer.json
- **Description**: Rename package, update description, update autoload namespace
- **Files**:
  - `composer.json` - Modify
- **Dependencies**: Task 0.2
- **Verification**: `composer validate`
- **Complexity**: Low

#### Task 0.4: Update module.xml
- **Description**: Rename module to NativeMind_FlutterBridge
- **Files**:
  - `etc/module.xml` - Modify
- **Dependencies**: Task 0.2
- **Verification**: Module name matches in XML
- **Complexity**: Low

#### Task 0.5: Update README.md
- **Description**: Complete rewrite for theme-agnostic positioning
- **Files**:
  - `README.md` - Modify
- **Dependencies**: Task 0.4
- **Verification**: README describes bridge (not theme) functionality
- **Complexity**: Low

#### Task 0.6: Clean up documentation files
- **Description**: Remove or update obsolete docs
- **Files**:
  - `CHANGELOG.md` - Modify (add migration note)
  - `CONTRIBUTING.md` - Keep
  - `EXAMPLES.md` - Delete or rewrite
  - `FLUTTER_INTEGRATION.md` - Delete (Flutter Web specific)
  - `INSTALL.md` - Modify
  - `PROJECT_SUMMARY.md` - Delete or rewrite
  - `PUBLISHING.md` - Keep
  - `RELEASE_NOTES.md` - Modify
- **Dependencies**: Task 0.5
- **Verification**: No references to FlutterTheme or Flutter Web
- **Complexity**: Low

---

### Phase 1: Base Module Configuration

#### Task 1.1: Create new config.xml
- **Description**: Replace config.xml with new structure for bridge features
- **Files**:
  - `etc/config.xml` - Replace
- **Dependencies**: Task 0.4
- **Verification**: Config paths match spec (nativemind_flutterbridge/*)
- **Complexity**: Medium

#### Task 1.2: Create new system.xml
- **Description**: Replace admin config with 8 groups (general, route, canonical, robots, jsonld, opengraph, app_links, app_banner)
- **Files**:
  - `etc/adminhtml/system.xml` - Replace
- **Dependencies**: Task 1.1
- **Verification**: Admin panel shows new config sections
- **Complexity**: Medium

#### Task 1.3: Update acl.xml
- **Description**: Update ACL resource names for FlutterBridge
- **Files**:
  - `etc/acl.xml` - Modify
- **Dependencies**: Task 1.2
- **Verification**: ACL resource path updated
- **Complexity**: Low

#### Task 1.4: Create Helper/Config.php
- **Description**: New config helper with all config accessors
- **Files**:
  - `Helper/Config.php` - Create
  - `Helper/Data.php` - Delete
- **Dependencies**: Task 1.1
- **Verification**: Unit test for config methods
- **Complexity**: Medium

#### Task 1.5: Update di.xml
- **Description**: Update DI preferences for new classes
- **Files**:
  - `etc/di.xml` - Modify
- **Dependencies**: Task 1.4
- **Verification**: DI compiles without errors
- **Complexity**: Low

#### Task 1.6: Create frontend routes.xml
- **Description**: Define routes for .well-known endpoints
- **Files**:
  - `etc/frontend/routes.xml` - Create
- **Dependencies**: Task 0.4
- **Verification**: Routes registered
- **Complexity**: Low

#### Task 1.7: Create frontend di.xml
- **Description**: Frontend-specific DI configuration
- **Files**:
  - `etc/frontend/di.xml` - Create
- **Dependencies**: Task 1.5
- **Verification**: DI compiles
- **Complexity**: Low

---

### Phase 2: Route Standard Implementation

#### Task 2.1: Create RouteType class
- **Description**: Constants for route types (product, category, cms, search, cart, checkout, customer, home, unknown)
- **Files**:
  - `Model/Route/RouteType.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Class exists with constants
- **Complexity**: Low

#### Task 2.2: Create RoutePayload class
- **Description**: Data model for route payload with toArray() and toJson()
- **Files**:
  - `Model/Route/RoutePayload.php` - Create
- **Dependencies**: Task 2.1
- **Verification**: Unit test for JSON output
- **Complexity**: Low

#### Task 2.3: Create RoutePayloadBuilderInterface
- **Description**: Interface for route payload builders
- **Files**:
  - `Api/RoutePayloadBuilderInterface.php` - Create
- **Dependencies**: Task 2.2
- **Verification**: Interface exists
- **Complexity**: Low

#### Task 2.4: Create ProductRoutePayloadBuilder
- **Description**: Build route payload for product pages
- **Files**:
  - `Model/Route/ProductRoutePayloadBuilder.php` - Create
- **Dependencies**: Task 2.3
- **Verification**: Unit test with mock product
- **Complexity**: Medium

#### Task 2.5: Create CategoryRoutePayloadBuilder
- **Description**: Build route payload for category pages
- **Files**:
  - `Model/Route/CategoryRoutePayloadBuilder.php` - Create
- **Dependencies**: Task 2.3
- **Verification**: Unit test with mock category
- **Complexity**: Medium

#### Task 2.6: Create CmsRoutePayloadBuilder
- **Description**: Build route payload for CMS pages
- **Files**:
  - `Model/Route/CmsRoutePayloadBuilder.php` - Create
- **Dependencies**: Task 2.3
- **Verification**: Unit test with mock CMS page
- **Complexity**: Medium

#### Task 2.7: Create SearchRoutePayloadBuilder
- **Description**: Build route payload for search results
- **Files**:
  - `Model/Route/SearchRoutePayloadBuilder.php` - Create
- **Dependencies**: Task 2.3
- **Verification**: Unit test with search query
- **Complexity**: Medium

#### Task 2.8: Create CartRoutePayloadBuilder
- **Description**: Build route payload for cart page
- **Files**:
  - `Model/Route/CartRoutePayloadBuilder.php` - Create
- **Dependencies**: Task 2.3
- **Verification**: Unit test
- **Complexity**: Low

#### Task 2.9: Create CheckoutRoutePayloadBuilder
- **Description**: Build route payload for checkout page
- **Files**:
  - `Model/Route/CheckoutRoutePayloadBuilder.php` - Create
- **Dependencies**: Task 2.3
- **Verification**: Unit test
- **Complexity**: Low

#### Task 2.10: Create CustomerRoutePayloadBuilder
- **Description**: Build route payload for customer account pages
- **Files**:
  - `Model/Route/CustomerRoutePayloadBuilder.php` - Create
- **Dependencies**: Task 2.3
- **Verification**: Unit test
- **Complexity**: Low

#### Task 2.11: Create RoutePayloadBuilderPool
- **Description**: Pool/composite to select correct builder based on page type
- **Files**:
  - `Model/Route/RoutePayloadBuilderPool.php` - Create
- **Dependencies**: Tasks 2.4-2.10
- **Verification**: Pool returns correct builder for each page type
- **Complexity**: Medium

---

### Phase 3: Layout Injection

#### Task 3.1: Create RouteMeta block
- **Description**: Block for rendering route metadata JSON
- **Files**:
  - `Block/Head/RouteMeta.php` - Create
- **Dependencies**: Task 2.11
- **Verification**: Block renders JSON
- **Complexity**: Medium

#### Task 3.2: Create RouteMetaViewModel
- **Description**: ViewModel for route metadata
- **Files**:
  - `ViewModel/RouteMetaViewModel.php` - Create
- **Dependencies**: Task 3.1
- **Verification**: ViewModel provides data
- **Complexity**: Low

#### Task 3.3: Create route_meta.phtml template
- **Description**: Template to output route JSON script block
- **Files**:
  - `view/frontend/templates/head/route_meta.phtml` - Create
- **Dependencies**: Task 3.1
- **Verification**: Template outputs valid JSON script
- **Complexity**: Low

#### Task 3.4: Create default.xml layout
- **Description**: Add RouteMeta block to all pages via before.body.end
- **Files**:
  - `view/frontend/layout/default.xml` - Replace
- **Dependencies**: Task 3.3
- **Verification**: Block appears on all pages
- **Complexity**: Low

#### Task 3.5: Create catalog_product_view.xml
- **Description**: Product-specific layout additions
- **Files**:
  - `view/frontend/layout/catalog_product_view.xml` - Replace
- **Dependencies**: Task 3.4
- **Verification**: Product page has route meta
- **Complexity**: Low

#### Task 3.6: Create catalog_category_view.xml
- **Description**: Category-specific layout additions
- **Files**:
  - `view/frontend/layout/catalog_category_view.xml` - Replace
- **Dependencies**: Task 3.4
- **Verification**: Category page has route meta
- **Complexity**: Low

#### Task 3.7: Create cms_page_view.xml
- **Description**: CMS page-specific layout
- **Files**:
  - `view/frontend/layout/cms_page_view.xml` - Create
- **Dependencies**: Task 3.4
- **Verification**: CMS page has route meta
- **Complexity**: Low

#### Task 3.8: Update cms_index_index.xml
- **Description**: Home page layout (CMS home)
- **Files**:
  - `view/frontend/layout/cms_index_index.xml` - Modify
- **Dependencies**: Task 3.4
- **Verification**: Home page has route meta
- **Complexity**: Low

#### Task 3.9: Create catalogsearch_result_index.xml
- **Description**: Search results layout
- **Files**:
  - `view/frontend/layout/catalogsearch_result_index.xml` - Create
- **Dependencies**: Task 3.4
- **Verification**: Search page has route meta
- **Complexity**: Low

#### Task 3.10: Create checkout_cart_index.xml
- **Description**: Cart page layout
- **Files**:
  - `view/frontend/layout/checkout_cart_index.xml` - Create
- **Dependencies**: Task 3.4
- **Verification**: Cart page has route meta
- **Complexity**: Low

#### Task 3.11: Create checkout_index_index.xml
- **Description**: Checkout page layout
- **Files**:
  - `view/frontend/layout/checkout_index_index.xml` - Create
- **Dependencies**: Task 3.4
- **Verification**: Checkout page has route meta
- **Complexity**: Low

#### Task 3.12: Create customer_account_index.xml
- **Description**: Customer account layout
- **Files**:
  - `view/frontend/layout/customer_account_index.xml` - Create
- **Dependencies**: Task 3.4
- **Verification**: Customer page has route meta
- **Complexity**: Low

---

### Phase 4: Canonical Resolution

#### Task 4.1: Create CanonicalResolverInterface
- **Description**: Interface for canonical resolvers
- **Files**:
  - `Api/CanonicalResolverInterface.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Interface exists
- **Complexity**: Low

#### Task 4.2: Create ProductCanonicalResolver
- **Description**: Resolve canonical URL for products (with mode support)
- **Files**:
  - `Model/Canonical/ProductCanonicalResolver.php` - Create
- **Dependencies**: Task 4.1
- **Verification**: Unit test for URL normalization
- **Complexity**: Medium

#### Task 4.3: Create CategoryCanonicalResolver
- **Description**: Resolve canonical URL for categories (strip filters)
- **Files**:
  - `Model/Canonical/CategoryCanonicalResolver.php` - Create
- **Dependencies**: Task 4.1
- **Verification**: Unit test for filter stripping
- **Complexity**: Medium

#### Task 4.4: Create CmsCanonicalResolver
- **Description**: Resolve canonical URL for CMS pages
- **Files**:
  - `Model/Canonical/CmsCanonicalResolver.php` - Create
- **Dependencies**: Task 4.1
- **Verification**: Unit test
- **Complexity**: Low

#### Task 4.5: Create SearchCanonicalResolver
- **Description**: Handle search canonical (usually none)
- **Files**:
  - `Model/Canonical/SearchCanonicalResolver.php` - Create
- **Dependencies**: Task 4.1
- **Verification**: Returns null for search
- **Complexity**: Low

#### Task 4.6: Create CanonicalResolverPool
- **Description**: Pool to select correct resolver
- **Files**:
  - `Model/Canonical/CanonicalResolverPool.php` - Create
- **Dependencies**: Tasks 4.2-4.5
- **Verification**: Pool returns correct resolver
- **Complexity**: Medium

#### Task 4.7: Create PageConfigCanonicalPlugin
- **Description**: Plugin to inject canonical via PageConfig
- **Files**:
  - `Plugin/PageConfigCanonicalPlugin.php` - Create
- **Dependencies**: Task 4.6
- **Verification**: Canonical appears in page head
- **Complexity**: Medium

---

### Phase 5: Robots Resolution

#### Task 5.1: Create RobotsResolver
- **Description**: Determine robots meta based on page type and config
- **Files**:
  - `Model/Robots/RobotsResolver.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Unit test for all page types
- **Complexity**: Medium

#### Task 5.2: Create PageConfigRobotsPlugin
- **Description**: Plugin to set robots meta via PageConfig
- **Files**:
  - `Plugin/PageConfigRobotsPlugin.php` - Create
- **Dependencies**: Task 5.1
- **Verification**: Robots meta appears correctly
- **Complexity**: Medium

---

### Phase 6: JSON-LD Implementation

#### Task 6.1: Create JsonLdBuilderInterface
- **Description**: Interface for JSON-LD builders
- **Files**:
  - `Api/JsonLdBuilderInterface.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Interface exists
- **Complexity**: Low

#### Task 6.2: Create ProductJsonLdBuilder
- **Description**: Build Product schema.org JSON-LD
- **Files**:
  - `Model/JsonLd/ProductJsonLdBuilder.php` - Create
- **Dependencies**: Task 6.1
- **Verification**: Valid JSON-LD output
- **Complexity**: High

#### Task 6.3: Create BreadcrumbJsonLdBuilder
- **Description**: Build BreadcrumbList schema.org JSON-LD
- **Files**:
  - `Model/JsonLd/BreadcrumbJsonLdBuilder.php` - Create
- **Dependencies**: Task 6.1
- **Verification**: Valid JSON-LD output
- **Complexity**: Medium

#### Task 6.4: Create OrganizationJsonLdBuilder
- **Description**: Build Organization schema.org JSON-LD
- **Files**:
  - `Model/JsonLd/OrganizationJsonLdBuilder.php` - Create
- **Dependencies**: Task 6.1
- **Verification**: Valid JSON-LD output
- **Complexity**: Medium

#### Task 6.5: Create JsonLd block
- **Description**: Block for rendering JSON-LD
- **Files**:
  - `Block/Head/JsonLd.php` - Create
- **Dependencies**: Tasks 6.2-6.4
- **Verification**: Block renders JSON-LD
- **Complexity**: Medium

#### Task 6.6: Create jsonld.phtml template
- **Description**: Template for JSON-LD script output
- **Files**:
  - `view/frontend/templates/head/jsonld.phtml` - Create
- **Dependencies**: Task 6.5
- **Verification**: Valid JSON-LD in output
- **Complexity**: Low

#### Task 6.7: Add JsonLd to product layout
- **Description**: Add JSON-LD block to catalog_product_view.xml
- **Files**:
  - `view/frontend/layout/catalog_product_view.xml` - Modify
- **Dependencies**: Task 6.6
- **Verification**: Product page has JSON-LD
- **Complexity**: Low

---

### Phase 7: OpenGraph Implementation

#### Task 7.1: Create OpenGraph block
- **Description**: Block for OpenGraph meta tags
- **Files**:
  - `Block/Head/OpenGraph.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Block provides OG data
- **Complexity**: Medium

#### Task 7.2: Create PageConfigOpenGraphPlugin
- **Description**: Plugin to inject OG meta via PageConfig
- **Files**:
  - `Plugin/PageConfigOpenGraphPlugin.php` - Create
- **Dependencies**: Task 7.1
- **Verification**: OG meta appears in head
- **Complexity**: Medium

---

### Phase 8: App Links Controllers

#### Task 8.1: Create AssetLinksBuilder
- **Description**: Build Android assetlinks.json content
- **Files**:
  - `Model/AppLinks/AssetLinksBuilder.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Valid JSON output
- **Complexity**: Low

#### Task 8.2: Create AppleAppSiteAssociationBuilder
- **Description**: Build iOS apple-app-site-association content
- **Files**:
  - `Model/AppLinks/AppleAppSiteAssociationBuilder.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Valid JSON output
- **Complexity**: Low

#### Task 8.3: Create AssetLinks controller
- **Description**: Controller for /.well-known/assetlinks.json
- **Files**:
  - `Controller/WellKnown/AssetLinks.php` - Create
- **Dependencies**: Task 8.1
- **Verification**: Endpoint returns JSON
- **Complexity**: Medium

#### Task 8.4: Create AppleAppSiteAssociation controller
- **Description**: Controller for /.well-known/apple-app-site-association
- **Files**:
  - `Controller/WellKnown/AppleAppSiteAssociation.php` - Create
- **Dependencies**: Task 8.2
- **Verification**: Endpoint returns JSON
- **Complexity**: Medium

#### Task 8.5: Create Debug/Route controller
- **Description**: Debug endpoint for route mapping verification
- **Files**:
  - `Controller/Debug/Route.php` - Create
- **Dependencies**: Task 2.11
- **Verification**: Debug page shows route info
- **Complexity**: Low

---

### Phase 9: App Banner

#### Task 9.1: Create Banner block
- **Description**: Block for app banner
- **Files**:
  - `Block/App/Banner.php` - Create
- **Dependencies**: Phase 1
- **Verification**: Block renders
- **Complexity**: Medium

#### Task 9.2: Create AppBannerViewModel
- **Description**: ViewModel for banner data
- **Files**:
  - `ViewModel/AppBannerViewModel.php` - Create
- **Dependencies**: Task 9.1
- **Verification**: ViewModel provides data
- **Complexity**: Low

#### Task 9.3: Create banner.phtml template
- **Description**: Template for app banner HTML
- **Files**:
  - `view/frontend/templates/app/banner.phtml` - Create
- **Dependencies**: Task 9.1
- **Verification**: Banner HTML renders
- **Complexity**: Low

#### Task 9.4: Create bridge.css
- **Description**: Namespaced CSS for banner (.nm-flutterbridge-*)
- **Files**:
  - `view/frontend/web/css/bridge.css` - Create
- **Dependencies**: Task 9.3
- **Verification**: CSS applies to banner
- **Complexity**: Low

#### Task 9.5: Create app-bridge.js
- **Description**: JS for banner dismiss functionality
- **Files**:
  - `view/frontend/web/js/app-bridge.js` - Create
- **Dependencies**: Task 9.3
- **Verification**: Dismiss works, sets cookie
- **Complexity**: Low

#### Task 9.6: Add banner to default.xml
- **Description**: Add banner block to after.body.start
- **Files**:
  - `view/frontend/layout/default.xml` - Modify
- **Dependencies**: Task 9.3
- **Verification**: Banner appears on pages
- **Complexity**: Low

---

### Phase 10: DI & Wiring

#### Task 10.1: Configure builder pools in di.xml
- **Description**: Wire up RoutePayloadBuilderPool and CanonicalResolverPool
- **Files**:
  - `etc/di.xml` - Modify
  - `etc/frontend/di.xml` - Modify
- **Dependencies**: All model tasks
- **Verification**: DI compiles
- **Complexity**: Medium

#### Task 10.2: Configure plugins in di.xml
- **Description**: Register PageConfig plugins
- **Files**:
  - `etc/frontend/di.xml` - Modify
- **Dependencies**: Plugin tasks
- **Verification**: Plugins execute
- **Complexity**: Low

---

### Phase 11: Cache Optimization

#### Task 11.1: Add cache identities to blocks
- **Description**: Implement Magento\Framework\DataObject\IdentityInterface
- **Files**:
  - `Block/Head/RouteMeta.php` - Modify
  - `Block/Head/JsonLd.php` - Modify
  - `Block/App/Banner.php` - Modify
- **Dependencies**: Block tasks
- **Verification**: Blocks have getIdentities()
- **Complexity**: Low

#### Task 11.2: Ensure blocks are cacheable
- **Description**: Verify no private data in blocks, add cacheable="true"
- **Files**:
  - All layout XML files - Verify
- **Dependencies**: Layout tasks
- **Verification**: Blocks cache correctly
- **Complexity**: Low

---

### Phase 12: Testing

#### Task 12.1: Create unit tests for RoutePayload
- **Description**: Test RoutePayload serialization
- **Files**:
  - `Test/Unit/Model/Route/RoutePayloadTest.php` - Create
- **Dependencies**: Task 2.2
- **Verification**: Tests pass
- **Complexity**: Low

#### Task 12.2: Create unit tests for route builders
- **Description**: Test each route payload builder
- **Files**:
  - `Test/Unit/Model/Route/ProductRoutePayloadBuilderTest.php` - Create
  - `Test/Unit/Model/Route/CategoryRoutePayloadBuilderTest.php` - Create
- **Dependencies**: Tasks 2.4-2.5
- **Verification**: Tests pass
- **Complexity**: Medium

#### Task 12.3: Create unit tests for canonical resolvers
- **Description**: Test canonical URL resolution
- **Files**:
  - `Test/Unit/Model/Canonical/ProductCanonicalResolverTest.php` - Create
- **Dependencies**: Task 4.2
- **Verification**: Tests pass
- **Complexity**: Medium

#### Task 12.4: Create unit tests for robots resolver
- **Description**: Test robots meta resolution
- **Files**:
  - `Test/Unit/Model/Robots/RobotsResolverTest.php` - Create
- **Dependencies**: Task 5.1
- **Verification**: Tests pass
- **Complexity**: Low

#### Task 12.5: Run composer validate
- **Description**: Validate composer.json
- **Files**: None
- **Dependencies**: Task 0.3
- **Verification**: `composer validate` passes
- **Complexity**: Low

#### Task 12.6: Run PHPStan
- **Description**: Static analysis check
- **Files**: None
- **Dependencies**: All PHP files
- **Verification**: PHPStan passes
- **Complexity**: Low

#### Task 12.7: Run Magento coding standard
- **Description**: Check against Magento coding standards
- **Files**: None
- **Dependencies**: All PHP files
- **Verification**: PHPCS passes
- **Complexity**: Low

---

## Dependency Graph

```
Phase 0 (Cleanup)
    │
    ├──► Phase 1 (Config)
    │        │
    │        ├──► Phase 2 (Route Standard)
    │        │        │
    │        │        └──► Phase 3 (Layout)
    │        │
    │        ├──► Phase 4 (Canonical)
    │        │
    │        ├──► Phase 5 (Robots)
    │        │
    │        ├──► Phase 6 (JSON-LD)
    │        │
    │        ├──► Phase 7 (OpenGraph)
    │        │
    │        ├──► Phase 8 (App Links)
    │        │
    │        └──► Phase 9 (Banner)
    │
    └──► Phase 10 (DI Wiring) ◄── Phases 2-9
              │
              └──► Phase 11 (Cache)
                       │
                       └──► Phase 12 (Testing)
```

## File Change Summary

| Action | Count | Files |
|--------|-------|-------|
| Delete | 15 | Old theme files, fallback templates, Vishakha styles |
| Create | 45 | New models, blocks, controllers, templates, layouts |
| Modify | 7 | registration.php, composer.json, module.xml, di.xml, acl.xml, README, existing layouts |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Breaking existing stores | Low | High | Theme-agnostic design, no template overrides |
| DI compilation errors | Medium | Medium | Incremental testing after each phase |
| FPC cache issues | Medium | Medium | Ensure no private data in blocks |
| Plugin conflicts | Low | Medium | Use after/around plugins carefully |
| JSON-LD conflicts with theme | Medium | Low | Configurable mode (disabled/append/replace) |

## Rollback Strategy

If implementation fails:

1. Git revert to pre-implementation commit
2. Re-enable old FlutterTheme module if needed
3. Clear Magento caches: `bin/magento cache:flush`
4. Run `bin/magento setup:upgrade` if needed

## Checkpoints

After each phase:

- [ ] All new files syntactically valid PHP
- [ ] `bin/magento setup:di:compile` succeeds
- [ ] `bin/magento cache:flush` succeeds
- [ ] No PHP errors in logs

After Phase 3:
- [ ] Route metadata JSON visible on product page

After Phase 12:
- [ ] All unit tests pass
- [ ] PHPStan passes
- [ ] Module works with Luma theme

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes: [pending]
