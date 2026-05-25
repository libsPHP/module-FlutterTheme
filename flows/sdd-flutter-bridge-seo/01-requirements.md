# Requirements: FlutterBridgeSeo

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

Magento stores using Flutter need proper SEO handling: canonical URLs, robots meta, JSON-LD structured data, and OpenGraph meta. These SEO enhancements should be theme-agnostic and work on top of any Magento theme without replacing templates.

## User Stories

### Primary

**As a** store owner
**I want** proper canonical URLs on product pages
**So that** search engines don't penalize duplicate content from category paths

**As a** store owner
**I want** JSON-LD Product schema on product pages
**So that** Google shows rich snippets in search results

### Secondary

**As a** store owner
**I want** filtered category pages marked noindex
**So that** search engines don't index duplicate paginated/filtered content

**As a** marketing manager
**I want** OpenGraph meta tags on products
**So that** products look good when shared on social media

## Acceptance Criteria

### Must Have

1. **Given** canonical normalization is enabled
   **When** product page loads via category path
   **Then** canonical URL points to shortest product URL (without category)

2. **Given** JSON-LD is enabled for products
   **When** product page loads
   **Then** `<script type="application/ld+json">` contains valid Product schema

3. **Given** robots configuration is set
   **When** search/cart/checkout/customer pages load
   **Then** robots meta reflects configured noindex/nofollow values

4. **Given** UTM stripping is enabled
   **When** canonical resolver processes URL with UTM params
   **Then** canonical URL has UTM params removed

### Should Have

- OpenGraph product meta (og:title, og:image, og:price:amount)
- Twitter Card meta
- Category ItemList JSON-LD
- Breadcrumb JSON-LD

### Won't Have (This Iteration)

- Route metadata (that's Routes module)
- App Links (that's AppLinks module)
- Full theme replacement

## Constraints

- **Dependencies**: Requires `NativeMind_FlutterBridgeCore`
- **No template overrides**: Uses layout XML block injection only
- **Theme-agnostic**: Works with Luma, Blank, Hyva, custom themes
- **FPC-compatible**: All blocks cacheable

## Config Scope

```text
nativemind_flutterbridge/canonical/
  - enabled
  - product_mode (shortest|category_path|magento_default)
  - category_filtered_mode (base_noindex|current_noindex|allow_all)
  - strip_utm
  - strip_tracking

nativemind_flutterbridge/robots/
  - search_robots (noindex,follow)
  - filtered_category_robots
  - cart_robots
  - checkout_robots
  - customer_robots

nativemind_flutterbridge/jsonld/
  - enabled
  - mode (append|replace)
  - product_enabled
  - breadcrumb_enabled
  - organization_enabled
  - category_itemlist_enabled

nativemind_flutterbridge/opengraph/
  - enabled
  - mode (append|replace)
  - default_image
  - twitter_card_type
```

## SEO Features Breakdown

```text
Canonical URL Resolution:
  - Product: shortest URL without category path
  - Category: base URL without filters
  - CMS: identifier-based URL
  - Home: base store URL
  - Strip UTM/tracking params

Robots Meta:
  - Search: noindex,follow
  - Filtered categories: configurable
  - Cart/Checkout/Customer: noindex,nofollow

JSON-LD Schemas:
  - Product (with Offer, availability, brand)
  - BreadcrumbList
  - Organization
  - ItemList (category)

OpenGraph:
  - og:title, og:description, og:image
  - og:type (product)
  - og:price:amount, og:price:currency
  - Twitter cards
```

## Open Questions

- [x] Should SEO module depend on Routes? → No, independent
- [x] Replace or append existing meta? → Configurable per feature

## References

- Original: `Model/Canonical/*`, `Model/Robots/*`, `Model/JsonLd/*`
- Schema.org Product spec
- OpenGraph protocol

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
