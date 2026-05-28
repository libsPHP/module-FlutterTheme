# NativeMind Bridge Core for Magento 2

[![Latest Stable Version](https://poser.pugx.org/nativemind/module-bridge-core/v/stable)](https://packagist.org/packages/nativemind/module-bridge-core)
[![License](https://poser.pugx.org/nativemind/module-bridge-core/license)](https://packagist.org/packages/nativemind/module-bridge-core)

Core module for NativeMind Flutter Bridge - provides shared configuration, utilities, and base functionality for all Bridge modules.

## Overview

This is the foundational module required by all other NativeMind Bridge modules. It provides:

- Shared admin configuration interface
- Common helper classes
- Base system configuration
- Store context utilities

## Requirements

- Magento 2.4.x
- PHP 8.1+

## Installation

### Via Composer (Recommended)

```bash
composer require nativemind/module-bridge-core
bin/magento module:enable NativeMind_BridgeCore
bin/magento setup:upgrade
bin/magento cache:flush
```

### Manual Installation

1. Create directory `app/code/NativeMind/BridgeCore`
2. Copy all files to this directory
3. Run:

```bash
bin/magento module:enable NativeMind_BridgeCore
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge**

### General Settings

| Setting | Description |
|---------|-------------|
| Enable Module | Enable/disable all Flutter Bridge functionality |
| Debug Mode | Enable debug logging and route verification endpoint |

## Dependent Modules

This module is required by:

- [nativemind/module-bridge-routes](https://packagist.org/packages/nativemind/module-bridge-routes) - Route metadata
- [nativemind/module-bridge-seo](https://packagist.org/packages/nativemind/module-bridge-seo) - SEO optimization
- [nativemind/module-bridge-applinks](https://packagist.org/packages/nativemind/module-bridge-applinks) - App Links
- [nativemind/module-bridge-appbanner](https://packagist.org/packages/nativemind/module-bridge-appbanner) - Smart App Banner
- [nativemind/module-bridge-debug](https://packagist.org/packages/nativemind/module-bridge-debug) - Debug tools
- [nativemind/module-bridge-flutterweb](https://packagist.org/packages/nativemind/module-bridge-flutterweb) - Flutter Web

## API

### Helper Classes

```php
use NativeMind\BridgeCore\Helper\Config;

class YourClass
{
    public function __construct(
        private Config $configHelper
    ) {}

    public function example(): void
    {
        if ($this->configHelper->isEnabled()) {
            // Module is enabled
        }

        if ($this->configHelper->isDebugMode()) {
            // Debug mode is active
        }
    }
}
```

## License

NativeMindNONC License - see [LICENSE](LICENSE)

## Related Projects

- [flutter_magento](https://pub.dev/packages/flutter_magento) - Flutter SDK for Magento
- [nativemind/module-bridge](https://packagist.org/packages/nativemind/module-bridge) - Umbrella module

## Support

- **Website**: https://nativemind.net
- **Issues**: GitHub Issues
