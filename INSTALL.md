# Installation Guide - NativeMind FlutterTheme

This guide provides detailed installation and setup instructions for the FlutterTheme module.

## 📋 Prerequisites

### System Requirements
- **Magento:** 2.4.0 or higher
- **PHP:** 7.4, 8.0, 8.1, or 8.2
- **Composer:** 2.x
- **Flutter SDK:** 3.0+ (for building Flutter app)

### Required Magento Modules
- Magento_Store
- Magento_Catalog
- Magento_Theme
- Magento_Cms

## 🚀 Installation Steps

### Step 1: Install Module

#### Option A: Via Composer (Recommended)

```bash
composer require nativemind/module-flutter-theme
```

#### Option B: Manual Installation

1. Download or clone the module
2. Create directory structure:
   ```bash
   mkdir -p app/code/NativeMind/FlutterTheme
   ```
3. Copy all module files to `app/code/NativeMind/FlutterTheme`

### Step 2: Enable Module

```bash
php bin/magento module:enable NativeMind_FlutterTheme
```

### Step 3: Run Setup Upgrade

```bash
php bin/magento setup:upgrade
```

### Step 4: Compile Code

```bash
php bin/magento setup:di:compile
```

### Step 5: Deploy Static Content

```bash
php bin/magento setup:static-content:deploy -f
```

### Step 6: Clear Cache

```bash
php bin/magento cache:clean
php bin/magento cache:flush
```

### Step 7: Set Permissions

```bash
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chmod u+x bin/magento
```

## 🎨 Setting Up Flutter Application

### Step 1: Build Flutter Web App

In your Flutter project:

```bash
cd /path/to/your/flutter/project

# For production with CanvasKit
flutter build web --web-renderer canvaskit --release

# Or for HTML renderer (smaller size)
flutter build web --web-renderer html --release
```

### Step 2: Copy Build Files

Copy the entire `build/web/` directory contents to the module:

```bash
# From your Flutter project directory
cp -r build/web/* /path/to/magento/app/code/NativeMind/FlutterTheme/view/frontend/web/flutter/

# Or if using pub/static (after deployment)
cp -r build/web/* /path/to/magento/pub/static/frontend/[Vendor]/[theme]/[locale]/NativeMind_FlutterTheme/flutter/
```

**Required files structure:**
```
view/frontend/web/flutter/
├── flutter.js
├── main.dart.js
├── flutter_service_worker.js (optional, for PWA)
├── manifest.json (optional, for PWA)
├── canvaskit/ (if using CanvasKit renderer)
│   ├── canvaskit.wasm
│   ├── canvaskit.js
│   └── profiling/
└── assets/
    ├── AssetManifest.json
    ├── FontManifest.json
    ├── NOTICES
    └── fonts/
```

### Step 3: Configure Flutter App

In your Flutter app's `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'dart:js' as js;

void main() {
  final config = _getMagentoConfig();
  runApp(MagentoStoreApp(config: config));
}

