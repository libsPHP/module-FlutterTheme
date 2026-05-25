# Requirements: FlutterBridgeAppLinks

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

Flutter mobile apps need App Links (Android) and Universal Links (iOS) to intercept web URLs and open them in the native app. This requires serving specific JSON files at `.well-known` paths that the operating systems verify.

## User Stories

### Primary

**As a** Flutter app developer
**I want** Magento to serve `/.well-known/assetlinks.json` for Android
**So that** Android can verify my app owns this domain for App Links

**As a** Flutter app developer
**I want** Magento to serve `/.well-known/apple-app-site-association` for iOS
**So that** iOS can verify my app owns this domain for Universal Links

### Secondary

**As a** store admin
**I want** to configure package name and SHA256 fingerprints in admin
**So that** I don't need to deploy static files manually

## Acceptance Criteria

### Must Have

1. **Given** Android App Links is enabled with valid config
   **When** `/.well-known/assetlinks.json` is requested
   **Then** valid JSON is returned with configured package name and fingerprints

2. **Given** iOS Universal Links is enabled with valid config
   **When** `/.well-known/apple-app-site-association` is requested
   **Then** valid JSON is returned with configured team ID and bundle ID

3. **Given** App Links is disabled
   **When** `.well-known` endpoints are requested
   **Then** 404 is returned (let Magento/webserver handle it)

4. **Given** incomplete configuration (missing package name)
   **When** endpoint is requested
   **Then** empty array `[]` is returned

### Should Have

- Multiple SHA256 fingerprints support (for debug/release keys)
- Path pattern configuration for selective app handling

### Won't Have (This Iteration)

- Web Credentials (passwords)
- Activity continuation
- Handoff

## Constraints

- **Dependencies**: Requires `NativeMind_FlutterBridgeCore`
- **Routing**: Custom router needed for `.well-known` paths (Magento standard routing doesn't support dots in paths)
- **Content-Type**: Must return `application/json`

## Config Scope

```text
nativemind_flutterbridge/app_links/
  - android_enabled
  - android_package_name (e.g., com.example.app)
  - android_sha256_fingerprints (textarea, one per line)
  - android_playstore_url (optional, for banner)
  - ios_enabled
  - ios_team_id (e.g., ABC123DEF4)
  - ios_bundle_id (e.g., com.example.app)
  - ios_appstore_url (optional, for banner)
```

## Endpoint Specifications

### Android: `/.well-known/assetlinks.json`

```json
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "com.example.app",
    "sha256_cert_fingerprints": [
      "AA:BB:CC:..."
    ]
  }
}]
```

### iOS: `/.well-known/apple-app-site-association`

```json
{
  "applinks": {
    "apps": [],
    "details": [{
      "appID": "ABC123DEF4.com.example.app",
      "paths": ["*"]
    }]
  }
}
```

## Open Questions

- [x] How to handle `.well-known` routing? → Custom Router class
- [x] Support multiple apps per domain? → Not in v1, single app config

## References

- Android App Links: https://developer.android.com/training/app-links
- iOS Universal Links: https://developer.apple.com/documentation/xcode/supporting-universal-links-in-your-app
- Original: `Controller/WellKnown/*`, `Model/AppLinks/*`, `Controller/Router.php`

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
