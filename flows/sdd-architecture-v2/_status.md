# Status: sdd-architecture-v2

## Current Phase

COMPLETE

## Phase Status

DONE

## Last Updated

2026-05-27 by Claude

## Blockers

- None

## Progress

- [x] Requirements drafted (from user review)
- [x] Requirements approved
- [x] Specifications drafted
- [x] Specifications approved
- [x] Plan drafted
- [x] Plan approved
- [x] Implementation started
- [x] Implementation complete

## Implementation Summary

### 1. RouteMeta Refactored to Services

Created service architecture:
- `RoutePayloadBuilderInterface` - contract for payload builders
- `CanonicalResolverInterface` - single source of truth for canonicals
- `DefaultCanonicalResolver` - implementation using Magento's URL logic
- `RoutePayloadBuilderPool` - composite for delegating to specific builders
- `ProductRoutePayloadBuilder` - product page handler
- `CategoryRoutePayloadBuilder` - category page handler
- `CmsRoutePayloadBuilder` - CMS page handler
- `SearchRoutePayloadBuilder` - search results handler
- `SimpleRoutePayloadBuilder` - cart/checkout/customer/home handler
- DI configuration in `etc/di.xml`
- Simplified `Block\RouteMeta` to only detect type and delegate

### 2. sourceUrl/canonicalUrl Consistency

- Added `sourceUrl` field to `RoutePayload`
- `sourceUrl` captures actual request URL (with tracking params, category path)
- `canonicalUrl` is normalized via `CanonicalResolverInterface`
- JSON output includes `sourceUrl` only when different from `canonicalUrl`

### 3. Dart-side Route Payload Parser

Created in `flutter_magento_core`:
- `MagentoRouteType` enum with all page types
- `MagentoRoutePayload` class mirroring PHP RoutePayload
- `MagentoRouteParser` with:
  - `fromJson()` - parse flutter-magento-route JSON
  - `fromUniversalLink()` - parse deep link URI
  - `fromAppRoute()` - parse app route string
- Helper accessors for entity data (productId, sku, categoryId, etc.)

### 4. Enhanced FlutterWeb Loader Config

Extended `Config.php` with:
- `allowedPageTypes` - which pages get Flutter enhancement
- `hideStrategy` - when to hide Magento HTML (on_ready recommended)
- `fallbackSelector` - Magento content selector
- `flutterRootSelector` - Flutter root element
- `bootstrapScript` - path to flutter.js
- `assetVersion` - cache busting
- `renderer` - auto/html/canvaskit
- `loadMode` - auto/manual/after_interaction
- `failureMode` - fallback/reload/silent

Updated `Loader.php` to expose full config as JSON.

### 5. Compatibility Status Table

Created `STATUS.md` with:
- Package status table (Stable/Beta/Experimental)
- Module status table
- Status definitions
- Version compatibility matrix
- Architecture contracts documentation
- Roadmap

## Files Created/Modified

### PHP (Magento)
- `NativeMind_BridgeRoutes/Model/Route/RoutePayloadBuilderInterface.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/CanonicalResolverInterface.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/DefaultCanonicalResolver.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/RoutePayloadBuilderPool.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/ProductRoutePayloadBuilder.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/CategoryRoutePayloadBuilder.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/CmsRoutePayloadBuilder.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/SearchRoutePayloadBuilder.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/SimpleRoutePayloadBuilder.php` (new)
- `NativeMind_BridgeRoutes/Model/Route/RoutePayload.php` (modified - added sourceUrl)
- `NativeMind_BridgeRoutes/Block/RouteMeta.php` (modified - delegates to services)
- `NativeMind_BridgeRoutes/etc/di.xml` (new)
- `NativeMind_BridgeFlutterWeb/Helper/Config.php` (modified - new config options)
- `NativeMind_BridgeFlutterWeb/Block/Loader.php` (modified - full config)

### Dart (Flutter)
- `flutter_magento_core/lib/src/route/magento_route_type.dart` (new)
- `flutter_magento_core/lib/src/route/magento_route_payload.dart` (new)
- `flutter_magento_core/lib/src/route/magento_route_parser.dart` (new)
- `flutter_magento_core/lib/flutter_magento_core.dart` (modified - exports)

### Documentation
- `STATUS.md` (new)

## Next Actions

- Update related SDD flows (routes, flutterweb) to reference this architecture
- Add unit tests for new Dart route parser
- Add admin system.xml for new FlutterWeb config fields
