import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/models/product_models.dart';
import 'package:flutter_magento/src/adapters/custom_attributes_adapter.dart';
import 'package:flutter_magento/src/adapters/validation_result.dart';

// Test adapter implementation
class TestCustomAttributes {
  final String? testField1;
  final int? testField2;
  final double? testField3;
  final bool? testField4;
  final List<String>? testField5;

  const TestCustomAttributes({
    this.testField1,
    this.testField2,
    this.testField3,
    this.testField4,
    this.testField5,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestCustomAttributes &&
          runtimeType == other.runtimeType &&
          testField1 == other.testField1 &&
          testField2 == other.testField2 &&
          testField3 == other.testField3 &&
          testField4 == other.testField4 &&
          _listEquals(testField5, other.testField5);

  @override
  int get hashCode =>
      testField1.hashCode ^
      testField2.hashCode ^
      testField3.hashCode ^
      testField4.hashCode ^
      testField5.hashCode;

  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int index = 0; index < a.length; index += 1) {
      if (a[index] != b[index]) return false;
    }
    return true;
  }
}

class TestCustomAttributesAdapter
    extends CustomAttributesAdapter<TestCustomAttributes> {
  @override
  String get adapterId => 'test_adapter';

  @override
  List<String> get supportedAttributeCodes => [
        'test_field_1',
        'test_field_2',
        'test_field_3',
        'test_field_4',
        'test_field_5',
      ];

  @override
  TestCustomAttributes fromCustomAttributes(List<CustomAttribute> attributes) {
    final attrMap = {
      for (var attr in attributes) attr.attributeCode: attr.value
    };

    return TestCustomAttributes(
      testField1: attrMap['test_field_1'],
      testField2: int.tryParse(attrMap['test_field_2'] ?? ''),
      testField3: double.tryParse(attrMap['test_field_3'] ?? ''),
      testField4: attrMap['test_field_4']?.toLowerCase() == 'true',
      testField5: attrMap['test_field_5']?.split(','),
    );
  }

  @override
  List<CustomAttribute> toCustomAttributes(TestCustomAttributes model) {
    final attributes = <CustomAttribute>[];

    if (model.testField1 != null) {
      attributes.add(CustomAttribute(
          attributeCode: 'test_field_1', value: model.testField1!));
    }
    if (model.testField2 != null) {
      attributes.add(CustomAttribute(
          attributeCode: 'test_field_2', value: model.testField2!.toString()));
    }
    if (model.testField3 != null) {
      attributes.add(CustomAttribute(
          attributeCode: 'test_field_3', value: model.testField3!.toString()));
    }
    if (model.testField4 != null) {
      attributes.add(CustomAttribute(
          attributeCode: 'test_field_4', value: model.testField4!.toString()));
    }
    if (model.testField5 != null) {
      attributes.add(CustomAttribute(
          attributeCode: 'test_field_5', value: model.testField5!.join(',')));
    }

    return attributes;
  }

  @override
  ValidationResult validate(TestCustomAttributes model) {
    final errors = <String>[];

    if (model.testField2 != null && model.testField2! < 0) {
      errors.add('test_field_2 must be non-negative');
    }

    if (model.testField3 != null &&
        (model.testField3! < 0.0 || model.testField3! > 100.0)) {
      errors.add('test_field_3 must be between 0.0 and 100.0');
    }

    return ValidationResult(isValid: errors.isEmpty, errors: errors);
  }

  @override
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code) {
    final attr = attributes.firstWhere(
      (attr) => attr.attributeCode == code,
      orElse: () => const CustomAttribute(attributeCode: '', value: ''),
    );

    if (attr.value.isEmpty) return null;

    if (U == String) return attr.value as U?;
    if (U == int) return int.tryParse(attr.value) as U?;
    if (U == double) return double.tryParse(attr.value) as U?;
    if (U == bool) return (attr.value.toLowerCase() == 'true') as U?;

    return null;
  }

  @override
  Map<String, dynamic> buildSearchFilters(TestCustomAttributes model) {
    final filters = <String, dynamic>{};

    if (model.testField1 != null) {
      filters['test_field_1'] = model.testField1;
    }
    if (model.testField2 != null) {
      filters['test_field_2'] = model.testField2;
    }

    return filters;
  }
}

