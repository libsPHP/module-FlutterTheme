# NativeMind Flutter Bridge for Magento 2

Theme-agnostic Magento 2 module for connecting Magento storefront URLs with Flutter applications built on [flutter_magento](https://pub.dev/packages/flutter_magento).

**This module does not replace your Magento theme and does not bundle Flutter Web.**

It works with any Magento frontend theme (Luma, Blank, Hyva, custom) by adding:

- Canonical URL normalization
- flutter_magento route metadata (`flutter_magento_v1` standard)
- Product/Category/CMS/Search route mapping
- JSON-LD structured data (Product, Breadcrumb, Organization)
- OpenGraph/Twitter meta tags
- Android App Links (`.well-known/assetlinks.json`)
- iOS Universal Links (`.well-known/apple-app-site-association`)
- Optional "Open in App" / "Install App" banner

Your existing Magento theme continues to render the storefront unchanged.

## Requirements

- Magento 2.4.x
- PHP 8.1+

## Installation

### Composer (Recommended)

```bash
composer require nativemind/module-bridge
bin/magento module:enable NativeMind_Bridge
bin/magento setup:upgrade
bin/magento cache:flush
```

### Manual Installation

1. Create directory `app/code/NativeMind/Bridge`
2. Copy all files to this directory
3. Run:

```bash
bin/magento module:enable NativeMind_Bridge
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge**

### General
- Enable/disable the module
- Debug mode for route verification

### Route Metadata
- Enable/disable route metadata output
- Configure app route patterns (`/product/{sku}`, `/category/{id}`, etc.)

### Canonical URLs
- Product canonical mode: Magento default / shortest URL / category path
- Category filtered pages: canonical to base + noindex
- Strip UTM/tracking parameters

### Robots
- Search pages: noindex,follow (default)
- Filtered categories: noindex,follow (default)
- Cart/checkout/customer: noindex,nofollow

### JSON-LD
- Mode: disabled / append / replace
- Product structured data
- Breadcrumb structured data
- Organization structured data

### OpenGraph
- Enable/disable OpenGraph meta tags
- Default share image
- Twitter card type

### App Links
- Android: package name, SHA256 fingerprints, Play Store URL
- iOS: Team ID, Bundle ID, App Store URL

### App Banner
- Enable/disable banner
- Customize text and buttons
- Show on specific page types
- Dismiss duration

## Route Metadata Format

The module outputs standardized route metadata for flutter_magento:

```html
<script type="application/json" id="flutter-magento-route">
{
  "standard": "flutter_magento_v1",
  "type": "product",
  "canonicalUrl": "https://shop.com/driven-backpack.html",
  "webPath": "/driven-backpack.html",
  "appRoute": "/product/24-WB03",
  "entity": {
    "id": 123,
    "sku": "24-WB03",
    "urlKey": "driven-backpack"
  },
  "store": {
    "websiteCode": "base",
    "storeCode": "default",
    "currency": "USD",
    "locale": "en_US"
  }
}
</script>
```

### Supported Route Types

| Type | App Route Pattern | Entity Data |
|------|-------------------|-------------|
| `product` | `/product/{sku}` | id, sku, urlKey |
| `category` | `/category/{id}` | id, urlKey, urlPath |
| `cms` | `/page/{identifier}` | id, identifier |
| `search` | `/search?q={query}` | query |
| `cart` | `/cart` | - |
| `checkout` | `/checkout` | - |
| `customer` | `/account` | - |
| `home` | `/` | - |

## App Links Setup

### Android App Links

Configure in admin, then verify:

```bash
curl https://your-store.com/.well-known/assetlinks.json
```

Expected output:
```json
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "your.app.package",
    "sha256_cert_fingerprints": ["AA:BB:CC:..."]
  }
}]
```

### iOS Universal Links

Configure in admin, then verify:

```bash
curl https://your-store.com/.well-known/apple-app-site-association
```

Expected output:
```json
{
  "applinks": {
    "apps": [],
    "details": [{
      "appIDs": ["TEAMID.your.bundle.id"],
      "components": [{"/" : "/*"}]
    }]
  }
}
```

## How It Works

```
Any Magento Theme (Luma/Blank/Hyva/Custom)
          │
          ▼
┌─────────────────────────────────┐
│   NativeMind_Bridge      │
│                                  │
│   Adds via layout XML:          │
│   - Route metadata (JSON)       │
│   - JSON-LD structured data     │
│   - App banner (optional)       │
│                                  │
│   Adds via plugins:             │
│   - Canonical <link>            │
│   - Robots <meta>               │
│   - OpenGraph <meta>            │
└─────────────────────────────────┘
          │
          ▼
flutter_magento mobile app can:
- Parse route metadata
- Open same URLs via deep links
- Navigate to correct app screen
```

## Theme Compatibility

This module is designed to work with any Magento theme:

- **Luma** - Tested
- **Blank** - Tested
- **Hyva** - Compatible (uses standard containers)
- **Custom themes** - Compatible if they include `after.body.start` and `before.body.end` containers

The module:
- Does NOT override any templates
- Does NOT create a theme
- Does NOT modify checkout
- Does NOT include Flutter Web build

## Debug Mode

Enable debug mode in admin to access:

```
https://your-store.com/Bridge/debug/route
```

This shows the current page's route metadata for verification.

## License

MIT License - see [LICENSE](LICENSE)

## Support

- **Website**: https://nativemind.net
- **Issues**: GitHub Issues

## Related Projects

- [flutter_magento](https://pub.dev/packages/flutter_magento) - Flutter package for Magento integration
