import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/models/product_models.dart';
import 'package:flutter_magento/src/adapters/custom_attributes_adapter.dart';
import 'package:flutter_magento/src/adapters/custom_attributes_manager.dart';
import 'package:flutter_magento/src/adapters/validation_result.dart';

// Test adapter implementations
class TestAdapter1 extends CustomAttributesAdapter<String> {
  @override
  String get adapterId => 'test_adapter_1';

  @override
  List<String> get supportedAttributeCodes => ['field_1', 'field_2'];

  @override
  String fromCustomAttributes(List<CustomAttribute> attributes) {
    return attributes
        .map((attr) => '${attr.attributeCode}:${attr.value}')
        .join(',');
  }

  @override
  List<CustomAttribute> toCustomAttributes(String model) {
    return [CustomAttribute(attributeCode: 'field_1', value: model)];
  }

  @override
  ValidationResult validate(String model) {
    return ValidationResult(
        isValid: model.isNotEmpty,
        errors: model.isEmpty ? ['Model cannot be empty'] : []);
  }

  @override
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code) {
    final attr = attributes.firstWhere(
      (attr) => attr.attributeCode == code,
      orElse: () => const CustomAttribute(attributeCode: '', value: ''),
    );
    return attr.value.isEmpty ? null : attr.value as U?;
  }

  @override
  Map<String, dynamic> buildSearchFilters(String model) {
    return {'field_1': model};
  }
}

class TestAdapter2 extends CustomAttributesAdapter<int> {
  @override
  String get adapterId => 'test_adapter_2';

  @override
  List<String> get supportedAttributeCodes => ['field_2', 'field_3'];

  @override
  int fromCustomAttributes(List<CustomAttribute> attributes) {
    return attributes.length;
  }

  @override
  List<CustomAttribute> toCustomAttributes(int model) {
    return [CustomAttribute(attributeCode: 'field_2', value: model.toString())];
  }

  @override
  ValidationResult validate(int model) {
    return ValidationResult(
        isValid: model >= 0,
        errors: model < 0 ? ['Model must be non-negative'] : []);
  }

  @override
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code) {
    final attr = attributes.firstWhere(
      (attr) => attr.attributeCode == code,
      orElse: () => const CustomAttribute(attributeCode: '', value: ''),
    );
    return attr.value.isEmpty ? null : int.tryParse(attr.value) as U?;
  }

  @override
  Map<String, dynamic> buildSearchFilters(int model) {
    return {'field_2': model};
  }
}

