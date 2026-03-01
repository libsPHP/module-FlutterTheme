# Implementation Plan: Facebook App Events

> Version: 1.0  
> Status: DRAFT  
> Last Updated: 2026-02-04  
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

Интеграция Facebook App Events в Deal Detective: добавление пакетов, создание AnalyticsService, внедрение вызовов в существующие провайдеры, настройка ATT для iOS.

## Task Breakdown

### Phase 1: Foundation

#### Task 1.1: Add dependencies
- **Description**: Добавить facebook_app_events и app_tracking_transparency в pubspec
- **Files**: `pubspec.yaml`
- **Dependencies**: None
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Extend EnvConfig
- **Description**: Добавить FACEBOOK_APP_ID, FACEBOOK_CLIENT_TOKEN, isFacebookEnabled
- **Files**: `lib/core/config/env_config.dart`
- **Dependencies**: Task 1.1
- **Verification**: Unit test for defaults
- **Complexity**: Low

#### Task 1.3: Create FacebookAppEventsService interface and impl
- **Description**: Создать FacebookAppEventsService и FacebookAppEventsServiceImpl
- **Files**:
  - `lib/features/analytics/facebook_app_events_service.dart` — Create
  - `lib/features/analytics/facebook_app_events_impl.dart` — Create
- **Dependencies**: Task 1.1, 1.2
- **Verification**: Unit test with mock plugin
- **Complexity**: Medium

### Phase 2: Platform Setup

#### Task 2.1: iOS configuration
- **Description**: Info.plist — NSUserTrackingUsageDescription, FacebookAppID, FacebookClientToken
- **Files**: `ios/Runner/Info.plist`
- **Dependencies**: Task 1.1
- **Verification**: Build iOS app
- **Complexity**: Low

#### Task 2.2: Android configuration
- **Description**: AndroidManifest meta-data для fb_app_id, fb_client_token
- **Files**: `android/app/src/main/AndroidManifest.xml`
- **Dependencies**: Task 1.1
- **Verification**: Build Android app
- **Complexity**: Low

### Phase 3: ATT and Initialization

#### Task 3.1: ATT service (iOS)
- **Description**: Реализовать запрос App Tracking Transparency
- **Files**: `lib/features/analytics/att_service.dart` — Create
- **Dependencies**: Task 1.1
- **Verification**: Manual test on iOS device
- **Complexity**: Medium

#### Task 3.2: Initialize Facebook SDK in main.dart
- **Description**: Вызвать FacebookSDK.init(), ATT перед first frame
- **Files**: `lib/main.dart`
- **Dependencies**: Task 1.3, 3.1
- **Verification**: App starts without crash
- **Complexity**: Medium

### Phase 4: Event Integration

#### Task 4.1: Provider FacebookAppEventsService
- **Description**: Добавить FacebookAppEventsService в дерево Provider
- **Files**: `lib/main.dart`
- **Dependencies**: Task 1.3
- **Verification**: Provider.of<FacebookAppEventsService> works
- **Complexity**: Low

#### Task 4.2: Onboarding events
- **Description**: CompleteRegistration при завершении onboarding
- **Files**: `lib/features/onboarding/screens/ready_screen.dart` or onboarding_service
- **Dependencies**: Task 4.1
- **Verification**: Event in Facebook Events Manager
- **Complexity**: Low

#### Task 4.3: Swipe events
- **Description**: AddToWishlist, dd_swipe_left, dd_swipe_right в SwipeProvider
- **Files**: `lib/features/swipe/providers/swipe_provider.dart`
- **Dependencies**: Task 4.1
- **Verification**: Events on swipe
- **Complexity**: Low

#### Task 4.4: Details events
- **Description**: ViewContent при открытии property details
- **Files**: `lib/features/details/screens/details_screen.dart` or provider
- **Dependencies**: Task 4.1
- **Verification**: Event on details open
- **Complexity**: Low

#### Task 4.5: Filter events
- **Description**: Search, dd_foreclosure_filter_toggled
- **Files**: `lib/features/swipe/providers/filter_provider.dart`
- **Dependencies**: Task 4.1
- **Verification**: Events on filter apply
- **Complexity**: Low

#### Task 4.6: Annotation events
- **Description**: dd_annotation_added при сохранении
- **Files**: `lib/features/annotation/screens/annotation_screen.dart`
- **Dependencies**: Task 4.1
- **Verification**: Event on annotation save
- **Complexity**: Low

#### Task 4.7: Mode switch event
- **Description**: dd_mode_switch при смене Beginner/Expert
- **Files**: Profile/Onboarding screens
- **Dependencies**: Task 4.1
- **Verification**: Event on mode change
- **Complexity**: Low

### Phase 5: Testing & Polish

#### Task 5.1: Unit tests
- **Description**: Tests для FacebookAppEventsService, EnvConfig, impl
- **Files**: `test/unit_tests/analytics_service_test.dart`
- **Dependencies**: Phase 4 complete
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
1.1 ─┬─→ 1.2 ─→ 1.3 ─┬─→ 3.2 ─→ 4.1 ─┬─→ 4.2
     │               │                ├─→ 4.3
     │               │                ├─→ 4.4
1.1 ─┼─→ 2.1        │                ├─→ 4.5
     │               │                ├─→ 4.6
1.1 ─┼─→ 2.2        │                └─→ 4.7
     │               │
     └─→ 3.1 ────────┘

4.x ─→ 5.1
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| pubspec.yaml | Modify | Add facebook_app_events, app_tracking_transparency |
| lib/core/config/env_config.dart | Modify | Facebook config |
| lib/features/analytics/facebook_app_events_service.dart | Create | Interface |
| lib/features/analytics/facebook_app_events_impl.dart | Create | Implementation |
| lib/features/analytics/att_service.dart | Create | ATT logic |
| lib/main.dart | Modify | Init, Provider |
| lib/features/swipe/providers/swipe_provider.dart | Modify | Events |
| lib/features/swipe/providers/filter_provider.dart | Modify | Events |
| lib/features/details/ | Modify | ViewContent |
| lib/features/onboarding/ | Modify | CompleteRegistration |
| lib/features/annotation/ | Modify | dd_annotation_added |
| ios/Runner/Info.plist | Modify | ATT, Facebook |
| android/.../AndroidManifest.xml | Modify | Facebook meta |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| ATT rejection rate high | Med | Low | Clear value prop in prompt |
| Facebook SDK breaking change | Low | Med | Pin version, test before upgrade |
| Events not received (config) | Med | Low | Log when disabled, doc for CI |

## Rollback Strategy

1. Set FACEBOOK_APP_ID="" in CI → all events no-op
2. Revert Provider registration to remove AnalyticsService
3. Remove package from pubspec if full rollback needed

## Checkpoints

- [ ] Phase 1: flutter pub get, EnvConfig tests pass
- [ ] Phase 2: iOS/Android builds succeed
- [ ] Phase 3: ATT prompt shows on iOS
- [ ] Phase 4: Events visible in Facebook Events Manager (test mode)
- [ ] Phase 5: All unit tests pass

---

## Approval

- [ ] Reviewed by:
- [ ] Approved on:
- [ ] Notes:
