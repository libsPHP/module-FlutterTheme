# Specifications: FlutterBridgeDebug

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

FlutterBridgeDebug provides debugging endpoints and console logging for FlutterBridge integration troubleshooting. All features gated behind Core's debug_mode setting.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `NativeMind_FlutterBridgeDebug` | Create | New module |
| Frontend Routes | Create | Debug endpoints |
| Frontend JS | Create | Console logging |

## Architecture

### Module Structure

```text
NativeMind_FlutterBridgeDebug/
├── registration.php
├── composer.json
├── etc/
│   ├── module.xml
│   ├── di.xml
│   └── frontend/
│       └── routes.xml
├── Helper/
│   └── DebugHelper.php
├── Controller/
│   └── Debug/
│       ├── Route.php
│       ├── Config.php
│       ├── Seo.php
│       └── AppLinks.php
├── Block/
│   └── ConsoleLogger.php
└── view/
    └── frontend/
        ├── layout/
        │   └── default.xml
        └── templates/
            └── console_logger.phtml
```

### Security Flow

```text
Request to /flutterbridge/debug/*
    │
    ▼
Controller checks Core::isDebugMode()
    │
    ├─► Debug ON → Return JSON data
    │
    └─► Debug OFF → Return 404
```

## Interfaces

### Helper\DebugHelper

```php
<?php
namespace NativeMind\FlutterBridgeDebug\Helper;

class DebugHelper
{
    public function isDebugAllowed(): bool;
    public function collectModuleStatus(): array;
    public function collectRouteData(): ?array;
    public function collectSeoData(): array;
    public function collectAppLinksData(): array;
}
```

### Controller\Debug\Route

```php
<?php
namespace NativeMind\FlutterBridgeDebug\Controller\Debug;

use Magento\Framework\App\Action\HttpGetActionInterface;

class Route implements HttpGetActionInterface
{
    public function execute(): ResultInterface;
}
```

## Data Models

### /flutterbridge/debug/config Response

```json
{
    "timestamp": "2026-05-25T10:30:00Z",
    "modules": {
        "core": {
            "installed": true,
            "enabled": true,
            "version": "2.0.0",
            "debug_mode": true
        },
        "routes": {
            "installed": true,
            "enabled": true,
            "standard": "flutter_magento_v1"
        },
        "seo": {
            "installed": true,
            "canonical_enabled": true,
            "jsonld_enabled": true,
            "opengraph_enabled": true
        },
        "applinks": {
            "installed": true,
            "android_enabled": true,
            "ios_enabled": false
        },
        "appbanner": {
            "installed": true,
            "enabled": false
        },
        "flutterweb": {
            "installed": true,
            "enabled": true,
            "assets_url": "https://cdn.example.com/flutter/"
        },
        "debug": {
            "installed": true
        }
    }
}
```

### /flutterbridge/debug/route Response

```json
{
    "page": {
        "fullActionName": "catalog_product_view",
        "routeType": "product"
    },
    "payload": {
        "standard": "flutter_magento_v1",
        "type": "product",
        "canonical": "https://store.com/product-name.html",
        "webPath": "/product-name.html",
        "appRoute": "/product/SKU123",
        "params": {
            "id": 123,
            "sku": "SKU123",
            "urlKey": "product-name"
        },
        "store": {
            "websiteCode": "base",
            "storeCode": "default",
            "currency": "USD",
            "locale": "en_US"
        }
    }
}
```

### /flutterbridge/debug/seo Response

```json
{
    "canonical": {
        "enabled": true,
        "resolved": "https://store.com/product-name.html",
        "mode": "shortest"
    },
    "robots": {
        "directive": "index,follow",
        "page_type": "product"
    },
    "jsonld": {
        "enabled": true,
        "type": "Product",
        "data": { /* full JSON-LD */ }
    },
    "opengraph": {
        "enabled": true,
        "tags": {
            "og:title": "Product Name",
            "og:type": "product",
            "og:url": "https://store.com/product-name.html"
        }
    }
}
```

### /flutterbridge/debug/applinks Response

```json
{
    "android": {
        "enabled": true,
        "package_name": "com.example.app",
        "fingerprints_count": 2,
        "assetlinks_url": "/.well-known/assetlinks.json",
        "playstore_url": "https://play.google.com/store/apps/details?id=com.example.app"
    },
    "ios": {
        "enabled": false,
        "team_id": null,
        "bundle_id": null,
        "aasa_url": "/.well-known/apple-app-site-association"
    }
}
```

## Behavior Specifications

### Debug Mode Check

```php
public function execute(): ResultInterface
{
    if (!$this->coreConfig->isDebugMode()) {
        return $this->resultFactory->create(ResultFactory::TYPE_FORWARD)
            ->setModule('cms')
            ->setController('noroute')
            ->forward('index');
    }

    // Return debug data...
}
```

### Console Logging

```javascript
// When debug mode enabled and FlutterWeb active
if (window.flutterBridgeDebug) {
    console.group('[FlutterBridge Debug]');
    console.log('Config:', window.flutterBridgeConfig);
    console.log('Route:', window.flutterMagentoRoute);
    console.log('Modules:', window.flutterBridgeDebug.modules);
    console.groupEnd();

    // Track Flutter lifecycle
    window.flutterBridgeDebug.events = [];
    window.flutterBridgeDebug.log = function(event, data) {
        const entry = { time: Date.now(), event, data };
        this.events.push(entry);
        console.log('[FlutterBridge]', event, data);
    };
}
```

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Debug OFF | `debug_mode = 0` | 404 for all endpoints |
| Module not installed | Missing dependency | `installed: false` in status |
| No route data | Unknown page type | Return null payload |

### Security: What NOT to expose

```text
NEVER expose:
- SHA256 fingerprints (only count)
- API keys or secrets
- Customer data
- Internal paths
- Database credentials
```

## Dependencies

### Requires

- `NativeMind_FlutterBridgeCore` (debug mode check)

### Optional Integration

Detects and reports on:
- `NativeMind_FlutterBridgeRoutes`
- `NativeMind_FlutterBridgeSeo`
- `NativeMind_FlutterBridgeAppLinks`
- `NativeMind_FlutterBridgeAppBanner`
- `NativeMind_FlutterBridgeFlutterWeb`

## Routes Configuration

### etc/frontend/routes.xml

```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
    <router id="standard">
        <route id="flutterbridge" frontName="flutterbridge">
            <module name="NativeMind_FlutterBridgeDebug"/>
        </route>
    </router>
</config>
```

## Layout Specification

### default.xml

```xml
<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <body>
        <referenceContainer name="before.body.end">
            <block class="NativeMind\FlutterBridgeDebug\Block\ConsoleLogger"
                   name="nativemind.flutterbridge.debug.console"
                   template="NativeMind_FlutterBridgeDebug::console_logger.phtml"
                   cacheable="false"/>
        </referenceContainer>
    </body>
</page>
```

Note: `cacheable="false"` because debug output shouldn't be cached.

## Testing Strategy

### Unit Tests

- [ ] DebugHelper collects correct module status
- [ ] Debug check returns false when disabled
- [ ] No secrets in output

### Integration Tests

- [ ] `/flutterbridge/debug/config` returns 200 when debug ON
- [ ] `/flutterbridge/debug/config` returns 404 when debug OFF
- [ ] All endpoints return valid JSON

### Manual Verification

- [ ] Console logging appears in browser
- [ ] All installed modules reported correctly
- [ ] Route data matches page content

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
