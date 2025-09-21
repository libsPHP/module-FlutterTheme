import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../models/device_info_model.dart';
import '../exceptions/magento_exception.dart';

/// Сервис для получения информации об устройстве и создания отпечатка устройства
///
/// Предоставляет унифицированный API для:
/// - Device Fingerprinting - создание уникального отпечатка устройства
/// - Platform Detection - определение платформы (iOS/Android/Web)
/// - Version Compatibility - проверка совместимости с версией ОС
/// - Performance Optimization - адаптация под возможности устройства
/// - Analytics Integration - передача данных об устройстве в аналитику
class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._internal();
  factory DeviceInfoService() => _instance;
  DeviceInfoService._internal();

  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  DeviceInfoModel? _cachedDeviceInfo;

  /// Получение информации об устройстве с кэшированием
  Future<DeviceInfoModel> getDeviceInfo() async {
    if (_cachedDeviceInfo != null) {
      return _cachedDeviceInfo!;
    }

    try {
      late DeviceInfoModel deviceInfo;

      if (kIsWeb) {
        deviceInfo = await _getWebDeviceInfo();
      } else if (Platform.isAndroid) {
        deviceInfo = await _getAndroidDeviceInfo();
      } else if (Platform.isIOS) {
        deviceInfo = await _getIOSDeviceInfo();
      } else if (Platform.isMacOS) {
        deviceInfo = await _getMacOSDeviceInfo();
      } else if (Platform.isWindows) {
        deviceInfo = await _getWindowsDeviceInfo();
      } else if (Platform.isLinux) {
        deviceInfo = await _getLinuxDeviceInfo();
      } else {
        throw MagentoException(
          'Unsupported platform',
          code: 'UNSUPPORTED_PLATFORM',
        );
      }

      _cachedDeviceInfo = deviceInfo;
      return deviceInfo;
    } catch (e) {
      throw MagentoException(
        'Failed to get device info: $e',
        code: 'DEVICE_INFO_ERROR',
      );
    }
  }

  /// Создание уникального отпечатка устройства
  Future<String> getDeviceFingerprint() async {
    final deviceInfo = await getDeviceInfo();
    final fingerprintData = {
      'platform': deviceInfo.platform,
      'deviceId': deviceInfo.deviceId,
      'model': deviceInfo.model,
      'brand': deviceInfo.brand,
      'systemName': deviceInfo.systemName,
      'systemVersion': deviceInfo.systemVersion,
      'screenResolution': deviceInfo.screenResolution,
      'isPhysicalDevice': deviceInfo.isPhysicalDevice,
    };

    final jsonString = json.encode(fingerprintData);
    final bytes = utf8.encode(jsonString);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }

  /// Определение типа устройства для оптимизации производительности
  Future<DevicePerformanceCategory> getPerformanceCategory() async {
    final deviceInfo = await getDeviceInfo();

    // Логика определения категории производительности
    if (kIsWeb) {
      return DevicePerformanceCategory.medium;
    }

    if (Platform.isAndroid) {
      // Для Android используем API level и RAM
      final apiLevel = deviceInfo.additionalInfo['version.sdkInt'] as int? ?? 0;
      final ramMb = deviceInfo.ramMb ?? 0;

      if (apiLevel >= 31 && ramMb >= 6000) {
        return DevicePerformanceCategory.high;
      } else if (apiLevel >= 28 && ramMb >= 4000) {
        return DevicePerformanceCategory.medium;
      } else {
        return DevicePerformanceCategory.low;
      }
    }

    if (Platform.isIOS) {
      // Для iOS используем модель устройства
      final model = deviceInfo.model.toLowerCase();
      if (model.contains('iphone 15') ||
          model.contains('iphone 14') ||
          model.contains('iphone 13') ||
          model.contains('ipad pro')) {
        return DevicePerformanceCategory.high;
      } else if (model.contains('iphone 12') ||
          model.contains('iphone 11') ||
          model.contains('ipad air')) {
        return DevicePerformanceCategory.medium;
      } else {
        return DevicePerformanceCategory.low;
      }
    }

    return DevicePerformanceCategory.medium;
  }

  /// Проверка совместимости с минимальными требованиями
  Future<bool> isCompatible({
    int? minAndroidSdk,
    String? minIOSVersion,
    int? minRamMb,
  }) async {
    final deviceInfo = await getDeviceInfo();

    if (Platform.isAndroid && minAndroidSdk != null) {
      final sdkInt = deviceInfo.additionalInfo['version.sdkInt'] as int? ?? 0;
      if (sdkInt < minAndroidSdk) return false;
    }

    if (Platform.isIOS && minIOSVersion != null) {
      final version = deviceInfo.systemVersion;
      if (_compareVersions(version, minIOSVersion) < 0) return false;
    }

    if (minRamMb != null && deviceInfo.ramMb != null) {
      if (deviceInfo.ramMb! < minRamMb) return false;
    }

    return true;
  }

  /// Получение данных для аналитики
  Future<Map<String, dynamic>> getAnalyticsData() async {
    final deviceInfo = await getDeviceInfo();
    final fingerprint = await getDeviceFingerprint();
    final performanceCategory = await getPerformanceCategory();

    return {
      'device_fingerprint': fingerprint,
      'platform': deviceInfo.platform,
      'device_model': deviceInfo.model,
      'device_brand': deviceInfo.brand,
      'system_name': deviceInfo.systemName,
      'system_version': deviceInfo.systemVersion,
      'screen_resolution': deviceInfo.screenResolution,
      'is_physical_device': deviceInfo.isPhysicalDevice,
      'performance_category': performanceCategory.name,
      'ram_mb': deviceInfo.ramMb,
      'storage_gb': deviceInfo.storageGb,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }

  /// Сброс кэша (для тестирования или принудительного обновления)
  void clearCache() {
    _cachedDeviceInfo = null;
  }

  // Приватные методы для получения информации по платформам

  Future<DeviceInfoModel> _getAndroidDeviceInfo() async {
    final androidInfo = await _deviceInfoPlugin.androidInfo;

    return DeviceInfoModel(
      platform: 'Android',
      deviceId: androidInfo.id,
      model: androidInfo.model,
      brand: androidInfo.brand,
      systemName: 'Android',
      systemVersion: androidInfo.version.release,
      screenResolution:
          'unknown', // Android не предоставляет displayMetrics в новых версиях
      isPhysicalDevice: androidInfo.isPhysicalDevice,
      ramMb: _extractRamFromAndroid(androidInfo),
      storageGb: null, // Android не предоставляет эту информацию напрямую
      additionalInfo: {
        'version.sdkInt': androidInfo.version.sdkInt,
        'version.codename': androidInfo.version.codename,
        'manufacturer': androidInfo.manufacturer,
        'product': androidInfo.product,
        'device': androidInfo.device,
        'hardware': androidInfo.hardware,
        'bootloader': androidInfo.bootloader,
        'fingerprint': androidInfo.fingerprint,
        // displayMetrics не доступен в новых версиях device_info_plus
      },
    );
  }

  Future<DeviceInfoModel> _getIOSDeviceInfo() async {
    final iosInfo = await _deviceInfoPlugin.iosInfo;

    return DeviceInfoModel(
      platform: 'iOS',
      deviceId: iosInfo.identifierForVendor ?? 'unknown',
      model: iosInfo.model,
      brand: 'Apple',
      systemName: iosInfo.systemName,
      systemVersion: iosInfo.systemVersion,
      screenResolution:
          'unknown', // iOS не предоставляет разрешение экрана напрямую
      isPhysicalDevice: iosInfo.isPhysicalDevice,
      ramMb: null, // iOS не предоставляет информацию о RAM
      storageGb: null, // iOS не предоставляет информацию о хранилище
      additionalInfo: {
        'name': iosInfo.name,
        'localizedModel': iosInfo.localizedModel,
        'utsname': {
          'machine': iosInfo.utsname.machine,
          'nodename': iosInfo.utsname.nodename,
          'release': iosInfo.utsname.release,
          'sysname': iosInfo.utsname.sysname,
          'version': iosInfo.utsname.version,
        },
      },
    );
  }

  Future<DeviceInfoModel> _getWebDeviceInfo() async {
    final webInfo = await _deviceInfoPlugin.webBrowserInfo;

    return DeviceInfoModel(
      platform: 'Web',
      deviceId: 'web-${webInfo.userAgent?.hashCode ?? 'unknown'}',
      model: 'Web Browser',
      brand: webInfo.browserName.name,
      systemName: webInfo.platform ?? 'Unknown',
      systemVersion: webInfo.appVersion ?? 'Unknown',
      screenResolution: 'unknown',
      isPhysicalDevice: false,
      ramMb: null,
      storageGb: null,
      additionalInfo: {
        'browserName': webInfo.browserName.name,
        'appCodeName': webInfo.appCodeName,
        'appName': webInfo.appName,
        'appVersion': webInfo.appVersion,
        'deviceMemory': webInfo.deviceMemory,
        'language': webInfo.language,
        'languages': webInfo.languages,
        'platform': webInfo.platform,
        'product': webInfo.product,
        'productSub': webInfo.productSub,
        'userAgent': webInfo.userAgent,
        'vendor': webInfo.vendor,
        'vendorSub': webInfo.vendorSub,
        'hardwareConcurrency': webInfo.hardwareConcurrency,
        'maxTouchPoints': webInfo.maxTouchPoints,
      },
    );
  }

  Future<DeviceInfoModel> _getMacOSDeviceInfo() async {
    final macInfo = await _deviceInfoPlugin.macOsInfo;

    return DeviceInfoModel(
      platform: 'macOS',
      deviceId: macInfo.systemGUID ?? 'unknown',
      model: macInfo.model,
      brand: 'Apple',
      systemName: 'macOS',
      systemVersion: macInfo.osRelease,
      screenResolution: 'unknown',
      isPhysicalDevice: true,
      ramMb: null,
      storageGb: null,
      additionalInfo: {
        'computerName': macInfo.computerName,
        'hostName': macInfo.hostName,
        'arch': macInfo.arch,
        'kernelVersion': macInfo.kernelVersion,
        'majorVersion': macInfo.majorVersion,
        'minorVersion': macInfo.minorVersion,
        'patchVersion': macInfo.patchVersion,
        'activeCPUs': macInfo.activeCPUs,
        'memorySize': macInfo.memorySize,
        'cpuFrequency': macInfo.cpuFrequency,
      },
    );
  }

  Future<DeviceInfoModel> _getWindowsDeviceInfo() async {
    final windowsInfo = await _deviceInfoPlugin.windowsInfo;

    return DeviceInfoModel(
      platform: 'Windows',
      deviceId: windowsInfo.deviceId,
      model: windowsInfo.productName,
      brand: 'Microsoft',
      systemName: 'Windows',
      systemVersion:
          '${windowsInfo.majorVersion}.${windowsInfo.minorVersion}.${windowsInfo.buildNumber}',
      screenResolution: 'unknown',
      isPhysicalDevice: true,
      ramMb: null,
      storageGb: null,
      additionalInfo: {
        'computerName': windowsInfo.computerName,
        'numberOfCores': windowsInfo.numberOfCores,
        'systemMemoryInMegabytes': windowsInfo.systemMemoryInMegabytes,
        'userName': windowsInfo.userName,
        'majorVersion': windowsInfo.majorVersion,
        'minorVersion': windowsInfo.minorVersion,
        'buildNumber': windowsInfo.buildNumber,
        'platformId': windowsInfo.platformId,
        'csdVersion': windowsInfo.csdVersion,
        'servicePackMajor': windowsInfo.servicePackMajor,
        'servicePackMinor': windowsInfo.servicePackMinor,
        'suitMask': windowsInfo.suitMask,
        'productType': windowsInfo.productType,
        'reserved': windowsInfo.reserved,
        'buildLab': windowsInfo.buildLab,
        'buildLabEx': windowsInfo.buildLabEx,
        'digitalProductId': windowsInfo.digitalProductId,
        'displayVersion': windowsInfo.displayVersion,
        'editionId': windowsInfo.editionId,
        'installDate': windowsInfo.installDate,
        'productId': windowsInfo.productId,
        'productName': windowsInfo.productName,
        'registeredOwner': windowsInfo.registeredOwner,
        'releaseId': windowsInfo.releaseId,
      },
    );
  }

  Future<DeviceInfoModel> _getLinuxDeviceInfo() async {
    final linuxInfo = await _deviceInfoPlugin.linuxInfo;

    return DeviceInfoModel(
      platform: 'Linux',
      deviceId: linuxInfo.machineId ?? 'unknown',
      model: linuxInfo.prettyName,
      brand: 'Linux',
      systemName: 'Linux',
      systemVersion: linuxInfo.version ?? 'unknown',
      screenResolution: 'unknown',
      isPhysicalDevice: true,
      ramMb: null,
      storageGb: null,
      additionalInfo: {
        'name': linuxInfo.name,
        'version': linuxInfo.version,
        'id': linuxInfo.id,
        'idLike': linuxInfo.idLike,
        'versionCodename': linuxInfo.versionCodename,
        'versionId': linuxInfo.versionId,
        'prettyName': linuxInfo.prettyName,
        'buildId': linuxInfo.buildId,
        'variant': linuxInfo.variant,
        'variantId': linuxInfo.variantId,
        'machineId': linuxInfo.machineId,
      },
    );
  }

  // Вспомогательные методы

  int? _extractRamFromAndroid(AndroidDeviceInfo androidInfo) {
    // Android не предоставляет информацию о RAM напрямую
    // Можно попытаться получить из системных свойств или использовать приблизительные значения
    return null;
  }

  int _compareVersions(String version1, String version2) {
    final v1Parts = version1.split('.').map(int.parse).toList();
    final v2Parts = version2.split('.').map(int.parse).toList();

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
