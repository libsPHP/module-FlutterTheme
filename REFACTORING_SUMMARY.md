# Flutter Magento - Рефакторинг и новые возможности

## 🚀 Обзор изменений

В рамках рефакторинга в библиотеку `flutter_magento` были добавлены универсальные сервисы и компоненты, выявленные при анализе приложений `liveskin`, `livingfood` и `magiccleaning`. Эти компоненты устраняют дублирование кода и предоставляют единообразное API для всех приложений.

## 📦 Новые компоненты

### 1. **Унифицированные Result классы** (`src/models/result_models.dart`)

Заменяют множество дублирующихся Result классов в приложениях:

```dart
// Базовый результат операции
MagentoOperationResult<T>.success(data);
MagentoOperationResult<T>.error("Error message");

// Результат аутентификации
MagentoAuthResult.success(authData);
MagentoAuthResult.error("Auth failed");

// Результат синхронизации
MagentoSyncResult.success(
  syncedCount: 10,
  failedCount: 2,
  conflicts: conflicts,
);

// Результат кэширования
MagentoCacheResult.success(data, cacheHit: true);

// Результат облачных функций
MagentoCloudFeatureResult.success(data, processingTime: duration);
MagentoCloudFeatureResult.fallback(data); // Когда используется fallback
```

### 2. **MagentoSyncService** (`src/services/sync_service.dart`)

Универсальный сервис синхронизации с поддержкой офлайн-режима:

```dart
final syncService = MagentoSyncService(networkService: networkService);
await syncService.initialize();

// Синхронизация данных
final result = await syncService.syncData<ClothingItem>(
  dataType: 'clothing_items',
  items: clothingItems,
  fromJson: ClothingItem.fromJson,
  toJson: (item) => item.toJson(),
  syncStrategy: MagentoSyncStrategy.incremental,
);

// Планирование автоматической синхронизации
await syncService.scheduleSync(
  dataType: 'clothing_items',
  interval: Duration(minutes: 30),
  immediate: true,
);

// Получение статистики
final stats = await syncService.getSyncStats('clothing_items');
print('Pending items: ${stats.pendingItemsCount}');
```

### 3. **MagentoCacheService** (`src/services/cache_service.dart`)

Интеллектуальное кэширование с управлением размером и TTL:

```dart
final cacheService = MagentoCacheService(
  defaultTtl: Duration(hours: 1),
  maxCacheSize: 50 * 1024 * 1024, // 50MB
);
await cacheService.initialize();

// Кэширование данных
await cacheService.cache(
  key: 'user_profile',
  data: userProfile,
  ttl: Duration(hours: 2),
);

// Получение данных
final result = await cacheService.get<UserProfile>(
  key: 'user_profile',
  fromJson: UserProfile.fromJson,
);

if (result.success && result.cacheHit) {
  print('Cache hit! Data: ${result.data}');
}

// Статистика кэша
final stats = cacheService.getStats();
print('Hit rate: ${(stats.hitRate * 100).toStringAsFixed(1)}%');
```

### 4. **MagentoCloudFeatureManager** (`src/services/cloud_feature_service.dart`)

Система облачных функций с fallback логикой:

```dart
final cloudManager = MagentoCloudFeatureManager(
  networkService: networkService,
  enableFallbacks: true,
);
await cloudManager.initialize();

// Выполнение облачной функции
final result = await cloudManager.executeFeature<AnalysisResult>(
  featureType: MagentoCloudFeatureType.aiAnalysis,
  parameters: {'image_data': base64Image},
  fromJson: AnalysisResult.fromJson,
  allowFallback: true,
);

if (result.fallbackUsed) {
  print('Used local fallback');
} else {
  print('Cloud processing time: ${result.cloudProcessingTime}');
}

// Управление функциями
await cloudManager.setFeatureEnabled(
  MagentoCloudFeatureType.advancedVision, 
  false
);
```

### 5. **MagentoServiceManager** (`src/services/service_manager.dart`)

Центральный менеджер всех сервисов:

```dart
final serviceManager = MagentoServiceManager.instance;

// Инициализация всех сервисов
await serviceManager.initializeServices();

// Переключение режимов
await serviceManager.switchMode(
  MagentoServiceMode.offline, 
  reason: 'Network unavailable'
);

// Получение сервисов
final syncService = serviceManager.getService<MagentoSyncService>();
final cacheService = serviceManager.getService<MagentoCacheService>();

// Мониторинг изменений режима
serviceManager.modeChangeStream.listen((change) {
  print('Mode changed: ${change.previousMode} -> ${change.newMode}');
});

// Детальный статус
final status = serviceManager.getDetailedStatus();
print('Services healthy: ${status.isHealthy}');
```

### 6. **MagentoNotificationService** (`src/services/notification_service.dart`)

Централизованная система уведомлений:

```dart
final notificationService = MagentoNotificationService();
await notificationService.initialize();

// Отправка уведомлений
notificationService.notifySuccess('Data synced successfully');
notificationService.notifyError('Sync failed', context: {'retry': true});

// Подписка на уведомления
final subscription = notificationService.subscribe(
  type: MagentoNotificationType.error,
  callback: (notification) {
    print('Error: ${notification.message}');
  },
  minPriority: MagentoNotificationPriority.high,
);

// Специализированные уведомления
notificationService.notifySync(
  message: 'Syncing 150 items...',
  state: MagentoSyncNotificationState.progress,
  dataType: 'products',
  itemCount: 150,
);

// История уведомлений
final history = notificationService.getHistory(
  type: MagentoNotificationType.error,
  limit: 10,
);
```