void main() {
  group('CustomAttributesManager', () {
    late CustomAttributesManager manager;
    late TestAdapter1 adapter1;
    late TestAdapter2 adapter2;

    setUp(() {
      manager = CustomAttributesManager.instance;
      manager.clearAllAdapters(); // Clear any existing adapters
      adapter1 = TestAdapter1();
      adapter2 = TestAdapter2();
    });

    tearDown(() {
      manager.clearAllAdapters();
    });

    group('Adapter Registration', () {
      test('should register adapter successfully', () {
        manager.registerAdapter('test1', adapter1);

        expect(manager.isAdapterRegistered('test1'), isTrue);
        expect(manager.registeredAdapters.containsKey('test1'), isTrue);
        expect(manager.registeredAdapters['test1'], equals(adapter1));
      });

      test('should register multiple adapters', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        expect(manager.registeredAdapters.length, equals(2));
        expect(manager.isAdapterRegistered('test1'), isTrue);
        expect(manager.isAdapterRegistered('test2'), isTrue);
      });

      test('should handle adapter priorities', () {
        manager.registerAdapter('test1', adapter1, priority: 1);
        manager.registerAdapter('test2', adapter2, priority: 2);

        expect(manager.adapterPriorities['test1'], equals(1));
        expect(manager.adapterPriorities['test2'], equals(2));
      });

      test('should override adapter with same ID', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test1', adapter2); // Override with same ID

        expect(manager.registeredAdapters.length, equals(1));
        expect(manager.registeredAdapters['test1'], equals(adapter2));
      });

      test('should build attribute mapping correctly', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        final mapping = manager.attributeMapping;

        expect(mapping['field_1'], equals('test1'));
        expect(
            mapping['field_2'],
            anyOf(equals('test1'),
                equals('test2'))); // Both adapters support field_2
        expect(mapping['field_3'], equals('test2'));
      });

      test('should prioritize higher priority adapters in attribute mapping',
          () {
        manager.registerAdapter('test1', adapter1, priority: 1);
        manager.registerAdapter('test2', adapter2,
            priority: 2); // Higher priority

        final mapping = manager.attributeMapping;

        // field_2 is supported by both, but test2 has higher priority
        expect(mapping['field_2'], equals('test2'));
      });
    });

    group('Adapter Unregistration', () {
      test('should unregister adapter successfully', () {
        manager.registerAdapter('test1', adapter1);
        manager.unregisterAdapter('test1');

        expect(manager.isAdapterRegistered('test1'), isFalse);
        expect(manager.registeredAdapters.containsKey('test1'), isFalse);
      });

      test('should rebuild attribute mapping after unregistration', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        expect(manager.attributeMapping['field_1'], equals('test1'));

        manager.unregisterAdapter('test1');

        expect(manager.attributeMapping.containsKey('field_1'), isFalse);
        expect(manager.attributeMapping['field_2'], equals('test2'));
      });

      test('should handle unregistering non-existent adapter', () {
        expect(
            () => manager.unregisterAdapter('non_existent'), returnsNormally);
      });
    });

    group('Adapter Retrieval', () {
      test('should get adapter by ID', () {
        manager.registerAdapter('test1', adapter1);

        final result = manager.getAdapter<String>('test1');

        expect(result, equals(adapter1));
      });

      test('should return null for non-existent adapter', () {
        final result = manager.getAdapter<String>('non_existent');

        expect(result, isNull);
      });

      test('should return null for type mismatch', () {
        manager.registerAdapter('test1', adapter1);

        final result = manager.getAdapter<int>('test1'); // Wrong type

        expect(result, isNull);
      });

      test('should get adapter by attribute code', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        final result1 = manager.getAdapterByAttribute('field_1');
        final result2 = manager.getAdapterByAttribute('field_3');

        expect(result1, equals(adapter1));
        expect(result2, equals(adapter2));
      });
    });

    group('Adapter Detection', () {
      test('should detect adapter automatically', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        final attributes = [
          const CustomAttribute(attributeCode: 'field_1', value: 'test'),
          const CustomAttribute(attributeCode: 'other_field', value: 'other'),
        ];

        final result = manager.detectAdapter(attributes);

        expect(result, equals(adapter1));
      });

      test('should detect adapter with highest score', () {
        manager.registerAdapter('test1', adapter1, priority: 1);
        manager.registerAdapter('test2', adapter2, priority: 2);

        final attributes = [
          const CustomAttribute(
              attributeCode: 'field_2', value: 'test'), // Supported by both
          const CustomAttribute(
              attributeCode: 'field_3',
              value: 'other'), // Only supported by adapter2
        ];

        final result = manager.detectAdapter(attributes);

        expect(
            result,
            equals(
                adapter2)); // Should prefer adapter2 due to more matches + higher priority
      });

      test('should return null when no suitable adapter found', () {
        manager.registerAdapter('test1', adapter1);

        final attributes = [
          const CustomAttribute(
              attributeCode: 'unsupported_field', value: 'test'),
        ];

        final result = manager.detectAdapter(attributes);

        expect(result, isNull);
      });

      test('should return null for empty attributes', () {
        manager.registerAdapter('test1', adapter1);

        final result = manager.detectAdapter([]);

        expect(result, isNull);
      });
    });

    group('Validation', () {
      test('should validate custom data using adapter', () {
        manager.registerAdapter('test1', adapter1);

        final result = manager.validateCustomData('test1', 'valid_data');

        expect(result, isNotNull);
        expect(result!.isValid, isTrue);
      });

      test('should return validation errors', () {
        manager.registerAdapter('test1', adapter1);

        final result = manager.validateCustomData(
            'test1', ''); // Empty string should be invalid

        expect(result, isNotNull);
        expect(result!.isValid, isFalse);
        expect(result.errors, contains('Model cannot be empty'));
      });

      test('should return null for non-existent adapter', () {
        final result = manager.validateCustomData('non_existent', 'data');

        expect(result, isNull);
      });
    });

    group('Attribute Conversion', () {
      test('should convert custom attributes using detected adapter', () {
        manager.registerAdapter('test1', adapter1);

        final attributes = [
          const CustomAttribute(attributeCode: 'field_1', value: 'test'),
          const CustomAttribute(attributeCode: 'field_2', value: 'value'),
        ];

        final result = manager.convertCustomAttributes<String>(attributes);

        expect(result, isNotNull);
        expect(result, equals('field_1:test,field_2:value'));
      });

      test('should return null when no suitable adapter found', () {
        manager.registerAdapter('test1', adapter1);

        final attributes = [
          const CustomAttribute(
              attributeCode: 'unsupported_field', value: 'test'),
        ];

        final result = manager.convertCustomAttributes<String>(attributes);

        expect(result, isNull);
      });
    });

    group('Information and Statistics', () {
      test('should get adapter info', () {
        manager.registerAdapter('test1', adapter1, priority: 5);

        final info = manager.getAdapterInfo('test1');

        expect(info['adapterId'], equals('test1'));
        expect(info['version'], equals('1.0.0'));
        expect(info['priority'], equals(5));
        expect(info['supportedAttributeCodes'], equals(['field_1', 'field_2']));
      });

      test('should get all adapters info', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        final allInfo = manager.getAllAdaptersInfo();

        expect(allInfo.length, equals(2));
        expect(allInfo.any((info) => info['adapterId'] == 'test1'), isTrue);
        expect(allInfo.any((info) => info['adapterId'] == 'test2'), isTrue);
      });

      test('should get statistics', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        final stats = manager.getStatistics();

        expect(stats['totalAdapters'], equals(2));
        expect(stats['totalMappedAttributes'], greaterThan(0));
        expect(stats['averageAttributesPerAdapter'], isA<String>());
      });

      test('should return empty info for non-existent adapter', () {
        final info = manager.getAdapterInfo('non_existent');

        expect(info, isEmpty);
      });
    });

    group('Clear Operations', () {
      test('should clear all adapters', () {
        manager.registerAdapter('test1', adapter1);
        manager.registerAdapter('test2', adapter2);

        expect(manager.registeredAdapters.length, equals(2));

        manager.clearAllAdapters();

        expect(manager.registeredAdapters, isEmpty);
        expect(manager.attributeMapping, isEmpty);
        expect(manager.adapterPriorities, isEmpty);
      });
    });

    group('Debug Logging', () {
      test('should enable and disable debug logging', () {
        expect(() => manager.enableDebugLogging = true, returnsNormally);
        expect(() => manager.enableDebugLogging = false, returnsNormally);
      });
    });
  });
}
