# Specifications: NativeMind Flutter Bridge

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

Transform `NativeMind_FlutterTheme` into `NativeMind_Bridge` - a theme-agnostic Magento 2 module that injects SEO metadata, route information, and app links into any existing Magento theme without replacing templates.

**Key architectural change**: From "replace root template" to "add blocks via layout XML".

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `registration.php` | Modify | Rename to `NativeMind_Bridge` |
| `composer.json` | Modify | Rename package, update description |
| `etc/module.xml` | Modify | Rename module |
| `etc/config.xml` | Replace | New config structure for bridge features |
| `etc/adminhtml/system.xml` | Replace | New admin config sections |
| `etc/frontend/routes.xml` | Create | Routes for .well-known endpoints |
| `etc/frontend/di.xml` | Create | DI configuration |
| `Helper/Config.php` | Create | New config helper (replace Data.php) |
| `Helper/Data.php` | Delete | Replaced by Config.php |
| `Block/Root.php` | Delete | Theme replacement - not needed |
| `Block/Fallback/*` | Delete | Theme fallback - not needed |
| `Block/Head/*` | Create | RouteMeta, JsonLd, OpenGraph, Canonical blocks |
| `Block/App/*` | Create | Banner, InstallCta blocks |
| `Model/Canonical/*` | Create | Canonical resolvers |
| `Model/Route/*` | Create | Route payload builders |
| `Model/JsonLd/*` | Create | JSON-LD builders |
| `Model/AppLinks/*` | Create | App Links builders |
| `Model/Robots/*` | Create | Robots resolver |
| `Controller/WellKnown/*` | Create | App Links endpoints |
| `Controller/Debug/*` | Create | Debug route endpoint |
| `ViewModel/*` | Create | View models for templates |
| `Plugin/*` | Create | PageConfig plugins |
| `view/frontend/layout/*` | Replace | Theme-agnostic layout injection |
| `view/frontend/templates/*` | Replace | New templates for metadata blocks |
| `view/frontend/web/css/*` | Replace | Namespaced banner CSS only |
| `view/frontend/web/js/*` | Replace | Namespaced banner JS only |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                     Any Magento Theme                                │
│  (Luma / Blank / Hyva / Custom)                                     │
└─────────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│                   NativeMind_Bridge                          │
│                                                                      │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌────────────┐ │
│  │   Layout    │  │   Blocks    │  │   Models    │  │ Controllers│ │
│  │   XML       │  │             │  │             │  │            │ │
│  │             │  │ Head/       │  │ Canonical/  │  │ WellKnown/ │ │
│  │ default.xml │  │  RouteMeta  │  │  Resolver   │  │ AssetLinks │ │
│  │ product.xml │  │  JsonLd     │  │             │  │ AppleAAA   │ │
│  │ category.xml│  │  OpenGraph  │  │ Route/      │  │            │ │
│  │ cms.xml     │  │             │  │  Payload    │  │ Debug/     │ │
│  │ search.xml  │  │ App/        │  │  Builder    │  │  Route     │ │
│  │ cart.xml    │  │  Banner     │  │             │  │            │ │
│  │ checkout.xml│  │             │  │ JsonLd/     │  │            │ │
│  │ customer.xml│  │             │  │  Builder    │  │            │ │
│  └─────────────┘  └─────────────┘  └─────────────┘  └────────────┘ │
│                                                                      │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐                  │
│  │  Plugins    │  │  ViewModels │  │   Config    │                  │
│  │             │  │             │  │             │                  │
│  │ PageConfig  │  │ ProductRoute│  │ Helper/     │                  │
│  │ Plugin      │  │ CategoryRte │  │  Config     │                  │
│  │             │  │ CmsRoute    │  │             │                  │
│  │             │  │ SearchRoute │  │ system.xml  │                  │
│  │             │  │ AppBanner   │  │ config.xml  │                  │
│  └─────────────┘  └─────────────┘  └─────────────┘                  │
└─────────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────┐
│                     HTML Output                                      │
│                                                                      │
│  <head>                                                              │
│    <link rel="canonical" href="...">                                │
│    <meta name="robots" content="...">                               │
│    <meta property="og:..." content="...">                           │
│  </head>                                                             │
│  <body>                                                              │
│    [App Banner - after.body.start]                                  │
│    [Theme Content - unchanged]                                       │
│    <script type="application/json" id="flutter-magento-route">      │
│    <script type="application/ld+json">                              │
│    [before.body.end]                                                │
│  </body>                                                             │
└─────────────────────────────────────────────────────────────────────┘
```

### Data Flow

```
Request arrives
      │
      ▼
