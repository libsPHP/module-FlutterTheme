# 🚀 NativeMind FlutterTheme for Magento 2

Progressive Enhancement theme for Magento 2 that combines Flutter Web for modern browsers with SEO-friendly HTML fallback for search engines and browsers without JavaScript support.

## 📋 Features

### ✨ Progressive Enhancement
- **Flutter Web** for JavaScript-enabled browsers
- **HTML Fallback** for search engines and no-JS browsers
- Automatic detection and serving of appropriate version

### 🤖 Smart Detection
- Search engine crawler detection (Google, Bing, Yandex, etc.)
- JavaScript support detection via cookies
- Configurable fallback modes

### 🎨 SEO Optimized
- Structured data (JSON-LD) for search engines
- Semantic HTML markup
- Fast server-side rendering for crawlers
- Complete product and category information

### 🌐 Flutter Web Integration
- Full integration with flutter_magento plugin
- CanvasKit or HTML renderer options
- Service Worker support for offline mode
- PWA capabilities

### ⚙️ Highly Configurable
- Admin panel configuration
- Per-store settings
- Flexible detection rules
- Debug and testing modes

## 📦 Installation

### Method 1: Composer (Recommended)

```bash
composer require nativemind/module-flutter-theme
php bin/magento module:enable NativeMind_FlutterTheme
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento cache:flush
```

### Method 2: Manual Installation

1. Create directory `app/code/NativeMind/FlutterTheme`
2. Copy all files to this directory
3. Run installation commands:

```bash
php bin/magento module:enable NativeMind_FlutterTheme
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento cache:flush
```

## 🔧 Configuration

### Admin Panel Configuration

Navigate to: **Stores → Configuration → NativeMind → Flutter Theme**

#### General Settings
- **Enable Flutter Theme** - Enable/disable the module
- **Force Fallback Mode** - Force HTML fallback for testing

#### Detection Settings
- **Detect Search Crawlers** - Auto-detect and serve fallback to bots
- **Detect JavaScript Support** - Check browser JS support
- **JS Cookie Name** - Cookie name for JS detection (default: `js_enabled`)
- **JS Cookie Lifetime** - How long to remember JS support (default: 1 year)

#### Flutter Settings
- **Use CanvasKit Renderer** - Better performance, larger bundle size
- **Enable Service Worker** - Offline support and caching
- **Preload Flutter Assets** - Faster initialization

#### SEO Settings
- **Include Structured Data** - Add JSON-LD for search engines
- **Load Fallback CSS** - Include CSS for fallback version
- **Minimal HTML Mode** - Lighter HTML for faster crawling

## 🎯 Setting Up Flutter Web Application

### 1. Build Your Flutter Web App

In your Flutter project (using `flutter_magento`):

```bash
cd your_flutter_project
flutter build web --web-renderer canvaskit --release
```

### 2. Copy Build Files to Module

Copy the contents of `build/web/` to:

```
module-FlutterTheme/view/frontend/web/flutter/
```

Your structure should look like:

```
view/frontend/web/flutter/
├── flutter.js
├── main.dart.js
├── flutter_service_worker.js
├── canvaskit/
│   ├── canvaskit.wasm
│   └── canvaskit.js
└── assets/
    └── ...
```

### 3. Configure Flutter App for Magento

In your Flutter app's `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'dart:js' as js;

void main() {
  // Get Magento configuration from JavaScript
  final config = _getMagentoConfig();
  
  runApp(MagentoApp(config: config));
}

Map<String, dynamic> _getMagentoConfig() {
  if (js.context.hasProperty('flutterConfiguration')) {
    final jsConfig = js.context['flutterConfiguration'];
    return {
      'baseUrl': jsConfig['magento']['baseUrl'],
      'storeCode': jsConfig['magento']['storeCode'],
      'currency': jsConfig['magento']['currency'],
      'locale': jsConfig['magento']['locale'],
    };
  }
  
  // Fallback configuration
  return {
    'baseUrl': 'https://your-store.com',
    'storeCode': 'default',
    'currency': 'USD',
    'locale': 'en_US',
  };
}
```

## 🧪 Testing

### Test Fallback Version

Force fallback mode in admin panel or add cookie:

```javascript
document.cookie = "js_enabled=0; path=/";
location.reload();
```

### Test as Search Crawler

Use User-Agent switcher browser extension or curl:

```bash
curl -A "Googlebot" https://your-store.com/product-page
```

### Test Flutter Version

Clear fallback cookie:

```javascript
document.cookie = "js_enabled=1; path=/";
location.reload();
```

## 🏗️ Architecture

### Request Flow

```
┌─────────────┐
│   Request   │
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│  User Agent &   │
│  Cookie Check   │
└──────┬──────────┘
       │
       ├─── Is Crawler? ──► Fallback HTML + SEO
       │
       ├─── No JS?      ──► Fallback HTML + Message
       │
       └─── Has JS      ──► Flutter Web App
