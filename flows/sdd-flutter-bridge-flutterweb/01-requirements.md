# Requirements: BridgeFlutterWeb

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

Stores want to progressively enhance their Magento pages with Flutter Web. The approach is **NOT** to replace Magento HTML, but to overlay Flutter Web on top of it. Search engines and no-JS users see standard Magento HTML, while JS-enabled browsers get Flutter Web enhancement. This is progressive enhancement, not dynamic rendering.

## Core Principle

**Same HTML for everyone. JS enhances, doesn't replace.**

```text
Magento PHP → HTML response → Everyone gets this
                            ↓
                        [JS enabled?]
                      Yes ↓         ↓ No
                 Flutter Web     Magento HTML
                  overlays       stays visible
```

## User Stories

### Primary

**As a** store owner
**I want** Flutter Web to enhance my Magento pages
**So that** users get a rich app-like experience while keeping SEO

**As a** search engine bot
**I want** to see standard Magento HTML
**So that** I can index product content correctly

**As a** mobile user
**I want** Flutter Web to load quickly
**So that** I get a smooth experience without waiting

### Secondary

**As a** developer
**I want** to configure Flutter assets URL separately
**So that** I can serve Flutter builds from CDN

**As a** store owner
**I want** graceful degradation if Flutter fails
**So that** users still see the Magento fallback

## Acceptance Criteria

### Must Have

1. **Given** FlutterWeb is enabled
   **When** page loads with JS enabled
   **Then** Flutter bootstrap script is injected

2. **Given** Flutter Web finishes loading
   **When** first frame renders
   **Then** Magento HTML is hidden (not removed)

3. **Given** Flutter Web fails to load
   **When** error or timeout occurs
   **Then** Magento HTML remains visible (graceful degradation)

4. **Given** route payload exists (from Routes module)
   **When** Flutter starts
   **Then** Flutter receives route info via `window.flutterMagentoRoute`

5. **Given** user has JS disabled
   **When** page loads
   **Then** standard Magento HTML is visible

6. **Given** search engine crawls page
   **When** HTML is returned
   **Then** same HTML as JS-enabled users (no bot detection)

### Should Have

- Configurable load trigger (immediate, after DOMContentLoaded, after idle)
- Loading indicator while Flutter loads
- Error fallback with retry option
- Service Worker configuration path

### Won't Have (This Iteration)

- Bot/crawler detection (explicitly prohibited)
- Different HTML for bots vs users
- Flutter build hosting (external responsibility)
- SSR simulation

## Explicit Prohibitions

```text
NEVER:
- Detect Googlebot/YandexBot/BingBot for different HTML
- Serve bot-only HTML
- Use User-Agent based rendering
- Remove Magento HTML elements (only hide)
```

## Constraints

- **Dependencies**:
  - Requires `NativeMind_BridgeCore`
  - Recommends `NativeMind_BridgeRoutes` for route handoff
- **Flutter builds external**: Module does NOT store Flutter assets
- **Same HTML for all**: Progressive enhancement only

## Config Scope

```text
nativemind_Bridge/flutter_web/
  - enabled
  - assets_base_url (e.g., https://cdn.example.com/flutter/)
  - flutter_js_url (default: {assets_base_url}/flutter.js)
  - main_dart_js_url (default: {assets_base_url}/main.dart.js)
  - asset_manifest_url (default: {assets_base_url}/assets/AssetManifest.json)
  - service_worker_enabled
  - service_worker_url (default: {assets_base_url}/flutter_service_worker.js)
  - renderer (auto|html|canvaskit)
  - target_container_id (default: flutter-container)
  - load_trigger (immediate|domready|idle|interaction)
  - load_timeout_ms (default: 10000)
  - hide_magento_after (flutter_ready|timeout|never)
  - show_loading_indicator
  - fallback_on_error (keep_magento|show_error|disable_flutter)
  - debug_mode
```

## Progressive Enhancement Flow

```text
1. Magento renders full HTML (products, content, etc.)
   ↓
2. HTML delivered to ALL clients (bots, no-JS, JS-enabled)
   ↓
3. JS checks:
   - Is FlutterWeb enabled?
   - Is route payload available?
   - Should we load now? (trigger check)
   ↓
4. Flutter bootstrap loads:
   - flutter.js
   - main.dart.js
   - Assets
   ↓
5. Flutter engine initializes:
   - Reads window.flutterMagentoRoute
   - Navigates to correct screen
   ↓
6. On first frame rendered:
   - Add class to hide Magento container
   - Flutter overlay becomes visible
   ↓
7. On Flutter error/timeout:
   - Remove loading indicator
   - Keep Magento visible
   - Optionally show error banner
```

## Target Container Architecture

```html
<!-- Magento page content (always rendered) -->
<main id="maincontent" class="...">
  <!-- Product info, etc -->
</main>

<!-- Flutter container (starts empty/hidden) -->
<div id="flutter-container"
     class="nm-Bridge-flutter"
     style="display:none;">
</div>

<!-- Flutter loader script -->
<script src="flutter.js" defer></script>
<script>
  // Initialize Flutter with route handoff
</script>

<!-- CSS hides Magento when .flutter-ready class added to body -->
<style>
  body.flutter-ready #maincontent { display: none; }
  body.flutter-ready #flutter-container { display: block; }
</style>
```

## Route Handoff

```javascript
// Set by Routes module
window.flutterMagentoRoute = {
  standard: "flutter_magento_v1",
  type: "product",
  appRoute: "/product/SKU123",
  params: { id: 123, sku: "SKU123" },
  // ...
};

// Flutter reads on startup
// Flutter navigates to appRoute
```

## SEO Safety

```text
Critical rule: Content parity

Magento HTML shows: Product A, $100, In Stock
Flutter displays:   Product A, $100, In Stock

Both must show same primary content.
Flutter can enhance UI but not change facts.
```

## Open Questions

- [x] Where to inject Flutter container? → After `#maincontent`, configurable
- [x] How to handle navigation in Flutter? → Flutter takes over, history API
- [ ] Back button behavior after Flutter loads? → Needs spec

## References

- Google's Progressive Enhancement guidelines
- Flutter Web deployment docs
- Original: New module, not in monolith

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