┌─────────────────┐
│ Magento routing │
│ (existing theme)│
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│ Layout XML processing                                            │
│                                                                   │
│  default.xml: Add Banner, RouteMeta to all pages                │
│  catalog_product_view.xml: Add Product-specific JsonLd          │
│  catalog_category_view.xml: Add Category-specific data          │
│  etc.                                                            │
└────────┬────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│ Block rendering                                                  │
│                                                                   │
│  Block → ViewModel → Model (RoutePayloadBuilder, etc.)          │
│  Block → Model (CanonicalResolver, JsonLdBuilder, etc.)         │
└────────┬────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│ Template output (.phtml)                                         │
│                                                                   │
│  route_meta.phtml → <script id="flutter-magento-route">         │
│  jsonld.phtml → <script type="application/ld+json">             │
│  banner.phtml → <div class="nm-Bridge-banner">           │
└────────┬────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│ PageConfig plugins (for <head> meta)                             │
│                                                                   │
│  CanonicalPlugin → <link rel="canonical">                       │
│  RobotsPlugin → <meta name="robots">                            │
│  OpenGraphPlugin → <meta property="og:*">                       │
└─────────────────────────────────────────────────────────────────┘
```

## Directory Structure

```
magento/NativeMind_Bridge/
├── registration.php
├── composer.json
├── README.md
│
├── etc/
│   ├── module.xml
│   ├── config.xml
│   ├── di.xml
│   ├── acl.xml
│   ├── frontend/
│   │   ├── routes.xml
│   │   ├── di.xml
│   │   └── events.xml
│   └── adminhtml/
│       └── system.xml
│
├── Api/
│   ├── CanonicalResolverInterface.php
│   ├── RoutePayloadBuilderInterface.php
│   └── JsonLdBuilderInterface.php
│
├── Block/
│   ├── Head/
│   │   ├── RouteMeta.php
│   │   ├── JsonLd.php
│   │   └── OpenGraph.php
│   └── App/
│       └── Banner.php
│
├── Controller/
│   ├── WellKnown/
│   │   ├── AssetLinks.php
│   │   └── AppleAppSiteAssociation.php
│   └── Debug/
│       └── Route.php
│
├── Helper/
│   └── Config.php
│
├── Model/
│   ├── Canonical/
│   │   ├── CanonicalResolver.php
│   │   ├── ProductCanonicalResolver.php
│   │   ├── CategoryCanonicalResolver.php
│   │   ├── CmsCanonicalResolver.php
│   │   └── SearchCanonicalResolver.php
│   │
│   ├── Route/
│   │   ├── RouteType.php
│   │   ├── RoutePayload.php
│   │   ├── RoutePayloadBuilder.php
│   │   ├── ProductRoutePayloadBuilder.php
│   │   ├── CategoryRoutePayloadBuilder.php
│   │   ├── CmsRoutePayloadBuilder.php
│   │   ├── SearchRoutePayloadBuilder.php
│   │   ├── CartRoutePayloadBuilder.php
│   │   ├── CheckoutRoutePayloadBuilder.php
│   │   └── CustomerRoutePayloadBuilder.php
│   │
│   ├── JsonLd/
│   │   ├── ProductJsonLdBuilder.php
│   │   ├── BreadcrumbJsonLdBuilder.php
│   │   ├── OrganizationJsonLdBuilder.php
│   │   └── CategoryItemListJsonLdBuilder.php
│   │
│   ├── AppLinks/
│   │   ├── AssetLinksBuilder.php
│   │   └── AppleAppSiteAssociationBuilder.php
│   │
│   └── Robots/
│       └── RobotsResolver.php
│
├── Plugin/
│   ├── PageConfigCanonicalPlugin.php
│   ├── PageConfigRobotsPlugin.php
│   └── PageConfigOpenGraphPlugin.php
│
├── ViewModel/
│   ├── RouteMetaViewModel.php
│   ├── JsonLdViewModel.php
│   ├── OpenGraphViewModel.php
│   └── AppBannerViewModel.php
│
└── view/
    └── frontend/
        ├── layout/
        │   ├── default.xml
        │   ├── catalog_product_view.xml
        │   ├── catalog_category_view.xml
        │   ├── cms_page_view.xml
        │   ├── cms_index_index.xml
        │   ├── catalogsearch_result_index.xml
        │   ├── checkout_cart_index.xml
        │   ├── checkout_index_index.xml
        │   └── customer_account_index.xml
        │
        ├── templates/
        │   ├── head/
        │   │   ├── route_meta.phtml
        │   │   └── jsonld.phtml
        │   └── app/
        │       └── banner.phtml
        │
        └── web/
            ├── css/
            │   └── bridge.css
            └── js/
                └── app-bridge.js
