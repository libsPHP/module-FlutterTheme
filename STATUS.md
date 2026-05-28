# Project Status

Current status of flutter_magento packages and Magento modules.

## Flutter Packages

| Package | Status | Description |
|---------|--------|-------------|
| `flutter_magento_core` | **Stable** | Core interfaces, models, transport, errors |
| `flutter_magento_auth` | **Stable** | Authentication, login, registration |
| `flutter_magento_catalog` | **Stable** | Products, categories, search |
| `flutter_magento_cart` | **Stable** | Shopping cart operations |
| `flutter_magento_profile` | **Stable** | Customer profile, addresses |
| `flutter_magento_graphql` | **Stable** | GraphQL transport implementation |
| `flutter_magento_rest` | **Stable** | REST transport implementation |
| `flutter_magento_localizations` | **Stable** | i18n, currency formatting |
| `flutter_magento_ui` | **Stable** | Themed widgets |
| `flutter_magento_riverpod` | **Stable** | Riverpod state management |
| `flutter_magento_offline` | **Beta** | Offline support, sync engine |
| `flutter_magento_marketplace` | **Beta** | Multi-vendor support |
| `flutter_magento_blockchain` | **Experimental** | ICP/EVM payments, NFT products |
| `flutter_magento` | **Stable** | Umbrella package |

## Magento Modules

| Module | Status | Description |
|--------|--------|-------------|
| `NativeMind_BridgeCore` | **Stable** | Core configuration, shared utilities |
| `NativeMind_BridgeRoutes` | **Stable** | Route metadata, page context |
| `NativeMind_BridgeSeo` | **Beta** | Canonical URLs, robots, JSON-LD |
| `NativeMind_BridgeAppLinks` | **Stable** | Universal Links, App Links |
| `NativeMind_BridgeAppBanner` | **Beta** | Smart App Banner |
| `NativeMind_BridgeFlutterWeb` | **Experimental** | Flutter Web progressive enhancement |
| `NativeMind_BridgeDebug` | **Beta** | Debug tools, logging |
| `NativeMind_Bridge` | **Legacy** | Umbrella module (deprecated) |

## Status Definitions

- **Stable**: Production-ready, API frozen
- **Beta**: Feature-complete, API may change
- **Experimental**: Work in progress, not for production
- **Legacy**: Maintained for compatibility, prefer alternatives

## Version Compatibility

| Component | Version |
|-----------|---------|
| Magento Open Source | 2.4.x |
| Adobe Commerce | 2.4.x |
| Flutter | 3.x |
| Dart | 3.x |
| PHP | 8.1+ |

## Architecture Contracts

The following contracts are stable and should not change without major version bump:

### Route Metadata Standard (flutter_magento_v1)

```json
{
  "standard": "flutter_magento_v1",
  "type": "product|category|cms|search|cart|checkout|customer|home",
  "canonicalUrl": "https://shop.com/product-url.html",
  "sourceUrl": "https://shop.com/category/product-url.html?utm=x",
  "webPath": "/product-url.html",
  "appRoute": "/product/123",
  "entity": {"id": 123, "sku": "ABC", "urlKey": "product-url"},
  "store": {"websiteCode": "base", "storeCode": "default", "currency": "USD", "locale": "en_US"}
}
```

### Transport Interface

```dart
abstract interface class MagentoTransport {
  Future<MagentoResponse<T>> execute<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
  });
}
```

### Repository Interfaces

All repositories follow the pattern:
- Interface in `flutter_magento_core`
- Implementation in domain package
- Optional caching decorator in `flutter_magento_offline`

## Roadmap

### Next Release

- [ ] Complete SEO module (canonical consistency)
- [ ] Flutter Web progressive loading improvements
- [ ] Marketplace checkout flow

### Future

- [ ] MSI inventory support
- [ ] Advanced checkout orchestration
- [ ] Real-time updates (WebSocket)
