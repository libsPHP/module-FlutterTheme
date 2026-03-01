# Requirements: Deep Linking & App Store Smart Banner

## Version
v0.2 - Updated with user feedback

## Problem Statement
Приложение Deal Detective (Flutter) размещается как web-версия на deal.taxlien.online. Необходимо обеспечить seamless переход между web-версией и нативными приложениями с сохранением контекста навигации.

## User Stories

### US-1: Mobile User Visits Web Version
**As a** mobile user visiting deal.taxlien.online
**I want to** see предложение скачать нативное приложение для моего устройства
**So that** я могу использовать лучший опыт нативного приложения

**Acceptance Criteria:**
- [ ] Given: пользователь на мобильном устройстве открывает deal.taxlien.online
- [ ] When: страница загружается
- [ ] Then: отображается стандартный smart banner с кнопкой перехода в стор
- [ ] And: стор определяется по приоритету из .env (Google Play первый)
- [ ] And: если URL стора отсутствует в .env — этот стор не предлагается

**Store Priority (из .env):**
1. Google Play (первый приоритет)
2. Apple App Store
3. Huawei AppGallery
4. Samsung Galaxy Store
5. Xiaomi GetApps
6. RuStore

### US-2: Deep Link from Web to App (App Installed)
**As a** user с установленным приложением
**I want to** нажав "Открыть в приложении" на web-странице /parcel/123
**So that** приложение открывается сразу на экране этого parcel

**Acceptance Criteria:**
- [ ] Given: приложение установлено, пользователь на deal.taxlien.online/parcel/123
- [ ] When: нажимает "Открыть в приложении"
- [ ] Then: приложение открывается и показывает экран parcel #123
- [ ] And: используется Universal Links (iOS) / App Links (Android)

### US-3: Deferred Deep Link (App Not Installed)
**As a** user без установленного приложения
**I want to** сохранить контекст страницы при установке приложения
**So that** после установки я попаду на ту же страницу

**Acceptance Criteria:**
- [ ] Given: приложение НЕ установлено, пользователь на deal.taxlien.online/parcel/123
- [ ] When: нажимает "Установить приложение"
- [ ] Then: путь сохраняется (localStorage + backend fingerprint)
- [ ] And: после установки и запуска — приложение открывается на /parcel/123

**Technical Approach:**
- localStorage хранит pending deep link path
- Backend хранит fingerprint → path mapping (для случаев когда localStorage недоступен)
- При первом запуске приложение проверяет оба источника

### US-4: Sharing from App
**As a** user приложения
**I want to** поделиться ссылкой на конкретную страницу
**So that** получатель может открыть её на любом устройстве

**Acceptance Criteria:**
- [ ] Given: пользователь в приложении на экране /parcel/123
- [ ] When: нажимает "Поделиться"
- [ ] Then: генерируется ссылка https://deal.taxlien.online/parcel/123
- [ ] And: получатель видит smart banner и может перейти в приложение

### US-5: Universal Link Handling
**As a** user получивший ссылку deal.taxlien.online/parcel/123
**I want to** чтобы ссылка автоматически открылась в приложении (если установлено)
**So that** не нужно вручную переходить из браузера

**Acceptance Criteria:**
- [ ] Given: приложение установлено, пользователь кликает на ссылку
- [ ] When: система обрабатывает ссылку
- [ ] Then: открывается приложение на соответствующем экране

## Configuration (.env structure)

```env
# Web App
WEB_DOMAIN=deal.taxlien.online

# App Identifiers
IOS_BUNDLE_ID=com.taxlien.dealdetective
IOS_TEAM_ID=XXXXXXXXXX
ANDROID_PACKAGE_NAME=com.taxlien.dealdetective
ANDROID_SHA256_FINGERPRINT=XX:XX:XX:...

# Store URLs (порядок = приоритет, пустые = недоступны)
STORE_GOOGLE_PLAY=https://play.google.com/store/apps/details?id=com.taxlien.dealdetective
STORE_APPLE=https://apps.apple.com/app/deal-detective/id123456789
STORE_HUAWEI=https://appgallery.huawei.com/app/C123456789
STORE_SAMSUNG=
STORE_XIAOMI=
STORE_RUSTORE=https://www.rustore.ru/catalog/app/com.taxlien.dealdetective
```

## Server Configuration

### Required Files on deal.taxlien.online

**iOS Universal Links:** `/.well-known/apple-app-site-association`
**Android App Links:** `/.well-known/assetlinks.json`

### Nginx Configuration (documentation required)
- [ ] Правильные MIME types для .well-known файлов
- [ ] HTTPS обязателен
- [ ] Настройка кэширования
- [ ] Инструкция для deploy

## Constraints

### Technical Constraints
- Flutter Web + Native (iOS, Android)
- GoRouter используется для навигации
- Домен и store URLs берутся из .env
- Firebase Dynamic Links НЕ используется (deprecated, отключен 25.08.2025)

### Deferred Deep Link Approach
- **Primary:** localStorage на web для сохранения pending path
- **Fallback:** Backend fingerprinting (device + IP hash → path)
- Собственное решение, не зависит от внешних сервисов

### Store Detection Logic
```
1. Detect platform (iOS/Android)
2. If Android, detect manufacturer (Huawei, Samsung, Xiaomi)
3. Check .env for available store URLs in priority order
4. Show first available store
```

## Non-Goals
- [ ] Аналитика переходов (out of scope)
- [ ] A/B тестирование smart banner
- [ ] Push notifications
- [ ] Firebase Dynamic Links (deprecated)

## Deliverables

1. **Smart Banner Component** — web-only, показывается на mobile
2. **Deep Link Handler** — обработка входящих Universal/App Links
3. **Deferred Deep Link Service** — localStorage + backend API
4. **Share Service** — генерация shareable URLs
5. **Server Config Documentation** — nginx setup guide
6. **.env Template** — с примерами всех переменных

## Open Questions

~~1. Store URLs/IDs~~ → Из .env
~~2. Приоритет сторов~~ → Google Play первый, остальные из .env
~~3. Deferred Deep Links~~ → localStorage + backend
~~4. Дизайн Smart Banner~~ → Стандартный
~~5. Серверный доступ~~ → Есть, нужна nginx документация

**Все вопросы закрыты.**

---

*Status: DRAFT - готов к ревью*

## Sources
- [Firebase Dynamic Links Deprecation FAQ](https://firebase.google.com/support/dynamic-links-faq)
- [Firebase Dynamic Links Deprecated: Guide to Alternatives](https://leancode.co/blog/firebase-dynamic-links-deprecated)
