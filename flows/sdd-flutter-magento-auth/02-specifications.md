# Specifications: flutter_magento_auth

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_auth provides concrete implementations of `AuthRepository` and `MagentoAuthStorage` interfaces. It handles customer authentication flows including login, registration, password reset, and secure token management.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| MagentoAuthRepository | Create | Implements AuthRepository interface |
| SecureMagentoAuthStorage | Create | flutter_secure_storage implementation |
| MemoryMagentoAuthStorage | Create | Testing implementation |
| SharedPrefsMagentoAuthStorage | Create | Lightweight alternative |
| CustomerSession model | Create | Login result with token/customer |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    flutter_magento_auth                      │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │           MagentoAuthRepository                     │     │
│  │         implements AuthRepository                   │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌──────────────────┐    │    ┌──────────────────────┐      │
│  │SecureMagentoAuth │    │    │ MemoryMagentoAuth    │      │
│  │    Storage       │    │    │    Storage           │      │
│  └──────────────────┘    │    └──────────────────────┘      │
│         │                │              │                    │
│         └────────────────┼──────────────┘                   │
│                          ▼                                   │
│              MagentoAuthStorage (interface)                  │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### MagentoAuthRepository

```dart
class MagentoAuthRepository implements AuthRepository {
  final MagentoTransport transport;
  final MagentoAuthStorage authStorage;
  final CartRepository? cartRepository; // For cart merge

  MagentoAuthRepository({
    required this.transport,
    required this.authStorage,
    this.cartRepository,
  });

  @override
  Future<CustomerSession> login({
    required String email,
    required String password,
  }) async {
    // 1. Authenticate with Magento
    // 2. Store token in authStorage
    // 3. Merge guest cart if exists
    // 4. Return session
  }

  @override
  Future<void> logout() async {
    // 1. Revoke token on server (optional)
    // 2. Clear authStorage
  }

  @override
  Future<Customer> me() async {
    // GET /customer/me or customer { ... } query
  }

  @override
  Future<CustomerSession> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    // 1. Create customer
    // 2. Auto-login
    // 3. Merge guest cart
    // 4. Return session
  }

  @override
  Future<void> requestPasswordReset(String email);

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });
}
```

### AuthStorage Implementations

```dart
class SecureMagentoAuthStorage implements MagentoAuthStorage {
  final FlutterSecureStorage _storage;
  static const _tokenKey = 'magento_customer_token';
  static const _cartIdKey = 'magento_guest_cart_id';

  SecureMagentoAuthStorage({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  @override
  Future<String?> getCustomerToken() =>
      _storage.read(key: _tokenKey);

  @override
  Future<void> saveCustomerToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  @override
  Future<void> clearCustomerToken() =>
      _storage.delete(key: _tokenKey);

  // Similar for guest cart ID...
}

class MemoryMagentoAuthStorage implements MagentoAuthStorage {
  String? _customerToken;
  String? _guestCartId;

  // In-memory implementation for tests
}

class SharedPrefsMagentoAuthStorage implements MagentoAuthStorage {
  // SharedPreferences-based (less secure but simpler)
}
```

## Data Models

### CustomerSession

```dart
class CustomerSession {
  final String token;
  final Customer customer;
  final DateTime expiresAt;

  const CustomerSession({
    required this.token,
    required this.customer,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}
```

### Customer (Domain Model)

```dart
class Customer extends MagentoEntity {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? middleName;
  final String? prefix;
  final String? suffix;
  final DateTime? dateOfBirth;
  final Gender? gender;
  final String? taxVatNumber;
  final List<Address> addresses;
  final bool isSubscribedToNewsletter;

  const Customer({...});
}
```

## GraphQL Mutations/Queries

```graphql
mutation GenerateCustomerToken($email: String!, $password: String!) {
  generateCustomerToken(email: $email, password: $password) {
    token
  }
}

mutation CreateCustomer($input: CustomerCreateInput!) {
  createCustomer(input: $input) {
    customer { id email firstname lastname }
  }
}

query GetCustomer {
  customer {
    id email firstname lastname middlename
    prefix suffix date_of_birth gender
    is_subscribed addresses { ... }
  }
}

mutation RequestPasswordResetEmail($email: String!) {
  requestPasswordResetEmail(email: $email)
}

mutation ResetPassword($email: String!, $resetPasswordToken: String!, $newPassword: String!) {
  resetPassword(
    email: $email
    resetPasswordToken: $resetPasswordToken
    newPassword: $newPassword
  )
}
```

## Dependencies

### Requires

- flutter_magento_core
- flutter_secure_storage: ^9.0.0
- shared_preferences: ^2.0.0 (optional)

### Blocks

- flutter_magento_riverpod (auth providers)
- flutter_magento (umbrella)

## Package Structure

```
lib/
├── flutter_magento_auth.dart
└── src/
    ├── repository/
    │   └── magento_auth_repository.dart
    ├── storage/
    │   ├── secure_magento_auth_storage.dart
    │   ├── memory_magento_auth_storage.dart
    │   └── shared_prefs_auth_storage.dart
    ├── models/
    │   ├── customer_session.dart
    │   └── customer.dart
    └── mappers/
        └── customer_mapper.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
