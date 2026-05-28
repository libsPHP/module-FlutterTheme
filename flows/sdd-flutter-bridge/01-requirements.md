# Requirements: NativeMind Flutter Bridge

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24

## Problem Statement

The current `NativeMind_FlutterTheme` module is designed as a full Magento 2 theme that bundles Flutter Web and replaces the storefront. This approach has significant limitations:

1. **High risk for existing stores** - Replacing the entire theme is invasive
2. **Theme conflicts** - Cannot work alongside existing Luma/Blank/Hyva/custom themes
3. **Complex deployment** - Requires Flutter Web build bundling
4. **Not Magento-native** - Doesn't leverage standard Magento extension patterns

**Solution**: Transform the module into `NativeMind_Bridge` - a theme-agnostic Magento 2 module that adds SEO/canonical/route metadata/app links functionality **on top of any existing theme**, without replacing it.

This enables flutter_magento mobile apps to seamlessly open web URLs while the Magento store continues using its existing theme.

## User Stories

### Primary

**As a** Magento store owner with an existing theme
**I want** to enable flutter_magento app deep linking without changing my storefront
**So that** customers can seamlessly switch between web and app experiences

**As a** SEO manager
**I want** canonical URLs and structured data added to pages automatically
**So that** search engines correctly index my store without duplicate content issues

**As a** mobile app developer using flutter_magento
**I want** standardized route metadata embedded in Magento pages
**So that** the Flutter app can understand and open any Magento URL

### Secondary

**As a** store administrator
**I want** to configure App Links (Android) and Universal Links (iOS)
**So that** clicking store URLs on mobile devices opens the app directly

**As a** marketing manager
**I want** an optional "Open in App" banner on the web store
**So that** web visitors are encouraged to install/use the mobile app

## Acceptance Criteria

### Must Have

1. **Theme-agnostic installation**
   - **Given** any Magento 2 store with Blank/Luma/Hyva/custom theme
   - **When** NativeMind_Bridge is installed
   - **Then** the existing theme continues to render all pages unchanged

2. **Canonical URL normalization**
   - **Given** a product accessible via multiple URLs
   - **When** the page is rendered
   - **Then** a single canonical `<link rel="canonical">` is output

3. **Route metadata injection**
   - **Given** a product/category/CMS/search page
   - **When** the page is rendered
   - **Then** a `<script type="application/json" id="flutter-magento-route">` block is injected with standardized route data

4. **App Links endpoints**
   - **Given** a Magento store with the module enabled
   - **When** `/.well-known/assetlinks.json` or `/.well-known/apple-app-site-association` is requested
   - **Then** valid App Links/Universal Links configuration is returned

5. **Admin configuration**
   - **Given** a store administrator
   - **When** accessing Stores > Configuration > NativeMind > Flutter Bridge
   - **Then** all features can be enabled/disabled/configured

6. **No template overrides**
   - **Given** the module is installed
   - **When** examining the module structure
   - **Then** no core Magento templates are overridden (product/view.phtml, category/view.phtml, etc.)

### Should Have

7. **JSON-LD structured data**
   - **Given** a product page with JSON-LD enabled
   - **When** the page is rendered
   - **Then** Product/Breadcrumb/Organization JSON-LD is output

8. **OpenGraph/Twitter meta tags**
   - **Given** a page with OpenGraph enabled
   - **When** the page is rendered
   - **Then** og:title, og:image, og:description, twitter:card meta tags are output

9. **Robots meta control**
   - **Given** cart/checkout/search/filtered category pages
   - **When** the page is rendered
   - **Then** appropriate noindex/nofollow robots meta is output

10. **App banner (optional)**
    - **Given** app banner is enabled in config
    - **When** any page is rendered
    - **Then** a dismissible "Open in App" banner appears

### Won't Have (This Iteration)

