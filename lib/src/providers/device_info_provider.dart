import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/device_info_model.dart';
import '../services/device_info_service.dart';
import '../exceptions/magento_exception.dart';

/// Провайдер для DeviceInfoService
final deviceInfoServiceProvider = Provider<DeviceInfoService>((ref) {
  return DeviceInfoService();
});

/// Провайдер для получения информации об устройстве
final deviceInfoProvider = FutureProvider<DeviceInfoModel>((ref) async {
  final service = ref.read(deviceInfoServiceProvider);
  return await service.getDeviceInfo();
});

/// Провайдер для получения отпечатка устройства
final deviceFingerprintProvider = FutureProvider<String>((ref) async {
  final service = ref.read(deviceInfoServiceProvider);
  return await service.getDeviceFingerprint();
});

/// Провайдер для получения категории производительности
final devicePerformanceCategoryProvider = 
    FutureProvider<DevicePerformanceCategory>((ref) async {
  final service = ref.read(deviceInfoServiceProvider);
  return await service.getPerformanceCategory();
});

/// Провайдер для получения аналитических данных
final deviceAnalyticsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final service = ref.read(deviceInfoServiceProvider);
  return await service.getAnalyticsData();
});

/// Провайдер для проверки совместимости
final deviceCompatibilityProvider = 
    FutureProvider.family<bool, DeviceCompatibilityRequirements>((ref, requirements) async {
  final service = ref.read(deviceInfoServiceProvider);
  return await service.isCompatible(
    minAndroidSdk: requirements.minAndroidSdk,
    minIOSVersion: requirements.minIOSVersion,
    minRamMb: requirements.minRamMb,
  );
});

/// Notifier для управления состоянием информации об устройстве
class DeviceInfoNotifier extends AsyncNotifier<DeviceInfoModel> {
  late DeviceInfoService _service;

  @override
  Future<DeviceInfoModel> build() async {
    _service = ref.read(deviceInfoServiceProvider);
    return await _service.getDeviceInfo();
  }

  /// Обновление информации об устройстве
  Future<void> refresh() async {
    _service.clearCache();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await _service.getDeviceInfo();
    });
  }

  /// Получение отпечатка устройства
  Future<String> getFingerprint() async {
    try {
      return await _service.getDeviceFingerprint();
    } catch (e) {
      throw MagentoException(
        'Failed to get device fingerprint: $e',
        code: 'DEVICE_FINGERPRINT_ERROR',
      );
    }
  }

  /// Получение категории производительности
  Future<DevicePerformanceCategory> getPerformanceCategory() async {
    try {
      return await _service.getPerformanceCategory();
    } catch (e) {
      throw MagentoException(
        'Failed to get performance category: $e',
        code: 'PERFORMANCE_CATEGORY_ERROR',
      );
    }
  }

  /// Проверка совместимости
  Future<bool> checkCompatibility({
    int? minAndroidSdk,
    String? minIOSVersion,
    int? minRamMb,
  }) async {
    try {
      return await _service.isCompatible(
        minAndroidSdk: minAndroidSdk,
        minIOSVersion: minIOSVersion,
        minRamMb: minRamMb,
      );
    } catch (e) {
      throw MagentoException(
        'Failed to check compatibility: $e',
        code: 'COMPATIBILITY_CHECK_ERROR',
      );
    }
  }

  /// Получение аналитических данных
  Future<Map<String, dynamic>> getAnalyticsData() async {
    try {
      return await _service.getAnalyticsData();
    } catch (e) {
      throw MagentoException(
        'Failed to get analytics data: $e',
        code: 'ANALYTICS_DATA_ERROR',
      );
    }
  }
}

/// Провайдер для DeviceInfoNotifier
final deviceInfoNotifierProvider = 
    AsyncNotifierProvider<DeviceInfoNotifier, DeviceInfoModel>(() {
  return DeviceInfoNotifier();
});

/// Класс для определения требований совместимости
class DeviceCompatibilityRequirements {
  final int? minAndroidSdk;
  final String? minIOSVersion;
  final int? minRamMb;

  const DeviceCompatibilityRequirements({
    this.minAndroidSdk,
    this.minIOSVersion,
    this.minRamMb,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceCompatibilityRequirements &&
          runtimeType == other.runtimeType &&
          minAndroidSdk == other.minAndroidSdk &&
          minIOSVersion == other.minIOSVersion &&
          minRamMb == other.minRamMb;

  @override
  int get hashCode =>
      minAndroidSdk.hashCode ^
      minIOSVersion.hashCode ^
      minRamMb.hashCode;
}

/// Расширения для удобной работы с провайдерами
extension DeviceInfoProviderExtensions on WidgetRef {
  /// Получение информации об устройстве
  AsyncValue<DeviceInfoModel> get deviceInfo => watch(deviceInfoProvider);

  /// Получение отпечатка устройства
  AsyncValue<String> get deviceFingerprint => watch(deviceFingerprintProvider);

  /// Получение категории производительности
  AsyncValue<DevicePerformanceCategory> get devicePerformanceCategory => 
      watch(devicePerformanceCategoryProvider);

  /// Получение аналитических данных
  AsyncValue<Map<String, dynamic>> get deviceAnalytics => 
      watch(deviceAnalyticsProvider);

  /// Проверка совместимости
  AsyncValue<bool> deviceCompatibility(DeviceCompatibilityRequirements requirements) =>
      watch(deviceCompatibilityProvider(requirements));

  /// Обновление информации об устройстве
  Future<void> refreshDeviceInfo() async {
    await read(deviceInfoNotifierProvider.notifier).refresh();
  }
}