/// Get Magento configuration from JavaScript window object
Map<String, dynamic> _getMagentoConfig() {
  try {
    if (js.context.hasProperty('flutterConfiguration')) {
      final jsConfig = js.context['flutterConfiguration'];
      final magento = jsConfig['magento'];
      
      return {
        'baseUrl': magento['baseUrl'],
        'storeCode': magento['storeCode'],
        'currency': magento['currency'],
        'locale': magento['locale'],
      };
    }
  } catch (e) {
    print('Error reading Magento config: $e');
  }
  
  // Fallback configuration (development)
  return {
    'baseUrl': 'https://your-magento-store.com',
    'storeCode': 'default',
    'currency': 'USD',
    'locale': 'en_US',
  };
}
```

## ⚙️ Configuration

### Step 1: Access Admin Configuration

1. Log in to Magento Admin Panel
2. Navigate to: **Stores → Configuration → NativeMind → Flutter Theme**

### Step 2: Configure General Settings

- **Enable Flutter Theme:** Yes
- **Force Fallback Mode:** No (set to Yes only for testing)

### Step 3: Configure Detection Settings

- **Detect Search Crawlers:** Yes (recommended)
- **Detect JavaScript Support:** Yes (recommended)
- **JS Cookie Name:** js_enabled (default)
- **JS Cookie Lifetime:** 31536000 (1 year)

### Step 4: Configure Flutter Settings

- **Use CanvasKit Renderer:** Yes (for better performance)
- **Enable Service Worker:** Yes (for PWA/offline support)
- **Preload Flutter Assets:** Yes (for faster initialization)

### Step 5: Configure SEO Settings

- **Include Structured Data:** Yes (for rich snippets)
- **Load Fallback CSS:** Yes (for proper fallback styling)
- **Minimal HTML Mode:** No (use Yes for very large catalogs)

### Step 6: Save Configuration

Click **Save Config** and clear cache:

```bash
php bin/magento cache:flush
```

## 🧪 Verification

### Test Flutter Version

1. Open your store in a modern browser (Chrome, Firefox, Safari)
2. Open Developer Tools → Console
3. You should see: `Initializing Flutter Web application...`
4. Check Network tab for `flutter.js` and `main.dart.js`

### Test Fallback Version

**Method 1: Force Fallback**
1. Set "Force Fallback Mode" to Yes in admin
2. Clear cache and reload page
3. You should see HTML version

**Method 2: Clear JS Cookie**
```javascript
// In browser console
document.cookie = "js_enabled=0; path=/";
location.reload();
```

**Method 3: Simulate Crawler**
```bash
curl -A "Googlebot" https://your-store.com/any-page.html
```

### Verify SEO

1. View page source as crawler
2. Check for structured data:
   ```html
   <script type="application/ld+json">
   {
     "@context": "https://schema.org",
     "@type": "Product",
     ...
   }
   </script>
   ```
3. Use Google's Rich Results Test

## 🔧 Troubleshooting

### Flutter Not Loading

**Issue:** Blank page or loading spinner forever

**Solutions:**
1. Check browser console for errors
2. Verify flutter files exist:
   ```bash
   ls -la pub/static/frontend/[Vendor]/[theme]/[locale]/NativeMind_FlutterTheme/flutter/
   ```
3. Check file permissions (should be readable)
4. Clear browser cache
5. Redeploy static content:
   ```bash
   php bin/magento setup:static-content:deploy -f
   ```

### Always Shows Fallback

**Issue:** Flutter never loads, always see HTML version

**Solutions:**
1. Check "Force Fallback Mode" is set to No
2. Clear cookies:
   ```javascript
   document.cookie = "js_enabled=1; path=/";
   location.reload();
   ```
3. Verify JS is enabled in browser
4. Check browser console for errors

### 404 for Flutter Files

**Issue:** Network tab shows 404 for flutter.js or other files

**Solutions:**
1. Verify files are in correct location
2. Check symlinks (if pub/static is symlinked):
   ```bash
   php bin/magento setup:static-content:deploy -f
   ```
3. Check `.htaccess` or nginx config allows access
4. Verify file permissions

### Crawler Seeing Flutter Version

**Issue:** Search engines indexing JavaScript version

**Solutions:**
1. Enable "Detect Search Crawlers" in admin
2. Test with real crawler user agent:
   ```bash
   curl -A "Googlebot" https://your-store.com
   ```
3. Check Helper/Data.php crawler patterns
4. Clear Magento cache

### Styling Issues in Fallback

**Issue:** Fallback version has no styling or broken layout

**Solutions:**
1. Check fallback.css is loaded (Network tab)
2. Deploy static content:
   ```bash
   php bin/magento setup:static-content:deploy -f
   ```
3. Clear browser cache
4. Verify "Load Fallback CSS" is enabled in config

### Performance Issues

**Issue:** Slow page load or Flutter initialization

**Solutions:**
1. Enable "Preload Flutter Assets"
2. Use CanvasKit renderer for better performance
3. Enable Service Worker for caching
4. Optimize Flutter build:
   ```bash
   flutter build web --release --tree-shake-icons
   ```
5. Consider CDN for static assets
6. Enable Magento Full Page Cache

## 📊 Monitoring

### Check Module Status

```bash
php bin/magento module:status NativeMind_FlutterTheme
```

### View Logs

```bash
# Magento system logs
tail -f var/log/system.log

# Magento exception logs
tail -f var/log/exception.log

# Web server logs
tail -f /var/log/nginx/error.log  # or
tail -f /var/log/apache2/error.log
```

### Check Configuration

```bash
php bin/magento config:show flutter_theme
```

## 🔄 Updating

### Update Module

```bash
composer update nativemind/module-flutter-theme
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy -f
php bin/magento cache:flush
```

### Update Flutter Build

1. Rebuild Flutter app
2. Copy new build files
3. Deploy static content
4. Clear cache

## 🗑️ Uninstallation

```bash
php bin/magento module:disable NativeMind_FlutterTheme
php bin/magento setup:upgrade
composer remove nativemind/module-flutter-theme
php bin/magento cache:flush
```

## 📞 Support

If you encounter issues not covered in this guide:

- **Email:** contact@nativemind.net
- **Documentation:** See README.md
- **GitHub Issues:** Report bugs and request features

## ✅ Post-Installation Checklist

- [ ] Module enabled and installed
- [ ] Flutter build files copied
- [ ] Admin configuration completed
- [ ] Flutter version loads correctly
- [ ] Fallback version works for crawlers
- [ ] Structured data present in HTML
- [ ] Tested on multiple browsers
- [ ] Verified SEO with Google Rich Results Test
- [ ] Tested product pages
- [ ] Tested category pages
- [ ] Service Worker working (if enabled)
- [ ] Performance is acceptable
- [ ] Error handling works correctly

---

**Congratulations!** Your NativeMind FlutterTheme is now installed and configured.

