import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/models/product_models.dart';
import 'package:flutter_magento/src/models/enhanced_product.dart';
import 'package:flutter_magento/src/adapters/custom_attributes_adapter.dart';
import 'package:flutter_magento/src/adapters/custom_attributes_manager.dart';
import 'package:flutter_magento/src/adapters/validation_result.dart';

// Test model and adapter
class TestCustomData {
  final String? field1;
  final int? field2;

  const TestCustomData({this.field1, this.field2});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestCustomData &&
          runtimeType == other.runtimeType &&
          field1 == other.field1 &&
          field2 == other.field2;

  @override
  int get hashCode => field1.hashCode ^ field2.hashCode;
}

class TestAdapter extends CustomAttributesAdapter<TestCustomData> {
  @override
  String get adapterId => 'test_adapter';

  @override
  List<String> get supportedAttributeCodes => ['field_1', 'field_2'];

  @override
  TestCustomData fromCustomAttributes(List<CustomAttribute> attributes) {
    final attrMap = {
      for (var attr in attributes) attr.attributeCode: attr.value
    };
    return TestCustomData(
      field1: attrMap['field_1'],
      field2: int.tryParse(attrMap['field_2'] ?? ''),
    );
  }

  @override
  List<CustomAttribute> toCustomAttributes(TestCustomData model) {
    final attributes = <CustomAttribute>[];
    if (model.field1 != null) {
      attributes
          .add(CustomAttribute(attributeCode: 'field_1', value: model.field1!));
    }
    if (model.field2 != null) {
      attributes.add(CustomAttribute(
          attributeCode: 'field_2', value: model.field2!.toString()));
    }
    return attributes;
  }

  @override
  ValidationResult validate(TestCustomData model) {
    final errors = <String>[];
    if (model.field2 != null && model.field2! < 0) {
      errors.add('field2 must be non-negative');
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
    return null;
  }

  @override
  Map<String, dynamic> buildSearchFilters(TestCustomData model) {
    final filters = <String, dynamic>{};
    if (model.field1 != null) filters['field_1'] = model.field1;
    if (model.field2 != null) filters['field_2'] = model.field2;
    return filters;
  }
}

void main() {
  group('EnhancedProduct', () {
    late Product baseProduct;
    late TestAdapter testAdapter;
    late CustomAttributesManager manager;

    setUp(() {
      baseProduct = const Product(
        id: 1,
        sku: 'test-sku',
        name: 'Test Product',
        typeId: 'simple',
        price: 99.99,
        status: 1,
        visibility: 4,
        stockStatus: 1,
        customAttributes: [
          CustomAttribute(attributeCode: 'field_1', value: 'test_value'),
          CustomAttribute(attributeCode: 'field_2', value: '42'),
          CustomAttribute(attributeCode: 'other_field', value: 'other_value'),
        ],
      );

      testAdapter = TestAdapter();
      manager = CustomAttributesManager.instance;
      manager.clearAllAdapters();
      manager.registerAdapter('test_adapter', testAdapter);
    });

    tearDown(() {
      manager.clearAllAdapters();
    });

    group('Creation', () {
      test('should create enhanced product from base product with adapter', () {
        final enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapter: testAdapter,
        );

        expect(enhanced.baseProduct, equals(baseProduct));
        expect(enhanced.adapterId, equals('test_adapter'));
        expect(enhanced.customData, isNotNull);
        expect(enhanced.customData!.field1, equals('test_value'));
        expect(enhanced.customData!.field2, equals(42));
        expect(enhanced.hasCustomData, isTrue);
        expect(enhanced.hasAdapter, isTrue);
      });

      test('should create enhanced product from base product with adapter ID',
          () {
        final enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapterId: 'test_adapter',
        );

        expect(enhanced.baseProduct, equals(baseProduct));
        expect(enhanced.adapterId, equals('test_adapter'));
        expect(enhanced.customData, isNotNull);
        expect(enhanced.customData!.field1, equals('test_value'));
        expect(enhanced.customData!.field2, equals(42));
      });

      test('should create enhanced product with auto-detection', () {
        final enhanced =
            EnhancedProduct<TestCustomData>.fromProduct(baseProduct);

        expect(enhanced.baseProduct, equals(baseProduct));
        expect(enhanced.adapterId,
            equals('test_adapter')); // Should be auto-detected
        expect(enhanced.customData, isNotNull);
      });

      test('should create enhanced product without custom data when no adapter',
          () {
        manager.clearAllAdapters(); // Remove all adapters

        final enhanced =
            EnhancedProduct<TestCustomData>.fromProduct(baseProduct);

        expect(enhanced.baseProduct, equals(baseProduct));
        expect(enhanced.adapterId, isNull);
        expect(enhanced.customData, isNull);
        expect(enhanced.hasCustomData, isFalse);
        expect(enhanced.hasAdapter, isFalse);
      });

      test('should populate raw custom attributes', () {
        final enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapter: testAdapter,
        );

        expect(enhanced.rawCustomAttributes, isNotEmpty);
        expect(enhanced.rawCustomAttributes['field_1'], equals('test_value'));
        expect(enhanced.rawCustomAttributes['field_2'], equals('42'));
        expect(
            enhanced.rawCustomAttributes['other_field'], equals('other_value'));
      });
    });

