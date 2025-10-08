# RADA Format - Руководство по использованию

## Содержание

1. [Введение](#введение)
2. [Экспорт данных](#экспорт-данных)
3. [Импорт данных](#импорт-данных)
4. [Preload механизм](#preload-механизм)
5. [Integration в приложение](#integration-в-приложение)
6. [Примеры использования](#примеры-использования)
7. [API Reference](#api-reference)

## Введение

RADA (Resource Archive for Data Application) - это формат для упаковки данных Magento в единый портативный файл. Формат включает:

- Структуру категорий
- Продукты с полной информацией
- Изображения (категорий и продуктов)
- Отзывы и рейтинги
- Мультиязычные переводы
- Метаданные и контрольные суммы

## Экспорт данных

### Базовый экспорт

```dart
import 'package:flutter_magento/flutter_magento.dart';

// Создание экспортера
final exporter = RadaExporter(
  productApi: productApi,
  baseUrl: 'https://your-magento-store.com',
);

// Настройка опций экспорта
final options = RadaExportOptions(
  categoryId: 123,
  includeSubcategories: true,
  includeProducts: true,
  includeReviews: true,
  includeImages: true,
  locales: ['en', 'ru'],
  maxImageWidth: 1024,
  imageQuality: 80,
);

// Экспорт
final outputPath = '/path/to/output.rada';
final file = await exporter.exportCategory(options, outputPath);
print('Exported to: ${file.path}');
```

### Опции экспорта

| Параметр | Тип | По умолчанию | Описание |
|----------|-----|--------------|----------|
| `categoryId` | `int` | required | ID категории для экспорта |
| `includeSubcategories` | `bool` | `true` | Включить подкатегории |
| `includeProducts` | `bool` | `true` | Включить продукты |
| `includeReviews` | `bool` | `true` | Включить отзывы |
| `includeImages` | `bool` | `true` | Включить изображения |
| `locales` | `List<String>` | `['en']` | Языки для экспорта |
| `maxImageWidth` | `int` | `1024` | Макс. ширина изображения |
| `maxImageHeight` | `int` | `1024` | Макс. высота изображения |
| `imageQuality` | `int` | `80` | Качество JPEG (1-100) |
| `maxProducts` | `int?` | `null` | Лимит продуктов |
| `maxDepth` | `int?` | `null` | Макс. глубина категорий |

## Импорт данных

### Базовый импорт

```dart
// Создание импортера
final importer = RadaImporter();

// Импорт файла
final result = await importer.importFromFile('/path/to/file.rada');

if (result.success) {
  print('Imported successfully!');
  print('Categories: ${result.categoriesImported}');
  print('Products: ${result.productsImported}');
  print('Images: ${result.imagesImported}');
  
  // Использование данных
  final package = result.package!;
  final categories = package.data.categories;
  final products = package.data.products;
} else {
  print('Import failed: ${result.error}');
}
```

### Валидация перед импортом

```dart
// Проверить файл
final isValid = await importer.validateArchive('/path/to/file.rada');

if (isValid) {
  // Получить информацию о файле
  final info = await importer.getArchiveInfo('/path/to/file.rada');
  print('Category: ${info.source.categoryName}');
  print('Products: ${info.stats.productsCount}');
  print('Created: ${info.createdAt}');
  
  // Показать диалог подтверждения пользователю
  final confirmed = await showConfirmDialog(info);
  
  if (confirmed) {
    final result = await importer.importFromFile('/path/to/file.rada');
    // Process result...
  }
}
```

### Извлечение конкретных данных

```dart
final package = result.package!;

// Извлечь все категории
final allCategories = importer.extractCategories(package, flatList: true);

// Извлечь дерево категорий
final categoryTree = importer.extractCategories(
  package,
  rootCategoryId: 123,
);

// Извлечь продукты конкретной категории
final categoryProducts = importer.extractProducts(
  package,
  categoryId: 123,
);

// Извлечь конкретные продукты по SKU
final specificProducts = importer.extractProducts(
  package,
  skus: ['SKU-001', 'SKU-002'],
);

// Извлечь отзывы продукта
final reviews = importer.extractReviews(
  package,
  productId: 456,
);
```

## Preload механизм

### Добавление preload файла в assets

1. Экспортируйте нужные данные в .rada файл
2. Добавьте файл в `assets/` директорию
3. Обновите `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/preload.rada
```

### Загрузка preload данных

```dart
final preloadService = RadaPreloadService();

// Загрузить из assets
final package = await preloadService.loadFromAssets('assets/preload.rada');

if (package != null) {
  // Использовать данные для быстрого старта
  await loadDataIntoApp(package);
}

// Проверить наличие preload данных
if (preloadService.hasPreloadData) {
  final preloaded = preloadService.preloadedPackage;
  // Use preloaded data...
}
```

### Получение информации о preload

```dart
// Получить информацию без полной загрузки
final info = await preloadService.getPreloadInfo('assets/preload.rada');

if (info != null) {
  print('Preload contains:');
  print('- ${info.stats.categoriesCount} categories');
  print('- ${info.stats.productsCount} products');
  print('- ${info.stats.imagesCount} images');
}
```

## Integration в приложение

### Provider Integration

```dart
class AppProvider extends ChangeNotifier {
  RadaPackage? _radaData;
  
  Future<void> loadFromRadaPackage(RadaPackage package) async {
    // Convert RADA categories to app categories
    _categories = package.data.categories.map((cat) {
      return AppCategory.fromRadaCategory(cat);
    }).toList();
    
    // Convert RADA products to app products
    _products = package.data.products.map((prod) {
      return AppProduct.fromRadaProduct(prod);
    }).toList();
    
    notifyListeners();
  }
  
  Future<void> loadPreloadIfAvailable() async {
    final preloadService = RadaPreloadService();
    final package = await preloadService.loadFromAssets('assets/preload.rada');
    
    if (package != null) {
      await loadFromRadaPackage(package);
    }
  }
}
```

### UI Integration

```dart
class RadaImportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Выбор файла
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['rada', 'zip'],
        );
        
        if (result != null) {
          final filePath = result.files.single.path!;
          
          // Показать прогресс
          showDialog(
            context: context,
            builder: (_) => LoadingDialog(message: 'Importing...'),
          );
          
          // Импорт
          final importer = RadaImporter();
          final importResult = await importer.importFromFile(filePath);
          
          Navigator.pop(context); // Close loading
          
          if (importResult.success) {
            // Load into app
            final provider = context.read<AppProvider>();
            await provider.loadFromRadaPackage(importResult.package!);
            
            // Show success
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Imported successfully!')),
            );
          } else {
            // Show error
            showErrorDialog(context, importResult.error!);
          }
        }
      },
      child: Text('Import RADA'),
    );
  }
}
```

## Примеры использования

### Пример 1: Демо-данные для приложения

```dart
// 1. Экспорт демо-данных из продакшн Magento
final exporter = RadaExporter(
  productApi: productionApi,
  baseUrl: 'https://production-store.com',
);

final options = RadaExportOptions(
  categoryId: 1, // Root category
  maxProducts: 50,
  maxDepth: 3,
  locales: ['en', 'ru', 'es'],
);

await exporter.exportCategory(options, 'demo_data.rada');

// 2. Добавить в assets/preload.rada
// 3. В приложении загрузить при первом запуске
await appProvider.loadPreloadIfAvailable();
```

### Пример 2: Офлайн-каталог

```dart
// Пользователь может скачать категорию для офлайн-просмотра
Future<void> downloadCategoryForOffline(int categoryId) async {
  final exporter = RadaExporter(
    productApi: productApi,
    baseUrl: baseUrl,
  );
  
  final options = RadaExportOptions(
    categoryId: categoryId,
    includeSubcategories: true,
    includeProducts: true,
    includeImages: true,
  );
  
  final dir = await getApplicationDocumentsDirectory();
  final path = '${dir.path}/offline_category_$categoryId.rada';
  
  await exporter.exportCategory(options, path);
  
  // Сохранить путь в БД для быстрого доступа
  await db.saveOfflineCategory(categoryId, path);
}

// Загрузка офлайн-категории
Future<void> loadOfflineCategory(int categoryId) async {
  final path = await db.getOfflineCategoryPath(categoryId);
  
  if (path != null) {
    final importer = RadaImporter();
    final result = await importer.importFromFile(path);
    
    if (result.success) {
      await appProvider.loadFromRadaPackage(result.package!);
    }
  }
}
```

### Пример 3: Обмен данными между устройствами

```dart
// Устройство 1: Экспорт любимых продуктов
Future<File> exportFavorites(List<String> skus) async {
  // Get products data
  final products = await getProductsBySkus(skus);
  
  // Create minimal RADA package
  final package = RadaPackage(
    manifest: createManifest(),
    data: RadaData(
      rootCategory: emptyCategory,
      categories: [],
      products: products,
      reviews: [],
    ),
    localizations: {},
    images: {},
  );
  
  // Export
  final service = RadaService();
  return service.createArchive(package, 'favorites.rada');
}

// Устройство 2: Импорт
final result = await importer.importFromFile('favorites.rada');
await addFavoritesFromPackage(result.package!);
```

## API Reference

### RadaService

Базовый сервис для работы с RADA архивами.

```dart
class RadaService {
  Future<File> createArchive(RadaPackage package, String outputPath);
  Future<RadaPackage> extractArchive(String archivePath);
  Future<bool> validateArchive(String archivePath);
  Future<RadaManifest> getArchiveInfo(String archivePath);
  RadaChecksums calculateChecksums(RadaPackage package);
  String getCategoryImagePath(int categoryId, String extension);
  String getProductImagePath(String sku, String filename);
}
```

### RadaExporter

Экспорт Magento данных в RADA формат.

```dart
class RadaExporter {
  RadaExporter({
    required ProductApi productApi,
    required String baseUrl,
    RadaService? radaService,
    Dio? dio,
  });
  
  Future<File> exportCategory(
    RadaExportOptions options,
    String outputPath,
  );
}
```

### RadaImporter

Импорт данных из RADA архивов.

```dart
class RadaImporter {
  RadaImporter({
    RadaService? radaService,
    CacheService? cacheService,
    ImageCacheService? imageCacheService,
  });
  
  Future<RadaImportResult> importFromFile(String filePath);
  Future<RadaManifest> getArchiveInfo(String filePath);
  Future<bool> validateArchive(String filePath);
  
  List<Category> extractCategories(
    RadaPackage package, {
    int? rootCategoryId,
    bool flatList = false,
  });
  
  List<Product> extractProducts(
    RadaPackage package, {
    int? categoryId,
    List<String>? skus,
  });
  
  List<Review> extractReviews(
    RadaPackage package, {
    int? productId,
  });
  
  Map<String, dynamic> getLocalizedData(
    RadaPackage package,
    String locale,
  );
}
```

### RadaPreloadService

Управление preload данными.

```dart
class RadaPreloadService {
  RadaPreloadService({RadaImporter? importer});
  
  Future<RadaPackage?> loadFromAssets(String assetPath);
  Future<RadaPackage?> loadFromFile(String filePath);
  Future<RadaManifest?> getPreloadInfo(String assetPath);
  
  RadaPackage? get preloadedPackage;
  bool get hasPreloadData;
  
  void clearPreload();
}
```

## Лучшие практики

### 1. Размер файла

- Ограничивайте количество продуктов (`maxProducts`)
- Оптимизируйте изображения (`maxImageWidth`, `imageQuality`)
- Не включайте лишние локализации

### 2. Валидация

- Всегда проверяйте файл перед импортом
- Показывайте информацию пользователю перед импортом
- Обрабатывайте ошибки корректно

### 3. Производительность

- Используйте preload для больших наборов данных
- Кешируйте изображения при импорте
- Загружайте данные асинхронно с индикатором прогресса

### 4. Безопасность

- Проверяйте контрольные суммы
- Валидируйте версию формата
- Не доверяйте файлам из неизвестных источников

## Поддержка

Для вопросов и issue:
- GitLab: https://gitlab.com/libsFlutter/flutter_magento
- Email: support@nativemind.ru

**Made with ❤️ by NativeMind Team**

