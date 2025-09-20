import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/src/flutter_magento_plugin.dart';
import 'package:flutter_magento/src/adapters/custom_attributes_manager.dart';
import 'package:flutter_magento/src/examples/ar_attributes_adapter.dart';
import 'package:flutter_magento/src/examples/fashion_attributes_adapter.dart';

void main() {
  group('Example Usage Tests', () {
    late FlutterMagento magento;
    late SamskaraARAdapter arAdapter;
    late FashionAttributesAdapter fashionAdapter;

    setUp(() {
      magento = FlutterMagento();
      arAdapter = SamskaraARAdapter();
      fashionAdapter = FashionAttributesAdapter();
    });

    tearDown(() {
      CustomAttributesManager.instance.clearAllAdapters();
    });

    group('AR Adapter (Samskara)', () {
      test('should have correct adapter properties', () {
        expect(arAdapter.adapterId, equals('samskara_ar'));
        expect(arAdapter.version, equals('1.0.0'));
        expect(arAdapter.supportedAttributeCodes, contains('model_path'));
        expect(
            arAdapter.supportedAttributeCodes, contains('ar_reference_image'));
        expect(arAdapter.supportedAttributeCodes, contains('artist_name'));
      });

      test('should convert AR attributes correctly', () {
        final attributes = [
          const CustomAttribute(
              attributeCode: 'model_path',
              value: 'https://example.com/model.glb'),
          const CustomAttribute(
              attributeCode: 'artist_name', value: 'John Doe'),
          const CustomAttribute(attributeCode: 'ar_width', value: '0.5'),
          const CustomAttribute(attributeCode: 'ar_height', value: '0.3'),
          const CustomAttribute(attributeCode: 'view_count', value: '150'),
          const CustomAttribute(attributeCode: 'average_rating', value: '4.5'),
          const CustomAttribute(
              attributeCode: 'orientation', value: 'portrait'),
        ];

        final result = arAdapter.fromCustomAttributes(attributes);

        expect(result.modelPath, equals('https://example.com/model.glb'));
        expect(result.artistName, equals('John Doe'));
        expect(result.arWidth, equals(0.5));
        expect(result.arHeight, equals(0.3));
        expect(result.viewCount, equals(150));
        expect(result.averageRating, equals(4.5));
        expect(result.orientation, equals('portrait'));
      });

      test('should validate AR attributes', () {
        // Valid AR attributes
        const validAR = ARAttributes(
          modelPath: 'https://example.com/model.glb',
          arWidth: 0.5,
          arHeight: 0.3,
          averageRating: 4.5,
          viewCount: 100,
        );

        final validResult = arAdapter.validate(validAR);
        expect(validResult.isValid, isTrue);
        expect(validResult.errors, isEmpty);

        // Invalid AR attributes
        const invalidAR = ARAttributes(
          modelPath: 'invalid-file.txt', // Wrong file extension
          arWidth: -1.0, // Negative width
          averageRating: 6.0, // Rating > 5
          viewCount: -10, // Negative count
        );

        final invalidResult = arAdapter.validate(invalidAR);
        expect(invalidResult.isValid, isFalse);
        expect(invalidResult.errors, isNotEmpty);
        expect(
            invalidResult.errors
                .any((error) => error.contains('Model path must be')),
            isTrue);
        expect(
            invalidResult.errors
                .any((error) => error.contains('AR width must be positive')),
            isTrue);
        expect(
            invalidResult.errors.any((error) =>
                error.contains('Average rating must be between 0 and 5')),
            isTrue);
        expect(
            invalidResult.errors.any(
                (error) => error.contains('View count cannot be negative')),
            isTrue);
      });

      test('should build AR search filters', () {
        const arData = ARAttributes(
          orientation: 'portrait',
          artistName: 'John Doe',
          category: 'sculpture',
          averageRating: 4.0,
          tags: ['modern', 'abstract'],
        );

        final filters = arAdapter.buildSearchFilters(arData);

        expect(filters['orientation'], equals('portrait'));
        expect(filters['artist_name'], equals({'like': '%John Doe%'}));
        expect(filters['category'], equals('sculpture'));
        expect(filters['average_rating'], equals({'gteq': '4.0'}));
        expect(
            filters['tags'],
            equals({
              'in': ['modern', 'abstract']
            }));
      });

      test('should check AR model validity', () {
        const validModel =
            ARAttributes(modelPath: 'https://example.com/model.glb');
        const invalidModel =
            ARAttributes(modelPath: 'https://example.com/model.txt');
        const noModel = ARAttributes();

        expect(validModel.isValidARModel, isTrue);
        expect(invalidModel.isValidARModel, isFalse);
        expect(noModel.isValidARModel, isFalse);
      });

      test('should calculate popularity score', () {
        const popularAR = ARAttributes(
          viewCount: 1000,
          interactionCount: 500,
          averageRating: 4.8,
        );

        final score = popularAR.popularityScore;
        expect(score, greaterThan(0));
        expect(score, equals(1000 * 0.3 + 500 * 0.5 + 4.8 * 20));
      });
    });

    group('Fashion Adapter', () {
      test('should have correct adapter properties', () {
        expect(fashionAdapter.adapterId, equals('fashion'));
        expect(fashionAdapter.version, equals('1.0.0'));
        expect(fashionAdapter.supportedAttributeCodes, contains('color'));
        expect(fashionAdapter.supportedAttributeCodes, contains('size'));
        expect(fashionAdapter.supportedAttributeCodes, contains('brand'));
      });

      test('should convert fashion attributes correctly', () {
        final attributes = [
          const CustomAttribute(attributeCode: 'color', value: 'red'),
          const CustomAttribute(attributeCode: 'size', value: 'M'),
          const CustomAttribute(attributeCode: 'brand', value: 'Nike'),
          const CustomAttribute(attributeCode: 'material', value: 'Cotton'),
          const CustomAttribute(attributeCode: 'discount', value: '20.5'),
          const CustomAttribute(
              attributeCode: 'is_eco_friendly', value: 'true'),
          const CustomAttribute(
              attributeCode: 'available_sizes', value: 'S,M,L,XL'),
        ];

        final result = fashionAdapter.fromCustomAttributes(attributes);

        expect(result.color, equals('red'));
        expect(result.size, equals('M'));
        expect(result.brand, equals('Nike'));
        expect(result.material, equals('Cotton'));
        expect(result.discount, equals(20.5));
        expect(result.isEcoFriendly, isTrue);
        expect(result.availableSizes, equals(['S', 'M', 'L', 'XL']));
      });

      test('should validate fashion attributes', () {
        // Valid fashion attributes
        const validFashion = FashionAttributes(
          color: 'blue',
          size: 'M',
          discount: 25.0,
          gender: 'unisex',
          yearReleased: 2023,
        );

        final validResult = fashionAdapter.validate(validFashion);
        expect(validResult.isValid, isTrue);
        expect(validResult.errors, isEmpty);

        // Invalid fashion attributes
        const invalidFashion = FashionAttributes(
          discount: 150.0, // > 100%
          gender: 'invalid_gender',
          yearReleased: 1800, // Too old
          weight: -10.0, // Negative weight
        );

        final invalidResult = fashionAdapter.validate(invalidFashion);
        expect(invalidResult.isValid, isFalse);
        expect(invalidResult.errors, isNotEmpty);
        expect(
            invalidResult.errors.any((error) =>
                error.contains('Discount must be between 0 and 100')),
            isTrue);
        expect(
            invalidResult.errors
                .any((error) => error.contains('Gender must be one of')),
            isTrue);
        expect(
            invalidResult.errors.any(
                (error) => error.contains('Year released must be between')),
            isTrue);
        expect(
            invalidResult.errors
                .any((error) => error.contains('Weight cannot be negative')),
            isTrue);
      });

      test('should build fashion search filters', () {
        const fashionData = FashionAttributes(
          color: 'red',
          brand: 'Nike',
          gender: 'women',
          season: 'summer',
          isEcoFriendly: true,
          discount: 15.0,
        );

        final filters = fashionAdapter.buildSearchFilters(fashionData);

        expect(filters['color'], equals('red'));
        expect(filters['brand'], equals({'like': '%Nike%'}));
        expect(filters['gender'], equals('women'));
        expect(filters['season'], equals({'like': '%summer%'}));
        expect(filters['is_eco_friendly'], equals('true'));
        expect(filters['discount'], equals({'gt': '0'}));
      });

      test('should check discount status', () {
        const withDiscount = FashionAttributes(discount: 20.0);
        const withoutDiscount = FashionAttributes(discount: 0.0);
        const noDiscount = FashionAttributes();

        expect(withDiscount.hasDiscount, isTrue);
        expect(withoutDiscount.hasDiscount, isFalse);
        expect(noDiscount.hasDiscount, isFalse);
      });

      test('should calculate discounted price', () {
        const item = FashionAttributes(
          originalPrice: 100.0,
          discount: 20.0, // 20% discount
        );

        expect(item.discountedPrice, equals(80.0));
      });

      test('should check sustainability', () {
        const ecoFriendly = FashionAttributes(isEcoFriendly: true);
        const sustainable = FashionAttributes(sustainability: 'Organic cotton');
        const regular = FashionAttributes();

        expect(ecoFriendly.isSustainable, isTrue);
        expect(sustainable.isSustainable, isTrue);
        expect(regular.isSustainable, isFalse);
      });

      test('should check premium status', () {
        const limitedEdition = FashionAttributes(isLimitedEdition: true);
        const handmade = FashionAttributes(isHandmade: true);
        const designerItem = FashionAttributes(designer: 'Versace');
        const regular = FashionAttributes();

        expect(limitedEdition.isPremium, isTrue);
        expect(handmade.isPremium, isTrue);
        expect(designerItem.isPremium, isTrue);
        expect(regular.isPremium, isFalse);
      });

      test('should check gender suitability', () {
        const unisexItem = FashionAttributes(gender: 'unisex');
        const menItem = FashionAttributes(gender: 'men');
        const womenItem = FashionAttributes(gender: 'women');

        expect(unisexItem.isSuitableForGender('men'), isTrue);
        expect(unisexItem.isSuitableForGender('women'), isTrue);
        expect(menItem.isSuitableForGender('men'), isTrue);
        expect(menItem.isSuitableForGender('women'), isFalse);
        expect(womenItem.isSuitableForGender('women'), isTrue);
        expect(womenItem.isSuitableForGender('men'), isFalse);
      });

      test('should determine care complexity', () {
        const highCare = FashionAttributes(careInstructions: 'Dry clean only');
        const mediumCare =
            FashionAttributes(careInstructions: 'Machine wash warm');
        const lowCare =
            FashionAttributes(careInstructions: 'Machine wash cold');
        const unknownCare = FashionAttributes();

        expect(highCare.careComplexity, equals('high'));
        expect(mediumCare.careComplexity, equals('medium'));
        expect(lowCare.careComplexity, equals('low'));
        expect(unknownCare.careComplexity, equals('unknown'));
      });
    });

    group('Adapter Integration', () {
      test('should register adapters during initialization', () {
        // This would be tested in integration tests with actual FlutterMagento initialization
        // Here we test the registration directly
        CustomAttributesManager.instance
            .registerAdapter('samskara_ar', arAdapter);
        CustomAttributesManager.instance
            .registerAdapter('fashion', fashionAdapter);

        expect(
            CustomAttributesManager.instance.isAdapterRegistered('samskara_ar'),
            isTrue);
        expect(CustomAttributesManager.instance.isAdapterRegistered('fashion'),
            isTrue);

        final registeredAdapters =
            CustomAttributesManager.instance.registeredAdapters;
        expect(registeredAdapters.length, equals(2));
      });

      test('should detect appropriate adapter automatically', () {
        CustomAttributesManager.instance
            .registerAdapter('samskara_ar', arAdapter);
        CustomAttributesManager.instance
            .registerAdapter('fashion', fashionAdapter);

        // AR attributes
        final arAttributes = [
          const CustomAttribute(
              attributeCode: 'model_path', value: 'model.glb'),
          const CustomAttribute(attributeCode: 'artist_name', value: 'John'),
        ];

        final detectedARAdapter =
            CustomAttributesManager.instance.detectAdapter(arAttributes);
        expect(detectedARAdapter, equals(arAdapter));

        // Fashion attributes
        final fashionAttributes = [
          const CustomAttribute(attributeCode: 'color', value: 'red'),
          const CustomAttribute(attributeCode: 'size', value: 'M'),
        ];

        final detectedFashionAdapter =
            CustomAttributesManager.instance.detectAdapter(fashionAttributes);
        expect(detectedFashionAdapter, equals(fashionAdapter));
      });

      test('should handle adapter priorities', () {
        // Register with different priorities
        CustomAttributesManager.instance
            .registerAdapter('samskara_ar', arAdapter, priority: 1);
        CustomAttributesManager.instance
            .registerAdapter('fashion', fashionAdapter, priority: 2);

        final priorities = CustomAttributesManager.instance.adapterPriorities;
        expect(priorities['samskara_ar'], equals(1));
        expect(priorities['fashion'], equals(2));
      });
    });

    group('Attribute Metadata', () {
      test('should provide AR attribute metadata', () {
        final modelPathMeta = arAdapter.getAttributeMetadata('model_path');
        expect(modelPathMeta['type'], equals('url'));
        expect(modelPathMeta['required'], isTrue);
        expect(modelPathMeta['description'], contains('3D model'));

        final orientationMeta = arAdapter.getAttributeMetadata('orientation');
        expect(orientationMeta['type'], equals('enum'));
        expect(orientationMeta['options'], contains('portrait'));
        expect(orientationMeta['options'], contains('landscape'));
      });

      test('should provide fashion attribute metadata', () {
        final colorMeta = fashionAdapter.getAttributeMetadata('color');
        expect(colorMeta['type'], equals('color'));
        expect(colorMeta['searchable'], isTrue);
        expect(colorMeta['filterable'], isTrue);

        final genderMeta = fashionAdapter.getAttributeMetadata('gender');
        expect(genderMeta['type'], equals('enum'));
        expect(genderMeta['options'], contains('men'));
        expect(genderMeta['options'], contains('women'));
        expect(genderMeta['options'], contains('unisex'));
      });
    });

    group('Default Values', () {
      test('should provide AR default values', () {
        expect(arAdapter.getDefaultValue('orientation'), equals('landscape'));
        expect(arAdapter.getDefaultValue('model_scale'), equals(1.0));
        expect(arAdapter.getDefaultValue('difficulty'), equals('beginner'));
      });

      test('should provide fashion default values', () {
        expect(fashionAdapter.getDefaultValue('gender'), equals('unisex'));
        expect(fashionAdapter.getDefaultValue('fit'), equals('regular'));
        expect(fashionAdapter.getDefaultValue('discount'), equals(0.0));
      });
    });

    group('Required Fields', () {
      test('should identify required AR fields', () {
        expect(arAdapter.isRequired('model_path'), isTrue);
        expect(arAdapter.isRequired('artist_name'), isFalse);
      });

      test('should identify required fashion fields', () {
        expect(fashionAdapter.isRequired('color'), isTrue);
        expect(fashionAdapter.isRequired('size'), isTrue);
        expect(fashionAdapter.isRequired('material'), isTrue);
        expect(fashionAdapter.isRequired('brand'), isFalse);
      });
    });
  });
}