```

### File Structure

```
module-FlutterTheme/
├── Block/
│   ├── Root.php              # Main block
│   └── Fallback/
│       ├── Product.php       # Product fallback
│       └── Category.php      # Category fallback
├── Helper/
│   ├── DataInterface.php
│   └── Data.php              # Detection logic
├── etc/
│   ├── module.xml
│   ├── config.xml
│   ├── di.xml
│   └── adminhtml/
│       └── system.xml        # Admin config
├── view/frontend/
│   ├── layout/
│   │   ├── default.xml
│   │   ├── catalog_product_view.xml
│   │   ├── catalog_category_view.xml
│   │   └── cms_index_index.xml
│   ├── templates/
│   │   ├── root.phtml        # Main template
│   │   └── fallback/
│   │       ├── product.phtml
│   │       ├── category.phtml
│   │       └── page.phtml
│   └── web/
│       ├── css/
│       │   └── fallback.css  # Fallback styles
│       ├── js/
│       │   └── flutter-loader.js
│       └── flutter/          # Flutter Web build
│           └── (Place your build here)
├── composer.json
├── registration.php
└── README.md
```

## 🔍 How It Works

### 1. Detection Phase

When a user visits the site:

1. **Helper/Data.php** checks:
   - Is force fallback enabled?
   - Is user agent a known crawler?
   - Does browser have JS cookie set?

2. Based on detection, serves either:
   - Flutter Web (full experience)
   - HTML Fallback (SEO-friendly)

### 2. Flutter Version

If JavaScript is detected:

```html
<div id="flutter-app">
  <div id="flutter-loading">Loading...</div>
</div>
<script src="flutter/flutter.js"></script>
<script src="js/flutter-loader.js"></script>
```

`flutter-loader.js` initializes Flutter with Magento configuration.

### 3. Fallback Version

For crawlers or no-JS browsers:

```html
<div id="fallback-content">
  <!-- Server-rendered HTML with structured data -->
  <article itemscope itemtype="https://schema.org/Product">
    ...
  </article>
</div>
```

### 4. Auto-Reload

If JS is detected on a fallback page:

```javascript
// Set cookie
document.cookie = "js_enabled=1; path=/; max-age=31536000";
// Reload to get Flutter version
window.location.reload();
```

## 🎨 Customization

### Custom Fallback Templates

Override templates in your theme:

```
app/design/frontend/YourVendor/YourTheme/
└── NativeMind_FlutterTheme/
    └── templates/
        └── fallback/
            └── product.phtml
```

### Custom Styles

Override or extend `fallback.css` in your theme.

### Custom Detection Logic

Create a plugin for `NativeMind\FlutterTheme\Helper\Data`:

```php
<?php
namespace YourVendor\YourModule\Plugin;

class CustomDetection
{
    public function afterIsCrawler(
        \NativeMind\FlutterTheme\Helper\Data $subject,
        $result
    ) {
        // Custom logic
        return $result;
    }
}
```

## 📊 SEO Benefits

- ✅ Full HTML content for search engines
- ✅ Structured data (JSON-LD) for rich snippets
- ✅ Fast server-side rendering
- ✅ No JavaScript execution required for indexing
- ✅ All product/category data accessible
- ✅ Clean URLs and proper meta tags

## 🚀 Performance

### Flutter Version
- Fast initialization with preloading
- Smooth 60fps animations
- Efficient caching with Service Worker
- Progressive Web App capabilities

### Fallback Version
- Minimal CSS (~20KB)
- No JavaScript overhead
- Fast server rendering
- Optimized for crawlers

## 🐛 Troubleshooting

### Flutter Not Loading

1. Check browser console for errors
2. Verify `flutter/` directory contains build files
3. Check file permissions
4. Clear Magento cache

### Always Shows Fallback

1. Check "Force Fallback Mode" is disabled
2. Clear cookies and reload
3. Verify JS cookie is being set
4. Check browser JS is enabled

### Crawler Seeing Flutter

1. Verify "Detect Search Crawlers" is enabled
2. Check crawler user agent in detection list
3. Add custom crawler patterns in Helper

### Styling Issues

1. Clear static content: `php bin/magento setup:static-content:deploy`
2. Check CSS file exists: `pub/static/.../css/fallback.css`
3. Verify CSS is loading (network tab)

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This module is licensed under the MIT License.

## 👥 Support

- **Email:** contact@nativemind.net
- **Website:** https://nativemind.net
- **Issues:** GitHub Issues

## 🔗 Related Projects

- [flutter_magento](https://pub.dev/packages/flutter_magento) - Flutter plugin for Magento
- [module-marketplace](https://github.com/nativemind/module-marketplace) - Marketplace module

## 📝 Changelog

### Version 1.0.0 (2024)
- Initial release
- Flutter Web integration
- Progressive Enhancement
- SEO fallback
- Admin configuration
- Crawler detection
- Service Worker support

---

Made with ❤️ by [NativeMind](https://nativemind.net)

