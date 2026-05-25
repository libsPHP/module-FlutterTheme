# Specifications: FlutterBridgeFlutterWeb

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

FlutterBridgeFlutterWeb implements progressive enhancement by loading Flutter Web on top of Magento HTML. The same HTML is served to everyone (bots, no-JS users, JS-enabled users). JS-enabled browsers get Flutter Web overlay that hides Magento content only after Flutter is ready.

## Critical Design Principles

```text
1. SAME HTML FOR EVERYONE - No bot detection, no UA sniffing
2. PROGRESSIVE ENHANCEMENT - JS enhances, doesn't replace
3. GRACEFUL DEGRADATION - Flutter failure = Magento fallback
4. CONTENT PARITY - Flutter shows same content as Magento HTML
```

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `NativeMind_FlutterBridgeFlutterWeb` | Create | New module |
| Frontend Layout | Modify | Inject container and scripts |
| Admin Config | Create | Flutter Web section |

## Architecture

### Module Structure

```text
NativeMind_FlutterBridgeFlutterWeb/
├── registration.php
├── composer.json
├── etc/
│   ├── module.xml
│   ├── config.xml
│   └── adminhtml/
│       └── system.xml
├── Helper/
│   └── Config.php
├── Block/
│   ├── Container.php
│   └── Loader.php
└── view/
    └── frontend/
        ├── layout/
        │   └── default.xml
        ├── templates/
        │   ├── container.phtml
        │   └── loader.phtml
        └── web/
            ├── css/
            │   └── flutter.css
            └── js/
                └── flutter-loader.js
```

### Progressive Enhancement Flow

```text
┌─────────────────────────────────────────────────────────────┐
│                    MAGENTO SERVER                            │
│  Generates complete HTML (products, content, etc.)          │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                    SAME HTML TO ALL                          │
│  Search engines, no-JS users, JS-enabled users              │
│  All receive identical HTML response                        │
└─────────────────────────────────────────────────────────────┘
                            │
            ┌───────────────┼───────────────┐
            ▼               ▼               ▼
      ┌──────────┐   ┌──────────┐   ┌──────────────┐
      │  No JS   │   │   Bot    │   │  JS Enabled  │
      │  User    │   │  Crawler │   │    Browser   │
      └──────────┘   └──────────┘   └──────────────┘
            │               │               │
            ▼               ▼               ▼
      ┌──────────┐   ┌──────────┐   ┌──────────────┐
      │ See full │   │ Index    │   │ Flutter JS   │
      │ Magento  │   │ Magento  │   │ loads async  │
      │ HTML     │   │ content  │   └──────────────┘
      └──────────┘   └──────────┘           │
                                            ▼
                                    ┌──────────────┐
                                    │ Flutter Web  │
                                    │ initializes  │
                                    └──────────────┘
                                            │
                                    ┌───────┴───────┐
                                    ▼               ▼
                              ┌──────────┐   ┌──────────┐
                              │ Success  │   │ Failure  │
                              └──────────┘   └──────────┘
                                    │               │
                                    ▼               ▼
                              ┌──────────┐   ┌──────────┐
                              │ Hide     │   │ Keep     │
                              │ Magento  │   │ Magento  │
                              │ Show     │   │ visible  │
                              │ Flutter  │   └──────────┘
                              └──────────┘
```

## Interfaces

### Helper\Config

```php
<?php
namespace NativeMind\FlutterBridgeFlutterWeb\Helper;

class Config extends \Magento\Framework\App\Helper\AbstractHelper
{
    public function isFlutterWebEnabled(?int $storeId = null): bool;
    public function getAssetsBaseUrl(?int $storeId = null): string;
    public function getFlutterJsUrl(?int $storeId = null): string;
    public function getMainDartJsUrl(?int $storeId = null): string;
    public function isServiceWorkerEnabled(?int $storeId = null): bool;
    public function getServiceWorkerUrl(?int $storeId = null): string;
    public function getRenderer(?int $storeId = null): string;
    public function getTargetContainerId(?int $storeId = null): string;
    public function getLoadTrigger(?int $storeId = null): string;
    public function getLoadTimeoutMs(?int $storeId = null): int;
    public function getHideMagentoAfter(?int $storeId = null): string;
    public function showLoadingIndicator(?int $storeId = null): bool;
    public function getFallbackOnError(?int $storeId = null): string;
}
```

### Block\Container

```php
<?php
namespace NativeMind\FlutterBridgeFlutterWeb\Block;

use Magento\Framework\View\Element\Template;

class Container extends Template
{
    public function isEnabled(): bool;
    public function getContainerId(): string;
}
```

### Block\Loader

