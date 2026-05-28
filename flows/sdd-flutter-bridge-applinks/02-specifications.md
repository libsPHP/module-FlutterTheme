# Specifications: BridgeAppLinks

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

BridgeAppLinks serves the `.well-known` JSON endpoints required for Android App Links and iOS Universal Links verification. Uses a custom router since Magento's standard routing doesn't support dots in path segments.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `NativeMind_BridgeAppLinks` | Create | New module |
| Router | Create | Custom router for .well-known |
| Admin Config | Create | App Links section |

## Architecture

### Module Structure

```text
NativeMind_BridgeAppLinks/
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
│   ├── AssetLinksBuilder.php
│   └── AppleAppSiteAssociationBuilder.php
├── Controller/
│   ├── Router.php
│   └── WellKnown/
│       ├── AssetLinks.php
│       └── AppleAppSiteAssociation.php
```

### Custom Router Flow

```text
Request: /.well-known/assetlinks.json
    │
    ▼
Router::match()
    │
    ├─► Check path matches .well-known/*
    │
    ├─► Check feature enabled
    │
    └─► Forward to appropriate controller
        │
        ▼
AssetLinks Controller
    │
    └─► Return JSON response
```

## Interfaces

### Helper\Config

```php
<?php
namespace NativeMind\BridgeAppLinks\Helper;

class Config extends \Magento\Framework\App\Helper\AbstractHelper
{
    public function isAndroidAppLinksEnabled(?int $storeId = null): bool;
    public function getAndroidPackageName(?int $storeId = null): ?string;
    public function getAndroidSha256Fingerprints(?int $storeId = null): array;
    public function getAndroidPlayStoreUrl(?int $storeId = null): ?string;

    public function isIosUniversalLinksEnabled(?int $storeId = null): bool;
    public function getIosTeamId(?int $storeId = null): ?string;
    public function getIosBundleId(?int $storeId = null): ?string;
    public function getIosAppStoreUrl(?int $storeId = null): ?string;
}
```

### Model\AssetLinksBuilder

```php
<?php
namespace NativeMind\BridgeAppLinks\Model;

class AssetLinksBuilder
{
    public function build(): array;
    public function toJson(): string;
}
```

### Model\AppleAppSiteAssociationBuilder

```php
<?php
namespace NativeMind\BridgeAppLinks\Model;

class AppleAppSiteAssociationBuilder
{
    public function build(): array;
    public function toJson(): string;
}
```

### Controller\Router

```php
<?php
namespace NativeMind\BridgeAppLinks\Controller;

use Magento\Framework\App\RouterInterface;

class Router implements RouterInterface
{
    private const ROUTES = [
        '.well-known/assetlinks.json' => [
            'module' => 'NativeMind_BridgeAppLinks',
            'controller' => 'wellknown',
            'action' => 'assetlinks'
        ],
        '.well-known/apple-app-site-association' => [
            'module' => 'NativeMind_BridgeAppLinks',
            'controller' => 'wellknown',
            'action' => 'appleappsiteassociation'
        ]
    ];

    public function match(RequestInterface $request);
}
```

## Data Models

### Android assetlinks.json

```json
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "com.example.myapp",
    "sha256_cert_fingerprints": [
      "AA:BB:CC:DD:...:ZZ"
    ]
  }
}]
```

### iOS apple-app-site-association

```json
{
  "applinks": {
    "apps": [],
    "details": [{
      "appID": "TEAMID.com.example.myapp",
      "paths": ["*"]
    }]
  }
}
```

### Config Paths

| Path | Type | Default |
|------|------|---------|
| `nativemind_Bridge/app_links/android_enabled` | bool | 0 |
| `nativemind_Bridge/app_links/android_package_name` | string | |
| `nativemind_Bridge/app_links/android_sha256_fingerprints` | textarea | |
| `nativemind_Bridge/app_links/android_playstore_url` | string | |
| `nativemind_Bridge/app_links/ios_enabled` | bool | 0 |
| `nativemind_Bridge/app_links/ios_team_id` | string | |
| `nativemind_Bridge/app_links/ios_bundle_id` | string | |
| `nativemind_Bridge/app_links/ios_appstore_url` | string | |

## Behavior Specifications

### Endpoint Responses

| Endpoint | Enabled & Configured | Enabled & Missing Config | Disabled |
|----------|---------------------|-------------------------|----------|
| `/.well-known/assetlinks.json` | Full JSON | `[]` | 404 |
| `/.well-known/apple-app-site-association` | Full JSON | `{}` | 404 |

### SHA256 Fingerprint Parsing

```text
Input (textarea):
AA:BB:CC:DD:EE:FF:00:11:22:33:44:55:66:77:88:99:AA:BB:CC:DD:EE:FF:00:11:22:33:44:55:66:77:88:99
11:22:33:44:55:66:77:88:99:AA:BB:CC:DD:EE:FF:00:11:22:33:44:55:66:77:88:99:AA:BB:CC:DD:EE:FF:00

Output (array):
[
  "AA:BB:CC:DD:EE:FF:...",
  "11:22:33:44:55:66:..."
]
```

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Core disabled | `Core::isEnabled() = false` | Router returns null (404) |
| Feature disabled | `android_enabled = 0` | 404 for that endpoint |
| Missing package name | Empty config | Return `[]` |
| Invalid fingerprint | Malformed string | Skip that fingerprint |

## Dependencies

### Requires

- `NativeMind_BridgeCore` (enabled check)

### Does NOT Require

- Any other Bridge modules

## DI Configuration

### di.xml

```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="urn:magento:framework:ObjectManager/etc/config.xsd">

    <!-- Register custom router -->
    <type name="Magento\Framework\App\RouterList">
        <arguments>
            <argument name="routerList" xsi:type="array">
                <item name="nativemind_Bridge_applinks" xsi:type="array">
                    <item name="class" xsi:type="string">NativeMind\BridgeAppLinks\Controller\Router</item>
                    <item name="disable" xsi:type="boolean">false</item>
                    <item name="sortOrder" xsi:type="string">25</item>
                </item>
            </argument>
        </arguments>
    </type>

</config>
```

## Testing Strategy

### Unit Tests

- [ ] AssetLinksBuilder generates correct JSON
- [ ] AppleAppSiteAssociationBuilder generates correct JSON
- [ ] Multiple fingerprints parsed correctly
- [ ] Empty config returns empty array

### Integration Tests

- [ ] `/.well-known/assetlinks.json` returns 200 when configured
- [ ] `/.well-known/apple-app-site-association` returns 200 when configured
- [ ] Returns 404 when disabled
- [ ] Content-Type is application/json

### Manual Verification

- [ ] Android App Links verification passes
- [ ] iOS Universal Links verification passes
- [ ] Test with assetlinks.json validator tools

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
