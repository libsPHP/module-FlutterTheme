# Specifications: Facebook App Events

> Version: 1.0  
> Status: DRAFT  
> Last Updated: 2026-02-04  
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

Интеграция Facebook App Events для Deal Detective обеспечивает маркетинговую аналитику и attribution. Включает стандартные и кастомные события, поддержку ATT (iOS App Tracking Transparency) и интеграцию с существующими экранами и сервисами.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `lib/core/config/env_config.dart` | Modify | Добавить FACEBOOK_APP_ID, FACEBOOK_CLIENT_TOKEN |
| `lib/features/analytics/` | Create | Новый модуль для абстракции аналитики |
| `lib/features/swipe/` | Modify | Вызов events при swipe actions |
| `lib/features/details/` | Modify | ViewContent, AddToWishlist |
| `lib/features/onboarding/` | Modify | CompleteRegistration |
| `lib/main.dart` | Modify | Инициализация Facebook SDK, ATT |
| `android/app/` | Modify | Facebook App ID в манифесте |
| `ios/Runner/` | Modify | Info.plist, ATT usage description |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         DEAL DETECTIVE APP                               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  SwipeProvider ──► AnalyticsService ──┬─► FacebookAppEventsPlugin       │
│  FilterProvider ──┤                   │                                  │
│  OnboardingProvider ─┤                └─► (future: Firebase)            │
│  DetailsProvider ───┤                                                   │
│  FamilyBoardService ─┘                                                  │
│                                                                         │
│  EnvConfig.isFacebookEnabled ──► guard before sending                   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### Data Flow

```
User Action (swipe/view/like)
    │
    ▼
Feature Provider/Service
    │
    ▼
AnalyticsService.logEvent(...)
    │
    ├── if !EnvConfig.isFacebookEnabled → no-op
    └── if enabled → FacebookAppEvents.logEvent(...)
```

## Interfaces

### FacebookAppEventsService (marketing analytics)

Separate from Firebase product analytics. Implements marketing events for attribution. Runs in parallel with AnalyticsService (Firebase).

```dart
// lib/features/analytics/facebook_app_events_service.dart

abstract class FacebookAppEventsService {
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters});
  Future<void> setUserProperty(String name, dynamic value);
  
  /// Standard events for marketing attribution
  Future<void> logCompleteRegistration();
  Future<void> logSearch(String searchString);
  Future<void> logViewContent(String propertyId, {double? price});
  Future<void> logAddToWishlist(String propertyId, {double? price});
  Future<void> logInitiateCheckout(String propertyId, double amount);
  Future<void> logPurchase(String propertyId, double amount);
  
  /// Custom DD events
  Future<void> logSwipeLeft(String propertyId, {double? foreclosureProb});
  Future<void> logSwipeRight(String propertyId, {double? foreclosureProb, double? fvi});
  Future<void> logAnnotationAdded(String propertyId, String expertRole);
  Future<void> logForeclosureFilterToggled(bool enabled);
  Future<void> logModeSwitch(String newMode);
}

class FacebookAppEventsServiceImpl implements FacebookAppEventsService {
  final FacebookAppEvents _plugin;
  final bool _enabled;
  
  FacebookAppEventsServiceImpl({required FacebookAppEvents plugin, required bool enabled});
  
  @override
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    if (!_enabled) return;
    await _plugin.logEvent(name: name, parameters: parameters);
  }
  // ... map standard/custom events to Facebook App Events API
}
```

## Data Models

### EnvConfig Extensions

```dart
// lib/core/config/env_config.dart

class EnvConfig {
  static const facebookAppId = String.fromEnvironment(
    'FACEBOOK_APP_ID',
    defaultValue: '',
  );

  static const facebookClientToken = String.fromEnvironment(
    'FACEBOOK_CLIENT_TOKEN',
    defaultValue: '',
  );

  static bool get isFacebookEnabled =>
    facebookAppId.isNotEmpty && facebookClientToken.isNotEmpty;
}
```

## Behavior Specifications

### Happy Path

1. App starts → Facebook SDK initialized (if enabled)
2. User completes onboarding → `CompleteRegistration` sent
3. User swipes right → `AddToWishlist` + `dd_swipe_right` sent
4. User opens property details → `ViewContent` sent
5. User applies filter → `Search` sent

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Facebook disabled (dev) | `isFacebookEnabled == false` | All log calls no-op, no crash |
| ATT declined | User denies tracking | Events sent with limited data; SKAdNetwork used |
| Network offline | No connection | Events queued; sent when online |
| Missing property_id | Edge case in code | Validate before send; skip if invalid |

### Error Handling

| Error | Cause | Response |
|-------|-------|----------|
| SDK not initialized | Config missing | Silent no-op, log to debug |
| Invalid parameters | PII detected | Sanitize or skip event |
| Plugin exception | Facebook SDK bug | Catch, log, don't crash app |

## Dependencies

### Pubspec
- `facebook_app_events`: ^0.18.0 (Facebook SDK Flutter)
- `app_tracking_transparency`: ^2.0.3 (iOS ATT)

### Requires
- Facebook Developer App with App ID and Client Token
- iOS: Info.plist `NSUserTrackingUsageDescription`
- Android: AndroidManifest meta-data for fb_app_id

### Blocks
- None (analytics is additive)

## Integration Points

### Call Sites (from requirements)

| Event | Location | Trigger |
|-------|----------|---------|
| CompleteRegistration | `ReadyScreen` / onboarding complete | User finishes onboarding |
| Search | `FilterProvider.apply()` | Filter applied |
| ViewContent | `DetailsScreen` init | Property details opened |
| AddToWishlist | `SwipeProvider.like()` | Swipe right |
| dd_swipe_left | `SwipeProvider.pass()` | Swipe left |
| dd_swipe_right | `SwipeProvider.like()` | Swipe right |
| dd_annotation_added | `AnnotationScreen` save | Annotation saved |
| dd_foreclosure_filter_on | `FilterProvider` | Foreclosure toggle |
| dd_mode_switch | Profile/Onboarding | Mode change |

## ATT (App Tracking Transparency)

### iOS Flow

1. Before any Facebook tracking: call `requestTrackingAuthorization()`
2. Show custom message (from requirements)
3. If `.authorized` → full IDFA, standard events
4. If `.denied` → limited ad attribution via SKAdNetwork
5. Store result; don't prompt again

### Implementation

```dart
// lib/features/analytics/att_service.dart

Future<void> requestTrackingPermission() async {
  if (!Platform.isIOS) return;
  final status = await AppTrackingTransparency.requestTrackingAuthorization();
  // Store status, configure Facebook SDK accordingly
}
```

## Testing Strategy

### Unit Tests
- [ ] `AnalyticsService` — verify no-op when disabled
- [ ] `FacebookAppEventsImpl` — mock plugin, verify correct event names/params
- [ ] `EnvConfig` — test fromEnvironment defaults

### Integration Tests
- [ ] Verify events sent on swipe (with mock)
- [ ] Verify ATT prompt shown on iOS (manual)

### Manual Verification
- [ ] Facebook Events Manager shows events
- [ ] ATT prompt appears on first launch (iOS)
- [ ] Dev build with empty config: no crashes

## Migration / Rollout

- Feature flag: `isFacebookEnabled` gates all sends
- Can ship with empty config (disabled) and enable later via CI secrets
- ATT: prompt timing — after onboarding welcome, before first property load

## Open Design Questions

- [ ] Нужен ли отдельный ATT prompt или объединить с location permission?
- [ ] Batching strategy for events (battery optimization)

---

## Approval

- [ ] Reviewed by:
- [ ] Approved on:
- [ ] Notes:
