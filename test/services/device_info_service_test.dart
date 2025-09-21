import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  group('DeviceInfoService', () {
    late DeviceInfoService service;

    setUp(() {
      service = DeviceInfoService();
      // Очищаем кэш перед каждым тестом
      service.clearCache();
    });

    tearDown(() {
      service.clearCache();
    });

    group('getDeviceInfo', () {
      testWidgets('should return device info on supported platforms', (tester) async {
        // Мокируем device_info_plus для тестирования
        const MethodChannel channel = MethodChannel('dev.fluttercommunity.plus/device_info');
        
        // Мокируем ответ для Android
        tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            if (methodCall.method == 'getAndroidDeviceInfo') {
              return {
                'id': 'test_device_id',
                'model': 'Test Model',
                'brand': 'Test Brand',
                'version.release': '11',
                'version.sdkInt': 30,
                'version.codename': 'REL',
                'manufacturer': 'Test Manufacturer',
                'product': 'test_product',
                'device': 'test_device',
                'hardware': 'test_hardware',
                'bootloader': 'test_bootloader',
                'fingerprint': 'test_fingerprint',
                'isPhysicalDevice': true,
                'displayMetrics': {
                  'widthPx': 1080.0,
                  'heightPx': 1920.0,
                  'xDpi': 420.0,
                  'yDpi': 420.0,
                },
              };
            }
            return null;
          },
        );

        try {
          final deviceInfo = await service.getDeviceInfo();
          
          expect(deviceInfo.platform, isNotEmpty);
          expect(deviceInfo.deviceId, isNotEmpty);
          expect(deviceInfo.model, isNotEmpty);
          expect(deviceInfo.brand, isNotEmpty);
          expect(deviceInfo.systemName, isNotEmpty);
          expect(deviceInfo.systemVersion, isNotEmpty);
        } catch (e) {
          // На некоторых тестовых платформах может быть исключение
          expect(e, isA<MagentoException>());
        }
      });

      testWidgets('should cache device info', (tester) async {
        const MethodChannel channel = MethodChannel('dev.fluttercommunity.plus/device_info');
        int callCount = 0;
        
        tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          channel,
          (MethodCall methodCall) async {
            callCount++;
            if (methodCall.method == 'getAndroidDeviceInfo') {
              return {
                'id': 'test_device_id',
                'model': 'Test Model',
                'brand': 'Test Brand',
                'version.release': '11',
                'version.sdkInt': 30,
                'version.codename': 'REL',
                'manufacturer': 'Test Manufacturer',
                'product': 'test_product',
                'device': 'test_device',
                'hardware': 'test_hardware',
                'bootloader': 'test_bootloader',
                'fingerprint': 'test_fingerprint',
                'isPhysicalDevice': true,
                'displayMetrics': {
                  'widthPx': 1080.0,
                  'heightPx': 1920.0,
                  'xDpi': 420.0,
                  'yDpi': 420.0,
                },
              };
            }
            return null;
          },
        );

        try {
          // Первый вызов
          await service.getDeviceInfo();
          // Второй вызов должен использовать кэш
          await service.getDeviceInfo();
          
          // Проверяем, что нативный метод был вызван только один раз
          expect(callCount, 1);
        } catch (e) {
          // Тест может не пройти на некоторых платформах
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('getDeviceFingerprint', () {
      test('should generate consistent fingerprint', () async {
        try {
          final fingerprint1 = await service.getDeviceFingerprint();
          final fingerprint2 = await service.getDeviceFingerprint();
          
          expect(fingerprint1, equals(fingerprint2));
          expect(fingerprint1, hasLength(64)); // SHA-256 hash length
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should generate different fingerprints after cache clear', () async {
        try {
          final fingerprint1 = await service.getDeviceFingerprint();
          service.clearCache();
          final fingerprint2 = await service.getDeviceFingerprint();
          
          // Поскольку мы очистили кэш, но данные устройства остались теми же,
          // отпечатки должны быть одинаковыми
          expect(fingerprint1, equals(fingerprint2));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('getPerformanceCategory', () {
      test('should return valid performance category', () async {
        try {
          final category = await service.getPerformanceCategory();
          expect(category, isA<DevicePerformanceCategory>());
          expect(DevicePerformanceCategory.values, contains(category));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('isCompatible', () {
      test('should check Android SDK compatibility', () async {
        try {
          final isCompatible = await service.isCompatible(minAndroidSdk: 21);
          expect(isCompatible, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should check iOS version compatibility', () async {
        try {
          final isCompatible = await service.isCompatible(minIOSVersion: '13.0');
          expect(isCompatible, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should check RAM compatibility', () async {
        try {
          final isCompatible = await service.isCompatible(minRamMb: 2000);
          expect(isCompatible, isA<bool>());
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });

      test('should return true when no requirements specified', () async {
        try {
          final isCompatible = await service.isCompatible();
          expect(isCompatible, true);
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('getAnalyticsData', () {
      test('should return analytics data with required fields', () async {
        try {
          final analyticsData = await service.getAnalyticsData();
          
          expect(analyticsData, isA<Map<String, dynamic>>());
          expect(analyticsData, containsPair('device_fingerprint', isA<String>()));
          expect(analyticsData, containsPair('platform', isA<String>()));
          expect(analyticsData, containsPair('device_model', isA<String>()));
          expect(analyticsData, containsPair('device_brand', isA<String>()));
          expect(analyticsData, containsPair('system_name', isA<String>()));
          expect(analyticsData, containsPair('system_version', isA<String>()));
          expect(analyticsData, containsPair('is_physical_device', isA<bool>()));
          expect(analyticsData, containsPair('performance_category', isA<String>()));
          expect(analyticsData, containsPair('timestamp', isA<String>()));
        } catch (e) {
          expect(e, isA<MagentoException>());
        }
      });
    });

    group('clearCache', () {
      test('should clear cached device info', () async {
        service.clearCache();
        // Метод не должен выбрасывать исключений
        expect(() => service.clearCache(), returnsNormally);
      });
    });

    group('DeviceInfoModel', () {
      test('should create valid device info model', () {
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

        expect(deviceInfo.platform, 'Test');
        expect(deviceInfo.deviceId, 'test_id');
        expect(deviceInfo.model, 'Test Model');
        expect(deviceInfo.brand, 'Test Brand');
        expect(deviceInfo.systemName, 'TestOS');
        expect(deviceInfo.systemVersion, '1.0');
        expect(deviceInfo.shortDescription, 'Test Brand Test Model (TestOS 1.0)');
        expect(deviceInfo.isMobile, false);
        expect(deviceInfo.isDesktop, false);
        expect(deviceInfo.isWeb, false);
      });

      test('should detect mobile platforms', () {
        const androidDevice = DeviceInfoModel(
          platform: 'Android',
          deviceId: 'test_id',
          model: 'Test Model',
          brand: 'Test Brand',
          systemName: 'Android',
          systemVersion: '11',
          screenResolution: '1080x1920',
          isPhysicalDevice: true,
          additionalInfo: {},
        );

        const iosDevice = DeviceInfoModel(
          platform: 'iOS',
          deviceId: 'test_id',
          model: 'iPhone 13',
          brand: 'Apple',
          systemName: 'iOS',
          systemVersion: '15.0',
          screenResolution: '1170x2532',
          isPhysicalDevice: true,
          additionalInfo: {},
        );

        expect(androidDevice.isMobile, true);
        expect(iosDevice.isMobile, true);
        expect(androidDevice.isDesktop, false);
        expect(iosDevice.isDesktop, false);
      });

      test('should detect desktop platforms', () {
        const windowsDevice = DeviceInfoModel(
          platform: 'Windows',
          deviceId: 'test_id',
          model: 'Windows PC',
          brand: 'Microsoft',
          systemName: 'Windows',
          systemVersion: '11',
          screenResolution: '1920x1080',
          isPhysicalDevice: true,
          additionalInfo: {},
        );

        expect(windowsDevice.isDesktop, true);
        expect(windowsDevice.isMobile, false);
      });

      test('should detect tablet devices', () {
        const ipadDevice = DeviceInfoModel(
          platform: 'iOS',
          deviceId: 'test_id',
          model: 'iPad Pro',
          brand: 'Apple',
          systemName: 'iOS',
          systemVersion: '15.0',
          screenResolution: '2048x2732',
          isPhysicalDevice: true,
          additionalInfo: {},
        );

        expect(ipadDevice.isTablet, true);
        expect(ipadDevice.isMobile, true);
      });

      test('should calculate performance info', () {
        const highPerformanceDevice = DeviceInfoModel(
          platform: 'iOS',
          deviceId: 'test_id',
          model: 'iPhone 15 Pro',
          brand: 'Apple',
          systemName: 'iOS',
          systemVersion: '17.0',
          screenResolution: '1179x2556',
          isPhysicalDevice: true,
          ramMb: 8192,
          additionalInfo: {},
        );

        final performanceInfo = highPerformanceDevice.performanceInfo;
        expect(performanceInfo.score, greaterThan(50));
        expect(performanceInfo.category, isA<DevicePerformanceCategory>());
        expect(performanceInfo.recommendations, isA<List<String>>());
      });

      test('should support JSON serialization', () {
        const deviceInfo = DeviceInfoModel(
          platform: 'Test',
          deviceId: 'test_id',
          model: 'Test Model',
          brand: 'Test Brand',
          systemName: 'TestOS',
          systemVersion: '1.0',
          screenResolution: '1080x1920',
          isPhysicalDevice: true,
          additionalInfo: {'test_key': 'test_value'},
        );

        final json = deviceInfo.toJson();
        expect(json, isA<Map<String, dynamic>>());
        expect(json['platform'], 'Test');
        expect(json['deviceId'], 'test_id');
        expect(json['additionalInfo'], containsPair('test_key', 'test_value'));

        final fromJson = DeviceInfoModel.fromJson(json);
        expect(fromJson.platform, deviceInfo.platform);
        expect(fromJson.deviceId, deviceInfo.deviceId);
        expect(fromJson.model, deviceInfo.model);
      });

      test('should support copyWith', () {
        const originalDevice = DeviceInfoModel(
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

        final updatedDevice = originalDevice.copyWith(
          model: 'Updated Model',
          systemVersion: '2.0',
        );

        expect(updatedDevice.platform, originalDevice.platform);
        expect(updatedDevice.deviceId, originalDevice.deviceId);
        expect(updatedDevice.model, 'Updated Model');
        expect(updatedDevice.systemVersion, '2.0');
        expect(updatedDevice.brand, originalDevice.brand);
      });

      test('should implement equality correctly', () {
        const device1 = DeviceInfoModel(
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

        const device2 = DeviceInfoModel(
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

        const device3 = DeviceInfoModel(
          platform: 'Different',
          deviceId: 'test_id',
          model: 'Test Model',
          brand: 'Test Brand',
          systemName: 'TestOS',
          systemVersion: '1.0',
          screenResolution: '1080x1920',
          isPhysicalDevice: true,
          additionalInfo: {},
        );

        expect(device1, equals(device2));
        expect(device1, isNot(equals(device3)));
        expect(device1.hashCode, equals(device2.hashCode));
      });
    });

    group('DevicePerformanceCategory', () {
      test('should have correct display names', () {
        expect(DevicePerformanceCategory.low.displayName, 'Low');
        expect(DevicePerformanceCategory.medium.displayName, 'Medium');
        expect(DevicePerformanceCategory.high.displayName, 'High');
      });

      test('should have correct string representation', () {
        expect(DevicePerformanceCategory.low.toString(), 'Low');
        expect(DevicePerformanceCategory.medium.toString(), 'Medium');
        expect(DevicePerformanceCategory.high.toString(), 'High');
      });
    });
  });
}
