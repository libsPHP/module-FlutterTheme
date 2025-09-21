import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/device_info_model.dart';
import '../services/device_info_service.dart';

/// Утилитный класс для работы с устройствами
class DeviceUtils {
  DeviceUtils._();

  /// Статический экземпляр DeviceInfoService
  static final DeviceInfoService _deviceInfoService = DeviceInfoService();

  /// Быстрая проверка платформы
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isWeb => kIsWeb;
  static bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
  static bool get isMobile => isAndroid || isIOS;

  /// Получение информации об устройстве (с кэшированием)
  static Future<DeviceInfoModel> getDeviceInfo() async {
    return await _deviceInfoService.getDeviceInfo();
  }

  /// Получение отпечатка устройства
  static Future<String> getDeviceFingerprint() async {
    return await _deviceInfoService.getDeviceFingerprint();
  }

  /// Определение категории производительности
  static Future<DevicePerformanceCategory> getPerformanceCategory() async {
    return await _deviceInfoService.getPerformanceCategory();
  }

  /// Проверка минимальных требований
  static Future<bool> meetsMinimumRequirements({
    int? minAndroidSdk,
    String? minIOSVersion,
    int? minRamMb,
  }) async {
    return await _deviceInfoService.isCompatible(
      minAndroidSdk: minAndroidSdk,
      minIOSVersion: minIOSVersion,
      minRamMb: minRamMb,
    );
  }

  /// Получение рекомендованных настроек для устройства
  static Future<DeviceOptimizationSettings> getOptimizationSettings() async {
    final deviceInfo = await getDeviceInfo();
    final performanceCategory = await getPerformanceCategory();

    return DeviceOptimizationSettings.fromDeviceInfo(
      deviceInfo,
      performanceCategory,
    );
  }

  /// Проверка поддержки конкретных функций
  static Future<DeviceCapabilities> getDeviceCapabilities() async {
    final deviceInfo = await getDeviceInfo();
    final performanceCategory = await getPerformanceCategory();

    return DeviceCapabilities(
      supportsAdvancedAnimations:
          performanceCategory == DevicePerformanceCategory.high,
      supportsHighQualityImages:
          performanceCategory != DevicePerformanceCategory.low,
      supportsVideoPlayback:
          !deviceInfo.isWeb ||
          deviceInfo.additionalInfo['hardwareConcurrency'] != null,
      supportsLocalStorage: !deviceInfo.isWeb,
      supportsPushNotifications: deviceInfo.isMobile,
      supportsCamera: deviceInfo.isMobile,
      supportsGPS: deviceInfo.isMobile,
      supportsBiometrics: deviceInfo.isMobile && deviceInfo.isPhysicalDevice,
      maxConcurrentRequests: _getMaxConcurrentRequests(performanceCategory),
      recommendedImageQuality: _getRecommendedImageQuality(performanceCategory),
      recommendedCacheSize: _getRecommendedCacheSize(
        performanceCategory,
        deviceInfo.ramMb,
      ),
    );
  }

  /// Получение аналитических данных для отправки
  static Future<Map<String, dynamic>> getAnalyticsPayload() async {
    return await _deviceInfoService.getAnalyticsData();
  }

  /// Проверка, является ли устройство планшетом
  static Future<bool> isTablet() async {
    final deviceInfo = await getDeviceInfo();
    return deviceInfo.isTablet;
  }

  /// Проверка, работает ли приложение на эмуляторе
  static Future<bool> isEmulator() async {
    final deviceInfo = await getDeviceInfo();
    return !deviceInfo.isPhysicalDevice;
  }

  /// Получение безопасного идентификатора устройства для аналитики
  static Future<String> getAnalyticsDeviceId() async {
    final fingerprint = await getDeviceFingerprint();
    // Используем только первые 16 символов хэша для анонимности
    return fingerprint.substring(0, 16);
  }

