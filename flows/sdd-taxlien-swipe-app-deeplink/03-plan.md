# Implementation Plan: Deep Linking & Smart Banner

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-01-30
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary
План охватывает настройку зависимостей, реализацию `EnvConfig` для управления ссылками на сторы, создание виджета `SmartBanner` для Web и реализацию `DeepLinkService` для нативных приложений. Основной фокус на чистоте архитектуры и изоляции платформ.

## Task Breakdown

### Phase 1: Setup & Configuration

#### Task 1.1: Dependencies & Env Setup
- **Description**: Добавление необходимых пакетов и обновление конфигурации `.env`.
- **Files**:
  - `pubspec.yaml` - Add `app_links`, `device_info_plus`, `package_info_plus`.
  - `.env` - Add store URLs placeholders.
  - `lib/core/config/env_config.dart` - Create wrapper class.
- **Dependencies**: None
- **Verification**: `flutter pub get` проходит без ошибок. `EnvConfig` корректно читает переменные.
- **Complexity**: Low

#### Task 1.2: Android Configuration
- **Description**: Настройка `AndroidManifest.xml` для поддержки App Links.
- **Files**:
  - `android/app/src/main/AndroidManifest.xml` - Add intent filters.
- **Dependencies**: Task 1.1
- **Verification**: Build Android app successful.
- **Complexity**: Low

#### Task 1.3: iOS Configuration
- **Description**: Настройка `Runner.entitlements` и `Info.plist` для Universal Links.
- **Files**:
  - `ios/Runner/Runner.entitlements` - Enable Associated Domains.
  - `ios/Runner/Info.plist` - Check URL types.
- **Dependencies**: Task 1.1
- **Verification**: Build iOS app successful.
- **Complexity**: Low

### Phase 2: Core Implementation (Web & Native)

#### Task 2.1: Smart Banner Widget (Web)
- **Description**: Создание виджета, который отображается только на Web + Mobile. Определяет ОС и показывает нужный стор.
- **Files**:
  - `lib/features/deeplink/widgets/smart_banner.dart` - Create.
  - `lib/features/swipe/screens/home_screen.dart` - Integrate banner (conditionally).
  - `lib/features/details/screens/details_screen.dart` - Integrate banner.
- **Dependencies**: Task 1.1
- **Verification**: Запуск в Chrome (mobile emulation mode). Виден баннер, ведет на правильную ссылку.
- **Complexity**: Medium

#### Task 2.2: Deep Link Service (Native)
- **Description**: Сервис для прослушивания входящих ссылок через `app_links` и обработки Deferred Links (mock).
- **Files**:
  - `lib/features/deeplink/services/deep_link_service.dart` - Create.
  - `lib/main.dart` - Initialize service.
- **Dependencies**: Task 1.1
- **Verification**: Unit test logic. Integration test (manual): opening link logs output.
- **Complexity**: Medium

#### Task 2.3: Routing Integration
- **Description**: Связывание сервиса с `GoRouter` для навигации.
- **Files**:
  - `lib/core/navigation/app_router.dart` - Ensure router can handle external updates or service calls router.
  - `lib/main.dart` - Connect listener.
- **Dependencies**: Task 2.2
- **Verification**: Manual test. Link opens specific screen.
- **Complexity**: Medium

### Phase 3: Sharing & Polish

#### Task 3.1: Share Feature
- **Description**: Добавление кнопки "Share" на экран деталей.
- **Files**:
  - `lib/features/details/screens/details_screen.dart` - Add share button.
  - `lib/features/deeplink/services/share_service.dart` - Helper to generate links.
- **Dependencies**: Task 2.2
- **Verification**: Share opens native share sheet with correct URL.
- **Complexity**: Low

## Dependency Graph

```
Task 1.1 ─┬─→ Task 1.2 ─┐
          ├─→ Task 1.3 ─┴─→ Task 2.2 ─→ Task 2.3 ─→ Task 3.1
          │
          └─→ Task 2.1
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/core/config/env_config.dart` | Create | Type-safe env access |
| `lib/features/deeplink/**` | Create | New feature module |
| `android/app/src/main/AndroidManifest.xml` | Modify | App Links support |
| `ios/Runner/**` | Modify | Universal Links support |
| `lib/main.dart` | Modify | Init service |
| `lib/features/**/screens/**` | Modify | Add banner & share button |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| App Links not opening | Medium | High | Тщательная проверка intent-filter и SHA256 fingerprints (хотя они на сервере). Локальное тестирование через `adb`. |
| Banner shows on Desktop | Low | Low | Проверка `defaultTargetPlatform` и UserAgent. |

## Rollback Strategy
Revert `pubspec.yaml` changes and remove `lib/features/deeplink`.

---

## Approval
- [ ] Reviewed by: Anton
- [ ] Approved on: [Date]
