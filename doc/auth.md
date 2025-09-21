# 🔐 Authentication API - Аутентификация и управление клиентами

Полная документация по системе аутентификации Flutter Magento Plugin 2.0. Включает JWT токены, управление сессиями, социальную аутентификацию и расширенные возможности безопасности.

## 📋 Обзор возможностей

### ✨ Основные функции
- 🔑 **JWT токены** с автоматическим обновлением
- 👤 **Регистрация и вход** клиентов
- 🔒 **Безопасное хранение** токенов
- 📱 **"Запомнить меня"** функциональность
- 🔄 **Автоматическая валидация** токенов
- ⏰ **Управление сессиями** и истечением токенов
- 🌐 **Социальная аутентификация** (Google, Facebook, Apple)
- 📧 **Восстановление пароля** через email
- 👥 **Группы клиентов** и разрешения

## 🚀 Быстрый старт

### Базовая аутентификация
```dart
final magento = FlutterMagento();

// Вход пользователя
try {
  final authResponse = await magento.auth.authenticateCustomer(
    email: 'customer@example.com',
    password: 'password123',
    rememberMe: true,
  );
  
  print('Добро пожаловать, ${authResponse.customer.firstname}!');
  print('Токен: ${authResponse.accessToken}');
  
} catch (e) {
  print('Ошибка входа: $e');
}
```

### Регистрация нового клиента
```dart
try {
  final customer = await magento.auth.createCustomer(
    email: 'new@example.com',
    password: 'securePassword123',
    firstName: 'John',
    lastName: 'Doe',
    dateOfBirth: DateTime(1990, 5, 15),
    gender: 'male',
    isSubscribed: true,
  );
  
  print('Клиент создан: ${customer.id}');
} catch (e) {
  print('Ошибка регистрации: $e');
}
```

## 🔑 Управление токенами

### Автоматическое управление токенами
```dart
// Плагин автоматически управляет токенами
final magento = FlutterMagento();

// Проверка статуса аутентификации
if (await magento.auth.isAuthenticated()) {
  print('Пользователь авторизован');
  
  // Получение текущего клиента
  final customer = await magento.auth.getCurrentCustomer();
  print('Текущий пользователь: ${customer.email}');
}
```

### Ручное управление токенами
```dart
// Получение токена
final token = await magento.auth.getAccessToken();
print('Текущий токен: $token');

// Обновление токена
final newToken = await magento.auth.refreshToken();
print('Новый токен: $newToken');

// Проверка валидности токена
final isValid = await magento.auth.validateToken();
print('Токен валиден: $isValid');
```

## 👤 Управление профилем клиента

### Получение информации о клиенте
```dart
try {
  final customer = await magento.auth.getCurrentCustomer();
  
  print('ID: ${customer.id}');
  print('Email: ${customer.email}');
  print('Имя: ${customer.firstname} ${customer.lastname}');
  print('Группа: ${customer.groupId}');
  print('Дата создания: ${customer.createdAt}');
  
} catch (e) {
  print('Ошибка получения профиля: $e');
}
```

### Обновление профиля
```dart
try {
  final updatedCustomer = await magento.auth.updateCustomerProfile(
    firstName: 'Новое имя',
    lastName: 'Новая фамилия',
    dateOfBirth: DateTime(1985, 10, 20),
    gender: 'female',
  );
  
  print('Профиль обновлен: ${updatedCustomer.firstname}');
} catch (e) {
  print('Ошибка обновления профиля: $e');
}
```

### Изменение пароля
```dart
try {
  final success = await magento.auth.changePassword(
    currentPassword: 'oldPassword123',
    newPassword: 'newSecurePassword456',
  );
  
  if (success) {
    print('Пароль успешно изменен');
  }
} catch (e) {
  print('Ошибка изменения пароля: $e');
}
```

## 📧 Восстановление пароля

### Запрос сброса пароля
```dart
try {
  final success = await magento.auth.requestPasswordReset(
    email: 'customer@example.com',
  );
  
  if (success) {
    print('Письмо для сброса пароля отправлено');
  }
} catch (e) {
  print('Ошибка запроса сброса: $e');
}
```

### Подтверждение сброса пароля
```dart
try {
  final success = await magento.auth.confirmPasswordReset(
    email: 'customer@example.com',
    resetToken: 'reset-token-from-email',
    newPassword: 'newPassword123',
  );
  
  if (success) {
    print('Пароль успешно сброшен');
  }
} catch (e) {
  print('Ошибка сброса пароля: $e');
}
```

## 🏠 Управление адресами