void main() {
  group('CustomAttributesAdapter', () {
    late TestCustomAttributesAdapter adapter;

    setUp(() {
      adapter = TestCustomAttributesAdapter();
    });

    group('Basic Properties', () {
      test('should have correct adapter ID', () {
        expect(adapter.adapterId, equals('test_adapter'));
      });

      test('should have correct supported attribute codes', () {
        expect(
            adapter.supportedAttributeCodes,
            equals([
              'test_field_1',
              'test_field_2',
              'test_field_3',
              'test_field_4',
              'test_field_5',
            ]));
      });

      test('should have default version', () {
        expect(adapter.version, equals('1.0.0'));
      });
    });

    group('Attribute Conversion', () {
      test('should convert custom attributes to typed model', () {
        final attributes = [
          const CustomAttribute(
              attributeCode: 'test_field_1', value: 'test_value'),
          const CustomAttribute(attributeCode: 'test_field_2', value: '42'),
          const CustomAttribute(attributeCode: 'test_field_3', value: '3.14'),
          const CustomAttribute(attributeCode: 'test_field_4', value: 'true'),
          const CustomAttribute(
              attributeCode: 'test_field_5', value: 'item1,item2,item3'),
        ];

        final result = adapter.fromCustomAttributes(attributes);

        expect(result.testField1, equals('test_value'));
        expect(result.testField2, equals(42));
        expect(result.testField3, equals(3.14));
        expect(result.testField4, equals(true));
        expect(result.testField5, equals(['item1', 'item2', 'item3']));
      });

      test('should convert typed model to custom attributes', () {
        const model = TestCustomAttributes(
          testField1: 'test_value',
          testField2: 42,
          testField3: 3.14,
          testField4: true,
          testField5: ['item1', 'item2', 'item3'],
        );

        final result = adapter.toCustomAttributes(model);

        expect(result.length, equals(5));
        expect(
            result.any((attr) =>
                attr.attributeCode == 'test_field_1' &&
                attr.value == 'test_value'),
            isTrue);
        expect(
            result.any((attr) =>
                attr.attributeCode == 'test_field_2' && attr.value == '42'),
            isTrue);
        expect(
            result.any((attr) =>
                attr.attributeCode == 'test_field_3' && attr.value == '3.14'),
            isTrue);
        expect(
            result.any((attr) =>
                attr.attributeCode == 'test_field_4' && attr.value == 'true'),
            isTrue);
        expect(
            result.any((attr) =>
                attr.attributeCode == 'test_field_5' &&
                attr.value == 'item1,item2,item3'),
            isTrue);
      });

      test('should handle null values correctly', () {
        final attributes = [
          const CustomAttribute(
              attributeCode: 'test_field_1', value: 'test_value'),
        ];

        final result = adapter.fromCustomAttributes(attributes);

        expect(result.testField1, equals('test_value'));
        expect(result.testField2, isNull);
        expect(result.testField3, isNull);
        expect(result.testField4, isNull);
        expect(result.testField5, isNull);
      });

      test('should handle empty attributes list', () {
        final result = adapter.fromCustomAttributes([]);

        expect(result.testField1, isNull);
        expect(result.testField2, isNull);
        expect(result.testField3, isNull);
        expect(result.testField4, isNull);
        expect(result.testField5, isNull);
      });
    });

    group('Validation', () {
      test('should validate valid model', () {
        const model = TestCustomAttributes(
          testField1: 'test',
          testField2: 42,
          testField3: 50.0,
          testField4: true,
        );

        final result = adapter.validate(model);

        expect(result.isValid, isTrue);
        expect(result.errors, isEmpty);
      });

      test('should detect validation errors', () {
        const model = TestCustomAttributes(
          testField2: -1, // Invalid: negative
          testField3: 150.0, // Invalid: > 100
        );

        final result = adapter.validate(model);

        expect(result.isValid, isFalse);
        expect(result.errors.length, equals(2));
        expect(result.errors, contains('test_field_2 must be non-negative'));
        expect(result.errors,
            contains('test_field_3 must be between 0.0 and 100.0'));
      });

      test('should handle null values in validation', () {
        const model = TestCustomAttributes();

        final result = adapter.validate(model);

        expect(result.isValid, isTrue);
        expect(result.errors, isEmpty);
      });
    });

    group('Attribute Value Retrieval', () {
      test('should get string attribute value', () {
        final attributes = [
          const CustomAttribute(
              attributeCode: 'test_field_1', value: 'test_value'),
        ];

        final result =
            adapter.getAttributeValue<String>(attributes, 'test_field_1');

        expect(result, equals('test_value'));
      });

      test('should get int attribute value', () {
        final attributes = [
          const CustomAttribute(attributeCode: 'test_field_2', value: '42'),
        ];

        final result =
            adapter.getAttributeValue<int>(attributes, 'test_field_2');

        expect(result, equals(42));
      });

      test('should get double attribute value', () {
        final attributes = [
          const CustomAttribute(attributeCode: 'test_field_3', value: '3.14'),
        ];

        final result =
            adapter.getAttributeValue<double>(attributes, 'test_field_3');

        expect(result, equals(3.14));
      });

      test('should get bool attribute value', () {
        final attributes = [
          const CustomAttribute(attributeCode: 'test_field_4', value: 'true'),
        ];

        final result =
            adapter.getAttributeValue<bool>(attributes, 'test_field_4');

        expect(result, equals(true));
      });

      test('should return null for non-existent attribute', () {
        final attributes = <CustomAttribute>[];

        final result =
            adapter.getAttributeValue<String>(attributes, 'non_existent');

        expect(result, isNull);
      });

      test('should return null for invalid type conversion', () {
        final attributes = [
          const CustomAttribute(
              attributeCode: 'test_field_2', value: 'not_a_number'),
        ];

        final result =
            adapter.getAttributeValue<int>(attributes, 'test_field_2');

        expect(result, isNull);
      });
    });

    group('Search Filters', () {
      test('should build search filters from model', () {
        const model = TestCustomAttributes(
          testField1: 'test_value',
          testField2: 42,
          testField3: 3.14, // Should not be included in search filters
        );

        final result = adapter.buildSearchFilters(model);

        expect(
            result,
            equals({
              'test_field_1': 'test_value',
              'test_field_2': 42,
            }));
      });

      test('should handle null values in search filters', () {
        const model = TestCustomAttributes();

        final result = adapter.buildSearchFilters(model);

        expect(result, isEmpty);
      });
    });

    group('Can Handle', () {
      test('should detect if adapter can handle attributes', () {
        final attributes = [
          const CustomAttribute(attributeCode: 'test_field_1', value: 'test'),
          const CustomAttribute(attributeCode: 'other_field', value: 'other'),
        ];

        final result = adapter.canHandle(attributes);

        expect(result, isTrue);
      });

      test('should return false for unsupported attributes', () {
        final attributes = [
          const CustomAttribute(
              attributeCode: 'unsupported_field', value: 'test'),
          const CustomAttribute(
              attributeCode: 'another_unsupported', value: 'other'),
        ];

        final result = adapter.canHandle(attributes);

        expect(result, isFalse);
      });

      test('should return false for empty attributes', () {
        final result = adapter.canHandle([]);

        expect(result, isFalse);
      });
    });

    group('Helper Methods', () {
      test('should get attribute display name', () {
        expect(adapter.getAttributeDisplayName('test_field_1'),
            equals('Test Field 1'));
        expect(adapter.getAttributeDisplayName('simple_name'),
            equals('Simple Name'));
        expect(
            adapter.getAttributeDisplayName('UPPERCASE'), equals('UPPERCASE'));
      });

      test('should get attribute metadata', () {
        final metadata = adapter.getAttributeMetadata('test_field_1');

        expect(metadata, isA<Map<String, dynamic>>());
        expect(metadata, isNotEmpty);
      });

      test('should transform attribute value', () {
        final result =
            adapter.transformAttributeValue('test_field_1', 'raw_value');

        expect(result, equals('raw_value'));
      });

      test('should get default value', () {
        final result = adapter.getDefaultValue('test_field_1');

        expect(result, isNull); // Default implementation returns null
      });

      test('should check if attribute is required', () {
        final result = adapter.isRequired('test_field_1');

        expect(result, isFalse); // Default implementation returns false
      });
    });
  });
}
