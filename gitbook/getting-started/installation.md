# Установка и настройка

Добро пожаловать в руководство по установке Flutter Magento Plugin 2.0! Этот раздел поможет вам быстро настроить плагин в вашем Flutter проекте.

## 📋 Системные требования

### Минимальные требования
- **Flutter SDK**: 3.10.0 или выше
- **Dart SDK**: 3.2.3 или выше
- **Magento**: 2.4.0 или выше
- **Android**: API level 21 (Android 5.0) или выше
- **iOS**: 12.0 или выше

### Рекомендуемые требования
- **Flutter SDK**: 3.16.0 или выше
- **Dart SDK**: 3.2.6 или выше
- **Magento**: 2.4.6 или выше

## 🚀 Установка плагина

### 1. Добавление зависимости

Добавьте `flutter_magento` в файл `pubspec.yaml` вашего проекта:

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Flutter Magento Plugin
  flutter_magento: ^2.8.0
  
  # Рекомендуемые зависимости для полной функциональности
  provider: ^6.1.1
  cached_network_image: ^3.3.1
  connectivity_plus: ^7.0.0
```

### 2. Установка зависимостей

Выполните команду для установки зависимостей:

```bash
flutter pub get
```

### 3. Настройка Android

#### AndroidManifest.xml

Добавьте необходимые разрешения в `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
```

#### Proguard (для release сборки)

Если используете Proguard, добавьте правила в `android/app/proguard-rules.pro`:

```proguard
# Flutter Magento
-keep class ru.nativemind.flutter.magento.** { *; }
-keepclassmembers class * {
    @com.fasterxml.jackson.annotation.* <fields>;
    @com.fasterxml.jackson.annotation.* <methods>;
}
```

### 4. Настройка iOS

#### Info.plist

Добавьте описания для сетевых запросов в `ios/Runner/Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

#### Podfile

Убедитесь, что минимальная версия iOS установлена в `ios/Podfile`:

```ruby
platform :ios, '12.0'
```

### 5. Настройка Web (опционально)

Для поддержки веб-платформы добавьте в `web/index.html`:

```html
<script src="flutter_magento_web.js" defer></script>
```

## 🔧 Конфигурация Magento

### 1. Настройка REST API

Убедитесь, что в вашем Magento включены REST API:

1. Войдите в админ панель Magento
2. Перейдите в **Система → Веб-сервисы → REST**
3. Убедитесь, что **Включить REST API** установлено в "Да"

### 2. Настройка CORS

Для веб-приложений настройте CORS в Magento:

```php
// app/etc/di.xml
<type name="Magento\Framework\App\Response\Http">
    <plugin name="cors_headers" type="Your\Module\Plugin\CorsHeaders"/>
</type>
```

### 3. Создание интеграции

Создайте интеграцию в Magento для получения токенов доступа:

1. **Система → Расширения → Интеграции**
2. Нажмите **Добавить новую интеграцию**
3. Заполните основную информацию
4. Настройте ресурсы API (выберите необходимые разрешения)
5. Сохраните и активируйте интеграцию

## 🚀 Первоначальная настройка

### 1. Базовая инициализация

Создайте файл инициализации в вашем проекте:

```dart
// lib/services/magento_service.dart
import 'package:flutter_magento/flutter_magento.dart';

class MagentoService {
  static final FlutterMagento _magento = FlutterMagento();
  
  static FlutterMagento get instance => _magento;
  
  static Future<bool> initialize() async {
    return await _magento.initialize(
      baseUrl: 'https://your-magento-store.com',
      headers: {
        'Store': 'default',
        'Content-Type': 'application/json',
      },
      connectionTimeout: 30000,
      receiveTimeout: 30000,
    );
  }
}
```

### 2. Инициализация в main.dart

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'services/magento_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Инициализация Magento
  await MagentoService.initialize();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MagentoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Magento App',
        home: HomePage(),
      ),
    );
  }
}
```

### 3. Создание конфигурационного файла

Создайте файл `.env` для хранения конфигурации:

```env
# .env
MAGENTO_BASE_URL=https://your-magento-store.com
MAGENTO_STORE_CODE=default
MAGENTO_CONSUMER_KEY=your_consumer_key
MAGENTO_CONSUMER_SECRET=your_consumer_secret
MAGENTO_ACCESS_TOKEN=your_access_token
MAGENTO_ACCESS_TOKEN_SECRET=your_access_token_secret
```

И добавьте поддержку в pubspec.yaml:

```yaml
dependencies:
  flutter_dotenv: ^5.1.0