  /// Определение оптимального размера кэша изображений
  static Future<int> getOptimalImageCacheSize() async {
    final deviceInfo = await getDeviceInfo();
    final performanceCategory = await getPerformanceCategory();

    return _getRecommendedCacheSize(performanceCategory, deviceInfo.ramMb);
  }

  /// Определение оптимального качества изображений
  static Future<double> getOptimalImageQuality() async {
    final performanceCategory = await getPerformanceCategory();
    return _getRecommendedImageQuality(performanceCategory);
  }

  /// Определение максимального количества одновременных запросов
  static Future<int> getMaxConcurrentRequests() async {
    final performanceCategory = await getPerformanceCategory();
    return _getMaxConcurrentRequests(performanceCategory);
  }

  /// Проверка поддержки темной темы системой
  static Future<bool> supportsSystemDarkMode() async {
    if (isWeb) return true; // Веб поддерживает через CSS
    if (isAndroid) {
      final deviceInfo = await getDeviceInfo();
      final sdkInt = deviceInfo.additionalInfo['version.sdkInt'] as int? ?? 0;
      return sdkInt >= 29; // Android Q (API 29) и выше
    }
    if (isIOS) {
      final deviceInfo = await getDeviceInfo();
      final version = deviceInfo.systemVersion;
      return _compareVersions(version, '13.0') >= 0; // iOS 13 и выше
    }
    return isDesktop; // Настольные системы обычно поддерживают
  }

