# Fastlane Metadata Guide

Руководство по работе с метаданными App Store через fastlane.

## 📋 Содержание

- [Быстрый старт](#быстрый-старт)
- [Структура метаданных](#структура-метаданных)
- [Команды](#команды)
- [Скриншоты](#скриншоты)
- [Проверка перед отправкой](#проверка-перед-отправкой)
- [Часто задаваемые вопросы](#часто-задаваемые-вопросы)

## 🚀 Быстрый старт

### 1. Установка зависимостей

```bash
# Установите fastlane если еще не установлен
gem install fastlane

# Или через Bundler (рекомендуется)
bundle install
```

### 2. Проверка метаданных

Перед загрузкой проверьте, что все файлы заполнены:

```bash
cd ios
fastlane precheck
```

### 3. Загрузка метаданных (без бинарника)

```bash
cd ios
fastlane deliver --skip_binary_upload
```

### 4. Только метаданные (без скриншотов)

```bash
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots
```

## 📁 Структура метаданных

```
ios/fastlane/metadata/
├── copyright.txt                          # © 2025 Flutter Magento SDK
├── primary_category.txt                   # DEVELOPER_TOOLS
├── secondary_category.txt                 # SHOPPING
├── README.md                              # Документация
│
├── review_information/                    # Контакты для Apple Review
│   ├── first_name.txt                    # Имя
│   ├── last_name.txt                     # Фамилия
│   ├── email_address.txt                 # Email
│   ├── phone_number.txt                  # Телефон
│   └── notes.txt                         # Заметки для ревьюеров
│
├── trade_representative_contact_information/  # Торговый представитель
│   ├── first_name.txt
│   ├── last_name.txt
│   ├── email_address.txt
│   └── phone_number.txt
│
├── ru-RU/                                 # Русская локализация
│   ├── name.txt                          # 30 символов макс
│   ├── subtitle.txt                      # 30 символов макс
│   ├── description.txt                   # 4000 символов макс
│   ├── keywords.txt                      # 100 символов макс (через запятую)
│   ├── promotional_text.txt              # 170 символов макс
│   ├── release_notes.txt                 # 4000 символов макс
│   ├── support_url.txt                   # URL поддержки
│   ├── marketing_url.txt                 # Маркетинговый URL
│   ├── privacy_url.txt                   # Политика конфиденциальности
│   └── screenshots/                       # Скриншоты для русской версии
│
└── en-US/                                 # Английская локализация
    ├── name.txt
    ├── subtitle.txt
    ├── description.txt
    ├── keywords.txt
    ├── promotional_text.txt
    ├── release_notes.txt
    ├── support_url.txt
    ├── marketing_url.txt
    ├── privacy_url.txt
    └── screenshots/                       # Скриншоты для английской версии
```

## 🎮 Команды

### Загрузка метаданных

```bash
# Только метаданные (без бинарника и скриншотов)
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots

# Метаданные + скриншоты (без бинарника)
cd ios
fastlane deliver --skip_binary_upload

# Всё вместе (метаданные + скриншоты + бинарник)
cd ios
fastlane deliver
```

### Скачивание существующих метаданных

```bash
cd ios
fastlane deliver download_metadata
```

### Скачивание скриншотов

```bash
cd ios
fastlane deliver download_screenshots
```

### Проверка метаданных

```bash
cd ios
fastlane precheck
```

### Создание превью метаданных (HTML)

```bash
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots --html
```

## 📱 Скриншоты

### Требуемые размеры

#### iPhone (обязательно)
- **6.7" Display** (iPhone 14 Pro Max, 15 Pro Max): `1290x2796` или `1284x2778`
- **6.5" Display** (iPhone 11 Pro Max, XS Max): `1242x2688` или `1284x2778`
- **5.5" Display** (iPhone 8 Plus): `1242x2208`

#### iPad (опционально)
- **12.9" Display** (iPad Pro 6th gen): `2048x2732`
- **11" Display** (iPad Pro): `1668x2388`

### Именование файлов

Скриншоты должны быть названы по порядку:
```
1_screenshot.png
2_screenshot.png
3_screenshot.png
...
10_screenshot.png
```

### Размещение

Поместите скриншоты в соответствующие директории:
```
metadata/ru-RU/screenshots/
metadata/en-US/screenshots/
```

### Автоматическое создание скриншотов

Используйте fastlane snapshot (требует дополнительной настройки):
```bash
cd ios
fastlane snapshot
```

## ✅ Проверка перед отправкой

### Checklist

- [ ] Все текстовые файлы заполнены
- [ ] Длина текстов соответствует лимитам:
  - name.txt: ≤ 30 символов
  - subtitle.txt: ≤ 30 символов
  - keywords.txt: ≤ 100 символов
  - promotional_text.txt: ≤ 170 символов
  - description.txt: ≤ 4000 символов
  - release_notes.txt: ≤ 4000 символов
- [ ] URLs валидны и доступны
- [ ] Скриншоты в правильных разрешениях
- [ ] Контактная информация актуальна
- [ ] Запущена проверка precheck без ошибок

### Автоматическая проверка

```bash
cd ios
fastlane precheck
```

### Проверка длины текстов

```bash
# Проверка name.txt (макс 30)
wc -m < fastlane/metadata/ru-RU/name.txt

# Проверка keywords.txt (макс 100)
wc -m < fastlane/metadata/ru-RU/keywords.txt

# Проверка promotional_text.txt (макс 170)
wc -m < fastlane/metadata/ru-RU/promotional_text.txt
```

## 🔧 Настройка

### Deliverfile

Основные настройки находятся в `ios/fastlane/Deliverfile`:

```ruby
app_identifier "com.example.example"
username "anton.v.dodonov@gmail.com"
team_id "120374799"
platform "ios"
languages ["ru-RU", "en-US"]
```

### Переменные окружения

Создайте `.env` файл в `ios/fastlane/`:

```bash
DELIVER_USERNAME=anton.v.dodonov@gmail.com
DELIVER_TEAM_ID=120374799
FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=xxxx-xxxx-xxxx-xxxx
```

## 📝 Обновление версии

### Перед каждым релизом:

1. **Обновите release notes**
   ```bash
   nano ios/fastlane/metadata/ru-RU/release_notes.txt
   nano ios/fastlane/metadata/en-US/release_notes.txt
   ```

2. **Обновите версию приложения**
   ```bash
   cd ios
   fastlane bump_version type:patch  # или minor, major
   ```

3. **Обновите build number**
   ```bash
   cd ios
   fastlane bump_build
   ```

4. **Обновите скриншоты** (если UI изменился)

## 🌍 Добавление новых языков

1. Создайте директорию для нового языка:
   ```bash
   mkdir -p ios/fastlane/metadata/de-DE
   ```

2. Скопируйте файлы из английской версии:
   ```bash
   cp -r ios/fastlane/metadata/en-US/* ios/fastlane/metadata/de-DE/
   ```

3. Переведите содержимое файлов

4. Обновите `Deliverfile`:
   ```ruby
   languages ["ru-RU", "en-US", "de-DE"]
   ```

### Поддерживаемые коды языков

- `en-US` - Английский (США)
- `ru-RU` - Русский
- `de-DE` - Немецкий
- `fr-FR` - Французский
- `es-ES` - Испанский
- `it-IT` - Итальянский
- `ja-JP` - Японский
- `zh-Hans` - Китайский (упрощенный)
- `pt-BR` - Португальский (Бразилия)
- `ko-KR` - Корейский

[Полный список](https://docs.fastlane.tools/actions/deliver/#available-language-codes)

## ❓ Часто задаваемые вопросы

### Как обновить только описание?

```bash
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots --force
```

### Как протестировать без загрузки?

```bash
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots --skip_metadata
```

### Ошибка: "No binary upload"

Это нормально если вы используете `--skip_binary_upload`. Бинарник загружается отдельно через `fastlane beta` или `fastlane release`.

### Как загрузить приложение в TestFlight?

```bash
cd ios
fastlane beta
```

### Как отправить на ревью?

```bash
cd ios
fastlane deliver --submit_for_review
```

### Проблемы с аутентификацией

1. Создайте App-Specific Password на appleid.apple.com
2. Экспортируйте переменную:
   ```bash
   export FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=xxxx-xxxx-xxxx-xxxx
   ```

## 🔗 Полезные ссылки

- [Fastlane Deliver Documentation](https://docs.fastlane.tools/actions/deliver/)
- [Fastlane Best Practices](https://docs.fastlane.tools/best-practices/)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)
- [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- [GitLab Repository](https://gitlab.com/libsFlutter/flutter_magento)

## 🆘 Поддержка

При возникновении проблем:
1. Проверьте логи fastlane
2. Запустите `fastlane precheck`
3. Создайте issue в [GitLab](https://gitlab.com/libsFlutter/flutter_magento/-/issues)
4. Email: anton.v.dodonov@gmail.com

