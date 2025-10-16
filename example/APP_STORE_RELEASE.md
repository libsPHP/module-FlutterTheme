# App Store Release Guide для Flutter Magento Example

Пошаговое руководство по созданию архива и публикации приложения в Apple App Store.

## 📋 Предварительные требования

### 1. Apple Developer Account
- ✅ Активная учетная запись Apple Developer ($99/год)
- ✅ Доступ к App Store Connect
- ✅ Созданный App ID в Developer Portal

### 2. Certificates & Provisioning Profiles
- ✅ iOS Distribution Certificate
- ✅ App Store Provisioning Profile
- ✅ Team ID

### 3. Xcode & Tools
- ✅ Xcode 15.0+
- ✅ Flutter 3.24.0+
- ✅ CocoaPods установлен

## 🔧 Подготовка проекта

### Шаг 1: Обновите Bundle Identifier

Откройте `ios/Runner.xcworkspace` в Xcode и:

1. Выберите проект "Runner" в навигаторе
2. Выберите target "Runner"
3. На вкладке "General" найдите "Bundle Identifier"
4. Измените на уникальный ID (например: `com.yourcompany.flutter-magento-example`)

Или через командную строку в `ios/Runner.xcodeproj/project.pbxproj`:
```
PRODUCT_BUNDLE_IDENTIFIER = com.yourcompany.flutterMagentoExample;
```

### Шаг 2: Обновите Team ID

#### В Xcode:
1. Откройте `ios/Runner.xcworkspace`
2. Выберите проект "Runner"
3. На вкладке "Signing & Capabilities"
4. Выберите вашу команду в "Team"

#### Или обновите `ios/ExportOptions.plist`:
```xml
<key>teamID</key>
<string>ВАША_TEAM_ID</string>
```

Найти Team ID можно:
- Apple Developer Account > Membership
- Xcode > Settings > Accounts > Manage Certificates

### Шаг 3: Обновите версию и build number

В `pubspec.yaml`:
```yaml
version: 1.0.0+1
#        ^app   ^build
#        version number
```

Для новых релизов:
- Новая версия: `1.0.0+1` → `1.1.0+1`
- Новый build: `1.0.0+1` → `1.0.0+2`

### Шаг 4: Обновите App Name и иконки

#### App Name в `ios/Runner/Info.plist`:
```xml
<key>CFBundleDisplayName</key>
<string>Flutter Magento</string>
```

#### App Icons:
Замените иконки в `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- 1024x1024 (App Store)
- Остальные размеры для устройств

## 🏗️ Создание Archive

### Метод 1: Автоматический скрипт (Рекомендуется)

```bash
chmod +x create_archive.sh
./create_archive.sh
```

Скрипт автоматически:
- Очистит предыдущие builds
- Установит зависимости
- Создаст Flutter build
- Создаст Xcode archive
- Экспортирует IPA файл

### Метод 2: Flutter команда

```bash
# Создать IPA файл
flutter build ipa --release

# Результат будет в:
# build/ios/ipa/Runner.ipa
```

### Метод 3: Через Xcode (ручной)

1. Откройте workspace:
   ```bash
   open ios/Runner.xcworkspace
   ```

2. В Xcode:
   - Product > Scheme > Edit Scheme
   - Убедитесь, что Build Configuration = Release
   - Product > Destination > Any iOS Device (arm64)
   - Product > Archive
   
3. После завершения откроется Organizer:
   - Выберите созданный archive
   - Нажмите "Distribute App"
   - Выберите "App Store Connect"
   - Следуйте инструкциям

## 📤 Загрузка в App Store Connect

### Вариант 1: Через Xcode Organizer

1. Window > Organizer (⌘⌥⇧O)
2. Выберите ваш archive
3. Нажмите "Distribute App"
4. Выберите "App Store Connect"
5. Upload

### Вариант 2: Через Transporter App

1. Скачайте Transporter из Mac App Store
2. Откройте Transporter
3. Перетащите IPA файл
4. Нажмите "Deliver"

### Вариант 3: Через командную строку (altool)

```bash
xcrun altool --upload-app \
  --type ios \
  --file build/ios/ipa/Runner.ipa \
  --username "your-apple-id@example.com" \
  --password "your-app-specific-password"
```

Создайте App-Specific Password:
- https://appleid.apple.com
- Sign In > App-Specific Passwords > Generate Password

## 🔍 Проверка перед загрузкой

### 1. Валидация IPA

```bash
xcrun altool --validate-app \
  --type ios \
  --file build/ios/ipa/Runner.ipa \
  --username "your-apple-id@example.com" \
  --password "your-app-specific-password"
```

### 2. Проверка архива

```bash
# Информация о IPA
unzip -l build/ios/ipa/Runner.ipa

# Проверка сертификата
codesign -dvv build/ios/archive/Runner.xcarchive/Products/Applications/Runner.app
```

### 3. Чек-лист

- [ ] Bundle Identifier уникален и зарегистрирован
- [ ] Team ID правильный
- [ ] Версия и build number актуальны
- [ ] App Name и иконки обновлены
- [ ] Все permissions указаны в Info.plist
- [ ] Privacy policy URL добавлен (если требуется)
- [ ] Тестирование на реальном устройстве

## 🎨 App Store Connect настройка

### 1. Создайте App в App Store Connect

1. Войдите в https://appstoreconnect.apple.com
2. Apps > "+" > New App
3. Заполните:
   - Platform: iOS
   - Name: Flutter Magento Example
   - Primary Language: English
   - Bundle ID: (выберите ваш)
   - SKU: уникальный идентификатор

### 2. Заполните метаданные

#### App Information:
- **Name:** Flutter Magento Example
- **Subtitle:** Magento E-commerce Demo
- **Privacy Policy URL:** (ваш URL)
- **Category:** Shopping
- **Secondary Category:** Business (optional)

#### Version Information:
- **Screenshots:** 
  - 6.5" iPhone (mandatory)
  - 5.5" iPhone
  - iPad Pro 12.9"
  
- **Description:**
```
A comprehensive Flutter application demonstrating Magento e-commerce integration.

