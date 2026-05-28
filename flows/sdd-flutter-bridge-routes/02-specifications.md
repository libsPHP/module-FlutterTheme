# Specifications: BridgeRoutes

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

BridgeRoutes outputs the `flutter_magento_v1` route metadata JSON on every supported page. This enables Flutter apps and Flutter Web to know the app route corresponding to the current Magento page.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `NativeMind_BridgeRoutes` | Create | New module |
| Frontend Layout | Modify | Inject block to body end |
| Admin Config | Create | Routes section |

## Architecture

### Module Structure

```text
NativeMind_BridgeRoutes/
├── registration.php
├── composer.json
├── etc/
│   ├── module.xml
│   ├── config.xml
│   ├── di.xml
│   └── adminhtml/
│       └── system.xml
├── Helper/
│   └── Config.php
├── Model/
│   └── Route/
│       ├── RouteType.php
│       └── RoutePayload.php
├── Block/
│   └── RouteMeta.php
└── view/
    └── frontend/
        ├── layout/
        │   └── default.xml
        └── templates/
            └── route_meta.phtml
```

### Data Flow

```text
Page Request
    │
    ▼
RouteMeta Block
    │
    ├─► Detect page type (fullActionName)
    │
    ├─► Get entity data (product/category/cms from registry)
    │
    ├─► Build RoutePayload
    │   - type, canonical, webPath, appRoute, params, store
    │
    └─► Output JSON in template

<script type="application/json" id="flutter-magento-route">
{...}
</script>
```

## Interfaces

### Helper\Config

```php
<?php
namespace NativeMind\BridgeRoutes\Helper;

class Config extends \Magento\Framework\App\Helper\AbstractHelper
{
    public function isRouteEnabled(?int $storeId = null): bool;
    public function getRouteStandardVersion(?int $storeId = null): string;
    public function getProductAppRoute(?int $storeId = null): string;
    public function getCategoryAppRoute(?int $storeId = null): string;
    public function getCmsAppRoute(?int $storeId = null): string;
    public function getSearchAppRoute(?int $storeId = null): string;
    public function getCartAppRoute(?int $storeId = null): string;
    public function getCheckoutAppRoute(?int $storeId = null): string;
    public function getCustomerAppRoute(?int $storeId = null): string;
    public function getHomeAppRoute(?int $storeId = null): string;
}
```

### Model\Route\RouteType

```php
<?php
namespace NativeMind\BridgeRoutes\Model\Route;

class RouteType
{
    public const PRODUCT = 'product';
    public const CATEGORY = 'category';
    public const CMS = 'cms';
    public const HOME = 'home';
    public const SEARCH = 'search';
    public const CART = 'cart';
    public const CHECKOUT = 'checkout';
    public const CUSTOMER = 'customer';
    public const UNKNOWN = 'unknown';
}
```

### Model\Route\RoutePayload

```php
<?php
namespace NativeMind\BridgeRoutes\Model\Route;

class RoutePayload
{
    private string $standard;
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
        array $store = [],
        string $standard = 'flutter_magento_v1'
    );

    public function toArray(): array;
    public function toJson(): string;
}
```

## Data Models

### Route Payload JSON Schema

```json
{
  "standard": "flutter_magento_v1",
  "type": "product|category|cms|home|search|cart|checkout|customer",
  "canonicalUrl": "https://store.com/full-url",
  "webPath": "/url-path",
  "appRoute": "/product/{sku}",
  "entity": {
    "id": 123,
    "sku": "ABC123",
    "urlKey": "product-name"
  },
  "store": {
    "websiteCode": "base",
    "storeCode": "default",
    "currency": "USD",
    "locale": "en_US"
  }
}
```

### Config Paths

| Path | Type | Default |
|------|------|---------|
| `nativemind_Bridge/route/enabled` | bool | 1 |
| `nativemind_Bridge/route/standard_version` | string | flutter_magento_v1 |
| `nativemind_Bridge/route/product_app_route` | string | /product/{sku} |
| `nativemind_Bridge/route/category_app_route` | string | /category/{id} |
| `nativemind_Bridge/route/cms_app_route` | string | /page/{identifier} |
| `nativemind_Bridge/route/search_app_route` | string | /search?q={query} |
| `nativemind_Bridge/route/cart_app_route` | string | /cart |
| `nativemind_Bridge/route/checkout_app_route` | string | /checkout |
| `nativemind_Bridge/route/customer_app_route` | string | /account |
| `nativemind_Bridge/route/home_app_route` | string | / |

## Behavior Specifications

### Route Detection Mapping

| Magento Action | Route Type |
|----------------|------------|
| `catalog_product_view` | product |
| `catalog_category_view` | category |
| `cms_page_view` | cms |
| `cms_index_index` | home |
| `catalogsearch_result_index` | search |
| `catalogsearch_advanced_result` | search |
| `checkout_cart_index` | cart |
| `checkout_index_index` | checkout |
| `checkout_onepage_index` | checkout |
| `customer_account_*` | customer |
| (other) | unknown |

### Placeholder Substitution

| Placeholder | Replaced With |
|-------------|---------------|
| `{id}` | Entity ID |
| `{sku}` | Product SKU |
| `{urlKey}` | URL key |
| `{urlPath}` | Category URL path |
| `{identifier}` | CMS page identifier |
| `{query}` | Search query (URL encoded) |

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Core disabled | `Core::isEnabled() = false` | No output |
| Routes disabled | `route/enabled = 0` | No output |
| Unknown page type | Unmapped action | Output with type="unknown" |
| Missing entity | Product deleted mid-request | No output |

## Dependencies

### Requires

- `NativeMind_BridgeCore` (enabled check)
- `Magento_Catalog` (product/category registry)
- `Magento_Cms` (cms page registry)
- `Magento_Store` (store context)

### Blocks

- `NativeMind_BridgeFlutterWeb` (uses route payload)

## Layout Specification

### default.xml

```xml
<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <body>
        <referenceContainer name="before.body.end">
            <block class="NativeMind\BridgeRoutes\Block\RouteMeta"
                   name="nativemind.Bridge.route.meta"
                   template="NativeMind_BridgeRoutes::route_meta.phtml"
                   cacheable="true"/>
        </referenceContainer>
    </body>
</page>
```

### Template Output

```html
<?php if ($block->isEnabled() && $block->hasRoutePayload()): ?>
<script type="application/json" id="flutter-magento-route">
<?= /* @noEscape */ $block->getRoutePayloadJson() ?>
</script>
<?php endif; ?>
```

## Testing Strategy

### Unit Tests

- [ ] RoutePayload::toArray() returns correct structure
- [ ] RoutePayload::toJson() returns valid JSON
- [ ] RouteType constants match expected values
- [ ] Config helper returns correct route patterns
- [ ] Placeholder substitution works correctly

### Integration Tests

- [ ] Product page outputs correct route payload
- [ ] Category page outputs correct route payload
- [ ] CMS page outputs correct route payload
- [ ] Block respects Core enabled flag

### Manual Verification

- [ ] View source shows JSON script block
- [ ] JSON is valid and parseable
- [ ] App route patterns match Flutter app routes

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