```

## Interfaces

### Api/CanonicalResolverInterface.php

```php
<?php
namespace NativeMind\Bridge\Api;

interface CanonicalResolverInterface
{
    /**
     * Resolve canonical URL for current page
     *
     * @return string|null Canonical URL or null if not applicable
     */
    public function resolve(): ?string;

    /**
     * Check if this resolver handles current page type
     *
     * @return bool
     */
    public function canResolve(): bool;
}
```

### Api/RoutePayloadBuilderInterface.php

```php
<?php
namespace NativeMind\Bridge\Api;

use NativeMind\Bridge\Model\Route\RoutePayload;

interface RoutePayloadBuilderInterface
{
    /**
     * Build route payload for current page
     *
     * @return RoutePayload|null
     */
    public function build(): ?RoutePayload;

    /**
     * Check if this builder handles current page type
     *
     * @return bool
     */
    public function canBuild(): bool;

    /**
     * Get route type this builder handles
     *
     * @return string
     */
    public function getRouteType(): string;
}
```

### Api/JsonLdBuilderInterface.php

```php
<?php
namespace NativeMind\Bridge\Api;

interface JsonLdBuilderInterface
{
    /**
     * Build JSON-LD structured data array
     *
     * @return array|null JSON-LD data or null if not applicable
     */
    public function build(): ?array;

    /**
     * Check if this builder handles current page type
     *
     * @return bool
     */
    public function canBuild(): bool;
}
```

## Data Models

### Model/Route/RouteType.php

```php
<?php
namespace NativeMind\Bridge\Model\Route;

class RouteType
{
    public const PRODUCT = 'product';
    public const CATEGORY = 'category';
    public const CMS = 'cms';
    public const SEARCH = 'search';
    public const CART = 'cart';
    public const CHECKOUT = 'checkout';
    public const CUSTOMER = 'customer';
    public const HOME = 'home';
    public const UNKNOWN = 'unknown';
}
```

### Model/Route/RoutePayload.php

```php
<?php
namespace NativeMind\Bridge\Model\Route;

class RoutePayload
{
    public const STANDARD_VERSION = 'flutter_magento_v1';

    private string $type;
    private string $canonicalUrl;
    private string $webPath;
    private string $appRoute;
    private array $entity;
    private array $store;

    public function __construct(
        string $type,
        string $canonicalUrl,
        string $webPath,
        string $appRoute,
        array $entity = [],
        array $store = []
    ) {
        $this->type = $type;
        $this->canonicalUrl = $canonicalUrl;
        $this->webPath = $webPath;
        $this->appRoute = $appRoute;
        $this->entity = $entity;
        $this->store = $store;
    }

