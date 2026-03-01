# Specifications: Authentication & Authorization

> Version: 1.0 (Retrospective)  
> Status: APPROVED  
> Last Updated: March 1, 2026  
> Requirements: [01-requirements.md](01-requirements.md)

---

## Overview

Система аутентификации для Flutter Magento, предоставляющая JWT-based authentication с безопасным хранением токенов, автоматическим refresh и реактивным состоянием.

---

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `AuthService` | Create | Core service для authentication logic |
| `AuthApi` | Create | API client для Magento REST endpoints |
| `AuthModels` | Create | AuthResponse, AuthTokens модели |
| `CustomerModels` | Create | Customer, CustomerCreateRequest |
| `NetworkService` | Integrate | Проверка connectivity |
| `FlutterSecureStorage` | Integrate | Безопасное хранение токенов |
| `SharedPreferences` | Integrate | Для remember me и metadata |

---

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                      UI Layer                                │
│  (LoginScreen, ProfileScreen, Auth Widgets)                 │
└────────────────────┬────────────────────────────────────────┘
                     │ listens to
┌────────────────────▼────────────────────────────────────────┐
│                   AuthService                                │
│  - ChangeNotifier                                            │
│  - State: isAuthenticated, isLoading, error, customer        │
│  - Methods: login, logout, register, refreshToken            │
└──────────┬─────────────────────────────────┬────────────────┘
           │                                 │
┌──────────▼──────────┐           ┌─────────▼────────────────┐
│    AuthApi          │           │   NetworkService         │
│  - MagentoApiClient │           │  - Connectivity check    │
│  - /integration/    │           │  - Online/offline state  │
│    customer/token   │           └──────────────────────────┘
│  - /customers       │
└──────────┬──────────┘
           │
┌──────────▼──────────────────────────────────────────────────┐
│              Storage Layer                                   │
│  ┌────────────────────┐  ┌────────────────────────────────┐ │
│  │ FlutterSecureStorage│  │ SharedPreferences             │ │
│  │ - access_token      │  │ - remember_me flag            │ │
│  │ - refresh_token     │  │ - metadata                    │ │
│  └────────────────────┘  └────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### Data Flow

```
Login Request:
UI → AuthService.login() → AuthApi.login() → Magento API
                                    ↓
                            Store Tokens
                                    ↓
                            Update State
                                    ↓
                            UI Updates

Token Refresh:
Timer/Expiry → AuthService.refreshToken() → AuthApi → New Tokens
```

---

## Interfaces

### AuthService Public API

```dart
class AuthService extends ChangeNotifier {
  // State getters
  bool get isAuthenticated;
  bool get isLoading;
  String? get error;
  Customer? get currentCustomer;
  
  // Token management
  bool get isTokenValid;
  Duration? get timeToTokenExpiry;
  
  // Core methods
  Future<bool> initialize();
  Future<Customer?> login({String email, String password});
  Future<void> logout();
  Future<Customer> register({CustomerCreateRequest request});
  Future<void> refreshToken();
  
  // State management
  void clearError();
  void reset();
}
```

### AuthApi Public API

```dart
class AuthApi {
  Future<AuthResponse> login({String email, String password});
  Future<Customer> register({CustomerCreateRequest request});
  Future<void> logout();
}
```

---

## Data Models

### AuthResponse

```dart
@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String accessToken,
    required String refreshToken,
    required Customer customer,
  }) = _AuthResponse;
}
```

### AuthTokens

```dart
@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
    DateTime? expiryDate,
  }) = _AuthTokens;
}
```

### Customer

```dart
@freezed
class Customer with _$Customer {
  const factory Customer({
    required int id,
    required String email,
    required String firstname,
    required String lastname,
    String? telephone,
    String? createdAt,
    // ... more fields
  }) = _Customer;
}
```

---

## Behavior Specifications

### Happy Path - Login

1. User enters email/password
2. App calls `AuthService.login()`
3. `AuthApi` sends POST to `/rest/V1/integration/customer/token`
4. Magento returns JWT token
5. Tokens stored в FlutterSecureStorage
6. AuthService обновляет state: `isAuthenticated = true`
7. UI автоматически обновляется через ChangeNotifier

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Invalid credentials | Wrong password | Show error "Invalid email or password" |
| Network error | No internet | Show error "No internet connection" |
| Token expired | Token > expiry time | Auto-refresh using refresh token |
| Refresh fails | Invalid refresh token | Logout user, show login screen |
| Concurrent logins | Multiple devices | Each device has unique token |

### Error Handling

| Error | Cause | Response |
|-------|-------|----------|
| 401 Unauthorized | Wrong credentials | Clear message, allow retry |
| 400 Bad Request | Invalid format | Validation error details |
| Network error | No connectivity | Offline error, retry option |
| Storage error | Secure storage failed | Critical error, log and report |

---

## Dependencies

### Requires

- ✅ `NetworkService` - для проверки connectivity
- ✅ `MagentoApiService` - для HTTP запросов
- ✅ `FlutterSecureStorage` - для безопасного хранения
- ✅ `SharedPreferences` - для metadata

### Blocks

- ❌ `CartService` - требует authentication для guest→customer cart
- ❌ `ProfileService` - требует loaded customer
- ❌ `OrderApi` - требует authentication
- ❌ `WishlistApi` - требует authentication

---

## Integration Points

### External Systems

- **Magento 2.x REST API** - `/rest/V1/integration/customer/token`
- **Magento Customer API** - `/rest/V1/customers`

### Internal Systems

- **NetworkService** - проверка online/offline
- **CacheService** - кэширование customer данных
- **ProfileService** - загрузка профиля после login

---

## Testing Strategy

### Unit Tests

- [ ] `AuthService.login()` - valid credentials returns customer
- [ ] `AuthService.login()` - invalid credentials throws exception
- [ ] `AuthService.logout()` - clears all tokens and state
- [ ] `AuthService.refreshToken()` - gets new tokens
- [ ] `AuthService.isTokenValid` - returns correct boolean
- [ ] `AuthService.initialize()` - loads stored credentials

### Integration Tests

- [ ] Full login flow: UI → Service → API → Storage
- [ ] Token refresh flow on expiry
- [ ] Remember me: app restart retains auth state
- [ ] Logout clears everything

### Manual Verification

- [ ] Login с correct credentials
- [ ] Login с incorrect credentials
- [ ] Logout и проверка что токены удалены
- [ ] App restart с remember me
- [ ] Token refresh после expiry

---

## Migration / Rollout

### Data Migration

- Не требуется - новая установка
- При обновлении: старая версия не имеет breaking changes

### Rollout Plan

1. ✅ Phase 1: Basic login/logout
2. ✅ Phase 2: Token refresh
3. ✅ Phase 3: Remember me
4. ✅ Phase 4: Registration

---

## Open Design Questions

- [ ] Добавить biometric authentication?
- [ ] Поддержка social login (Google/Facebook)?
- [ ] Password reset flow через email?

---

## Approval

- [x] Reviewed by: AI Assistant (Retrospective)
- [x] Approved on: March 1, 2026
- [x] Notes: Documented from existing implementation
