# Specifications: BridgeSeo

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

BridgeSeo provides theme-agnostic SEO enhancements: canonical URL normalization, robots meta directives, JSON-LD structured data, and OpenGraph meta tags. All via layout XML injection without template overrides.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `NativeMind_BridgeSeo` | Create | New module |
| Frontend Layout | Modify | Inject head/body blocks |
| Admin Config | Create | SEO sections |

## Architecture

### Module Structure

```text
NativeMind_BridgeSeo/
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
│   ├── Canonical/
│   │   └── CanonicalResolver.php
│   ├── Robots/
│   │   └── RobotsResolver.php
│   ├── JsonLd/
│   │   ├── ProductBuilder.php
│   │   ├── BreadcrumbBuilder.php
│   │   └── OrganizationBuilder.php
│   ├── OpenGraph/
│   │   └── MetaBuilder.php
│   └── Config/
│       └── Source/
│           ├── ProductCanonicalMode.php
│           ├── CategoryFilteredMode.php
│           └── TwitterCardType.php
├── Block/
│   ├── Canonical.php
│   ├── Robots.php
│   ├── JsonLd.php
│   └── OpenGraph.php
├── Plugin/
│   └── AddCanonicalPlugin.php (optional)
└── view/
    └── frontend/
        ├── layout/
        │   ├── default.xml
        │   └── catalog_product_view.xml
        └── templates/
            ├── jsonld.phtml
            └── opengraph.phtml
```

### Data Flow

```text
Page Request
    │
    ├─► CanonicalResolver
    │   └─► Determines canonical URL
    │
    ├─► RobotsResolver
    │   └─► Determines robots directive
    │
    ├─► JsonLd Builders
    │   └─► Build schema.org data
    │
    └─► OpenGraph Builder
        └─► Build og: meta tags
```

## Interfaces

### Model\Canonical\CanonicalResolver

```php
<?php
namespace NativeMind\BridgeSeo\Model\Canonical;

class CanonicalResolver
{
    public function resolve(): ?string;
    public function stripTrackingParams(string $url): string;
    public function hasActiveFilters(): bool;
}
```

### Model\Robots\RobotsResolver

```php
<?php
namespace NativeMind\BridgeSeo\Model\Robots;

class RobotsResolver
{
    public function resolve(): ?string;
    public function shouldNoIndex(): bool;
}
```

### Model\JsonLd\ProductBuilder

```php
<?php
namespace NativeMind\BridgeSeo\Model\JsonLd;

class ProductBuilder
{
    public function build(): ?array;
    public function toJson(): string;
}
```

## Data Models

### Product JSON-LD Schema

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Product Name",
  "description": "Short description",
  "sku": "SKU123",
  "url": "https://store.com/product",
  "image": "https://store.com/media/product.jpg",
  "brand": {
    "@type": "Brand",
    "name": "Brand Name"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://store.com/product",
    "priceCurrency": "USD",
    "price": "99.99",
    "availability": "https://schema.org/InStock",
    "itemCondition": "https://schema.org/NewCondition"
  }
}
```

### OpenGraph Meta Structure

```html
<meta property="og:type" content="product"/>
<meta property="og:title" content="Product Name"/>
<meta property="og:description" content="Description"/>
<meta property="og:url" content="https://store.com/product"/>
<meta property="og:image" content="https://store.com/media/product.jpg"/>
<meta property="product:price:amount" content="99.99"/>
<meta property="product:price:currency" content="USD"/>
<meta name="twitter:card" content="summary_large_image"/>
```

### Config Paths

| Path | Type | Default |
|------|------|---------|
| `nativemind_Bridge/canonical/enabled` | bool | 1 |
| `nativemind_Bridge/canonical/product_mode` | select | shortest |
| `nativemind_Bridge/canonical/category_filtered_mode` | select | base_noindex |
| `nativemind_Bridge/canonical/strip_utm` | bool | 1 |
| `nativemind_Bridge/canonical/strip_tracking` | bool | 1 |
| `nativemind_Bridge/robots/search_robots` | string | noindex,follow |
| `nativemind_Bridge/robots/filtered_category_robots` | string | noindex,follow |
| `nativemind_Bridge/robots/cart_robots` | string | noindex,nofollow |
| `nativemind_Bridge/robots/checkout_robots` | string | noindex,nofollow |
| `nativemind_Bridge/robots/customer_robots` | string | noindex,nofollow |
| `nativemind_Bridge/jsonld/enabled` | bool | 1 |
| `nativemind_Bridge/jsonld/product_enabled` | bool | 1 |
| `nativemind_Bridge/jsonld/breadcrumb_enabled` | bool | 1 |
| `nativemind_Bridge/opengraph/enabled` | bool | 1 |
| `nativemind_Bridge/opengraph/twitter_card_type` | select | summary_large_image |

## Behavior Specifications

### Canonical URL Resolution

| Page Type | Mode: shortest | Mode: category_path | Mode: magento_default |
|-----------|----------------|---------------------|----------------------|
| Product | `/product-name.html` | `/category/product-name.html` | Let Magento decide |
| Category | Base URL (no filters) | Current URL | Let Magento decide |
| CMS | `/{identifier}` | N/A | Let Magento decide |

### Tracking Parameter Stripping

Remove these params from canonical URLs:
- UTM: `utm_source`, `utm_medium`, `utm_campaign`, `utm_term`, `utm_content`
- Tracking: `gclid`, `fbclid`, `msclkid`, `dclid`, `mc_cid`, `mc_eid`, `ref`, `affiliate`, `partner`

### Robots Meta Rules

| Page Type | Default Directive |
|-----------|------------------|
| Search results | noindex,follow |
| Filtered category | noindex,follow |
| Cart | noindex,nofollow |
| Checkout | noindex,nofollow |
| Customer account | noindex,nofollow |
| Product/Category/CMS | index,follow (Magento default) |

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Missing product | Registry empty | Skip JSON-LD output |
| No image | Product has no image | Omit image field |
| Out of stock | Quantity = 0 | Use OutOfStock availability |
| Price = 0 | Free product | Include price: "0.00" |

## Dependencies

### Requires

- `NativeMind_BridgeCore` (enabled check)
- `Magento_Catalog` (product/category data)
- `Magento_Cms` (CMS page data)

### Does NOT Require

- `NativeMind_BridgeRoutes` (independent)

## Layout Specification

### catalog_product_view.xml

```xml
<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <body>
        <referenceContainer name="before.body.end">
            <block class="NativeMind\BridgeSeo\Block\JsonLd"
                   name="nativemind.Bridge.jsonld.product"
                   template="NativeMind_BridgeSeo::jsonld.phtml"
                   cacheable="true">
                <arguments>
                    <argument name="builder_type" xsi:type="string">product</argument>
                </arguments>
            </block>
        </referenceContainer>
    </body>
</page>
```

## Testing Strategy

### Unit Tests

- [ ] CanonicalResolver returns correct URLs
- [ ] Tracking params stripped correctly
- [ ] RobotsResolver returns correct directives
- [ ] ProductBuilder generates valid JSON-LD

### Integration Tests

- [ ] Product page has JSON-LD script
- [ ] OpenGraph meta tags present
- [ ] Canonical URL is correct

### Manual Verification

- [ ] Google Rich Results Test validates JSON-LD
- [ ] Facebook Debugger shows OG data
- [ ] View source confirms canonical tag

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
