# NativeMind Bridge SEO for Magento 2

[![Latest Stable Version](https://poser.pugx.org/nativemind/module-bridge-seo/v/stable)](https://packagist.org/packages/nativemind/module-bridge-seo)
[![License](https://poser.pugx.org/nativemind/module-bridge-seo/license)](https://packagist.org/packages/nativemind/module-bridge-seo)

SEO optimization module for Flutter Bridge - canonical URLs, robots meta tags, JSON-LD structured data, and OpenGraph meta tags.

## Overview

This module enhances Magento's SEO capabilities with:

- Canonical URL normalization and management
- Robots meta tag control for various page types
- JSON-LD structured data (Product, Breadcrumb, Organization)
- OpenGraph and Twitter Card meta tags
- UTM parameter stripping from canonical URLs

## Requirements

- Magento 2.4.x
- PHP 8.1+
- nativemind/module-bridge-core ^2.0

## Installation

### Via Composer (Recommended)

```bash
composer require nativemind/module-bridge-seo
bin/magento module:enable NativeMind_BridgeSeo
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge > SEO**

### Canonical URLs

| Setting | Description |
|---------|-------------|
| Product Canonical Mode | `default` / `shortest` / `category_path` |
| Category Filtered Pages | Canonical to base category + noindex |
| Strip UTM Parameters | Remove tracking parameters from canonical |

### Robots Meta

| Setting | Description |
|---------|-------------|
| Search Pages | `noindex,follow` (recommended) |
| Filtered Categories | `noindex,follow` (recommended) |
| Cart/Checkout/Customer | `noindex,nofollow` (recommended) |

### JSON-LD Structured Data

| Setting | Description |
|---------|-------------|
| Mode | `disabled` / `append` / `replace` |
| Product Schema | Enable Product structured data |
| Breadcrumb Schema | Enable BreadcrumbList structured data |
| Organization Schema | Enable Organization structured data |

### OpenGraph

| Setting | Description |
|---------|-------------|
| Enable OpenGraph | Output OpenGraph meta tags |
| Default Share Image | Fallback image for social sharing |
| Twitter Card Type | `summary` / `summary_large_image` |

## JSON-LD Output Example

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Driven Backpack",
  "image": "https://shop.com/media/catalog/product/driven-backpack.jpg",
  "description": "Premium backpack for everyday use",
  "sku": "24-WB03",
  "brand": {
    "@type": "Brand",
    "name": "Fusion"
  },
  "offers": {
    "@type": "Offer",
    "url": "https://shop.com/driven-backpack.html",
    "priceCurrency": "USD",
    "price": "36.00",
    "availability": "https://schema.org/InStock"
  }
}
</script>
```

## OpenGraph Output Example

```html
<meta property="og:type" content="product" />
<meta property="og:title" content="Driven Backpack" />
<meta property="og:description" content="Premium backpack for everyday use" />
<meta property="og:url" content="https://shop.com/driven-backpack.html" />
<meta property="og:image" content="https://shop.com/media/catalog/product/driven-backpack.jpg" />
<meta property="product:price:amount" content="36.00" />
<meta property="product:price:currency" content="USD" />
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
