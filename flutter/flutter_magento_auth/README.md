# flutter_magento_auth

[![pub package](https://img.shields.io/pub/v/flutter_magento_auth.svg)](https://pub.dev/packages/flutter_magento_auth)

Authentication module for Flutter Magento SDK - login, registration, and secure token storage.

## Features

- Customer login with email/password
- Customer registration
- Token-based authentication
- Secure token storage (flutter_secure_storage)
- Shared preferences fallback storage
- Password reset flow
- Session management

## Installation

```yaml
dependencies:
  flutter_magento_auth: ^1.0.0
```

## Usage

### Setup

```dart
import 'package:flutter_magento_auth/flutter_magento_auth.dart';

// Use secure storage for production
final authStorage = SecureMagentoAuthStorage();

// Or shared preferences for simpler apps
// final authStorage = SharedPrefsAuthStorage();

final authRepository = MagentoAuthRepository(
  transport: myGraphQLTransport,
  storage: authStorage,
);
```

### Login

```dart
try {
  final session = await authRepository.login(
    email: 'user@example.com',
    password: 'password123',
  );

  print('Logged in as: ${session.customer.firstName}');
  print('Token: ${session.token}');
} on MagentoAuthException catch (e) {
  print('Login failed: ${e.message}');
}
```

### Registration

```dart
final session = await authRepository.register(
  email: 'newuser@example.com',
  password: 'password123',
  firstName: 'John',
  lastName: 'Doe',
);
```

### Check Auth Status

```dart
final isLoggedIn = await authRepository.isLoggedIn();
if (isLoggedIn) {
  final customer = await authRepository.getCurrentCustomer();
  print('Welcome back, ${customer.firstName}!');
}
```

### Logout

```dart
await authRepository.logout();
```

### Password Reset

```dart
// Request password reset email
await authRepository.requestPasswordReset('user@example.com');

// Reset with token from email
await authRepository.resetPassword(
  email: 'user@example.com',
  resetToken: 'TOKEN_FROM_EMAIL',
  newPassword: 'newPassword123',
);
```

### Restore Session

```dart
// On app start, restore saved session
final session = await authRepository.restoreSession();
if (session != null) {
  print('Session restored for ${session.customer.email}');
}
```

## Storage Options

### SecureMagentoAuthStorage (Recommended)

Uses `flutter_secure_storage` for encrypted token storage:

```dart
final storage = SecureMagentoAuthStorage(
  tokenKey: 'magento_auth_token',
  customerKey: 'magento_customer',
);
```

### SharedPrefsAuthStorage

Simpler storage using shared preferences (less secure):

```dart
final storage = SharedPrefsAuthStorage();
```

### Custom Storage

Implement `MagentoAuthStorage` for custom storage:

```dart
class MyCustomStorage implements MagentoAuthStorage {
  @override
  Future<String?> getToken() async { ... }

  @override
  Future<void> saveToken(String token) async { ... }

  @override
  Future<void> clear() async { ... }
}
```

## API Reference

| Class | Description |
|-------|-------------|
| `MagentoAuthRepository` | Main auth repository |
| `SecureMagentoAuthStorage` | Encrypted storage |
| `SharedPrefsAuthStorage` | SharedPreferences storage |
| `CustomerMapper` | Maps customer data |
| `AuthQueries` | GraphQL queries |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_riverpod](https://pub.dev/packages/flutter_magento_riverpod) - Auth state management
