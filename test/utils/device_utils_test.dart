import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  group('DeviceUtils', () {
    setUp(() {
      // Очищаем кэш перед каждым тестом
      DeviceUtils.clearCache();
    });

    tearDown(() {
      DeviceUtils.clearCache();
    });

    group('Platform Detection', () {
      test('should detect platforms correctly', () {
        // Эти тесты будут работать в зависимости от платформы тестирования
        expect(DeviceUtils.isAndroid, isA<bool>());
        expect(DeviceUtils.isIOS, isA<bool>());
        expect(DeviceUtils.isWeb, isA<bool>());
        expect(DeviceUtils.isDesktop, isA<bool>());
        expect(DeviceUtils.isMobile, isA<bool>());
      });

      test('should have mutually exclusive platform flags', () {
        // На тестовой платформе должна быть активна только одна платформа
        final platformCount = [
          DeviceUtils.isAndroid,
          DeviceUtils.isIOS,
          DeviceUtils.isWeb,
        ].where((platform) => platform).length;
        
        // В тестовой среде может быть 0 или 1 активная платформа
        expect(platformCount, lessThanOrEqualTo(1));
      });
    });

    group('Device Information', () {
      test('should get device info', () async {
        try {
          final deviceInfo = await DeviceUtils.getDeviceInfo();
          expect(deviceInfo, isA<DeviceInfoModel>());
          expect(deviceInfo.platform, isNotEmpty);
          expect(deviceInfo.deviceId, isNotEmpty);
        } catch (e) {
          // В тестовой среде может быть исключение
          expect(e, isA<MagentoException>());
        }
      });

      test('should get device fingerprint', () async {
        try {
          final fingerprint = await DeviceUtils.getDeviceFingerprint();
          expect(fingerprint, isA<String>());
          expect(fingerprint, hasLength(64)); // SHA-256 hash
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should get performance category', () async {
        try {
          final category = await DeviceUtils.getPerformanceCategory();
          expect(category, isA<DevicePerformanceCategory>());
          expect(DevicePerformanceCategory.values, contains(category));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('Optimization Settings', () {
      test('should get optimization settings', () async {
        try {
          final settings = await DeviceUtils.getOptimizationSettings();
          expect(settings, isA<DeviceOptimizationSettings>());
          expect(settings.maxConcurrentRequests, greaterThan(0));
          expect(settings.imageQuality, greaterThan(0));
          expect(settings.imageQuality, lessThanOrEqualTo(1));
          expect(settings.imageCacheSize, greaterThan(0));
          expect(settings.listBufferSize, greaterThan(0));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should get device capabilities', () async {
        try {
          final capabilities = await DeviceUtils.getDeviceCapabilities();
          expect(capabilities, isA<DeviceCapabilities>());
          expect(capabilities.maxConcurrentRequests, greaterThan(0));
          expect(capabilities.recommendedImageQuality, greaterThan(0));
          expect(capabilities.recommendedImageQuality, lessThanOrEqualTo(1));
          expect(capabilities.recommendedCacheSize, greaterThan(0));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('Compatibility Checks', () {
      test('should check minimum requirements', () async {
        try {
          final compatible = await DeviceUtils.meetsMinimumRequirements();
          expect(compatible, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should check Android SDK requirements', () async {
        try {
          final compatible = await DeviceUtils.meetsMinimumRequirements(
            minAndroidSdk: 21,
          );
          expect(compatible, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should check iOS version requirements', () async {
        try {
          final compatible = await DeviceUtils.meetsMinimumRequirements(
            minIOSVersion: '13.0',
          );
          expect(compatible, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should check RAM requirements', () async {
        try {
          final compatible = await DeviceUtils.meetsMinimumRequirements(
            minRamMb: 2000,
          );
          expect(compatible, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('Analytics', () {
      test('should get analytics payload', () async {
        try {
          final analytics = await DeviceUtils.getAnalyticsPayload();
          expect(analytics, isA<Map<String, dynamic>>());
          expect(analytics, containsPair('device_fingerprint', isA<String>()));
          expect(analytics, containsPair('platform', isA<String>()));
          expect(analytics, containsPair('timestamp', isA<String>()));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should get analytics device id', () async {
        try {
          final deviceId = await DeviceUtils.getAnalyticsDeviceId();
          expect(deviceId, isA<String>());
          expect(deviceId, hasLength(16)); // Первые 16 символов хэша
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('Device Type Detection', () {
      test('should detect if device is tablet', () async {
        try {
          final isTablet = await DeviceUtils.isTablet();
          expect(isTablet, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should detect if device is emulator', () async {
        try {
          final isEmulator = await DeviceUtils.isEmulator();
          expect(isEmulator, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('Performance Optimization', () {
      test('should get optimal image cache size', () async {
        try {
          final cacheSize = await DeviceUtils.getOptimalImageCacheSize();
          expect(cacheSize, greaterThan(0));
          expect(cacheSize, lessThanOrEqualTo(500)); // Разумный максимум
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should get optimal image quality', () async {
        try {
          final quality = await DeviceUtils.getOptimalImageQuality();
          expect(quality, greaterThan(0));
          expect(quality, lessThanOrEqualTo(1));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should get max concurrent requests', () async {
        try {
          final maxRequests = await DeviceUtils.getMaxConcurrentRequests();
          expect(maxRequests, greaterThan(0));
          expect(maxRequests, lessThanOrEqualTo(10)); // Разумный максимум
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('System Features', () {
      test('should check system dark mode support', () async {
        try {
          final supportsDarkMode = await DeviceUtils.supportsSystemDarkMode();
          expect(supportsDarkMode, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should get network info', () async {
        final networkInfo = await DeviceUtils.getNetworkInfo();
        if (networkInfo != null) {
          expect(networkInfo, isA<NetworkInfo>());
          expect(networkInfo.type, isNotEmpty);
          expect(networkInfo.isConnected, isA<bool>());
        }
      });
    });

    group('Cache Management', () {
      test('should clear cache without errors', () {
        expect(() => DeviceUtils.clearCache(), returnsNormally);
      });
    });
  });

  group('DeviceOptimizationSettings', () {
    test('should create from device info', () {
      const deviceInfo = DeviceInfoModel(
        platform: 'Test',
        deviceId: 'test_id',
        model: 'Test Model',
        brand: 'Test Brand',
        systemName: 'TestOS',
        systemVersion: '1.0',
        screenResolution: '1080x1920',
        isPhysicalDevice: true,
        additionalInfo: {},
      );

      final settings = DeviceOptimizationSettings.fromDeviceInfo(
        deviceInfo,
        DevicePerformanceCategory.medium,
      );

      expect(settings.maxConcurrentRequests, greaterThan(0));
      expect(settings.imageQuality, greaterThan(0));
      expect(settings.imageQuality, lessThanOrEqualTo(1));
      expect(settings.imageCacheSize, greaterThan(0));
      expect(settings.enableLazyLoading, true);
    });

    test('should adjust for high performance devices', () {
      const deviceInfo = DeviceInfoModel(
        platform: 'iOS',
        deviceId: 'test_id',
        model: 'iPhone 15 Pro',
        brand: 'Apple',
        systemName: 'iOS',
        systemVersion: '17.0',
        screenResolution: '1179x2556',
        isPhysicalDevice: true,
        additionalInfo: {},
      );

      final settings = DeviceOptimizationSettings.fromDeviceInfo(
        deviceInfo,
        DevicePerformanceCategory.high,
      );

      expect(settings.maxConcurrentRequests, greaterThanOrEqualTo(6));
      expect(settings.imageQuality, greaterThanOrEqualTo(0.9));
      expect(settings.enableAnimations, true);
      expect(settings.enableAdvancedFeatures, true);
    });

    test('should adjust for low performance devices', () {
      const deviceInfo = DeviceInfoModel(
        platform: 'Android',
        deviceId: 'test_id',
        model: 'Old Device',
        brand: 'Generic',
        systemName: 'Android',
        systemVersion: '7.0',
        screenResolution: '720x1280',
        isPhysicalDevice: true,
        additionalInfo: {'version.sdkInt': 24},
      );

      final settings = DeviceOptimizationSettings.fromDeviceInfo(
        deviceInfo,
        DevicePerformanceCategory.low,
      );

      expect(settings.maxConcurrentRequests, lessThanOrEqualTo(2));
      expect(settings.imageQuality, lessThanOrEqualTo(0.6));
      expect(settings.enableAnimations, false);
      expect(settings.enableAdvancedFeatures, false);
    });

    test('should have string representation', () {
      const deviceInfo = DeviceInfoModel(
        platform: 'Test',
        deviceId: 'test_id',
        model: 'Test Model',
        brand: 'Test Brand',
        systemName: 'TestOS',
        systemVersion: '1.0',
        screenResolution: '1080x1920',
        isPhysicalDevice: true,
        additionalInfo: {},
      );

      final settings = DeviceOptimizationSettings.fromDeviceInfo(
        deviceInfo,
        DevicePerformanceCategory.medium,
      );

      final stringRep = settings.toString();
      expect(stringRep, contains('DeviceOptimizationSettings'));
      expect(stringRep, contains('maxConcurrentRequests'));
      expect(stringRep, contains('imageQuality'));
      expect(stringRep, contains('imageCacheSize'));
    });
  });

  group('DeviceCapabilities', () {
    test('should have string representation', () {
      const capabilities = DeviceCapabilities(
        supportsAdvancedAnimations: true,
        supportsHighQualityImages: true,
        supportsVideoPlayback: true,
        supportsLocalStorage: true,
        supportsPushNotifications: true,
        supportsCamera: true,
        supportsGPS: true,
        supportsBiometrics: true,
        maxConcurrentRequests: 6,
        recommendedImageQuality: 0.9,
        recommendedCacheSize: 200,
      );

      final stringRep = capabilities.toString();
      expect(stringRep, contains('DeviceCapabilities'));
      expect(stringRep, contains('animations: true'));
      expect(stringRep, contains('highQualityImages: true'));
      expect(stringRep, contains('video: true'));
    });
  });

  group('NetworkInfo', () {
    test('should create network info', () {
      const networkInfo = NetworkInfo(
        type: 'wifi',
        isConnected: true,
        strength: 80,
      );

      expect(networkInfo.type, 'wifi');
      expect(networkInfo.isConnected, true);
      expect(networkInfo.strength, 80);
    });

    test('should have string representation', () {
      const networkInfo = NetworkInfo(
        type: 'wifi',
        isConnected: true,
        strength: 80,
      );

      final stringRep = networkInfo.toString();
      expect(stringRep, contains('NetworkInfo'));
      expect(stringRep, contains('type: wifi'));
      expect(stringRep, contains('connected: true'));
      expect(stringRep, contains('strength: 80'));
    });
  });
}
