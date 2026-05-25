# Requirements: FlutterBridgeRoutes

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

Flutter mobile apps and Flutter Web need to know how to map Magento page URLs to app routes. This module provides the `flutter_magento_v1` route metadata standard - a JSON payload embedded in every page that tells Flutter which app screen corresponds to the current Magento page.

## User Stories

### Primary

**As a** Flutter app developer
**I want** route metadata embedded in Magento pages
**So that** my app can deep-link and intercept URLs correctly

**As a** Flutter Web developer
**I want** route payload available on page load
**So that** Flutter Web can initialize with the correct route

### Secondary

**As a** store admin
**I want** to customize app route patterns per page type
**So that** routes match my Flutter app's routing structure

## Acceptance Criteria

### Must Have

1. **Given** FlutterBridgeRoutes is enabled
   **When** any supported page loads (product/category/cms/search/cart/checkout/home)
   **Then** a `<script type="application/json" id="flutter-magento-route">` block is injected

2. **Given** a product page loads
   **When** routes are enabled
   **Then** JSON payload contains:
   ```json
   {
     "standard": "flutter_magento_v1",
     "type": "product",
     "canonicalUrl": "https://store.com/product-url",
     "webPath": "/product-url",
     "appRoute": "/product/{sku}",
     "entity": { "id": 123, "sku": "ABC123", "urlKey": "product-url" },
     "store": { "websiteCode": "...", "storeCode": "...", "currency": "...", "locale": "..." }
   }
   ```

3. **Given** admin configures route patterns
   **When** page renders
   **Then** appRoute uses configured pattern with placeholder substitution

4. **Given** FlutterBridgeCore is disabled
   **When** Routes module checks
   **Then** route metadata is not output

### Should Have

- Configurable route patterns for each page type
- Support for custom page types via events

### Won't Have (This Iteration)

- Canonical URL resolution (that's SEO module)
- Robots meta (that's SEO module)
- JSON-LD structured data (that's SEO module)

## Constraints

- **Dependencies**: Requires `NativeMind_FlutterBridgeCore`
- **Output location**: `before.body.end` container via layout XML
- **Cache**: Block must be FPC-compatible (`cacheable="true"`)

## Config Scope

```text
nativemind_flutterbridge/route/
  - enabled (yes/no)
  - standard_version (default: flutter_magento_v1)
  - product_app_route (default: /product/{sku})
  - category_app_route (default: /category/{id})
  - cms_app_route (default: /page/{identifier})
  - search_app_route (default: /search?q={query})
  - cart_app_route (default: /cart)
  - checkout_app_route (default: /checkout)
  - customer_app_route (default: /account)
  - home_app_route (default: /)
```

## Route Types Supported

```text
product - catalog_product_view
category - catalog_category_view
cms - cms_page_view
home - cms_index_index
search - catalogsearch_result_index, catalogsearch_advanced_result
cart - checkout_cart_index
checkout - checkout_index_index, checkout_onepage_index
customer - customer_account_*
unknown - fallback for unmapped pages
```

## Open Questions

- [x] Should route output be in head or body? → Body (`before.body.end`)
- [x] JSON or script tag? → `<script type="application/json">` for safe parsing

## References

- flutter_magento_v1 standard (internal spec)
- Original: `Block/Head/RouteMeta.php`

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