Features:
• Complete Magento REST API integration
• Secure customer authentication
• Product catalog browsing
• Shopping cart management
• Real-time data from demo stores
• Modern Material Design UI

Perfect for developers learning Magento mobile integration or businesses looking to build e-commerce apps.

Test with Luma Demo store included!
```

- **Keywords:** magento, ecommerce, shopping, flutter, demo, catalog, cart
- **Support URL:** https://github.com/nativemind/flutter_magento
- **Marketing URL:** https://nativemind.net

### 3. Загрузите скриншоты

Используйте существующие скриншоты из `/screenshots/`:
- main.jpg
- login.jpg
- signup.jpg
- products.jpg
- cart.jpg
- settings.jpg

Или создайте новые:
```bash
flutter run --release
# Сделайте скриншоты нужных экранов
```

## 📱 TestFlight (опционально)

Перед публикацией рекомендуется протестировать через TestFlight:

1. После загрузки build в App Store Connect
2. Перейдите в TestFlight
3. Добавьте внутренних тестеров
4. Настройте внешнее тестирование (требует review)
5. Соберите обратную связь

## 🚦 Submission процесс

### 1. Подготовка к Review

#### App Review Information:
- **First Name:** Your Name
- **Last Name:** Your Last Name  
- **Phone Number:** +1 234 567 8900
- **Email:** your-email@example.com
- **Demo Account:** (если требуется вход)
  ```
  Email: test@scandipwa.com
  Password: Test@123456
  ```
- **Notes:**
```
This is a demo application for Flutter Magento plugin.

Test Store: https://luma-demo.scandipwa.com/
Test Credentials: test@scandipwa.com / Test@123456

The app demonstrates e-commerce features using public Magento demo API.
```

### 2. Submit for Review

1. Убедитесь, что все поля заполнены
2. Выберите build из TestFlight
3. Нажмите "Submit for Review"
4. Ожидайте 24-48 часов

## 🔧 Устранение проблем

### Проблема: Build не компилируется

```bash
# Очистите все
flutter clean
cd ios && pod deintegrate && pod install && cd ..
flutter pub get

# Попробуйте снова
flutter build ios --release
```

### Проблема: Code signing ошибки

1. Откройте Xcode
2. Product > Clean Build Folder (⌘⇧K)
3. Preferences > Accounts > Download Manual Profiles
4. Signing & Capabilities > Automatically manage signing ✓

### Проблема: "No provisioning profile found"

```bash
# Скачайте profiles
cd ios
xcodebuild -downloadPlatform iOS
```

Или в Xcode:
- Window > Devices and Simulators
- Right-click device > Unpair
- Re-pair device

### Проблема: freezed модели не компилируются

```bash
# Регенерируйте models
cd ..  # в корень flutter_magento
flutter pub run build_runner build --delete-conflicting-outputs

# Затем вернитесь в example
cd example
flutter build ios --release
```

## 📊 Размеры и оптимизация

### Уменьшение размера IPA

```bash
# Build с оптимизацией
flutter build ios --release \
  --split-debug-info=./debug-info \
  --obfuscate \
  --tree-shake-icons

# Проверка размера
ls -lh build/ios/ipa/*.ipa
```

### Анализ размера

```bash
# Используйте code-size-analysis
flutter build ios --release --analyze-size
```

## 📋 Чек-лист перед публикацией

- [ ] Bundle ID уникален и зарегистрирован в Developer Portal
- [ ] Team ID указан корректно
- [ ] Версия обновлена (если не первый релиз)
- [ ] App Store иконка 1024x1024 добавлена
- [ ] Скриншоты для всех размеров экранов подготовлены
- [ ] Description и keywords заполнены
- [ ] Privacy Policy URL добавлен
- [ ] Support URL указан
- [ ] Demo credentials предоставлены в Review Notes
- [ ] Приложение протестировано на реальном устройстве
- [ ] Все permissions объяснены в Info.plist
- [ ] TestFlight beta testing пройден (опционально)

## 🎯 Быстрый старт

Для быстрого создания архива (после настройки Team ID):

```bash
# 1. Обновите ExportOptions.plist с вашим Team ID
# 2. Запустите скрипт
./create_archive.sh

# 3. Загрузите через Transporter или Xcode
```

## 📞 Поддержка

Если возникли проблемы:
- 📧 Email: support@nativemind.net
- 🐛 Issues: https://github.com/nativemind/flutter_magento/issues
- 📚 Apple Documentation: https://developer.apple.com/app-store/submissions/

## 🔗 Полезные ссылки

- [App Store Connect](https://appstoreconnect.apple.com)
- [Apple Developer Portal](https://developer.apple.com/account)
- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [Flutter iOS Deployment](https://docs.flutter.dev/deployment/ios)

---

**Примечание:** Убедитесь, что все freezed модели успешно сгенерированы перед созданием архива.