### Получение адресов клиента
```dart
try {
  final addresses = await magento.auth.getCustomerAddresses();
  
  for (final address in addresses) {
    print('Адрес ${address.id}:');
    print('${address.firstname} ${address.lastname}');
    print('${address.street?.join(', ')}');
    print('${address.city}, ${address.region} ${address.postcode}');
    print('Страна: ${address.countryId}');
    print('По умолчанию для доставки: ${address.defaultShipping}');
    print('По умолчанию для счетов: ${address.defaultBilling}');
    print('---');
  }
} catch (e) {
  print('Ошибка получения адресов: $e');
}
```

### Добавление нового адреса
```dart
try {
  final address = await magento.auth.addCustomerAddress(
    firstName: 'John',
    lastName: 'Doe',
    street: ['123 Main Street', 'Apt 4B'],
    city: 'New York',
    region: 'NY',
    postcode: '10001',
    countryId: 'US',
    telephone: '+1-555-123-4567',
    company: 'Acme Corp',
    isDefaultShipping: true,
    isDefaultBilling: false,
  );
  
  print('Адрес добавлен с ID: ${address.id}');
} catch (e) {
  print('Ошибка добавления адреса: $e');
}
```

### Обновление адреса
```dart
try {
  final updatedAddress = await magento.auth.updateCustomerAddress(
    addressId: 123,
    firstName: 'Jane',
    lastName: 'Smith',
    telephone: '+1-555-987-6543',
  );
  
  print('Адрес обновлен: ${updatedAddress.id}');
} catch (e) {
  print('Ошибка обновления адреса: $e');
}
```

### Удаление адреса
```dart
try {
  final success = await magento.auth.deleteCustomerAddress(123);
  
  if (success) {
    print('Адрес удален');
  }
} catch (e) {
  print('Ошибка удаления адреса: $e');
}
```

## 🌐 Социальная аутентификация

### Google Sign-In
```dart
try {
  final authResponse = await magento.auth.signInWithGoogle();
  
  print('Вход через Google успешен');
  print('Пользователь: ${authResponse.customer.email}');
} catch (e) {
  print('Ошибка входа через Google: $e');
}
```

### Facebook Login
```dart
try {
  final authResponse = await magento.auth.signInWithFacebook();
  
  print('Вход через Facebook успешен');
  print('Пользователь: ${authResponse.customer.email}');
} catch (e) {
  print('Ошибка входа через Facebook: $e');
}
```

### Apple Sign-In
```dart
try {
  final authResponse = await magento.auth.signInWithApple();
  
  print('Вход через Apple успешен');
  print('Пользователь: ${authResponse.customer.email}');
} catch (e) {
  print('Ошибка входа через Apple: $e');
}
```

## 👥 Группы клиентов

### Получение информации о группе
```dart
try {
  final customerGroup = await magento.auth.getCustomerGroup();
  
  print('Группа: ${customerGroup.code}');
  print('Налоговый класс: ${customerGroup.taxClassId}');
  print('Скидка: ${customerGroup.discount}%');
} catch (e) {
  print('Ошибка получения группы: $e');
}
```

### Получение всех групп
```dart
try {
  final groups = await magento.auth.getAllCustomerGroups();
  
  for (final group in groups) {
    print('${group.id}: ${group.code}');
  }
} catch (e) {
  print('Ошибка получения групп: $e');
}
```

## 🔐 Расширенная безопасность

### Двухфакторная аутентификация (2FA)
```dart
// Включение 2FA
try {
  final secret = await magento.auth.enable2FA();
  print('QR код секрет: $secret');
} catch (e) {
  print('Ошибка включения 2FA: $e');
}

// Подтверждение 2FA кода
try {
  final success = await magento.auth.verify2FA('123456');
  if (success) {
    print('2FA код подтвержден');
  }
} catch (e) {
  print('Ошибка подтверждения 2FA: $e');
}
```

### Аудит входов
```dart
try {
  final loginHistory = await magento.auth.getLoginHistory();
  
  for (final login in loginHistory) {
    print('Вход: ${login.timestamp}');
    print('IP: ${login.ipAddress}');
    print('Устройство: ${login.userAgent}');
    print('Успешен: ${login.successful}');
    print('---');
  }
} catch (e) {
  print('Ошибка получения истории: $e');
}
```

## ⚙️ Конфигурация аутентификации

### Настройка токенов
```dart
await magento.initialize(
  baseUrl: 'https://your-store.com',
  authConfig: AuthConfig(
    tokenExpirationTime: Duration(hours: 24),
    refreshTokenExpirationTime: Duration(days: 30),
    autoRefreshTokens: true,
    rememberMeDuration: Duration(days: 90),
    enableSecureStorage: true,
  ),
);
```

