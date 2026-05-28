# NativeMind Bridge Debug for Magento 2

[![Latest Stable Version](https://poser.pugx.org/nativemind/module-bridge-debug/v/stable)](https://packagist.org/packages/nativemind/module-bridge-debug)
[![License](https://poser.pugx.org/nativemind/module-bridge-debug/license)](https://packagist.org/packages/nativemind/module-bridge-debug)

Debug and development tools module for Flutter Bridge - provides logging, route verification, and debugging endpoints.

## Overview

This module helps during development and testing by providing:

- Route metadata verification endpoint
- Debug logging for Bridge modules
- Configuration validation
- App Links verification tools

**Note**: This module should only be enabled in development/staging environments.

## Requirements

- Magento 2.4.x
- PHP 8.1+
- nativemind/module-bridge-core ^2.0

## Installation

### Via Composer (Recommended)

```bash
composer require nativemind/module-bridge-debug
bin/magento module:enable NativeMind_BridgeDebug
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge > Debug**

### Settings

| Setting | Description |
|---------|-------------|
| Enable Debug Mode | Activate debug features |
| Log Level | `error` / `warning` / `info` / `debug` |
| Log to File | Write logs to `var/log/nativemind_bridge.log` |

## Debug Endpoints

### Route Verification

```
GET /nativemind/bridge/debug/route
```

Returns the current page's route metadata in a readable format:

```json
{
  "status": "ok",
  "route": {
    "standard": "flutter_magento_v1",
    "type": "product",
    "canonicalUrl": "https://shop.com/driven-backpack.html",
    "appRoute": "/product/24-WB03",
    "entity": {
      "id": 123,
      "sku": "24-WB03"
    }
  },
  "config": {
    "enabled": true,
    "debug": true,
    "modules": ["core", "routes", "seo", "applinks"]
  }
}
```

### App Links Verification

```
GET /nativemind/bridge/debug/applinks
```

Validates App Links configuration:

```json
{
  "status": "ok",
  "android": {
    "valid": true,
    "package_name": "com.example.app",
    "fingerprints_count": 2,
    "assetlinks_url": "/.well-known/assetlinks.json"
  },
  "ios": {
    "valid": true,
    "team_id": "TEAMID",
    "bundle_id": "com.example.app",
    "aasa_url": "/.well-known/apple-app-site-association"
  }
}
```

### Configuration Check

```
GET /nativemind/bridge/debug/config
```

Returns all Bridge module configurations (sanitized).

## Debug Logging

When enabled, the module logs Bridge activity:

```
tail -f var/log/nativemind_bridge.log
```

Example log entries:

```
[2024-01-15 10:30:00] bridge.INFO: Route detected {"type":"product","sku":"24-WB03"}
[2024-01-15 10:30:01] bridge.DEBUG: SEO meta generated {"canonical":"https://..."}
[2024-01-15 10:30:02] bridge.WARNING: App Links not configured for Android
```

## Security Warning

**Do not enable this module in production!**

The debug endpoints expose internal configuration and should only be used during development.

Recommended `.htaccess` rule for staging:

```apache
<If "%{REQUEST_URI} =~ m#^/nativemind/bridge/debug#">
    Require ip 10.0.0.0/8 192.168.0.0/16
</If>
```

## License

NativeMindNONC License - see [LICENSE](LICENSE)

## Related Projects

- [flutter_magento](https://pub.dev/packages/flutter_magento) - Flutter SDK for Magento
- [nativemind/module-bridge](https://packagist.org/packages/nativemind/module-bridge) - Umbrella module
- [nativemind/module-bridge-core](https://packagist.org/packages/nativemind/module-bridge-core) - Core module

## Support

- **Website**: https://nativemind.net
- **Issues**: GitHub Issues
