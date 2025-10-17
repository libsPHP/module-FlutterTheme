# App Store Metadata

Эта директория содержит метаданные для загрузки приложения в App Store через fastlane.

## Структура

```
metadata/
├── copyright.txt                      # Информация об авторских правах
├── primary_category.txt              # Основная категория (DEVELOPER_TOOLS)
├── secondary_category.txt            # Дополнительная категория (SHOPPING)
├── review_information/               # Контактная информация для ревью
│   ├── first_name.txt
│   ├── last_name.txt
│   ├── email_address.txt
│   ├── phone_number.txt
│   └── notes.txt                    # Заметки для ревьюеров
├── ru-RU/                           # Русская локализация
│   ├── name.txt                     # Название (макс 30 символов)
│   ├── subtitle.txt                 # Подзаголовок (макс 30 символов)
│   ├── description.txt              # Описание (макс 4000 символов)
│   ├── keywords.txt                 # Ключевые слова (макс 100 символов)
│   ├── promotional_text.txt         # Промо текст (макс 170 символов)
│   ├── release_notes.txt            # Что нового (макс 4000 символов)
│   ├── support_url.txt             # URL поддержки
│   ├── marketing_url.txt           # Маркетинговый URL
│   ├── privacy_url.txt             # Политика конфиденциальности
│   └── screenshots/                 # Скриншоты
└── en-US/                           # Английская локализация
    ├── name.txt
    ├── subtitle.txt
    ├── description.txt
    ├── keywords.txt
    ├── promotional_text.txt
    ├── release_notes.txt
    ├── support_url.txt
    ├── marketing_url.txt
    ├── privacy_url.txt
    └── screenshots/
```

## Скриншоты

Для App Store требуются скриншоты в следующих разрешениях:

### iPhone
- **6.7" Display** (iPhone 14 Pro Max, 15 Pro Max): 1290x2796 или 1284x2778
- **6.5" Display** (iPhone 11 Pro Max, XS Max): 1242x2688 или 1284x2778
- **5.5" Display** (iPhone 8 Plus): 1242x2208

### iPad (опционально)
- **12.9" Display** (iPad Pro): 2048x2732
- **11" Display** (iPad Pro): 1668x2388

Файлы скриншотов должны называться: `1_screenshot.png`, `2_screenshot.png`, и т.д.

## Использование

### Заполнение метаданных
Все файлы уже заполнены базовой информацией. При необходимости отредактируйте их.

### Загрузка метаданных в App Store Connect
```bash
cd ios
fastlane deliver --skip_binary_upload --skip_screenshots
```

### Загрузка со скриншотами
```bash
cd ios
fastlane deliver --skip_binary_upload
```

### Полная загрузка (с бинарником)
```bash
cd ios
fastlane deliver
```

## Важные замечания

1. **name.txt** и **subtitle.txt** имеют лимит в 30 символов каждый
2. **keywords.txt** - максимум 100 символов, ключевые слова разделяются запятыми
3. **promotional_text.txt** - максимум 170 символов
4. **description.txt** и **release_notes.txt** - максимум 4000 символов

## Обновление

Перед каждым релизом:
1. Обновите `release_notes.txt` с описанием изменений
2. При необходимости обновите скриншоты
3. Проверьте актуальность URLs

## Дополнительные локали

Чтобы добавить поддержку других языков:
1. Создайте директорию с кодом локали (например, `de-DE` для немецкого)
2. Скопируйте все `.txt` файлы из `en-US`
3. Переведите содержимое файлов

## Ссылки

- [Fastlane Deliver Documentation](https://docs.fastlane.tools/actions/deliver/)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)
- [GitLab Repository](https://gitlab.com/libsFlutter/flutter_magento)

