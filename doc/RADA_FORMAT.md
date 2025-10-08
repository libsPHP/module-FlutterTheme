>>>
# 🚀 .rada хранит данные с выбранной категории (может быть root) magento, включает в себя структуру категорий от выбранной, картинки, отзывы, комментарии,...
файлы сжимаются в единый .zip
изображения лежат в папке asstets
переводы лежат в папке l10n
основная информация лежит в файле data.json

<<< До этого места редактировать запрещено

---

## 📋 Спецификация формата RADA v1.0

### Структура архива

```
example.rada (ZIP archive)
├── manifest.json          # Метаданные формата и версия
├── data.json             # Основные данные категории и продуктов
├── assets/               # Изображения
│   ├── categories/       # Изображения категорий
│   │   └── {id}.{ext}
│   └── products/         # Изображения продуктов
│       └── {sku}/
│           └── {filename}.{ext}
└── l10n/                 # Переводы
    ├── en.json
    ├── ru.json
    └── {locale}.json
```

### manifest.json

```json
{
  "version": "1.0",
  "format": "rada",
  "createdAt": "2025-10-08T12:00:00Z",
  "createdBy": "flutter_magento",
  "source": {
    "storeUrl": "https://example.com",
    "categoryId": 123,
    "categoryName": "Electronics"
  },
  "stats": {
    "categoriesCount": 10,
    "productsCount": 50,
    "imagesCount": 150,
    "reviewsCount": 25,
    "localesCount": 2
  },
  "checksums": {
    "main": "sha256:...",
    "assets": "sha256:...",
    "l10n": "sha256:..."
  }
}
```

### data.json

```json
{
  "rootCategory": {
    "id": 123,
    "name": "Electronics",
    "description": "...",
    "image": "assets/categories/123.jpg",
    "parentId": null,
    "level": 1,
    "position": 1,
    "isActive": true,
    "childrenCount": 3,
    "children": [/* категории */],
    "attributes": [/* атрибуты */]
  },
  "categories": [
    /* Плоский список всех категорий */
  ],
  "products": [
    {
      "id": 1,
      "sku": "PROD-001",
      "name": "Product Name",
      "price": 99.99,
      "description": "...",
      "images": [
        "assets/products/PROD-001/image1.jpg"
      ],
      "categories": [123, 124],
      "reviews": [/* отзывы */],
      "customAttributes": [/* атрибуты */]
    }
  ],
  "reviews": [
    {
      "id": 1,
      "productId": 1,
      "title": "Great product",
      "detail": "...",
      "rating": 5,
      "nickname": "User123",
      "createdAt": "2025-10-08T12:00:00Z"
    }
  ]
}
```

### l10n/{locale}.json

```json
{
  "categories": {
    "123": {
      "name": "Электроника",
      "description": "Описание категории"
    }
  },
  "products": {
    "PROD-001": {
      "name": "Название продукта",
      "description": "Описание продукта",
      "shortDescription": "Краткое описание"
    }
  },
  "attributes": {
    "color": "Цвет",
    "size": "Размер"
  }
}
```

## 🔧 Использование

### Экспорт данных

```dart
final exporter = RadaExporter(magentoApi);
final radaFile = await exporter.exportCategory(
  categoryId: 123,
  includeSubcategories: true,
  includeProducts: true,
  includeReviews: true,
  includeImages: true,
  locales: ['en', 'ru'],
);
```

### Импорт данных (Preload)

```dart
final importer = RadaImporter();
final radaData = await importer.importFromFile('assets/preload.rada');

// Использовать как начальные данные
await magentoProvider.loadFromRadaData(radaData);
```

## 🎯 Преимущества

1. **Портативность** - один файл содержит всё необходимое
2. **Офлайн-поддержка** - можно работать без подключения к Magento
3. **Быстрый старт** - preload для демо и тестирования
4. **Версионирование** - манифест позволяет управлять совместимостью
5. **Локализация** - встроенная поддержка переводов
6. **Целостность** - контрольные суммы для валидации данных

## 📦 Ограничения

- Максимальный размер файла: 500 МБ (рекомендуется)
- Изображения автоматически оптимизируются
- Поддержка форматов изображений: JPG, PNG, WebP
- Рекомендуемая глубина вложенности категорий: до 5 уровней

**Made with ❤️ by NativeMind Team**