    public function toArray(): array
    {
        return [
            'standard' => self::STANDARD_VERSION,
            'type' => $this->type,
            'canonicalUrl' => $this->canonicalUrl,
            'webPath' => $this->webPath,
            'appRoute' => $this->appRoute,
            'entity' => $this->entity,
            'store' => $this->store,
        ];
    }

    public function toJson(): string
    {
        return json_encode($this->toArray(), JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
    }
}
```

## Behavior Specifications

### Route Metadata Output

#### Happy Path - Product Page

1. User visits `/driven-backpack.html`
2. Layout `catalog_product_view.xml` activates RouteMeta block
3. ProductRoutePayloadBuilder detects product context from registry
4. RoutePayload is built with product data
5. Template outputs JSON script block

**Output**:
```html
<script type="application/json" id="flutter-magento-route">
{
  "standard": "flutter_magento_v1",
  "type": "product",
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
</script>
```

#### Happy Path - Category Page

**Output**:
```html
<script type="application/json" id="flutter-magento-route">
{
  "standard": "flutter_magento_v1",
  "type": "category",
  "canonicalUrl": "https://shop.com/women/bags.html",
  "webPath": "/women/bags.html",
  "appRoute": "/category/42",
  "entity": {
    "id": 42,
    "urlKey": "bags",
    "urlPath": "women/bags"
  },
  "store": {...}
}
</script>
```

#### Happy Path - Search Page

**Output**:
```html
<script type="application/json" id="flutter-magento-route">
{
  "standard": "flutter_magento_v1",
  "type": "search",
  "canonicalUrl": "https://shop.com/catalogsearch/result/?q=backpack",
  "webPath": "/catalogsearch/result/",
  "appRoute": "/search?q=backpack",
  "entity": {
    "query": "backpack"
  },
  "store": {...}
}
</script>
```

### Canonical URL Resolution

| Page Type | Input URL | Canonical Output |
|-----------|-----------|------------------|
| Product (short mode) | `/women/bags/driven-backpack.html` | `/driven-backpack.html` |
| Product (Magento default) | `/women/bags/driven-backpack.html` | `/women/bags/driven-backpack.html` |
| Category (base) | `/women/bags.html` | `/women/bags.html` |
| Category (filtered) | `/women/bags.html?color=red` | `/women/bags.html` |
| Search | `/catalogsearch/result/?q=test` | (no canonical, robots noindex) |
| CMS | `/about-us` | `/about-us` |

### Robots Meta Resolution

| Page Type | Condition | Robots Output |
|-----------|-----------|---------------|
| Product | Always | `index,follow` |
| Category (base) | No filters | `index,follow` |
| Category (filtered) | Has filters | `noindex,follow` |
| Search | Always | `noindex,follow` |
| Cart | Always | `noindex,nofollow` |
| Checkout | Always | `noindex,nofollow` |
| Customer | Always | `noindex,nofollow` |

### App Links Endpoints

#### /.well-known/assetlinks.json

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "net.nativemind.flutter_magento",
      "sha256_cert_fingerprints": ["AA:BB:CC:..."]
    }
  }
]
```

**Response**: `Content-Type: application/json`

#### /.well-known/apple-app-site-association

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appIDs": ["TEAMID.net.nativemind.flutterMagento"],
        "components": [
          {"/": "/*", "comment": "Open all URLs in app"}
        ]
      }
    ]
  }
}
```

**Response**: `Content-Type: application/json`

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Module disabled | `enabled = 0` in config | No blocks render, no metadata output |
| Route metadata disabled | `route/enabled = 0` | No route JSON block output |
| JSON-LD disabled | `jsonld/enabled = 0` | No JSON-LD block output |
| App banner disabled | `app_banner/enabled = 0` | No banner HTML output |
| Unknown page type | Custom controller action | RouteType::UNKNOWN, minimal metadata |
| Configurable product | Child product URL | Redirect/canonical to parent |
| Multi-store | Different store view | Correct storeCode/locale in payload |
| UTM parameters | `?utm_source=google` | Strip from canonical URL |
| Missing product | 404 page | No route metadata output |

### Error Handling

| Error | Cause | Response |
|-------|-------|----------|
| Missing registry product | Product block on non-product page | Return null, skip block |
| Invalid config | Missing App Links config | Return empty/default values |
| JSON encode failure | Invalid UTF-8 in data | Sanitize or skip field |
| Plugin exception | PageConfig error | Log error, continue rendering |

## Admin Configuration

### Config Structure

```
nativemind_Bridge/
├── general/
│   ├── enabled (bool)
│   └── debug_mode (bool)
│
├── route/
│   ├── enabled (bool)
│   ├── standard_version (string: flutter_magento_v1)
│   ├── product_app_route (string: /product/{sku})
│   ├── category_app_route (string: /category/{id})
│   ├── cms_app_route (string: /page/{identifier})
│   └── search_app_route (string: /search?q={query})
│
├── canonical/
│   ├── enabled (bool)
│   ├── product_mode (select: magento_default|shortest|category_path)
│   ├── category_filtered_mode (select: base_noindex|filtered_index|magento_default)
│   ├── strip_utm (bool)
│   └── strip_tracking (bool)
│
├── robots/
│   ├── search_robots (select: noindex_follow|index_follow)
│   ├── filtered_category_robots (select: noindex_follow|index_follow)
│   ├── cart_robots (string: noindex,nofollow)
│   ├── checkout_robots (string: noindex,nofollow)
│   └── customer_robots (string: noindex,nofollow)
│
├── jsonld/
│   ├── enabled (bool)
│   ├── mode (select: disabled|append|replace)
│   ├── product_enabled (bool)
│   ├── breadcrumb_enabled (bool)
│   ├── organization_enabled (bool)
│   └── category_itemlist_enabled (bool)
│
├── opengraph/
│   ├── enabled (bool)
│   ├── mode (select: disabled|append|override)
│   ├── default_image (image)
│   └── twitter_card_type (select: summary|summary_large_image)
│
├── app_links/
│   ├── android_enabled (bool)
│   ├── android_package_name (string)
│   ├── android_sha256_fingerprints (textarea)
│   ├── android_playstore_url (string)
│   ├── ios_enabled (bool)
│   ├── ios_team_id (string)
│   ├── ios_bundle_id (string)
│   └── ios_appstore_url (string)
│
└── app_banner/
    ├── enabled (bool)
    ├── title (string: "Open in App")
    ├── subtitle (string: "Better experience")
    ├── open_button_text (string: "Open")
    ├── install_button_text (string: "Install")
    ├── show_on_product (bool)
    ├── show_on_category (bool)
    ├── show_on_home (bool)
    └── dismiss_cookie_days (int: 7)
