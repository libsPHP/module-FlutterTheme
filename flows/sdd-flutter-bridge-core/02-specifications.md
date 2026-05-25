# Specifications: FlutterBridgeCore

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

FlutterBridgeCore is the minimal foundation module that all other FlutterBridge modules depend on. It provides centralized enabled/disabled state, debug mode flag, and version tracking. No frontend output.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `NativeMind_FlutterBridgeCore` | Create | New module |
| Admin Config | Create | General section under nativemind_flutterbridge |
| ACL | Create | Config permission resource |

## Architecture

### Module Structure

```text
NativeMind_FlutterBridgeCore/
├── registration.php
├── composer.json
├── etc/
│   ├── module.xml
│   ├── config.xml
│   ├── acl.xml
│   └── adminhtml/
│       └── system.xml
└── Helper/
    └── Config.php
```

### Component Diagram

```text
┌─────────────────────────────────────┐
│         Admin Configuration         │
│  Stores > Config > FlutterBridge    │
└─────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────┐
│         Helper\Config               │
│  - isEnabled()                      │
│  - isDebugMode()                    │
│  - getVersion()                     │
└─────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────┐
│     Other FlutterBridge Modules     │
│  (Routes, Seo, AppLinks, etc.)      │
└─────────────────────────────────────┘
```

## Interfaces

### Helper\Config

```php
<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeCore\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Store\Model\ScopeInterface;

class Config extends AbstractHelper
{
    public const VERSION = '2.0.0';

    public const XML_PATH_ENABLED = 'nativemind_flutterbridge/general/enabled';
    public const XML_PATH_DEBUG_MODE = 'nativemind_flutterbridge/general/debug_mode';

    public function isEnabled(?int $storeId = null): bool;
    public function isDebugMode(?int $storeId = null): bool;
    public function getVersion(): string;
}
```

## Data Models

No persistent data models. Config stored in Magento's `core_config_data` table.

### Config Paths

| Path | Type | Default | Description |
|------|------|---------|-------------|
| `nativemind_flutterbridge/general/enabled` | bool | 1 | Master enable/disable |
| `nativemind_flutterbridge/general/debug_mode` | bool | 0 | Debug output enabled |

## Behavior Specifications

### Happy Path

1. Admin enables FlutterBridge in config
2. Other modules call `Config::isEnabled()`
3. Returns `true`, modules proceed with their functionality

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Core disabled | `enabled = 0` | All dependent modules skip their output |
| Store-specific config | Different store settings | Per-store scope respected |
| No config set | Fresh install | Uses defaults (enabled=1, debug=0) |

### Error Handling

| Error | Cause | Response |
|-------|-------|----------|
| Config read failure | Database issue | Fall back to false (safe default) |

## Dependencies

### Requires

- `Magento_Store` (scope config)
- `Magento_Backend` (admin config)
- `Magento_Config` (system.xml)

### Blocks

- `NativeMind_FlutterBridgeRoutes`
- `NativeMind_FlutterBridgeSeo`
- `NativeMind_FlutterBridgeAppLinks`
- `NativeMind_FlutterBridgeAppBanner`
- `NativeMind_FlutterBridgeFlutterWeb`
- `NativeMind_FlutterBridgeDebug`

## File Specifications

### registration.php

```php
<?php
use Magento\Framework\Component\ComponentRegistrar;

ComponentRegistrar::register(
    ComponentRegistrar::MODULE,
    'NativeMind_FlutterBridgeCore',
    __DIR__
);
```

### composer.json

```json
{
    "name": "nativemind/module-flutter-bridge-core",
    "description": "FlutterBridge Core - Foundation module",
    "type": "magento2-module",
    "version": "2.0.0",
    "license": "MIT",
    "autoload": {
        "psr-4": {
            "NativeMind\\FlutterBridgeCore\\": ""
        },
        "files": ["registration.php"]
    },
    "require": {
        "php": ">=8.1",
        "magento/framework": ">=103.0"
    }
}
```

### etc/module.xml

```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="urn:magento:framework:Module/etc/module.xsd">
    <module name="NativeMind_FlutterBridgeCore" setup_version="2.0.0">
        <sequence>
            <module name="Magento_Store"/>
            <module name="Magento_Backend"/>
        </sequence>
    </module>
</config>
```

### etc/config.xml

```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Store:etc/config.xsd">
    <default>
        <nativemind_flutterbridge>
            <general>
                <enabled>1</enabled>
                <debug_mode>0</debug_mode>
            </general>
        </nativemind_flutterbridge>
    </default>
</config>
```

### etc/acl.xml

```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="urn:magento:framework:Acl/etc/acl.xsd">
    <acl>
        <resources>
            <resource id="Magento_Backend::admin">
                <resource id="Magento_Backend::stores">
                    <resource id="Magento_Backend::stores_settings">
                        <resource id="Magento_Config::config">
                            <resource id="NativeMind_FlutterBridgeCore::config"
                                      title="FlutterBridge" sortOrder="100"/>
                        </resource>
                    </resource>
                </resource>
            </resource>
        </resources>
    </acl>
</config>
```

### etc/adminhtml/system.xml

```xml
<?xml version="1.0"?>
<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Config:etc/system_file.xsd">
    <system>
        <tab id="nativemind" translate="label" sortOrder="400">
            <label>NativeMind</label>
        </tab>
        <section id="nativemind_flutterbridge" translate="label" sortOrder="10"
                 showInDefault="1" showInWebsite="1" showInStore="1">
            <label>FlutterBridge</label>
            <tab>nativemind</tab>
            <resource>NativeMind_FlutterBridgeCore::config</resource>
            <group id="general" translate="label" sortOrder="10"
                   showInDefault="1" showInWebsite="1" showInStore="1">
                <label>General</label>
                <field id="enabled" translate="label comment" type="select" sortOrder="10"
                       showInDefault="1" showInWebsite="1" showInStore="1">
                    <label>Enable FlutterBridge</label>
                    <source_model>Magento\Config\Model\Config\Source\Yesno</source_model>
                    <comment>Master switch for all FlutterBridge modules</comment>
                </field>
                <field id="debug_mode" translate="label comment" type="select" sortOrder="20"
                       showInDefault="1" showInWebsite="1" showInStore="1">
                    <label>Debug Mode</label>
                    <source_model>Magento\Config\Model\Config\Source\Yesno</source_model>
                    <comment>Enable debug endpoints and console logging</comment>
                </field>
            </group>
        </section>
    </system>
</config>
```

## Testing Strategy

### Unit Tests

- [ ] `Config::isEnabled()` returns correct boolean
- [ ] `Config::isDebugMode()` returns correct boolean
- [ ] `Config::getVersion()` returns version string
- [ ] Store scope is respected

### Integration Tests

- [ ] Admin config saves and loads correctly
- [ ] ACL restricts access properly

### Manual Verification

- [ ] Admin panel shows FlutterBridge section
- [ ] Enable/disable toggle works
- [ ] Debug mode toggle works

## Migration / Rollout

From monolith `NativeMind_FlutterBridge`:
1. Extract general config paths
2. Keep same XML paths for backward compatibility
3. Dependent modules will check Core's enabled state

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
