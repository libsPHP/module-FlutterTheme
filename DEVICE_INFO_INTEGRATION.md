# Device Info Plus Integration

## Обзор

В Flutter Magento добавлена интеграция с пакетом `device_info_plus` для унификации API получения информации об устройстве. Эта интеграция реализует все поставленные цели:

- ✅ **Device Fingerprinting** - создание уникального отпечатка устройства
- ✅ **Platform Detection** - определение платформы (iOS/Android/Web/Desktop)
- ✅ **Version Compatibility** - проверка совместимости с версией ОС
- ✅ **Performance Optimization** - адаптация под возможности устройства
- ✅ **Analytics Integration** - передача данных об устройстве в аналитику

## Добавленные компоненты

### 1. DeviceInfoService
**Файл**: `lib/src/services/device_info_service.dart`

Основной сервис для работы с информацией об устройстве:
- Унифицированный API для всех платформ
- Кэширование данных для оптимизации производительности
- Создание уникального отпечатка устройства (SHA-256)
- Определение категории производительности (High/Medium/Low)
- Проверка совместимости с минимальными требованиями
- Генерация аналитических данных

### 2. DeviceInfoModel
**Файл**: `lib/src/models/device_info_model.dart`

Унифицированная модель данных об устройстве:
- Базовая информация (платформа, модель, бренд, система)
- Технические характеристики (RAM, хранилище, разрешение экрана)
- Автоматическое определение типа устройства (мобильное, планшет, десктоп, веб)
- Расчет показателей производительности
- Поддержка JSON сериализации

### 3. DeviceInfoProvider
**Файл**: `lib/src/providers/device_info_provider.dart`

Riverpod провайдеры для управления состоянием:
- `deviceInfoProvider` - получение информации об устройстве
- `deviceFingerprintProvider` - получение отпечатка устройства
- `devicePerformanceCategoryProvider` - категория производительности
- `deviceAnalyticsProvider` - аналитические данные
- `deviceCompatibilityProvider` - проверка совместимости

### 4. DeviceUtils
**Файл**: `lib/src/utils/device_utils.dart`

Утилитный класс для быстрого доступа к функциям:
- Статические методы для определения платформы
- Получение оптимальных настроек для устройства
- Проверка возможностей устройства
- Рекомендации по оптимизации производительности

### 5. DeviceInfoWidget
**Файл**: `lib/src/widgets/device_info_widget.dart`

Готовый виджет для отображения информации:
- Три стиля отображения: Card, List, Compact
- Показ детальной информации и рекомендаций
- Копирование данных в буфер обмена
- Интеграция с провайдерами состояния

### 6. Демонстрационный экран
**Файл**: `example/lib/screens/device_info_screen.dart`

Полнофункциональный экран для демонстрации возможностей:
- Четыре вкладки: Overview, Performance, Capabilities, Analytics
- Интерактивные элементы и тестирование функций
- Копирование и отправка аналитических данных

## Использование

### Базовое использование

```dart
import 'package:flutter_magento/flutter_magento.dart';

// Получение информации об устройстве
final deviceInfo = await DeviceUtils.getDeviceInfo();
print('Device: ${deviceInfo.shortDescription}');

// Создание отпечатка устройства
final fingerprint = await DeviceUtils.getDeviceFingerprint();
print('Fingerprint: $fingerprint');

// Проверка производительности
final performance = await DeviceUtils.getPerformanceCategory();
print('Performance: $performance');
```

### Использование с Riverpod

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfoAsync = ref.watch(deviceInfoProvider);
    
    return deviceInfoAsync.when(
      data: (deviceInfo) => Text(deviceInfo.shortDescription),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

### Проверка совместимости

```dart
// Проверка минимальных требований
final isCompatible = await DeviceUtils.meetsMinimumRequirements(
  minAndroidSdk: 24,
  minIOSVersion: '13.0',
  minRamMb: 4000,
);

if (!isCompatible) {
  // Показать предупреждение или ограничить функциональность
}
```

### Оптимизация производительности

```dart
// Получение оптимальных настроек
final settings = await DeviceUtils.getOptimizationSettings();

// Применение настроек
final imageQuality = settings.imageQuality; // 0.6 - 0.9
final maxRequests = settings.maxConcurrentRequests; // 2 - 6
final cacheSize = settings.imageCacheSize; // 50 - 200 MB
```

### Аналитика

```dart
// Получение данных для аналитики
final analyticsData = await DeviceUtils.getAnalyticsPayload();

// Отправка в аналитическую систему
await analytics.track('device_info', analyticsData);
```

## Поддерживаемые платформы

- ✅ **Android** - полная поддержка всех функций
- ✅ **iOS** - полная поддержка всех функций  
- ✅ **Web** - базовая поддержка через браузер API
- ✅ **Windows** - полная поддержка настольной версии
- ✅ **macOS** - полная поддержка настольной версии
- ✅ **Linux** - полная поддержка настольной версии

## Категории производительности

### High Performance
- Современные флагманские устройства
- iPhone 13+ / топовые Android с 6+ GB RAM
- Настольные системы
- Поддержка всех функций и анимаций

### Medium Performance  
- Устройства среднего класса
- iPhone 11-12 / Android с 4-6 GB RAM
- Оптимизированные настройки изображений и кэша

### Low Performance
- Бюджетные и старые устройства
- Устройства с менее 4 GB RAM
- Ограниченная анимация, сжатие изображений

## Безопасность

- Отпечаток устройства создается через SHA-256 хэширование
- Для аналитики используется только первые 16 символов хэша
- Персональные данные не собираются и не передаются
- Все данные обрабатываются локально на устройстве

## Тестирование

Добавлены комплексные unit-тесты:
- `test/services/device_info_service_test.dart` - тесты сервиса
- `test/utils/device_utils_test.dart` - тесты утилит
- Покрытие всех основных сценариев использования
- Мокирование нативных API для стабильного тестирования

## Производительность

- Кэширование данных об устройстве для избежания повторных вызовов
- Ленивая загрузка тяжелых операций
- Оптимизация под конкретное устройство
- Минимальное влияние на время запуска приложения
