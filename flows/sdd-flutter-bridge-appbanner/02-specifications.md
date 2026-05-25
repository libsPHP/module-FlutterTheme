# Specifications: FlutterBridgeAppBanner

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

FlutterBridgeAppBanner displays an "Open in App" banner encouraging mobile users to switch to the native app. Uses vanilla JS for behavior and namespaced CSS for styling. FPC-compatible via hidden initial state.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `NativeMind_FlutterBridgeAppBanner` | Create | New module |
| Frontend Layout | Modify | Inject banner block |
| Admin Config | Create | Banner section |
| Frontend CSS | Create | Namespaced styles |

## Architecture

### Module Structure

```text
NativeMind_FlutterBridgeAppBanner/
├── registration.php
├── composer.json
├── etc/
│   ├── module.xml
│   ├── config.xml
│   └── adminhtml/
│       └── system.xml
├── Helper/
│   └── Config.php
├── Block/
│   └── Banner.php
└── view/
    └── frontend/
        ├── layout/
        │   └── default.xml
        ├── templates/
        │   └── banner.phtml
        └── web/
            └── css/
                └── banner.css
```

### Banner Flow

```text
Page Load
    │
    ▼
Banner Block (hidden by default)
    │
    ├─► Check isEnabled (Core + Banner config)
    │
    ├─► Check page type (product/category/home)
    │
    └─► Render hidden HTML

JS on Load
    │
    ├─► Check dismiss cookie
    │
    ├─► If not dismissed → show banner
    │
    └─► Attach close handler

User Interaction
    │
    ├─► Open button → navigate to app (via App Links)
    │
    ├─► Install button → open store URL
    │
    └─► Close button → set cookie, hide banner
```

## Interfaces

### Helper\Config

```php
<?php
namespace NativeMind\FlutterBridgeAppBanner\Helper;

class Config extends \Magento\Framework\App\Helper\AbstractHelper
{
    public function isBannerEnabled(?int $storeId = null): bool;
    public function getBannerTitle(?int $storeId = null): string;
    public function getBannerSubtitle(?int $storeId = null): string;
    public function getOpenButtonText(?int $storeId = null): string;
    public function getInstallButtonText(?int $storeId = null): string;
    public function showOnProduct(?int $storeId = null): bool;
    public function showOnCategory(?int $storeId = null): bool;
    public function showOnHome(?int $storeId = null): bool;
    public function getDismissCookieDays(?int $storeId = null): int;
    public function getInstallUrl(?int $storeId = null): ?string;
}
```

### Block\Banner

```php
<?php
namespace NativeMind\FlutterBridgeAppBanner\Block;

use Magento\Framework\View\Element\Template;

class Banner extends Template
{
    public function isEnabled(): bool;
    public function getTitle(): string;
    public function getSubtitle(): string;
    public function getOpenButtonText(): string;
    public function getInstallButtonText(): string;
    public function getInstallUrl(): string;
    public function getDismissDays(): int;
    public function getCurrentUrl(): string;
}
```

## Data Models

### Config Paths

| Path | Type | Default |
|------|------|---------|
| `nativemind_flutterbridge/app_banner/enabled` | bool | 0 |
| `nativemind_flutterbridge/app_banner/title` | string | Open in App |
| `nativemind_flutterbridge/app_banner/subtitle` | string | Better shopping experience |
| `nativemind_flutterbridge/app_banner/open_button_text` | string | Open |
| `nativemind_flutterbridge/app_banner/install_button_text` | string | Install |
| `nativemind_flutterbridge/app_banner/show_on_product` | bool | 1 |
| `nativemind_flutterbridge/app_banner/show_on_category` | bool | 1 |
| `nativemind_flutterbridge/app_banner/show_on_home` | bool | 1 |
| `nativemind_flutterbridge/app_banner/dismiss_cookie_days` | int | 7 |
| `nativemind_flutterbridge/app_banner/install_url` | string | |

## Behavior Specifications

### Page Type Detection

```php
$fullActionName = $request->getFullActionName();

switch ($fullActionName) {
    case 'catalog_product_view':
        return $this->config->showOnProduct();
    case 'catalog_category_view':
        return $this->config->showOnCategory();
    case 'cms_index_index':
        return $this->config->showOnHome();
    default:
        return false;
}
```

### Cookie Management

