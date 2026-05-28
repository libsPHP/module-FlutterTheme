# NativeMind Bridge Routes for Magento 2

[![Latest Stable Version](https://poser.pugx.org/nativemind/module-bridge-routes/v/stable)](https://packagist.org/packages/nativemind/module-bridge-routes)
[![License](https://poser.pugx.org/nativemind/module-bridge-routes/license)](https://packagist.org/packages/nativemind/module-bridge-routes)

Route metadata module for Flutter Bridge - provides page context and app routing information for [flutter_magento](https://pub.dev/packages/flutter_magento) mobile applications.

## Overview

This module outputs standardized route metadata that allows Flutter apps to:

- Identify the current page type (product, category, CMS, search, etc.)
- Map web URLs to app routes for deep linking
- Access entity data (product SKU, category ID, etc.)
- Handle store context (website, store, currency, locale)

## Requirements

- Magento 2.4.x
- PHP 8.1+
- nativemind/module-bridge-core ^2.0

## Installation

### Via Composer (Recommended)

```bash
composer require nativemind/module-bridge-routes
bin/magento module:enable NativeMind_BridgeRoutes
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge > Route Metadata**

### Settings

| Setting | Description |
|---------|-------------|
| Enable Route Metadata | Output route metadata JSON on pages |
| Product Route Pattern | App route pattern for products (default: `/product/{sku}`) |
| Category Route Pattern | App route pattern for categories (default: `/category/{id}`) |
| CMS Route Pattern | App route pattern for CMS pages (default: `/page/{identifier}`) |

## Route Metadata Format

The module outputs a JSON script block following the `flutter_magento_v1` standard:

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

## Supported Route Types

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

## Flutter Integration

In your Flutter app using `flutter_magento`:

```dart
import 'package:flutter_magento/flutter_magento.dart';

// Parse route metadata from WebView
final routeData = FlutterMagentoRoute.parse(jsonString);

if (routeData.type == RouteType.product) {
  // Navigate to product screen
  Navigator.pushNamed(
    context,
    routeData.appRoute,
    arguments: ProductArgs(sku: routeData.entity['sku']),
  );
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