```

## Layout XML Injection Strategy

### default.xml (all pages)

```xml
<page>
    <body>
        <!-- App Banner at top of body -->
        <referenceContainer name="after.body.start">
            <block class="NativeMind\Bridge\Block\App\Banner"
                   name="nativemind.Bridge.app.banner"
                   template="NativeMind_Bridge::app/banner.phtml"
                   ifconfig="nativemind_Bridge/app_banner/enabled"/>
        </referenceContainer>

        <!-- Route metadata at end of body -->
        <referenceContainer name="before.body.end">
            <block class="NativeMind\Bridge\Block\Head\RouteMeta"
                   name="nativemind.Bridge.route.meta"
                   template="NativeMind_Bridge::head/route_meta.phtml"
                   ifconfig="nativemind_Bridge/route/enabled"/>
        </referenceContainer>
    </body>
</page>
```

### catalog_product_view.xml

```xml
<page>
    <body>
        <referenceContainer name="before.body.end">
            <block class="NativeMind\Bridge\Block\Head\JsonLd"
                   name="nativemind.Bridge.product.jsonld"
                   template="NativeMind_Bridge::head/jsonld.phtml"
                   ifconfig="nativemind_Bridge/jsonld/product_enabled">
                <arguments>
                    <argument name="builder_type" xsi:type="string">product</argument>
                </arguments>
            </block>
        </referenceContainer>
    </body>
