# Requirements: Facebook App Events

**Version:** 1.0
**Status:** DRAFT
**Last Updated:** 2026-02-03

---

## Problem Statement

Deal Detective нуждается в отслеживании маркетинговых метрик для:
1. **Attribution** - понимание откуда приходят пользователи (Facebook Ads)
2. **Conversion Tracking** - отслеживание ключевых действий для оптимизации рекламы
3. **Audience Building** - создание lookalike audiences на основе конвертирующихся пользователей

---

## User Stories

### US-1: Marketing Attribution

**As a** маркетолог
**I want** видеть какие Facebook Ads кампании приводят пользователей
**So that** я могу оптимизировать рекламный бюджет

**Acceptance Criteria:**
- [ ] Facebook SDK интегрирован в приложение
- [ ] Install events отправляются автоматически
- [ ] Deep link attribution работает

---

### US-2: Conversion Events

**As a** маркетолог
**I want** отслеживать ключевые конверсии
**So that** Facebook может оптимизировать показ рекламы

**Key Events:**
| Event | Trigger | Value |
|-------|---------|-------|
| `CompleteRegistration` | Завершение onboarding | - |
| `Search` | Применение фильтра | search_string |
| `ViewContent` | Просмотр property details | property_id, price |
| `AddToWishlist` | Swipe right (Like) | property_id, price |
| `InitiateCheckout` | Начало оформления bid | property_id, amount |
| `Purchase` | Успешная покупка lien | property_id, amount |

**Acceptance Criteria:**
- [ ] Все события из таблицы отправляются корректно
- [ ] Value параметры передаются для монетизируемых событий
- [ ] Custom events не дублируют standard events

---

### US-3: iOS App Tracking Transparency (ATT)

**As a** iOS пользователь
**I want** контролировать tracking моих данных
**So that** моя приватность защищена

**Acceptance Criteria:**
- [ ] ATT prompt показывается корректно на iOS 14.5+
- [ ] Текст запроса кастомизирован для нашего use-case
- [ ] При отказе: ограниченный tracking через SKAdNetwork
- [ ] При согласии: полный IDFA доступен

**ATT Prompt Text (предложение):**
> "Deal Detective использует ваши данные для показа релевантной рекламы о foreclosure properties в вашем регионе."

---

### US-4: Custom Events for Deal Detective

**As a** продуктовый аналитик
**I want** отслеживать специфичные для Deal Detective действия
**So that** понимаю поведение пользователей

**Custom Events:**
| Event | Trigger | Parameters |
|-------|---------|------------|
| `dd_swipe_left` | Pass на property | property_id, foreclosure_prob |
| `dd_swipe_right` | Like на property | property_id, foreclosure_prob, fvi |
| `dd_annotation_added` | Добавление annotation | property_id, expert_role |
| `dd_export_pdf` | Экспорт в PDF (в taxlien-flutter-app) | property_id |
| `dd_foreclosure_filter_on` | Включение foreclosure фильтра | - |
| `dd_mode_switch` | Переключение Beginner/Expert | new_mode |

**Acceptance Criteria:**
- [ ] Custom events не конфликтуют со standard events
- [ ] Параметры не содержат PII (Personally Identifiable Information)
- [ ] Events батчатся для экономии батареи

---

## Technical Constraints

- **Package:** `facebook_app_events` или официальный Facebook SDK
- **Minimum iOS:** 12.0 (ATT requires 14.5+)
- **Minimum Android:** API 21
- **Privacy:** GDPR/CCPA compliant

---

## Dependencies

### Configuration Sources

**App IDs и Secrets хранятся:**
```
LOCAL DEVELOPMENT:
├── .env                          # НЕ в git! (в .gitignore)
│   ├── FACEBOOK_APP_ID=123456789
│   └── FACEBOOK_CLIENT_TOKEN=abc123...
│
CI/CD (GitHub Actions):
├── GitHub Secrets
│   ├── FACEBOOK_APP_ID
│   └── FACEBOOK_CLIENT_TOKEN
│
BUILD TIME:
├── --dart-define=FACEBOOK_APP_ID=${FACEBOOK_APP_ID}
└── --dart-define=FACEBOOK_CLIENT_TOKEN=${FACEBOOK_CLIENT_TOKEN}
```

**Usage in Code:**
```dart
// lib/core/config/env_config.dart
class EnvConfig {
  static const facebookAppId = String.fromEnvironment(
    'FACEBOOK_APP_ID',
    defaultValue: '', // Empty = disabled in dev
  );

  static const facebookClientToken = String.fromEnvironment(
    'FACEBOOK_CLIENT_TOKEN',
    defaultValue: '',
  );

  static bool get isFacebookEnabled =>
    facebookAppId.isNotEmpty && facebookClientToken.isNotEmpty;
}
```

### Platform Files

- iOS: `Info.plist` - FacebookAppID, FacebookClientToken (injected at build)
- Android: `AndroidManifest.xml` - `fb_app_id`, `fb_client_token` (from build.gradle)
- iOS: ATT (App Tracking Transparency) usage description

---

## Out of Scope (This Iteration)

- Facebook Login integration
- Facebook Share functionality
- Deferred deep links (без отдельного flow)
- Server-side events (CAPI)

---

## Open Questions

- [ ] Нужен ли отдельный ATT prompt или объединить с location permission?
- [ ] Какой minimum value для Purchase event?
- [ ] Нужны ли offline conversions через server?

---

## References

- [Facebook App Events for Flutter](https://pub.dev/packages/facebook_app_events)
- [ATT Best Practices](https://developer.apple.com/app-store/user-privacy-and-data-use/)
- `sdd-taxlien-swipe-app-firebaseanalytics` - companion analytics

---

## Approval

- [ ] Reviewed by:
- [ ] Approved on:
- [ ] Notes:
