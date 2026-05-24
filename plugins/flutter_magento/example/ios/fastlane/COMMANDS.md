# Fastlane Quick Commands

Быстрая справка по командам fastlane.

## 🚀 Основные команды

### Загрузка метаданных
```bash
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots
```

### Загрузка в TestFlight
```bash
cd ios
fastlane beta
```

### Релиз в App Store
```bash
cd ios
fastlane release
```

### Build Ad-Hoc
```bash
cd ios
fastlane adhoc
```

## 📋 Проверки

### Проверка метаданных
```bash
cd ios
fastlane precheck
```

### Проверка длины текстов
```bash
# Name (макс 30)
wc -m < fastlane/metadata/ru-RU/name.txt

# Subtitle (макс 30)
wc -m < fastlane/metadata/ru-RU/subtitle.txt

# Keywords (макс 100)
wc -m < fastlane/metadata/ru-RU/keywords.txt

# Promotional text (макс 170)
wc -m < fastlane/metadata/ru-RU/promotional_text.txt
```

## 🔄 Управление версиями

### Увеличить build number
```bash
cd ios
fastlane bump_build
```

### Увеличить версию (patch: 1.0.0 → 1.0.1)
```bash
cd ios
fastlane bump_version type:patch
```

### Увеличить версию (minor: 1.0.0 → 1.1.0)
```bash
cd ios
fastlane bump_version type:minor
```

### Увеличить версию (major: 1.0.0 → 2.0.0)
```bash
cd ios
fastlane bump_version type:major
```

## 📥 Скачать существующие данные

### Скачать метаданные из App Store Connect
```bash
cd ios
fastlane deliver download_metadata
```

### Скачать скриншоты
```bash
cd ios
fastlane deliver download_screenshots
```

## 📱 Сборка

### Flutter build + iOS
```bash
flutter clean
flutter pub get
flutter build ios --release --no-codesign
```

### Полная сборка через fastlane
```bash
cd ios
fastlane beta  # или release
```

## 🔑 Аутентификация

### Создать App-Specific Password
1. Зайдите на https://appleid.apple.com
2. Security → App-Specific Passwords
3. Generate Password

### Установить password
```bash
export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=xxxx-xxxx-xxxx-xxxx
```

### Или добавить в .env
```bash
echo "FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=xxxx-xxxx-xxxx-xxxx" >> ios/fastlane/.env
```

## 🎨 Скриншоты

### Создать структуру для скриншотов
```bash
mkdir -p ios/fastlane/metadata/ru-RU/screenshots
mkdir -p ios/fastlane/metadata/en-US/screenshots
```

### Требуемые размеры
- iPhone 6.7": 1290x2796 или 1284x2778
- iPhone 6.5": 1242x2688
- iPhone 5.5": 1242x2208

### Именование
```
1_screenshot.png
2_screenshot.png
3_screenshot.png
...
```

## 🌍 Локализация

### Добавить новый язык
```bash
# Создать директорию
mkdir -p ios/fastlane/metadata/de-DE

# Скопировать шаблон
cp -r ios/fastlane/metadata/en-US/* ios/fastlane/metadata/de-DE/

# Отредактировать файлы
nano ios/fastlane/metadata/de-DE/description.txt
```

## 🧹 Очистка

### Очистить build artifacts
```bash
cd ios
fastlane clean_build_artifacts
```

### Полная очистка Flutter
```bash
flutter clean
cd ios
rm -rf Pods Podfile.lock
pod install
```

## 📊 Просмотр

### HTML превью метаданных
```bash
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots --html
```

Откроется файл в браузере с превью вашего App Store листинга.

## 🔍 Отладка

### Verbose режим
```bash
cd ios
fastlane beta --verbose
```

### Trace режим (максимум информации)
```bash
cd ios
fastlane beta --trace
```

### Только Flutter build без загрузки
```bash
flutter build ios --release --no-codesign
```

## 📦 Полный цикл релиза

```bash
# 1. Обновить release notes
nano ios/fastlane/metadata/ru-RU/release_notes.txt
nano ios/fastlane/metadata/en-US/release_notes.txt

# 2. Увеличить build number
cd ios
fastlane bump_build

# 3. Проверить метаданные
fastlane precheck

# 4. Собрать и загрузить в TestFlight
fastlane beta

# 5. Загрузить метаданные
fastlane deliver --skip_binary_upload

# 6. Отправить на ревью (вручную через App Store Connect)
```

## 🆘 Решение проблем

### Проблема: Certificate/Provisioning Profile
```bash
cd ios
fastlane match development --readonly
fastlane match appstore --readonly
```

### Проблема: Outdated pods
```bash
cd ios
pod repo update
pod install
```

### Проблема: Xcode не находит проект
```bash
cd ios
xcodebuild -list -workspace Runner.xcworkspace
```

### Проблема: Старая версия fastlane
```bash
gem update fastlane
# или
bundle update fastlane
```

## 📚 Документация

- Fastlane: https://docs.fastlane.tools
- Deliver: https://docs.fastlane.tools/actions/deliver/
- Match: https://docs.fastlane.tools/actions/match/
- Snapshot: https://docs.fastlane.tools/actions/snapshot/

## 💡 Советы

1. **Всегда проверяйте с precheck** перед загрузкой
2. **Используйте TestFlight** для тестирования перед production
3. **Храните .env файлы в .gitignore** для секретов
4. **Делайте backup** перед major изменениями
5. **Используйте fastlane match** для управления сертификатами в команде