</page>
```

## Plugin Strategy

### PageConfigCanonicalPlugin

**Target**: `Magento\Framework\View\Page\Config::addRemotePageAsset` or custom event

**Behavior**:
1. Check if canonical is enabled in config
2. Get appropriate CanonicalResolver based on page type
3. Resolve canonical URL
4. Set via `$pageConfig->addRemotePageAsset()` with `rel="canonical"`

### PageConfigRobotsPlugin

**Target**: `Magento\Framework\View\Page\Config::setRobots`

**Behavior**:
1. Intercept after setRobots
2. Check current page type
3. Override robots based on config rules (cart/checkout/filtered category)

## FPC (Full Page Cache) Compatibility

### Cache-Safe Blocks

All blocks must be cacheable:

```xml
<block cacheable="true" ...>
```

### No Private Data

Blocks must NOT output:
- Customer-specific data
- Session data
- Cart contents
- Tokens

### Cache Tags

Blocks should declare cache tags:

```php
public function getIdentities()
{
    return ['nativemind_Bridge_route'];
}
```

### ESI Considerations

App banner with user-specific state (dismissed) should use:
- Cookie-based dismissal (client-side JS)
- NOT server-side session

## Testing Strategy

### Unit Tests

- [ ] `CanonicalResolver` - URL normalization logic
- [ ] `ProductRoutePayloadBuilder` - payload structure
- [ ] `CategoryRoutePayloadBuilder` - payload structure
- [ ] `CmsRoutePayloadBuilder` - payload structure
- [ ] `SearchRoutePayloadBuilder` - query extraction
- [ ] `RobotsResolver` - robots meta logic
- [ ] `AssetLinksBuilder` - JSON structure
- [ ] `AppleAppSiteAssociationBuilder` - JSON structure
- [ ] `RoutePayload` - JSON serialization
- [ ] `Config` helper - config reading

### Integration Tests

- [ ] Product page contains route metadata script
- [ ] Category page contains canonical link
- [ ] Search page has noindex robots
- [ ] Cart page has noindex,nofollow robots
- [ ] App Links endpoints return valid JSON
- [ ] Debug endpoint returns route mapping
- [ ] Disabled config prevents output

### Manual Verification

- [ ] Install on Luma theme - verify no visual changes
- [ ] Install on Blank theme - verify no visual changes
- [ ] Check `view-source:` for route metadata
- [ ] Validate JSON-LD with Google Rich Results Test
- [ ] Validate App Links with Android/iOS validators
- [ ] Test banner dismiss functionality

## Migration from FlutterTheme

### Files to Delete

```
Block/Root.php
Block/Fallback/Product.php
Block/Fallback/Category.php
Helper/Data.php
Helper/DataInterface.php
view/frontend/templates/root.phtml
view/frontend/templates/fallback/product.phtml
view/frontend/templates/fallback/category.phtml
view/frontend/templates/fallback/page.phtml
view/frontend/web/js/flutter-loader.js
view/frontend/web/flutter/.gitkeep
view/frontend/web/css/fallback.css
view/frontend/web/css/vishakha-devi-*.css
```

### Files to Rename/Modify

```
registration.php: FlutterTheme → Bridge
composer.json: package name, description
etc/module.xml: module name
etc/config.xml: complete replacement
etc/adminhtml/system.xml: complete replacement
etc/di.xml: update preferences
etc/acl.xml: update resource names
```

## Open Design Questions

- [x] Where to place route metadata JSON? **Answer**: `before.body.end` container
- [x] How to handle JSON-LD conflicts with theme? **Answer**: Config mode (disabled/append/replace)
- [x] Plugin vs Observer for canonical? **Answer**: Plugin on PageConfig for reliability

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
- [x] Notes: Approved as drafted