- Flutter Web build bundling or serving
- SSR Flutter rendering
- Checkout flow modification
- Customer/admin token handling in HTML
- Custom product/category view templates
- Theme inheritance from Blank/Luma
- Service Worker registration
- PWA manifest generation

## Module Boundaries

### What the module DOES

| Feature | Description |
|---------|-------------|
| Canonical resolver | Normalizes canonical URLs across product/category/CMS/search pages |
| Route metadata | Outputs standardized JSON for flutter_magento route mapping |
| JSON-LD | Outputs Product/Breadcrumb/Organization structured data |
| OpenGraph/Twitter | Outputs social sharing meta tags |
| Robots meta | Controls indexing for cart/checkout/search/filtered pages |
| App Links | Serves /.well-known/assetlinks.json and apple-app-site-association |
| App banner | Optional "Open in App" / "Install App" banner |
| Debug endpoint | Route mapping verification page |
| Admin config | Full configuration via Magento admin |

### What the module does NOT do

| Non-feature | Rationale |
|-------------|-----------|
| Does not create Magento theme | Works with any existing theme |
| Does not inherit from Blank/Luma | Not a theme, just a module |
| Does not override product view | Adds blocks, doesn't replace templates |
| Does not override category view | Adds blocks, doesn't replace templates |
| Does not contain Flutter Web build | No main.dart.js, no canvaskit |
| Does not do SSR Flutter | Not rendering Flutter on server |
| Does not modify checkout | No checkout template changes |
| Does not store tokens in HTML | Security: no customer/admin tokens |
| Does not break existing frontend | Low-risk, additive-only changes |

## Route Standard: flutter_magento_v1

The module outputs route metadata in a standardized JSON format:

```json
{
  "standard": "flutter_magento_v1",
  "type": "product|category|cms|search|cart|checkout|customer",
  "canonicalUrl": "https://shop.com/driven-backpack.html",
  "webPath": "/driven-backpack.html",
  "appRoute": "/product/24-WB03",
  "entity": {
    "id": 123,
    "sku": "24-WB03",
    "urlKey": "driven-backpack"
  },
  "store": {
    "websiteCode": "base",
    "storeCode": "default",
    "currency": "USD",
    "locale": "en_US"
  }
}
```

## Constraints

- **Technical**: Must work with Magento 2.4.x (PHP 8.1+)
- **Compatibility**: Must not conflict with Luma, Blank, Hyva, or custom themes
- **Performance**: Must be FPC-safe (Full Page Cache compatible)
- **Security**: Must not output sensitive data (tokens, customer info) in HTML
- **Extensibility**: Must use Magento-native patterns (plugins, observers, layout XML)

## Implementation Phases

Based on user specification, implementation follows these phases:

1. **Phase 0**: Rename/reposition from FlutterTheme to Bridge
2. **Phase 1**: Base module structure (registration, config, admin)
3. **Phase 2**: Layout injection (blocks in default.xml and page-specific layouts)
4. **Phase 3**: Route standard (RoutePayload builders for all page types)
5. **Phase 4**: Canonical resolver (Product, Category, CMS, Search)
6. **Phase 5**: Robots meta resolver
7. **Phase 6**: JSON-LD builders
8. **Phase 7**: OpenGraph/Twitter meta
9. **Phase 8**: App Links controllers
10. **Phase 9**: App banner
11. **Phase 10**: Theme compatibility testing
12. **Phase 11**: Cache optimization
13. **Phase 12**: Tests

## Open Questions

- [x] Should JSON-LD mode support "disabled/append/replace"? **Yes** - some themes already output JSON-LD
- [x] Should canonical mode be configurable? **Yes** - Magento default / shortest URL / category path
- [x] Where to output route metadata script? **before.body.end** - safe, theme-agnostic location

## References

- User specification provided in command args (comprehensive technical spec)
- Adobe Magento Developer Documentation: Layout XML, Plugins, Observers
- flutter_magento package: Route handling on Flutter side

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
- [x] Notes: Approved as drafted
