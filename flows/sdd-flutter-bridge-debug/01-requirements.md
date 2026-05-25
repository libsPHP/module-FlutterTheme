# Requirements: FlutterBridgeDebug

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

Developers and store integrators need debugging tools to verify FlutterBridge modules are working correctly. These debug endpoints and tools should be in a separate module that can be disabled in production.

## User Stories

### Primary

**As a** developer integrating FlutterBridge
**I want** debug endpoints to inspect current configuration
**So that** I can troubleshoot integration issues

**As a** QA engineer
**I want** to verify route payloads and SEO data
**So that** I can confirm correct implementation

### Secondary

**As a** developer
**I want** console logging of Flutter handoff
**So that** I can debug Flutter Web integration

## Acceptance Criteria

### Must Have

1. **Given** debug mode is enabled in Core
   **When** `/flutterbridge/debug/route` is accessed
   **Then** JSON response shows current route payload

2. **Given** debug mode is enabled
   **When** `/flutterbridge/debug/config` is accessed
   **Then** JSON response shows non-sensitive configuration

3. **Given** debug mode is disabled
   **When** debug endpoints are accessed
   **Then** 404 is returned

4. **Given** debug mode is enabled
   **When** page loads
   **Then** `console.log` outputs route handoff data

### Should Have

- `/flutterbridge/debug/seo` - Show canonical, robots, JSON-LD data
- `/flutterbridge/debug/applinks` - Show app links configuration
- Debug toolbar integration (if Magento debug toolbar enabled)

### Won't Have (This Iteration)

- Production logging
- Performance profiling
- Error reporting service integration

## Constraints

- **Dependencies**: Requires `NativeMind_FlutterBridgeCore`
- **Security**: Must check debug mode before exposing data
- **No secrets**: Never expose API keys, fingerprints, etc.

## Config Scope

```text
Uses nativemind_flutterbridge/general/debug_mode from Core
No additional config needed
```

## Debug Endpoints

```text
GET /flutterbridge/debug/route
Response: Current page route payload JSON

GET /flutterbridge/debug/config
Response: {
  "core": { "enabled": true, "version": "2.0.0" },
  "routes": { "enabled": true, "standard": "flutter_magento_v1" },
  "seo": { "canonical_enabled": true, ... },
  "applinks": { "android_enabled": true, "ios_enabled": false },
  "appbanner": { "enabled": false },
  "flutterweb": { "enabled": true, "assets_url": "..." }
}

GET /flutterbridge/debug/seo
Response: {
  "canonical": "https://...",
  "robots": "index,follow",
  "jsonld": { ... },
  "opengraph": { ... }
}

GET /flutterbridge/debug/applinks
Response: {
  "android": { "package": "...", "assetlinks_url": "..." },
  "ios": { "team_id": "...", "aasa_url": "..." }
}
```

## Console Debug Output

```javascript
// When debug mode enabled and FlutterWeb active
console.group('[FlutterBridge Debug]');
console.log('Route:', window.flutterMagentoRoute);
console.log('Flutter Status:', 'loading|ready|error');
console.log('Load Time:', '1234ms');
console.groupEnd();
```

## Open Questions

- [x] IP restriction for debug endpoints? → No, rely on debug_mode setting
- [x] Include in production deploys? → Yes, module is optional

## References

- Original: `Controller/Debug/Route.php`
- Magento Profiler/Debug Toolbar

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