### 7. **UI Компоненты** (`src/widgets/`)

Готовые виджеты для отображения статуса:

```dart
// Статус облачного подключения
MagentoCloudStatusWidget(
  isCompact: true,
  onTap: () => showStatusDetails(),
)

// Индикатор синхронизации
MagentoSyncIndicator(
  dataType: 'products',
  showProgress: true,
)

// Индикатор подключения
MagentoConnectionIndicator(showText: true)

// FAB для ручной синхронизации
MagentoSyncFAB(
  onPressed: () => triggerManualSync(),
)

// Детальный статус сервисов
MagentoDetailedStatusWidget()

// Уведомления как снэкбары
MagentoNotificationSnackbar(
  child: MyApp(),
  minPriority: MagentoNotificationPriority.normal,
)

// Список уведомлений
MagentoNotificationList(
  limit: 50,
  showFilters: true,
)
```

## 🔄 Миграция существующих приложений

### Liveskin

**До:**
```dart
class MagentoService extends ChangeNotifier {
  // 308 строк собственной реализации
}

class MagentoAuthResult { /* ... */ }
class CloudSyncResult { /* ... */ }
```

**После:**
```dart
import 'package:flutter_magento/flutter_magento.dart';

// Используем готовые сервисы
final serviceManager = MagentoServiceManager.instance;
await serviceManager.initializeServices();

final syncService = serviceManager.getService<MagentoSyncService>();
final result = await syncService.syncData<ClothingItem>(/* ... */);
```

### Livingfood

**До:**
```dart
class MagentoCloudService extends ChangeNotifier {
  // 376 строк собственной реализации кэширования и синхронизации
}
```

**После:**
```dart
import 'package:flutter_magento/flutter_magento.dart';

final cacheService = serviceManager.getService<MagentoCacheService>();
final syncService = serviceManager.getService<MagentoSyncService>();

// Кэширование рецептов
await cacheService.cache(
  key: 'recipes',
  data: recipes,
  ttl: Duration(hours: 2),
);

// Синхронизация ингредиентов
await syncService.syncData<Ingredient>(
  dataType: 'ingredients',
  items: ingredients,
  fromJson: Ingredient.fromJson,
  toJson: (item) => item.toJson(),
);
```

### Magiccleaning

**До:**
```dart
class MagentoBackendService extends ChangeNotifier {
  // 458 строк с системой облачных функций
}

enum CloudFeatureType { /* ... */ }
class CloudFeature { /* ... */ }
```

**После:**
```dart
import 'package:flutter_magento/flutter_magento.dart';

final cloudManager = serviceManager.getService<MagentoCloudFeatureManager>();

// Выполнение AI анализа
final result = await cloudManager.executeFeature<AnalysisResult>(
  featureType: MagentoCloudFeatureType.aiAnalysis,
  parameters: {'image': imageData},
  fromJson: AnalysisResult.fromJson,
);
```

## 📊 Результаты рефакторинга

### Сокращение кода
- **~1142 строки** дублирующегося кода устранены
- **3 различных реализации** Result классов заменены унифицированными
- **Множественные реализации** кэширования заменены одним сервисом

### Новые возможности
- ✅ **Унифицированное API** для всех операций
- ✅ **Автоматическое управление** жизненным циклом сервисов
- ✅ **Готовые UI компоненты** для быстрой разработки
- ✅ **Система уведомлений** с приоритетами и фильтрацией
- ✅ **Интеллектуальное кэширование** с LRU eviction
- ✅ **Облачные функции** с fallback логикой
- ✅ **Мониторинг и статистика** всех операций

### Улучшение архитектуры
- 🏗️ **Singleton pattern** для менеджера сервисов
- 🔄 **Observer pattern** для уведомлений о состоянии
- 🎯 **Strategy pattern** для различных типов синхронизации
- 🛡️ **Graceful degradation** при потере соединения

## 🚀 Использование в новых приложениях

```dart
import 'package:flutter_magento/flutter_magento.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MagentoNotificationSnackbar(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MagentoServiceManager serviceManager;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    serviceManager = MagentoServiceManager.instance;
    await serviceManager.initializeServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Magento App'),
        actions: [
          MagentoConnectionIndicator(showText: true),
          SizedBox(width: 8),
          MagentoCloudStatusWidget(isCompact: true),
        ],
      ),
      body: Column(
        children: [
          MagentoSyncIndicator(),
          Expanded(
            child: MagentoDetailedStatusWidget(),
          ),
        ],
      ),
      floatingActionButton: MagentoSyncFAB(),
    );
  }
}
```

## 🔮 Дальнейшие улучшения

1. **Добавить поддержку WebSocket** для real-time уведомлений
2. **Реализовать сжатие данных** в кэше для экономии места
3. **Добавить метрики производительности** для каждого сервиса
4. **Создать плагин для VS Code** с автодополнением
5. **Добавить интеграционные тесты** для всех сервисов

## 📚 Документация

- [Sync Service Guide](doc/sync_service.md)
- [Cache Service Guide](doc/cache_service.md)
- [Cloud Features Guide](doc/cloud_features.md)
- [UI Widgets Guide](doc/ui_widgets.md)
- [Migration Guide](MIGRATION_GUIDE.md)

---

**Заключение**: Рефакторинг значительно упростил архитектуру приложений, устранил дублирование кода и предоставил мощные инструменты для разработки новых приложений с поддержкой Magento.