    group('Custom Attribute Access', () {
      late EnhancedProduct<TestCustomData> enhanced;

      setUp(() {
        enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapter: testAdapter,
        );
      });

      test('should get custom attribute value', () {
        expect(enhanced.getCustomAttribute('field_1'), equals('test_value'));
        expect(enhanced.getCustomAttribute('field_2'), equals('42'));
        expect(
            enhanced.getCustomAttribute('other_field'), equals('other_value'));
      });

      test('should get typed custom attribute value', () {
        expect(enhanced.getTypedCustomAttribute<String>('field_1'),
            equals('test_value'));
        expect(enhanced.getTypedCustomAttribute<int>('field_2'), equals(42));
        expect(
            enhanced.getTypedCustomAttribute<double>('field_2'), equals(42.0));
      });

      test('should return null for non-existent attribute', () {
        expect(enhanced.getCustomAttribute('non_existent'), isNull);
        expect(
            enhanced.getTypedCustomAttribute<String>('non_existent'), isNull);
      });

      test('should return null for invalid type conversion', () {
        expect(enhanced.getTypedCustomAttribute<int>('field_1'),
            isNull); // 'test_value' is not a number
      });

      test('should check if custom attribute exists', () {
        expect(enhanced.hasCustomAttribute('field_1'), isTrue);
        expect(enhanced.hasCustomAttribute('non_existent'), isFalse);
      });

      test('should get custom attribute codes', () {
        final codes = enhanced.customAttributeCodes;
        expect(codes, contains('field_1'));
        expect(codes, contains('field_2'));
        expect(codes, contains('other_field'));
      });
    });

    group('Validation', () {
      test('should validate custom data correctly', () {
        final enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapter: testAdapter,
        );

        expect(enhanced.isCustomDataValid, isTrue);
        expect(enhanced.customDataValidationErrors, isEmpty);
      });

      test('should detect validation errors', () {
        final invalidProduct = baseProduct.copyWith(
          customAttributes: [
            const CustomAttribute(attributeCode: 'field_1', value: 'test'),
            const CustomAttribute(
                attributeCode: 'field_2', value: '-1'), // Invalid: negative
          ],
        );

        final enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          invalidProduct,
          adapter: testAdapter,
        );

        expect(enhanced.isCustomDataValid, isFalse);
        expect(enhanced.customDataValidationErrors,
            contains('field2 must be non-negative'));
      });

      test('should return true for validation when no adapter', () {
        final enhanced = EnhancedProduct<TestCustomData>(
          baseProduct: baseProduct,
        );

        expect(enhanced.isCustomDataValid, isTrue);
        expect(enhanced.customDataValidationErrors, isEmpty);
      });
    });

    group('Data Manipulation', () {
      late EnhancedProduct<TestCustomData> enhanced;

      setUp(() {
        enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapter: testAdapter,
        );
      });

      test('should refresh custom data', () {
        final refreshed = enhanced.refreshCustomData();

        expect(refreshed.customData, equals(enhanced.customData));
        expect(refreshed.lastUpdated, isNot(equals(enhanced.lastUpdated)));
      });

      test('should update custom data', () {
        const newCustomData = TestCustomData(field1: 'new_value', field2: 100);

        final updated = enhanced.updateCustomData(newCustomData);

        expect(updated.customData, equals(newCustomData));
        expect(updated.baseProduct.customAttributes,
            isNot(equals(baseProduct.customAttributes)));
        expect(updated.rawCustomAttributes['field_1'], equals('new_value'));
        expect(updated.rawCustomAttributes['field_2'], equals('100'));
      });

      test('should create copy with new adapter', () {
        final newAdapter = TestAdapter();
        final withNewAdapter = enhanced
            .withAdapter<TestCustomData>('new_adapter', adapter: newAdapter);

        expect(withNewAdapter.adapterId, equals('new_adapter'));
        expect(withNewAdapter.baseProduct, equals(enhanced.baseProduct));
      });
    });

    group('Search Filters', () {
      test('should get search filters from custom data', () {
        final enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapter: testAdapter,
        );

        final filters = enhanced.getSearchFilters();

        expect(filters['field_1'], equals('test_value'));
        expect(filters['field_2'], equals(42));
      });

      test('should return empty filters when no adapter', () {
        final enhanced = EnhancedProduct<TestCustomData>(
          baseProduct: baseProduct,
        );

        final filters = enhanced.getSearchFilters();

        expect(filters, isEmpty);
      });
    });

    group('Filter Matching', () {
      late EnhancedProduct<TestCustomData> enhanced;

      setUp(() {
        enhanced = EnhancedProduct<TestCustomData>.fromProduct(
          baseProduct,
          adapter: testAdapter,
        );
      });

      test('should match simple filters', () {
        final filters = {
          'field_1': 'test_value',
          'field_2': '42',
        };

        expect(enhanced.matchesFilters(filters), isTrue);
      });

      test('should not match incorrect filters', () {
        final filters = {
          'field_1': 'wrong_value',
        };

        expect(enhanced.matchesFilters(filters), isFalse);
      });

      test('should match complex filters', () {
        final filters = {
          'field_2': {'gt': '40'}, // 42 > 40
        };

        expect(enhanced.matchesFilters(filters), isTrue);
      });

      test('should not match complex filters with wrong condition', () {
        final filters = {
          'field_2': {'gt': '50'}, // 42 is not > 50
        };

        expect(enhanced.matchesFilters(filters), isFalse);
      });

      test('should match range filters', () {
        final filters = {
          'field_2': {
            'range': {'from': '40', 'to': '50'}
          }, // 42 is between 40 and 50
        };

        expect(enhanced.matchesFilters(filters), isTrue);
      });

      test('should match like filters', () {
        final filters = {
          'field_1': {'like': 'test'}, // 'test_value' contains 'test'
        };

        expect(enhanced.matchesFilters(filters), isTrue);
      });

      test('should match in filters', () {
        final filters = {
          'field_1': {
            'in': ['test_value', 'other_value']
          },
        };

        expect(enhanced.matchesFilters(filters), isTrue);
      });
    });
  });

  group('EnhancedProductListResponse', () {
    late ProductListResponse baseResponse;
    late TestAdapter testAdapter;

    setUp(() {
      baseResponse = const ProductListResponse(
        items: [
          Product(
            id: 1,
            sku: 'sku1',
            name: 'Product 1',
            typeId: 'simple',
            price: 99.99,
            status: 1,
            visibility: 4,
            stockStatus: 1,
            customAttributes: [
              CustomAttribute(attributeCode: 'field_1', value: 'value1'),
            ],
          ),
          Product(
            id: 2,
            sku: 'sku2',
            name: 'Product 2',
            typeId: 'simple',
            price: 199.99,
            status: 1,
            visibility: 4,
            stockStatus: 1,
            customAttributes: [
              CustomAttribute(attributeCode: 'field_1', value: 'value2'),
            ],
          ),
        ],
        totalCount: 2,
        pageSize: 20,
        currentPage: 1,
        totalPages: 1,
      );

      testAdapter = TestAdapter();
    });

    test('should create from product list response', () {
      final enhanced =
          EnhancedProductListResponse<TestCustomData>.fromProductListResponse(
        baseResponse,
        adapter: testAdapter,
      );

      expect(enhanced.items.length, equals(2));
      expect(enhanced.totalCount, equals(2));
      expect(enhanced.pageSize, equals(20));
      expect(enhanced.currentPage, equals(1));
      expect(enhanced.totalPages, equals(1));
      expect(enhanced.hasItems, isTrue);
      expect(enhanced.hasMorePages, isFalse);
    });

    test('should get items with custom data', () {
      final enhanced =
          EnhancedProductListResponse<TestCustomData>.fromProductListResponse(
        baseResponse,
        adapter: testAdapter,
      );

      final itemsWithCustomData = enhanced.itemsWithCustomData;

      expect(itemsWithCustomData.length, equals(2));
      expect(itemsWithCustomData.every((item) => item.hasCustomData), isTrue);
    });

    test('should get items with specific adapter', () {
      final enhanced =
          EnhancedProductListResponse<TestCustomData>.fromProductListResponse(
        baseResponse,
        adapter: testAdapter,
      );

      final itemsWithAdapter = enhanced.getItemsWithAdapter('test_adapter');

      expect(itemsWithAdapter.length, equals(2));
      expect(itemsWithAdapter.every((item) => item.adapterId == 'test_adapter'),
          isTrue);
    });

    test('should provide custom data statistics', () {
      final enhanced =
          EnhancedProductListResponse<TestCustomData>.fromProductListResponse(
        baseResponse,
        adapter: testAdapter,
      );

      final stats = enhanced.customDataStatistics;

      expect(stats['totalItems'], equals(2));
      expect(stats['itemsWithCustomData'], equals(2));
      expect(stats['customDataUsagePercentage'], equals('100.0'));
      expect(stats['adapterUsage'], isA<Map<String, int>>());
    });
  });
}