```php
<?php
namespace NativeMind\FlutterBridgeFlutterWeb\Block;

use Magento\Framework\View\Element\Template;

class Loader extends Template
{
    public function isEnabled(): bool;
    public function getFlutterConfig(): array;
    public function getFlutterConfigJson(): string;
}
```

## Data Models

### Flutter Configuration Object

```javascript
window.flutterBridgeConfig = {
    enabled: true,
    assetsBaseUrl: "https://cdn.example.com/flutter/",
    flutterJsUrl: "https://cdn.example.com/flutter/flutter.js",
    mainDartJsUrl: "https://cdn.example.com/flutter/main.dart.js",
    serviceWorker: {
        enabled: true,
        url: "https://cdn.example.com/flutter/flutter_service_worker.js"
    },
    renderer: "auto", // auto|html|canvaskit
    targetContainerId: "flutter-container",
    loadTrigger: "idle", // immediate|domready|idle|interaction
    loadTimeoutMs: 10000,
    hideMagentoAfter: "flutter_ready", // flutter_ready|timeout|never
    showLoadingIndicator: true,
    fallbackOnError: "keep_magento" // keep_magento|show_error|disable_flutter
};
```

### Route Handoff (from Routes module)

```javascript
// Set by FlutterBridgeRoutes module
window.flutterMagentoRoute = {
    standard: "flutter_magento_v1",
    type: "product",
    canonicalUrl: "https://store.com/product-url",
    webPath: "/product-url",
    appRoute: "/product/SKU123",
    entity: { id: 123, sku: "SKU123", urlKey: "product-url" },
    store: { websiteCode: "base", storeCode: "default", currency: "USD", locale: "en_US" }
};

// Flutter reads this on startup to navigate to correct screen
```

### Config Paths

| Path | Type | Default |
|------|------|---------|
| `nativemind_flutterbridge/flutter_web/enabled` | bool | 0 |
| `nativemind_flutterbridge/flutter_web/assets_base_url` | string | |
| `nativemind_flutterbridge/flutter_web/flutter_js_url` | string | {assets_base_url}/flutter.js |
| `nativemind_flutterbridge/flutter_web/main_dart_js_url` | string | {assets_base_url}/main.dart.js |
| `nativemind_flutterbridge/flutter_web/service_worker_enabled` | bool | 0 |
| `nativemind_flutterbridge/flutter_web/service_worker_url` | string | |
| `nativemind_flutterbridge/flutter_web/renderer` | select | auto |
| `nativemind_flutterbridge/flutter_web/target_container_id` | string | flutter-container |
| `nativemind_flutterbridge/flutter_web/load_trigger` | select | idle |
| `nativemind_flutterbridge/flutter_web/load_timeout_ms` | int | 10000 |
| `nativemind_flutterbridge/flutter_web/hide_magento_after` | select | flutter_ready |
| `nativemind_flutterbridge/flutter_web/show_loading_indicator` | bool | 1 |
| `nativemind_flutterbridge/flutter_web/fallback_on_error` | select | keep_magento |

## Behavior Specifications

### Load Trigger Options

| Trigger | When Flutter Loads | Use Case |
|---------|-------------------|----------|
| `immediate` | Script tag executes | Fastest Flutter start |
| `domready` | DOMContentLoaded event | After DOM parsed |
| `idle` | requestIdleCallback | After page is interactive |
| `interaction` | First user click/touch | Lazy load on demand |

### Hide Magento Options

| Option | When Magento Hidden | Use Case |
|--------|---------------------|----------|
| `flutter_ready` | First Flutter frame rendered | Smooth transition |
| `timeout` | After N ms regardless | Guaranteed takeover |
| `never` | Never hidden | Overlay/hybrid mode |

### Fallback Options

| Option | On Flutter Error | Use Case |
|--------|-----------------|----------|
| `keep_magento` | Keep Magento visible | Safe default |
| `show_error` | Show error banner | Debug/dev |
| `disable_flutter` | Set cookie to skip Flutter | Persistent fallback |

### JavaScript Loader Logic

