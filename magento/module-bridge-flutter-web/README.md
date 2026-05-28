# NativeMind Bridge Flutter Web for Magento 2

[![Latest Stable Version](https://poser.pugx.org/nativemind/module-bridge-flutterweb/v/stable)](https://packagist.org/packages/nativemind/module-bridge-flutterweb)
[![License](https://poser.pugx.org/nativemind/module-bridge-flutterweb/license)](https://packagist.org/packages/nativemind/module-bridge-flutterweb)

Flutter Web integration module for Flutter Bridge - enables progressive enhancement with Flutter Web components on your Magento storefront.

## Overview

This module allows you to:

- Embed Flutter Web widgets in Magento pages
- Load Flutter Web builds from CDN or local storage
- Progressive enhancement without replacing the theme
- Share route context between Magento and Flutter

**Note**: This module does not bundle Flutter Web builds - you deploy them separately.

## Requirements

- Magento 2.4.x
- PHP 8.1+
- nativemind/module-bridge-core ^2.0
- nativemind/module-bridge-routes ^2.0

## Installation

### Via Composer (Recommended)

```bash
composer require nativemind/module-bridge-flutterweb
bin/magento module:enable NativeMind_BridgeFlutterWeb
bin/magento setup:upgrade
bin/magento cache:flush
```

## Configuration

Navigate to: **Stores > Configuration > NativeMind > Flutter Bridge > Flutter Web**

### General Settings

| Setting | Description |
|---------|-------------|
| Enable Flutter Web | Activate Flutter Web integration |
| Load Mode | `lazy` / `eager` / `on-interaction` |

### Build Location

| Setting | Description |
|---------|-------------|
| Build URL | URL to Flutter Web build (e.g., `https://cdn.example.com/flutter/`) |
| Local Path | Or local path under `pub/flutter/` |
| Service Worker | Enable Flutter service worker |

### Widget Configuration

| Setting | Description |
|---------|-------------|
| Container Selector | CSS selector for Flutter container |
| Initial Route | Starting route for Flutter app |
| Pass Route Context | Send Magento route data to Flutter |

## Usage

### 1. Build Your Flutter Web App

```bash
cd your_flutter_app
flutter build web --release
```

### 2. Deploy to Magento

Copy build output to `pub/flutter/`:

```bash
cp -r build/web/* /path/to/magento/pub/flutter/
```

Or deploy to CDN and configure URL in admin.

### 3. Add Container to Theme

In your layout XML:

```xml
<referenceContainer name="content">
    <block class="NativeMind\BridgeFlutterWeb\Block\FlutterContainer"
           name="flutter.container"
           template="NativeMind_BridgeFlutterWeb::container.phtml">
        <arguments>
            <argument name="container_id" xsi:type="string">flutter-app</argument>
        </arguments>
    </block>
</referenceContainer>
```

Or use CMS block:

```
{{block class="NativeMind\BridgeFlutterWeb\Block\FlutterContainer" container_id="flutter-app"}}
```

### 4. Flutter Receives Route Context

In your Flutter app:

```dart
import 'dart:html' as html;
import 'dart:convert';

void main() {
  // Get route context from Magento
  final routeElement = html.document.getElementById('flutter-magento-route');
  if (routeElement != null) {
    final routeData = jsonDecode(routeElement.text!);
    print('Page type: ${routeData['type']}');
    print('App route: ${routeData['appRoute']}');
  }

  runApp(MyApp());
}
```

## Progressive Enhancement Examples

### Product Page Widget

Replace product gallery with Flutter:

```xml
<referenceContainer name="product.info.media">
    <block class="NativeMind\BridgeFlutterWeb\Block\FlutterContainer"
           name="flutter.product.gallery"
           template="NativeMind_BridgeFlutterWeb::container.phtml">
        <arguments>
            <argument name="container_id" xsi:type="string">flutter-gallery</argument>
            <argument name="initial_route" xsi:type="string">/widget/gallery</argument>
        </arguments>
    </block>
</referenceContainer>
```

### Mini Cart Widget

```xml
<referenceBlock name="minicart">
    <block class="NativeMind\BridgeFlutterWeb\Block\FlutterContainer"
           name="flutter.minicart">
        <arguments>
            <argument name="container_id" xsi:type="string">flutter-minicart</argument>
            <argument name="initial_route" xsi:type="string">/widget/minicart</argument>
        </arguments>
    </block>
</referenceBlock>
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