### Настройка социальной аутентификации
```dart
await magento.initialize(
  baseUrl: 'https://your-store.com',
  socialAuthConfig: SocialAuthConfig(
    googleClientId: 'your-google-client-id',
    facebookAppId: 'your-facebook-app-id',
    appleServiceId: 'your-apple-service-id',
    enableGoogleSignIn: true,
    enableFacebookLogin: true,
    enableAppleSignIn: true,
  ),
);
```

## 🔔 Слушатели событий аутентификации

### Отслеживание состояния аутентификации
```dart
// Подписка на изменения состояния
magento.auth.authStateChanges.listen((authState) {
  switch (authState.status) {
    case AuthStatus.authenticated:
      print('Пользователь вошел: ${authState.customer?.email}');
      break;
    case AuthStatus.unauthenticated:
      print('Пользователь вышел');
      break;
    case AuthStatus.tokenExpired:
      print('Токен истек');
      break;
    case AuthStatus.tokenRefreshed:
      print('Токен обновлен');
      break;
  }
});
```

### Обработка событий токенов
```dart
magento.auth.tokenEvents.listen((tokenEvent) {
  switch (tokenEvent.type) {
    case TokenEventType.refreshed:
      print('Токен обновлен: ${tokenEvent.newToken}');
      break;
    case TokenEventType.expired:
      print('Токен истек');
      break;
    case TokenEventType.invalidated:
      print('Токен аннулирован');
      break;
  }
});
```

## 🔍 Валидация и ошибки

### Валидация данных
```dart
// Валидация email
if (!magento.auth.isValidEmail('test@example.com')) {
  print('Некорректный email');
}

// Валидация пароля
final passwordValidation = magento.auth.validatePassword('password123');
if (!passwordValidation.isValid) {
  print('Ошибки пароля:');
  for (final error in passwordValidation.errors) {
    print('- $error');
  }
}
```

### Обработка ошибок
```dart
try {
  await magento.auth.authenticateCustomer(
    email: 'user@example.com',
    password: 'wrongpassword',
  );
} on MagentoAuthException catch (e) {
  switch (e.type) {
    case AuthExceptionType.invalidCredentials:
      print('Неверные учетные данные');
      break;
    case AuthExceptionType.accountLocked:
      print('Аккаунт заблокирован');
      break;
    case AuthExceptionType.emailNotVerified:
      print('Email не подтвержден');
      break;
    case AuthExceptionType.tooManyAttempts:
      print('Слишком много попыток входа');
      break;
  }
}
```

## 📱 Интеграция с Provider

### AuthProvider для управления состоянием
```dart
class AuthProvider extends ChangeNotifier {
  final FlutterMagento _magento;
  
  Customer? _customer;
  bool _isAuthenticated = false;
  bool _isLoading = false;
  
  Customer? get customer => _customer;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  
  AuthProvider(this._magento) {
    _initializeAuth();
  }
  
  Future<void> _initializeAuth() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      if (await _magento.auth.isAuthenticated()) {
        _customer = await _magento.auth.getCurrentCustomer();
        _isAuthenticated = true;
      }
    } catch (e) {
      print('Ошибка инициализации аутентификации: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<bool> login(String email, String password, {bool rememberMe = false}) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final authResponse = await _magento.auth.authenticateCustomer(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );
      
      _customer = authResponse.customer;
      _isAuthenticated = true;
      notifyListeners();
      
      return true;
    } catch (e) {
      print('Ошибка входа: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  Future<void> logout() async {
    try {
      await _magento.auth.logout();
      _customer = null;
      _isAuthenticated = false;
      notifyListeners();
    } catch (e) {
      print('Ошибка выхода: $e');
    }
  }
}
```

### Использование в UI
```dart
Consumer<AuthProvider>(
  builder: (context, auth, child) {
    if (auth.isLoading) {
      return CircularProgressIndicator();
    }
    
    if (auth.isAuthenticated) {
      return Text('Добро пожаловать, ${auth.customer?.firstname}!');
    }
    
    return LoginForm();
  },
)
```

## 📚 Дополнительные ресурсы

- **[API Reference](../gitbook/api-reference/authentication-api.md)** - Полная документация методов
- **[Примеры](../gitbook/examples/basic-ecommerce.md)** - Готовые примеры использования
- **[Безопасность](../gitbook/security/security-principles.md)** - Принципы безопасности
- **[FAQ](../gitbook/support/faq.md)** - Часто задаваемые вопросы

---

**Следующий раздел:** [Каталог продуктов API](catalog.md)