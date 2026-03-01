# Flutter Magento - Release Guide

Полное руководство по публикации пакета и example приложений.

## 📦 Публикация Пакета на pub.dev

### Предварительные проверки

```bash
cd /Users/anton/proj/libs/libsMagento/flutter_magento

# 1. Проверить версию в pubspec.yaml
grep "^version:" pubspec.yaml

# 2. Обновить CHANGELOG.md
# Добавить записи о новой версии

# 3. Запустить тесты
flutter test

# 4. Проверить линтер
flutter analyze

# 5. Dry-run публикации
flutter pub publish --dry-run
```

### Публикация

```bash
# После успешного dry-run
flutter pub publish

# Подтвердить публикацию (y)
```

### Текущий статус (v4.3.1)

✅ CHANGELOG обновлен  
✅ Версия установлена на 4.3.1  
✅ equatable добавлен в dependencies  
⚠️ Freezed модели требуют регенерации  
⚠️ flutter_secure_storage использует beta версию  

### Решение проблем

**Freezed ошибки**:
```bash
# Регенерировать модели
dart run build_runner build --delete-conflicting-outputs
```

**Pre-release зависимости**:
```bash
# Опция 1: Использовать стабильную версию flutter_secure_storage
# Опция 2: Опубликовать как pre-release
flutter pub publish --dry-run
# Использовать версию типа 4.3.1-beta.1
```

---

## 📱 Релиз Example Приложений

### Example Marketplace (iOS + Android)

#### iOS - TestFlight

```bash
cd example_marketplace

# Метод 1: Использовать fastlane
cd ios
fastlane beta

# Метод 2: Использовать скрипт
cd ..
./release.sh ios beta
```

#### iOS - App Store

```bash
cd example_marketplace
./release.sh ios release

# Или вручную:
cd ios
fastlane release
```

#### Android - Play Console

```bash
cd example_marketplace

# Internal testing
./release.sh android beta

# Production release
./release.sh android release
```

### Fastlane Lanes

#### iOS Lanes:
- `ios beta` - TestFlight beta release
- `ios release` - App Store production release  
- `ios build_debug` - Debug build
- `ios test` - Run tests
- `ios screenshots` - Generate screenshots

#### Android Lanes:
- `android beta` - Play Console internal testing
- `android release` - Play Store production
- `android build_apk` - Build APK for testing

---

## 🔄 Полный Release Workflow

### 1. Подготовка

```bash
# Перейти в директорию проекта
cd /Users/anton/proj/libs/libsMagento/flutter_magento

# Убедиться что все изменения закоммичены
git status

# Создать ветку для релиза (опционально)
git checkout -b release/v4.3.1
```

### 2. Обновление версий

```bash
# Обновить версию в pubspec.yaml
# version: 4.3.1

# Обновить CHANGELOG.md
# Добавить описание изменений
```

### 3. Тестирование

```bash
# Запустить тесты основного пакета
flutter test

# Запустить тесты example приложений
cd example && flutter test
cd ../example_marketplace && flutter test
```

### 4. Публикация пакета

```bash
cd /Users/anton/proj/libs/libsMagento/flutter_magento

# Dry-run
flutter pub publish --dry-run

# Если все ОК - публиковать
flutter pub publish
```

### 5. Релиз Example Apps

```bash
# iOS TestFlight
cd example_marketplace
./release.sh ios beta

# Android Internal Testing  
./release.sh android beta
```

### 6. Создание тега и push

```bash
# Вернуться в корень
cd /Users/anton/proj/libs/libsMagento/flutter_magento

# Создать тег
git tag -a v4.3.1 -m "Release v4.3.1 - Marketplace support"

# Push в репозиторий
git push origin master
git push origin v4.3.1
```

---

## 📋 Чеклист Релиза

### Перед релизом:
- [ ] Все тесты проходят
- [ ] Нет линтер ошибок (или только warnings)
- [ ] CHANGELOG.md обновлен
- [ ] Версия в pubspec.yaml правильная
- [ ] README.md актуальный
- [ ] Примеры работают
- [ ] Документация обновлена
- [ ] Git чистый (все закоммичено)

### Публикация пакета:
- [ ] `flutter pub publish --dry-run` успешен
- [ ] `flutter pub publish` выполнен
- [ ] Пакет появился на pub.dev
- [ ] Проверена документация на pub.dev

### Релиз Example Apps:
- [ ] Fastlane настроен
- [ ] Appfile сконфигурирован
- [ ] iOS beta build загружен
- [ ] Android beta build загружен
- [ ] Тестеры приглашены
- [ ] Release notes добавлены

### После релиза:
- [ ] Git tag создан
- [ ] Изменения запушены
- [ ] Release notes опубликованы
- [ ] Социальные сети обновлены
- [ ] Changelog на сайте обновлен

---

## 🛠️ Troubleshooting

### "Package validation failed"

**Проблема**: Freezed модели не генерируются корректно

**Решение**:
```bash
# Удалить сгенерированные файлы
find lib -name "*.freezed.dart" -delete
find lib -name "*.g.dart" -delete

# Регенерировать
dart run build_runner build --delete-conflicting-outputs
```

### "Modified files in git"

**Проблема**: Git отслеживает изменения

**Решение**:
```bash
# Закоммитить все изменения
git add -A
git commit -m "Prepare for release v4.3.1"
```

### "Pre-release dependency"

**Проблема**: flutter_secure_storage использует beta версию

**Решение**:
```bash
# Опция 1: Изменить на стабильную версию
# В pubspec.yaml:
# flutter_secure_storage: ^9.0.0

# Опция 2: Опубликовать как pre-release
# В pubspec.yaml:
# version: 4.3.1-beta.1
```

### Fastlane authentication errors

**Решение**:
```bash
# Установить переменные окружения
export FASTLANE_USER="your-apple-id@example.com"
export FASTLANE_PASSWORD="your-password"

# Или создать .env файл в ios/ директории
```

---

## 📊 Версионирование

Следуйте Semantic Versioning (semver.org):

- **MAJOR** (5.0.0): Breaking changes
- **MINOR** (4.3.0): New features, backward compatible  
- **PATCH** (4.2.2): Bug fixes, backward compatible

### Текущая версия: 4.3.1

**История**:
- 4.1.0 - Предыдущий релиз
- 4.2.1 - Marketplace features added
- 4.3.1 - Marketplace examples created

---

## 🚀 Quick Commands

```bash
# Package publish (dry-run)
flutter pub publish --dry-run

# Package publish (real)
flutter pub publish

# iOS TestFlight
cd example_marketplace && ./release.sh ios beta

# Android Internal
cd example_marketplace && ./release.sh android beta

# Create release tag
git tag -a v4.3.1 -m "Release v4.3.1"
git push origin v4.3.1
```

---

## 📞 Support

Вопросы по релизу:
- 📧 contact@nativemind.net
- 📖 https://docs.fastlane.tools
- 🐛 GitLab Issues

---

**Последнее обновление**: October 18, 2025  
**Версия гайда**: 1.0