```

Загрузка конфигурации:

```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Загрузка переменных окружения
  await dotenv.load(fileName: ".env");
  
  // Инициализация с переменными окружения
  await MagentoService.initializeFromEnv();
  
  runApp(MyApp());
}
```

## ✅ Проверка установки

### 1. Тест подключения

Создайте простой тест для проверки подключения:

```dart
// lib/test_connection.dart
import 'package:flutter_magento/flutter_magento.dart';

Future<void> testMagentoConnection() async {
  try {
    final magento = FlutterMagento();
    
    await magento.initialize(
      baseUrl: 'https://your-magento-store.com',
    );
    
    // Тест получения информации о магазине
    final storeInfo = await magento.getStoreInfo();
    print('✅ Подключение успешно: ${storeInfo.name}');
    
  } catch (e) {
    print('❌ Ошибка подключения: $e');
  }
}
```

### 2. Тест API

```dart
Future<void> testMagentoAPI() async {
  try {
    final magento = FlutterMagento();
    
    // Тест получения продуктов
    final products = await magento.getProducts(
      page: 1,
      pageSize: 5,
    );
    
    print('✅ API работает. Получено продуктов: ${products.items.length}');
    
  } catch (e) {
    print('❌ Ошибка API: $e');
  }
}
```

## 🔧 Расширенная конфигурация

### 1. Настройка кэширования

```dart
await magento.initialize(
  baseUrl: 'https://your-magento-store.com',
  cacheConfig: CacheConfig(
    enableCaching: true,
    cacheDuration: Duration(minutes: 30),
    maxCacheSize: 100 * 1024 * 1024, // 100MB
  ),
);
```

### 2. Настройка офлайн режима

```dart
await magento.initialize(
  baseUrl: 'https://your-magento-store.com',
  offlineConfig: OfflineConfig(
    enableOfflineMode: true,
    syncInterval: Duration(minutes: 15),
    maxOfflineActions: 100,
  ),
);
```

### 3. Настройка локализации

```dart
await magento.initialize(
  baseUrl: 'https://your-magento-store.com',
  localizationConfig: LocalizationConfig(
    supportedLanguages: ['en', 'ru', 'de', 'fr'],
    autoDetectLanguage: true,
    fallbackLanguage: 'en',
  ),
);
```

## 🐛 Устранение неполадок

### Распространенные проблемы

#### 1. Ошибка сетевого подключения
```
DioError [DioErrorType.connectTimeout]: Connecting timeout
```

**Решение:**
- Проверьте URL Magento магазина
- Увеличьте таймауты подключения
- Проверьте настройки сети

#### 2. Ошибка CORS (для веб)
```
Access to XMLHttpRequest has been blocked by CORS policy
```

**Решение:**
- Настройте CORS в Magento
- Добавьте домен в разрешенные origins

#### 3. Ошибка SSL сертификата
```
HandshakeException: Handshake error in client
```

**Решение:**
```dart
// Только для разработки!
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}
```

## 📚 Следующие шаги

После успешной установки рекомендуем ознакомиться с:

1. **[Быстрый старт](quick-start.md)** - Создание первого приложения
2. **[Конфигурация](configuration.md)** - Детальная настройка
3. **[API Reference](../api-reference/overview.md)** - Полная документация API
4. **[Примеры](../examples/basic-ecommerce.md)** - Готовые примеры приложений

## 💡 Полезные советы

- Используйте переменные окружения для хранения конфиденциальной информации
- Настройте правильные таймауты для вашей сети
- Включите кэширование для улучшения производительности
- Регулярно обновляйте плагин до последней версии

---

**Нужна помощь?** Обратитесь к нашему [разделу поддержки](../support/getting-support.md) или создайте issue в [GitHub репозитории](https://github.com/nativemind/flutter_magento/issues).