  /// Получение информации о сети (если доступно)
  static Future<NetworkInfo?> getNetworkInfo() async {
    try {
      final deviceInfo = await getDeviceInfo();

      if (deviceInfo.isWeb) {
        // Для веб можем получить некоторую информацию через navigator
        return NetworkInfo(
          type: 'web',
          isConnected: true, // Предполагаем, что есть соединение
          strength: null,
        );
      }

      // Для мобильных устройств информация о сети требует дополнительных разрешений
      // и отдельного пакета (connectivity_plus уже есть в зависимостях)
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Очистка кэша информации об устройстве
  static void clearCache() {
    _deviceInfoService.clearCache();
  }

  // Приватные вспомогательные методы

  static int _getMaxConcurrentRequests(DevicePerformanceCategory category) {
    switch (category) {
      case DevicePerformanceCategory.high:
        return 6;
      case DevicePerformanceCategory.medium:
        return 4;
      case DevicePerformanceCategory.low:
        return 2;
    }
  }

  static double _getRecommendedImageQuality(
    DevicePerformanceCategory category,
  ) {
    switch (category) {
      case DevicePerformanceCategory.high:
        return 0.9;
      case DevicePerformanceCategory.medium:
        return 0.8;
      case DevicePerformanceCategory.low:
        return 0.6;
    }
  }

  static int _getRecommendedCacheSize(
    DevicePerformanceCategory category,
    int? ramMb,
  ) {
    int baseSize = 100; // Значение по умолчанию

    switch (category) {
      case DevicePerformanceCategory.high:
        baseSize = 200; // 200 MB
        break;
      case DevicePerformanceCategory.medium:
        baseSize = 100; // 100 MB
        break;
      case DevicePerformanceCategory.low:
        baseSize = 50; // 50 MB
        break;
    }

    // Корректируем на основе доступной RAM
    if (ramMb != null) {
      if (ramMb >= 8000) {
        baseSize = (baseSize * 1.5).round();
      } else if (ramMb <= 2000) {
        baseSize = (baseSize * 0.5).round();
      }
    }

    return baseSize;
  }

  static int _compareVersions(String version1, String version2) {
    final v1Parts = version1
        .split('.')
        .map((e) => int.tryParse(e) ?? 0)
        .toList();
    final v2Parts = version2
        .split('.')
        .map((e) => int.tryParse(e) ?? 0)
        .toList();

    final maxLength = v1Parts.length > v2Parts.length
        ? v1Parts.length
        : v2Parts.length;

    for (int i = 0; i < maxLength; i++) {
      final v1Part = i < v1Parts.length ? v1Parts[i] : 0;
      final v2Part = i < v2Parts.length ? v2Parts[i] : 0;

      if (v1Part < v2Part) return -1;
      if (v1Part > v2Part) return 1;
    }

    return 0;
  }
}

/// Настройки оптимизации для конкретного устройства
class DeviceOptimizationSettings {
  final int maxConcurrentRequests;
  final double imageQuality;
  final int imageCacheSize;
  final bool enableAnimations;
  final bool enableAdvancedFeatures;
  final int listBufferSize;
  final bool enableLazyLoading;

  const DeviceOptimizationSettings({
    required this.maxConcurrentRequests,
    required this.imageQuality,
    required this.imageCacheSize,
    required this.enableAnimations,
    required this.enableAdvancedFeatures,
    required this.listBufferSize,
    required this.enableLazyLoading,
  });

  factory DeviceOptimizationSettings.fromDeviceInfo(
    DeviceInfoModel deviceInfo,
    DevicePerformanceCategory performanceCategory,
  ) {
    final isHighPerformance =
        performanceCategory == DevicePerformanceCategory.high;
    final isMediumPerformance =
        performanceCategory == DevicePerformanceCategory.medium;

    return DeviceOptimizationSettings(
      maxConcurrentRequests: isHighPerformance
          ? 6
          : (isMediumPerformance ? 4 : 2),
      imageQuality: isHighPerformance ? 0.9 : (isMediumPerformance ? 0.8 : 0.6),
      imageCacheSize: isHighPerformance
          ? 200
          : (isMediumPerformance ? 100 : 50),
      enableAnimations: performanceCategory != DevicePerformanceCategory.low,
      enableAdvancedFeatures: isHighPerformance,
      listBufferSize: isHighPerformance ? 10 : (isMediumPerformance ? 5 : 3),
      enableLazyLoading: true, // Всегда включено для экономии ресурсов
    );
  }

  @override
  String toString() =>
      'DeviceOptimizationSettings('
      'maxConcurrentRequests: $maxConcurrentRequests, '
      'imageQuality: $imageQuality, '
      'imageCacheSize: ${imageCacheSize}MB, '
      'enableAnimations: $enableAnimations, '
      'enableAdvancedFeatures: $enableAdvancedFeatures)';
}

/// Возможности устройства
class DeviceCapabilities {
  final bool supportsAdvancedAnimations;
  final bool supportsHighQualityImages;
  final bool supportsVideoPlayback;
  final bool supportsLocalStorage;
  final bool supportsPushNotifications;
  final bool supportsCamera;
  final bool supportsGPS;
  final bool supportsBiometrics;
  final int maxConcurrentRequests;
  final double recommendedImageQuality;
  final int recommendedCacheSize;

  const DeviceCapabilities({
    required this.supportsAdvancedAnimations,
    required this.supportsHighQualityImages,
    required this.supportsVideoPlayback,
    required this.supportsLocalStorage,
    required this.supportsPushNotifications,
    required this.supportsCamera,
    required this.supportsGPS,
    required this.supportsBiometrics,
    required this.maxConcurrentRequests,
    required this.recommendedImageQuality,
    required this.recommendedCacheSize,
  });

  @override
  String toString() =>
      'DeviceCapabilities('
      'animations: $supportsAdvancedAnimations, '
      'highQualityImages: $supportsHighQualityImages, '
      'video: $supportsVideoPlayback, '
      'localStorage: $supportsLocalStorage, '
      'push: $supportsPushNotifications, '
      'camera: $supportsCamera, '
      'gps: $supportsGPS, '
      'biometrics: $supportsBiometrics)';
}

/// Информация о сети
class NetworkInfo {
  final String type;
  final bool isConnected;
  final int? strength;

  const NetworkInfo({
    required this.type,
    required this.isConnected,
    this.strength,
  });

  @override
  String toString() =>
      'NetworkInfo(type: $type, connected: $isConnected, strength: $strength)';
}
