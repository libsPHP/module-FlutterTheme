# Usage Examples

This document provides practical examples for using and customizing the FlutterTheme module.

## 📋 Table of Contents

- [Basic Setup](#basic-setup)
- [Configuration Examples](#configuration-examples)
- [Customization Examples](#customization-examples)
- [Advanced Use Cases](#advanced-use-cases)

## 🚀 Basic Setup

### Enable Module for Specific Store View

```bash
# Enable for all stores
php bin/magento config:set flutter_theme/general/enabled 1

# Enable for specific store (use store code)
php bin/magento config:set --scope=store --scope-code=default flutter_theme/general/enabled 1
```

### Quick Test of Fallback Mode

```php
// In root.phtml or any template
<?php
$helper = $this->helper(\NativeMind\FlutterTheme\Helper\DataInterface::class);

echo "Is Crawler: " . ($helper->isCrawler() ? 'Yes' : 'No') . "\n";
echo "Has JS: " . ($helper->hasJavaScriptSupport() ? 'Yes' : 'No') . "\n";
echo "Use Fallback: " . ($helper->shouldUseFallback() ? 'Yes' : 'No') . "\n";
?>
```

## ⚙️ Configuration Examples

### Development Configuration

For local development with frequent Flutter rebuilds:

```bash
# Store → Configuration → NativeMind → Flutter Theme

General Settings:
  Enable Flutter Theme: Yes
  Force Fallback Mode: No

Detection Settings:
  Detect Search Crawlers: Yes
  Detect JavaScript Support: Yes
  JS Cookie Lifetime: 3600  # 1 hour for testing

Flutter Settings:
  Use CanvasKit Renderer: No  # HTML renderer is faster to build
  Enable Service Worker: No   # Disable for hot reload
  Preload Flutter Assets: No  # Faster page load during development

SEO Settings:
  Include Structured Data: Yes
  Load Fallback CSS: Yes
  Minimal HTML Mode: No
```

### Production Configuration

For live site with optimal performance:

```bash
General Settings:
  Enable Flutter Theme: Yes
  Force Fallback Mode: No

Detection Settings:
  Detect Search Crawlers: Yes
  Detect JavaScript Support: Yes
  JS Cookie Lifetime: 31536000  # 1 year

Flutter Settings:
  Use CanvasKit Renderer: Yes  # Best performance
  Enable Service Worker: Yes   # Offline support
  Preload Flutter Assets: Yes  # Faster initialization

SEO Settings:
  Include Structured Data: Yes
  Load Fallback CSS: Yes
  Minimal HTML Mode: Yes  # For large catalogs
```

### SEO Testing Configuration

To test how search engines see your site:

```bash
General Settings:
  Enable Flutter Theme: Yes
  Force Fallback Mode: Yes  # Force HTML version

SEO Settings:
  Include Structured Data: Yes
  Load Fallback CSS: Yes
  Minimal HTML Mode: No  # See full HTML
```

## 🎨 Customization Examples

### 1. Custom Crawler Detection

Add custom bot patterns:

```php
<?php
// app/code/YourVendor/YourModule/Plugin/CustomCrawlerDetection.php

namespace YourVendor\YourModule\Plugin;

use NativeMind\FlutterTheme\Helper\Data;

class CustomCrawlerDetection
{
    public function aroundIsCrawler(Data $subject, callable $proceed)
    {
        // Call original method
        $result = $proceed();
        
        if ($result) {
            return true;
        }
        
        // Add custom crawler detection
        $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? '';
        $customBots = [
            'YourCustomBot',
            'AnotherBot',
            'SpecialCrawler',
        ];
        
        foreach ($customBots as $bot) {
            if (stripos($userAgent, $bot) !== false) {
                return true;
            }
        }
        
        return false;
    }
}
```

Register plugin in `etc/di.xml`:

```xml
<type name="NativeMind\FlutterTheme\Helper\Data">
    <plugin name="custom_crawler_detection" 
            type="YourVendor\YourModule\Plugin\CustomCrawlerDetection"/>
</type>
```

### 2. Custom Fallback Template

Override product fallback in your theme:

```php
<?php
// app/design/frontend/YourVendor/YourTheme/NativeMind_FlutterTheme/templates/fallback/product.phtml

/** @var \NativeMind\FlutterTheme\Block\Fallback\Product $block */
$product = $block->getProduct();
?>

<div class="custom-product-fallback">
    <div class="product-wrapper">
        <!-- Custom HTML structure -->
        <h1><?= $escaper->escapeHtml($product->getName()) ?></h1>
        
        <!-- Your custom content -->
        <div class="custom-gallery">
            <!-- Custom image gallery -->
        </div>
        
        <!-- Custom price display -->
        <div class="custom-price">
            <?= $block->getProductPrice($product) ?>
        </div>
    </div>
</div>
```

### 3. Custom CSS for Fallback

Add theme-specific styles:

```css
/* app/design/frontend/YourVendor/YourTheme/web/css/custom-fallback.css */

.fallback-product {
    /* Override default styles */
    background: #f9f9f9;
}

.product-name {
    /* Custom product name styling */
    font-family: 'Your Custom Font', sans-serif;
    color: #your-brand-color;
}
```

Include in layout:

```xml
<!-- app/design/frontend/YourVendor/YourTheme/Magento_Theme/layout/default.xml -->
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <head>
        <css src="css/custom-fallback.css"/>
    </head>
</page>
```

### 4. Custom Loading Screen

Customize Flutter loading in your theme:

```php
<?php
// Override root.phtml
?>
<div id="flutter-app" class="flutter-app">
    <!-- Custom loading indicator -->
    <div id="flutter-loading" class="custom-loading">
        <img src="<?= $escaper->escapeUrl($block->getViewFileUrl('images/logo.svg')) ?>" 
             alt="Loading" 
             class="loading-logo">
        <div class="loading-spinner"></div>
        <p class="loading-text">Loading Your Store...</p>
    </div>
</div>

<style>
.custom-loading {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
}

.loading-logo {
    width: 120px;
    height: auto;
    margin-bottom: 30px;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
}
</style>
```

## 🔧 Advanced Use Cases

### 1. A/B Testing Flutter vs Traditional

```php
<?php
namespace YourVendor\YourModule\Plugin;

use NativeMind\FlutterTheme\Helper\Data;

class ABTestingPlugin
{
    public function aroundShouldUseFallback(Data $subject, callable $proceed)
    {
        // 50% of users get Flutter, 50% get fallback
        $userId = $_COOKIE['user_id'] ?? uniqid();
        $useFlutter = (crc32($userId) % 2) === 0;
        
        if ($useFlutter) {
            return false; // Use Flutter
        }
        
        return $proceed(); // Use original logic
    }
}
```

### 2. Gradual Rollout

```php
<?php
namespace YourVendor\YourModule\Helper;

class FeatureFlag
{
    public function isFlutterEnabled(): bool
    {
        $rolloutPercentage = 25; // Start with 25%
        $random = rand(1, 100);
        
        return $random <= $rolloutPercentage;
    }
}
```

### 3. Device-Specific Detection

```php
<?php
public function shouldUseFallback(): bool
{
    // Check if mobile device
    $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? '';
    $isMobile = preg_match('/(Mobile|Android|iPhone|iPad)/', $userAgent);
    
    if ($isMobile) {
        // Use Flutter for mobile
        return false;
    }
    
    // Use fallback for desktop (or vice versa)
    return true;
}
```

### 4. Time-Based Switching

```php
<?php
public function shouldUseFallback(): bool
{
    // Use fallback during maintenance window
    $hour = (int)date('H');
    
    if ($hour >= 2 && $hour <= 4) {
        // Use fallback during 2 AM - 4 AM
        return true;
    }
    
    return parent::shouldUseFallback();
}
```

### 5. Geo-Location Based

```php
<?php
public function shouldUseFallback(): bool
{
    // Get visitor country
    $country = $_SERVER['HTTP_CF_IPCOUNTRY'] ?? 'US'; // Cloudflare example
    
    // Enable Flutter only for specific countries
    $flutterCountries = ['US', 'CA', 'GB', 'AU'];
    
    if (!in_array($country, $flutterCountries)) {
        return true; // Use fallback
    }
    
    return parent::shouldUseFallback();
}
```

## 📊 Analytics Integration

### Track Flutter vs Fallback Usage

```javascript
// In your theme's JavaScript
document.addEventListener('DOMContentLoaded', function() {
    const isFlutter = document.getElementById('flutter-app') !== null;
    const isFallback = document.getElementById('fallback-content') !== null;
    
    // Send to Google Analytics
    if (typeof gtag !== 'undefined') {
        gtag('event', 'page_version', {
            'version': isFlutter ? 'flutter' : 'fallback',
            'user_agent': navigator.userAgent
        });
    }
});
```

### Track Flutter Loading Time

```javascript
window.addEventListener('flutterLoaded', function(event) {
    const loadTime = event.detail.loadTime || 0;
    
    // Send to analytics
    if (typeof gtag !== 'undefined') {
        gtag('event', 'flutter_load_time', {
            'event_category': 'performance',
            'value': loadTime,
            'event_label': 'Flutter initialization'
        });
    }
});
```

## 🔒 Security Examples

### Rate Limiting for API

```php
<?php
namespace YourVendor\YourModule\Plugin;

class RateLimitPlugin
{
    public function beforeGetProducts($subject)
    {
        $ip = $_SERVER['REMOTE_ADDR'];
        $cacheKey = 'rate_limit_' . $ip;
        
        $requests = (int)$this->cache->load($cacheKey) ?: 0;
        
        if ($requests > 100) {
            throw new \Exception('Rate limit exceeded');
        }
        
        $this->cache->save($requests + 1, $cacheKey, [], 60);
    }
}
```

### CORS Configuration

```php
<?php
// In module's Plugin/CorsPlugin.php
public function beforeDispatch($subject, $request)
{
    $allowedOrigins = [
        'https://your-flutter-domain.com',
        'https://your-cdn.com',
    ];
    
    $origin = $request->getHeader('Origin');
    
    if (in_array($origin, $allowedOrigins)) {
        header('Access-Control-Allow-Origin: ' . $origin);
        header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
        header('Access-Control-Allow-Headers: Content-Type, Authorization');
    }
}
```

## 📝 Logging Examples

### Debug Flutter Loading

```javascript
// Add to flutter-loader.js
console.group('Flutter Debug Info');
console.log('Configuration:', window.flutterConfiguration);
console.log('User Agent:', navigator.userAgent);
console.log('Screen Size:', window.innerWidth + 'x' + window.innerHeight);
console.log('JS Enabled:', true);
console.groupEnd();
```

### Log Fallback Renders

```php
<?php
// In Helper/Data.php
public function shouldUseFallback(): bool
{
    $result = parent::shouldUseFallback();
    
    // Log for debugging
    $this->logger->debug('Fallback Decision', [
        'result' => $result,
        'is_crawler' => $this->isCrawler(),
        'has_js' => $this->hasJavaScriptSupport(),
        'user_agent' => $_SERVER['HTTP_USER_AGENT'] ?? '',
    ]);
    
    return $result;
}
```

## 🧪 Testing Examples

### Automated Testing with curl

```bash
#!/bin/bash

# Test as Googlebot
echo "Testing as Googlebot..."
curl -A "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" \
     https://your-store.com/ | grep "fallback-content"

# Test as Chrome
echo "Testing as Chrome..."
curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" \
     -b "js_enabled=1" \
     https://your-store.com/ | grep "flutter-app"
```

### Selenium Testing

```python
from selenium import webdriver
from selenium.webdriver.common.by import By

def test_flutter_loads():
    driver = webdriver.Chrome()
    driver.get('https://your-store.com')
    
    # Check if Flutter app div exists
    flutter_app = driver.find_element(By.ID, 'flutter-app')
    assert flutter_app is not None
    
    # Wait for Flutter to load
    driver.implicitly_wait(10)
    
    # Check if loading indicator is hidden
    loading = driver.find_element(By.ID, 'flutter-loading')
    assert loading.value_of_css_property('display') == 'none'
    
    driver.quit()
```

---

For more examples and support, visit: https://nativemind.net