```javascript
// Cookie name
const COOKIE_NAME = 'nm_flutterbridge_banner_dismissed';

// Set cookie on dismiss
function dismiss() {
    const days = banner.dataset.dismissDays || 7;
    const expires = new Date();
    expires.setTime(expires.getTime() + (days * 24 * 60 * 60 * 1000));
    document.cookie = `${COOKIE_NAME}=1; expires=${expires.toUTCString()}; path=/`;
    banner.style.display = 'none';
}

// Check cookie on load
function shouldShow() {
    return !document.cookie.match(new RegExp(`(^| )${COOKIE_NAME}=`));
}
```

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Core disabled | `Core::isEnabled() = false` | No banner output |
| Banner disabled | `banner/enabled = 0` | No banner output |
| Page not configured | `show_on_product = 0` | No banner on products |
| No install URL | Empty config | Hide install button |
| Cookie exists | Previously dismissed | Banner stays hidden |

## CSS Specification

### Class Names (BEM, namespaced)

```css
.nm-flutterbridge-banner {}
.nm-flutterbridge-banner__content {}
.nm-flutterbridge-banner__text {}
.nm-flutterbridge-banner__title {}
.nm-flutterbridge-banner__subtitle {}
.nm-flutterbridge-banner__actions {}
.nm-flutterbridge-banner__btn {}
.nm-flutterbridge-banner__btn--open {}
.nm-flutterbridge-banner__btn--install {}
.nm-flutterbridge-banner__close {}
```

### Default Styles

```css
.nm-flutterbridge-banner {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 9999;
    padding: 12px 16px;
    background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
    color: #ffffff;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

/* Mobile only */
@media (min-width: 769px) {
    .nm-flutterbridge-banner {
        display: none !important;
    }
}
```

## Layout Specification

### default.xml

```xml
<?xml version="1.0"?>
<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
    <head>
        <css src="NativeMind_FlutterBridgeAppBanner::css/banner.css"/>
    </head>
    <body>
        <referenceContainer name="after.body.start">
            <block class="NativeMind\FlutterBridgeAppBanner\Block\Banner"
                   name="nativemind.flutterbridge.app.banner"
                   template="NativeMind_FlutterBridgeAppBanner::banner.phtml"
                   cacheable="true"/>
        </referenceContainer>
    </body>
</page>
```

### Template Structure

```html
<?php if ($block->isEnabled()): ?>
<div class="nm-flutterbridge-banner"
     id="nm-flutterbridge-banner"
     data-dismiss-days="<?= $block->escapeHtmlAttr($block->getDismissDays()) ?>"
     style="display: none;">
    <div class="nm-flutterbridge-banner__content">
        <div class="nm-flutterbridge-banner__text">
            <strong class="nm-flutterbridge-banner__title">
                <?= $block->escapeHtml($block->getTitle()) ?>
            </strong>
            <span class="nm-flutterbridge-banner__subtitle">
                <?= $block->escapeHtml($block->getSubtitle()) ?>
            </span>
        </div>
        <div class="nm-flutterbridge-banner__actions">
            <a class="nm-flutterbridge-banner__btn nm-flutterbridge-banner__btn--open"
               href="<?= $block->escapeUrl($block->getCurrentUrl()) ?>">
                <?= $block->escapeHtml($block->getOpenButtonText()) ?>
            </a>
            <?php if ($block->getInstallUrl()): ?>
            <a class="nm-flutterbridge-banner__btn nm-flutterbridge-banner__btn--install"
               href="<?= $block->escapeUrl($block->getInstallUrl()) ?>"
               target="_blank" rel="noopener">
                <?= $block->escapeHtml($block->getInstallButtonText()) ?>
            </a>
            <?php endif; ?>
        </div>
    </div>
    <button type="button" class="nm-flutterbridge-banner__close"
            id="nm-flutterbridge-banner-close" aria-label="Close">
        &times;
    </button>
</div>
<script>/* inline vanilla JS */</script>
<?php endif; ?>
```

## Dependencies

### Requires

- `NativeMind_FlutterBridgeCore` (enabled check)

### Optional Integration

- Can read install URLs from `NativeMind_FlutterBridgeAppLinks` if available

## Testing Strategy

### Unit Tests

- [ ] Config returns correct values
- [ ] Block correctly checks page types
- [ ] isEnabled respects all conditions

### Integration Tests

- [ ] Banner renders on product page
- [ ] Banner hidden on cart page
- [ ] CSS loaded correctly

### Manual Verification

- [ ] Banner appears on mobile
- [ ] Close button works
- [ ] Cookie persists across pages
- [ ] Open button navigates to app

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
