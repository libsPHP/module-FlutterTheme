# NativeMind Bridge App Links for Magento 2

[![Latest Stable Version](https://poser.pugx.org/nativemind/module-bridge-applinks/v/stable)](https://packagist.org/packages/nativemind/module-bridge-applinks)
[![License](https://poser.pugx.org/nativemind/module-bridge-applinks/license)](https://packagist.org/packages/nativemind/module-bridge-applinks)

App Links module for Flutter Bridge - enables Android App Links and iOS Universal Links for seamless deep linking from web to mobile app.

## Overview

This module provides:

- Android App Links via `/.well-known/assetlinks.json`
- iOS Universal Links via `/.well-known/apple-app-site-association`
- Configurable URL patterns and app credentials
- Multiple app support (debug/release builds)

## Requirements

- Magento 2.4.x
- PHP 8.1+
- nativemind/module-bridge-core ^2.0

## Installation

### Via Composer (Recommended)

```bash
composer require nativemind/module-bridge-applinks
bin/magento module:enable NativeMind_BridgeAppLinks
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge > App Links**

### Android App Links

| Setting | Description |
|---------|-------------|
| Package Name | Your Android app package (e.g., `com.example.app`) |
| SHA256 Fingerprints | Signing certificate fingerprints (comma-separated) |
| Play Store URL | Link to Google Play Store listing |

### iOS Universal Links

| Setting | Description |
|---------|-------------|
| Team ID | Apple Developer Team ID |
| Bundle ID | iOS app bundle identifier |
| App Store URL | Link to App Store listing |

### URL Patterns

| Setting | Description |
|---------|-------------|
| Include Patterns | URL paths to handle in app (e.g., `/*`, `/product/*`) |
| Exclude Patterns | URL paths to keep in browser (e.g., `/admin/*`) |

## Verification

### Android App Links

```bash
curl https://your-store.com/.well-known/assetlinks.json
```

Expected output:

```json
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "com.example.app",
    "sha256_cert_fingerprints": [
      "AA:BB:CC:DD:EE:FF:00:11:22:33:44:55:66:77:88:99:AA:BB:CC:DD:EE:FF:00:11:22:33:44:55:66:77:88:99"
    ]
  }
}]
```

### iOS Universal Links

```bash
curl https://your-store.com/.well-known/apple-app-site-association
```

Expected output:

```json
{
  "applinks": {
    "apps": [],
    "details": [{
      "appIDs": ["TEAMID.com.example.app"],
      "components": [
        {"/" : "/*", "exclude": false},
        {"/" : "/admin/*", "exclude": true}
      ]
    }]
  }
}
```

## Flutter Setup

### Android

Add to `android/app/src/main/AndroidManifest.xml`:

```xml
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" android:host="your-store.com" />
</intent-filter>
```

### iOS

Add to `ios/Runner/Runner.entitlements`:

```xml
<key>com.apple.developer.associated-domains</key>
<array>
    <string>applinks:your-store.com</string>
</array>
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
