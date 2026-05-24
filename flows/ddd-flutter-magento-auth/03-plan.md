# Implementation Plan: Authentication & Authorization

> Version: 1.0 (Retrospective)  
> Status: APPROVED  
> Last Updated: March 1, 2026  
> Specifications: [02-specifications.md](02-specifications.md)

---

## Summary

Implementation of comprehensive authentication system with JWT tokens, secure storage, auto-refresh, and reactive state management.

**Estimated Complexity**: Medium  
**Implementation Time**: ~2 weeks (original)  
**Documentation Approach**: Retrospective (code-first)

---

## Task Breakdown

### Phase 1: Foundation

#### Task 1.1: Create Auth Models
- **Description**: Define data models for authentication responses and tokens
- **Files**:
  - `lib/src/models/auth_models.dart` - Create
  - `lib/src/models/customer_models.dart` - Create/Extend
- **Dependencies**: None
- **Verification**: Models compile, JSON serialization works
- **Complexity**: Low

#### Task 1.2: Create AuthApi Client
- **Description**: API client for Magento authentication endpoints
- **Files**:
  - `lib/src/api/auth_api.dart` - Create
- **Dependencies**: Task 1.1 (Models)
- **Verification**: API calls return correct response types
- **Complexity**: Medium

---

### Phase 2: Core Implementation

#### Task 2.1: Create AuthService
- **Description**: Main service with business logic and state management
- **Files**:
  - `lib/src/services/auth_service.dart` - Create
- **Dependencies**: Task 1.1, Task 1.2
- **Verification**: Service can login/logout, state updates correctly
- **Complexity**: High

#### Task 2.2: Secure Storage Integration
- **Description**: Integrate FlutterSecureStorage for token storage
- **Files**:
  - `lib/src/services/auth_service.dart` - Modify
- **Dependencies**: Task 2.1
- **Verification**: Tokens persist across app restarts
- **Complexity**: Medium

#### Task 2.3: Token Refresh Logic
- **Description**: Automatic token refresh before expiry
- **Files**:
  - `lib/src/services/auth_service.dart` - Modify
- **Dependencies**: Task 2.2
- **Verification**: Token refreshes automatically 5 min before expiry
- **Complexity**: High

---

### Phase 3: Integration

#### Task 3.1: Integrate with NetworkService
- **Description**: Add network connectivity checks
- **Files**:
  - `lib/src/services/auth_service.dart` - Modify
- **Dependencies**: Task 2.1
- **Verification**: Login fails gracefully when offline
- **Complexity**: Low

#### Task 3.2: Integrate with FlutterMagentoCore
- **Description**: Add AuthService to core singleton
- **Files**:
  - `lib/src/flutter_magento_core.dart` - Modify
  - `lib/src/flutter_magento_plugin.dart` - Modify
- **Dependencies**: Task 2.1
- **Verification**: Service accessible via FlutterMagentoCore.instance.authService
- **Complexity**: Low

#### Task 3.3: Unified API Integration
- **Description**: Add auth methods to unified API
- **Files**:
  - `lib/src/flutter_magento_unified.dart` - Modify
- **Dependencies**: Task 3.2
- **Verification**: FlutterMagento.login() works
- **Complexity**: Low

---

### Phase 4: Testing & Polish

#### Task 4.1: Error Handling
- **Description**: Comprehensive error handling for all auth scenarios
- **Files**:
  - `lib/src/services/auth_service.dart` - Modify
  - `lib/src/api/auth_api.dart` - Modify
- **Dependencies**: Task 2.1
- **Verification**: All error cases show user-friendly messages
- **Complexity**: Medium

#### Task 4.2: State Management Polish
- **Description**: Ensure clean state transitions and notifications
- **Files**:
  - `lib/src/services/auth_service.dart` - Modify
- **Dependencies**: Task 2.1
- **Verification**: UI updates correctly on all state changes
- **Complexity**: Low

#### Task 4.3: Testing
- **Description**: Unit and integration tests
- **Files**:
  - `test/services/auth_service_test.dart` - Create
- **Dependencies**: All previous tasks
- **Verification**: All tests pass
- **Complexity**: Medium

---

## Dependency Graph

```
Task 1.1 (Models)
       │
       ├─→ Task 1.2 (AuthApi)
       │        │
       │        └─→ Task 2.1 (AuthService)
       │                 │
       │                 ├─→ Task 2.2 (Storage)
       │                 │        │
       │                 │        └─→ Task 2.3 (Refresh)
       │                 │
       │                 ├─→ Task 3.1 (Network)
       │                 │
       │                 ├─→ Task 3.2 (Core Integration)
       │                 │        │
       │                 │        └─→ Task 3.3 (Unified API)
       │                 │
       │                 └─→ Task 4.1 (Error Handling)
       │                          │
       │                          └─→ Task 4.2 (State Polish)
       │                                   │
       │                                   └─→ Task 4.3 (Testing)
```

---

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/src/models/auth_models.dart` | Create | AuthResponse, AuthTokens models |
| `lib/src/models/customer_models.dart` | Create/Extend | Customer data model |
| `lib/src/api/auth_api.dart` | Create | Magento API client |
| `lib/src/services/auth_service.dart` | Create | Core auth service |
| `lib/src/flutter_magento_core.dart` | Modify | Add AuthService |
| `lib/src/flutter_magento_plugin.dart` | Modify | Export service |
| `lib/src/flutter_magento_unified.dart` | Modify | Unified API |

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Secure storage not available on some platforms | Low | High | Fallback to SharedPreferences for non-sensitive data |
| Token refresh fails | Medium | High | Logout user gracefully, show login screen |
| Network errors during login | High | Medium | Show clear error, allow retry |
| State not updating UI | Low | High | Ensure notifyListeners() called after all state changes |
| Concurrent refresh calls | Medium | Medium | Use flag to prevent concurrent refreshes |

---

## Rollback Strategy

If implementation fails or needs to be reverted:

1. Revert changes to `flutter_magento_core.dart` and `flutter_magento_plugin.dart`
2. Remove new files: `auth_service.dart`, `auth_api.dart`, `auth_models.dart`
3. Restore previous version from git
4. Disable auth-dependent features (cart, profile, orders)

---

## Checkpoints

### After Phase 1:
- [ ] Models compile without errors
- [ ] JSON serialization generates correctly
- [ ] API client can make test calls

### After Phase 2:
- [ ] Login/logout works
- [ ] Tokens stored securely
- [ ] Auto-refresh triggers correctly

### After Phase 3:
- [ ] Network checks work
- [ ] Service accessible from core
- [ ] Unified API methods work

### After Phase 4:
- [ ] All error cases handled
- [ ] UI updates correctly
- [ ] All tests pass

---

## Open Implementation Questions

- [ ] Should we support multiple auth providers? (deferred to future)
- [ ] Should we add biometric auth? (deferred to future)
- [ ] Token expiry time configuration? (use Magento default for now)

---

## Approval

- [x] Reviewed by: AI Assistant (Retrospective)
- [x] Approved on: March 1, 2026
- [x] Notes: Plan documented from existing implementation
