# NativeMind Bridge App Banner for Magento 2

[![Latest Stable Version](https://poser.pugx.org/nativemind/module-bridge-appbanner/v/stable)](https://packagist.org/packages/nativemind/module-bridge-appbanner)
[![License](https://poser.pugx.org/nativemind/module-bridge-appbanner/license)](https://packagist.org/packages/nativemind/module-bridge-appbanner)

Smart App Banner module for Flutter Bridge - displays "Open in App" or "Install App" banners to promote your mobile app.

## Overview

This module adds a customizable banner that:

- Detects iOS/Android devices and shows appropriate store links
- Shows "Open in App" for users with app installed (via App Links)
- Shows "Install App" for users without the app
- Remembers user dismissal preferences
- Supports per-page-type visibility rules

## Requirements

- Magento 2.4.x
- PHP 8.1+
- nativemind/module-bridge-core ^2.0

## Installation

### Via Composer (Recommended)

```bash
composer require nativemind/module-bridge-appbanner
bin/magento module:enable NativeMind_BridgeAppBanner
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge > App Banner**

### General Settings

| Setting | Description |
|---------|-------------|
| Enable Banner | Show/hide the app banner |
| Banner Position | `top` / `bottom` |
| Banner Style | `native` / `custom` |

### Content

| Setting | Description |
|---------|-------------|
| App Name | Display name in banner |
| App Icon | App icon image URL |
| Primary Text | Main banner message |
| Secondary Text | Subtitle message |
| Open Button Text | "Open" button label |
| Install Button Text | "Get" button label |

### Visibility

| Setting | Description |
|---------|-------------|
| Show on Home | Display on homepage |
| Show on Products | Display on product pages |
| Show on Categories | Display on category pages |
| Show on CMS | Display on CMS pages |
| Show on Cart | Display on cart page |

### Behavior

| Setting | Description |
|---------|-------------|
| Dismiss Duration | Days to hide after dismissal (0 = session) |
| Delay (ms) | Milliseconds before showing banner |
| Animation | `slide` / `fade` / `none` |

### Store Links

| Setting | Description |
|---------|-------------|
| iOS App Store URL | Apple App Store link |
| Android Play Store URL | Google Play Store link |

## Banner Appearance

The banner automatically adapts to the device:

### iOS (Safari)

Uses native Smart App Banner when available:

```html
<meta name="apple-itunes-app" content="app-id=123456789">
```

### Android / Other

Shows custom banner with styling matching your theme:

```
┌─────────────────────────────────────────────┐
│ [Icon] Your App Name              [Open] [X]│
│        Open in app for best experience      │
└─────────────────────────────────────────────┘
```

## Custom Styling

Override banner styles in your theme:

```css
.nativemind-app-banner {
    background: #your-brand-color;
}

.nativemind-app-banner__button {
    background: #your-accent-color;
}
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
