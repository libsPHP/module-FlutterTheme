# FlutterBridge Module Split - Master Overview

> Last Updated: 2026-05-25

## Summary

Splitting the monolithic `NativeMind_FlutterBridge` into 7 independent capability modules:

| Module | Purpose | Dependencies |
|--------|---------|--------------|
| **Core** | Base config, enabled/debug flags | Magento only |
| **Routes** | flutter_magento_v1 route metadata | Core |
| **Seo** | Canonical, robots, JSON-LD, OpenGraph | Core |
| **AppLinks** | .well-known endpoints for mobile app links | Core |
| **AppBanner** | "Open in App" visual banner | Core |
| **FlutterWeb** | Progressive enhancement with Flutter Web | Core, (Routes) |
| **Debug** | Debug endpoints and console logging | Core |

## Module Dependency Graph

```text
                    ┌──────────────────────────────────────────┐
                    │         NativeMind_FlutterBridgeCore     │
                    │   (enabled, debug_mode, version)         │
                    └──────────────────────────────────────────┘
                                        │
           ┌────────────────────────────┼────────────────────────────┐
           │              │             │             │              │
           ▼              ▼             ▼             ▼              ▼
      ┌─────────┐   ┌─────────┐   ┌──────────┐  ┌──────────┐  ┌─────────┐
      │ Routes  │   │   Seo   │   │ AppLinks │  │AppBanner │  │  Debug  │
      └─────────┘   └─────────┘   └──────────┘  └──────────┘  └─────────┘
           │
           │ (recommended)
           ▼
      ┌───────────┐
      │FlutterWeb │
      └───────────┘
```

## Installation Scenarios

### Minimal (Route metadata only)
```bash
composer require nativemind/module-flutter-bridge-core
composer require nativemind/module-flutter-bridge-routes
```

### SEO Enhancement
```bash
composer require nativemind/module-flutter-bridge-core
composer require nativemind/module-flutter-bridge-seo
```

### Full Native App Support
```bash
composer require nativemind/module-flutter-bridge-core
composer require nativemind/module-flutter-bridge-routes
composer require nativemind/module-flutter-bridge-applinks
composer require nativemind/module-flutter-bridge-appbanner
```

### Progressive Flutter Web
```bash
composer require nativemind/module-flutter-bridge-core
composer require nativemind/module-flutter-bridge-routes
composer require nativemind/module-flutter-bridge-seo
composer require nativemind/module-flutter-bridge-flutterweb
```

### Everything + Debug
```bash
composer require nativemind/module-flutter-bridge-core
composer require nativemind/module-flutter-bridge-routes
composer require nativemind/module-flutter-bridge-seo
composer require nativemind/module-flutter-bridge-applinks
composer require nativemind/module-flutter-bridge-appbanner
composer require nativemind/module-flutter-bridge-flutterweb
composer require nativemind/module-flutter-bridge-debug
```

## Implementation Order

Based on dependencies and risk:

1. **Core** - Foundation, must be first
2. **Routes** - Core feature, no SEO risk
3. **Seo** - Can run parallel with Routes
4. **AppLinks** - Independent capability
5. **AppBanner** - Independent capability
6. **Debug** - Useful for testing previous modules
7. **FlutterWeb** - Most complex, depends on Routes working

## SDD Flow Status

| Module | Flow Directory | Phase |
|--------|----------------|-------|
| Core | `flows/sdd-flutter-bridge-core/` | PLAN (draft) |
| Routes | `flows/sdd-flutter-bridge-routes/` | PLAN (draft) |
| Seo | `flows/sdd-flutter-bridge-seo/` | PLAN (draft) |
| AppLinks | `flows/sdd-flutter-bridge-applinks/` | PLAN (draft) |
| AppBanner | `flows/sdd-flutter-bridge-appbanner/` | PLAN (draft) |
| FlutterWeb | `flows/sdd-flutter-bridge-flutterweb/` | PLAN (draft) |
| Debug | `flows/sdd-flutter-bridge-debug/` | PLAN (draft) |

## Key Design Principles

### 1. No Bot Detection
```text
NEVER detect Googlebot/YandexBot/BingBot
NEVER serve different HTML to bots
ALWAYS same HTML response for everyone
```

### 2. Progressive Enhancement
```text
Magento HTML = base content (always visible to no-JS)
JS enabled = optional enhancement (Flutter Web)
Flutter failure = graceful fallback to Magento
```

### 3. Theme Agnostic
```text
NO template overrides
ONLY layout XML block injection
Works with: Luma, Blank, Hyva, custom themes
```

### 4. Modular Independence
```text
Each module works standalone (except Core dependency)
No cross-module assumptions
Config in own section under nativemind_flutterbridge/*
```

## Next Steps

1. Review and approve requirements for each module
2. Create specifications (architecture, interfaces)
3. Create implementation plans
4. Implement in dependency order
5. Integration testing