```javascript
(function() {
    const config = window.flutterBridgeConfig;
    if (!config || !config.enabled) return;

    const route = window.flutterMagentoRoute;
    let flutterLoaded = false;
    let loadTimeout;

    function showFlutter() {
        if (flutterLoaded) return;
        flutterLoaded = true;
        clearTimeout(loadTimeout);
        document.body.classList.add('flutter-ready');
        if (config.showLoadingIndicator) {
            document.getElementById('flutter-loading')?.remove();
        }
    }

    function handleError(error) {
        console.error('[FlutterBridge]', error);
        clearTimeout(loadTimeout);
        switch (config.fallbackOnError) {
            case 'show_error':
                // Show error banner
                break;
            case 'disable_flutter':
                document.cookie = 'nm_flutterbridge_disabled=1; path=/; max-age=86400';
                break;
            case 'keep_magento':
            default:
                // Do nothing, Magento stays visible
        }
    }

    function loadFlutter() {
        // Check if disabled by previous error
        if (document.cookie.includes('nm_flutterbridge_disabled=1')) return;

        // Set timeout
        loadTimeout = setTimeout(() => {
            if (!flutterLoaded) {
                handleError(new Error('Flutter load timeout'));
            }
        }, config.loadTimeoutMs);

        // Load flutter.js
        const script = document.createElement('script');
        script.src = config.flutterJsUrl;
        script.onload = () => {
            _flutter.loader.loadEntrypoint({
                entrypointUrl: config.mainDartJsUrl,
                serviceWorker: config.serviceWorker.enabled ? {
                    serviceWorkerUrl: config.serviceWorker.url
                } : undefined,
                onEntrypointLoaded: async (engineInitializer) => {
                    const appRunner = await engineInitializer.initializeEngine({
                        renderer: config.renderer === 'auto' ? undefined : config.renderer
                    });
                    await appRunner.runApp();
                    showFlutter();
                }
            });
        };
        script.onerror = handleError;
        document.head.appendChild(script);
    }

    // Trigger based on config
    switch (config.loadTrigger) {
        case 'immediate':
            loadFlutter();
            break;
        case 'domready':
            if (document.readyState !== 'loading') loadFlutter();
            else document.addEventListener('DOMContentLoaded', loadFlutter);
            break;
        case 'idle':
            if ('requestIdleCallback' in window) {
                requestIdleCallback(loadFlutter);
            } else {
                setTimeout(loadFlutter, 100);
            }
            break;
        case 'interaction':
            document.addEventListener('click', loadFlutter, { once: true });
            document.addEventListener('touchstart', loadFlutter, { once: true });
            break;
    }
})();
```

### CSS for Transition

```css
/* Flutter container - initially hidden */
#flutter-container {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 10000;
    display: none;
}

/* When Flutter is ready, show container and hide Magento */
body.flutter-ready #flutter-container {
    display: block;
}

body.flutter-ready #maincontent,
body.flutter-ready .page-wrapper {
    visibility: hidden;
    height: 0;
    overflow: hidden;
}

/* Loading indicator */
#flutter-loading {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 10001;
}
```

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Core disabled | `Core::isEnabled() = false` | No Flutter scripts |
| FlutterWeb disabled | `flutter_web/enabled = 0` | No Flutter scripts |
| No assets URL | Empty config | No Flutter scripts |
| Routes module missing | No window.flutterMagentoRoute | Flutter starts at home |
| Flutter fails to load | Network error | Keep Magento visible |
| Flutter JS error | Runtime exception | Keep Magento visible |
| User has Flutter disabled | Cookie set | Skip Flutter entirely |

## Dependencies

### Requires

- `NativeMind_FlutterBridgeCore` (enabled check)

### Recommends

- `NativeMind_FlutterBridgeRoutes` (route handoff)

### Does NOT Require

- SEO, AppLinks, AppBanner modules

## Layout Specification

### default.xml

```xml
<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <head>
        <css src="NativeMind_FlutterBridgeFlutterWeb::css/flutter.css"/>
    </head>
    <body>
        <!-- Flutter container at end of body -->
        <referenceContainer name="before.body.end">
            <block class="NativeMind\FlutterBridgeFlutterWeb\Block\Container"
                   name="nativemind.flutterbridge.flutter.container"
                   template="NativeMind_FlutterBridgeFlutterWeb::container.phtml"
                   cacheable="true"/>
            <block class="NativeMind\FlutterBridgeFlutterWeb\Block\Loader"
                   name="nativemind.flutterbridge.flutter.loader"
                   template="NativeMind_FlutterBridgeFlutterWeb::loader.phtml"
                   cacheable="true"/>
        </referenceContainer>
    </body>
</page>
```

## Testing Strategy

### Unit Tests

- [ ] Config returns correct URLs
- [ ] Block generates valid config JSON
- [ ] URL placeholder substitution works

### Integration Tests

- [ ] Flutter container rendered when enabled
- [ ] Config JSON in page source
- [ ] CSS loaded correctly

### Manual Verification

- [ ] Flutter loads and renders
- [ ] Magento content hidden after Flutter ready
- [ ] Fallback works when Flutter fails
- [ ] Route handoff works with Routes module
- [ ] No bot detection (verify with curl)

### SEO Verification

- [ ] Same HTML for all user agents
- [ ] Google can index Magento content
- [ ] Mobile-friendly test passes

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
