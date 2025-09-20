import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/product_models.dart';
import '../adapters/custom_attributes_adapter.dart';
import '../adapters/validation_result.dart';

part 'fashion_attributes_adapter.freezed.dart';
part 'fashion_attributes_adapter.g.dart';

/// Fashion attributes model for clothing/fashion applications
@freezed
class FashionAttributes with _$FashionAttributes {
  const factory FashionAttributes({
    String? color,
    String? size,
    String? material,
    String? brand,
    String? season,
    List<String>? availableSizes,
    double? discount,
    String? careInstructions,
    String? fabricComposition,
    String? countryOfOrigin,
    String? gender, // 'men' | 'women' | 'unisex' | 'kids'
    String? ageGroup, // 'adult' | 'teen' | 'kids' | 'baby'
    String? pattern, // 'solid' | 'striped' | 'floral' | 'geometric'
    String? fit, // 'slim' | 'regular' | 'loose' | 'oversized'
    String? neckline, // 'round' | 'v-neck' | 'crew' | 'collar'
    String? sleeveLength, // 'short' | 'long' | '3/4' | 'sleeveless'
    String? occasion, // 'casual' | 'formal' | 'sport' | 'party'
    bool? isEcoFriendly,
    bool? isHandmade,
    bool? isLimitedEdition,
    double? weight, // in grams
    Map<String, String>? measurements, // chest, waist, length, etc.
    List<String>? colors, // all available colors
    String? designer,
    String? collection,
    int? yearReleased,
    double? originalPrice,
    String? sustainability, // sustainability rating or description
    Map<String, dynamic>? sizeChart,
    List<String>? tags,
  }) = _FashionAttributes;

  factory FashionAttributes.fromJson(Map<String, dynamic> json) =>
      _$FashionAttributesFromJson(json);

  const FashionAttributes._();

  /// Check if this item has a discount
  bool get hasDiscount => discount != null && discount! > 0;

  /// Calculate discounted price if original price is available
  double? get discountedPrice {
    if (originalPrice == null || discount == null) return null;
    return originalPrice! * (1 - (discount! / 100));
  }

  /// Check if this is a sustainable/eco-friendly product
  bool get isSustainable =>
      isEcoFriendly == true ||
      (sustainability != null && sustainability!.isNotEmpty);

  /// Check if this is a premium product
  bool get isPremium =>
      isLimitedEdition == true ||
      isHandmade == true ||
      (designer != null && designer!.isNotEmpty);

  /// Get size availability status
  bool get hasSizeVariations =>
      availableSizes != null && availableSizes!.isNotEmpty;

  /// Get color availability status
  bool get hasColorVariations => colors != null && colors!.length > 1;

  /// Check if suitable for specific gender
  bool isSuitableForGender(String targetGender) {
    if (gender == null || gender!.toLowerCase() == 'unisex') return true;
    return gender!.toLowerCase() == targetGender.toLowerCase();
  }

  /// Check if suitable for specific age group
  bool isSuitableForAgeGroup(String targetAgeGroup) {
    if (ageGroup == null) return true;
    return ageGroup!.toLowerCase() == targetAgeGroup.toLowerCase();
  }

  /// Get care complexity level
  String get careComplexity {
    if (careInstructions == null || careInstructions!.isEmpty) return 'unknown';

    final instructions = careInstructions!.toLowerCase();
    if (instructions.contains('dry clean only') ||
        instructions.contains('hand wash only')) {
      return 'high';
    } else if (instructions.contains('machine wash') &&
        !instructions.contains('cold water')) {
      return 'medium';
    } else {
      return 'low';
    }
  }

  /// Get season appropriateness
  List<String> get appropriateSeasons {
    if (season == null) return [];
    return season!.split(',').map((s) => s.trim().toLowerCase()).toList();
  }
}

/// Custom attributes adapter for fashion/clothing applications
class FashionAttributesAdapter
    extends CustomAttributesAdapter<FashionAttributes> {
  @override
  String get adapterId => 'fashion';

  @override
  String get version => '1.0.0';

  @override
  List<String> get supportedAttributeCodes => [
        'color',
        'size',
        'material',
        'brand',
        'season',
        'available_sizes',
        'discount',
        'care_instructions',
        'fabric_composition',
        'country_of_origin',
        'gender',
        'age_group',
        'pattern',
        'fit',
        'neckline',
        'sleeve_length',
        'occasion',
        'is_eco_friendly',
        'is_handmade',
        'is_limited_edition',
        'weight',
        'measurements',
        'colors',
        'designer',
        'collection',
        'year_released',
        'original_price',
        'sustainability',
        'size_chart',
        'tags',
      ];

  @override
  FashionAttributes fromCustomAttributes(List<CustomAttribute> attributes) {
    final attrMap = {
      for (var attr in attributes) attr.attributeCode: attr.value
    };

    return FashionAttributes(
      color: attrMap['color'],
      size: attrMap['size'],
      material: attrMap['material'],
      brand: attrMap['brand'],
      season: attrMap['season'],
      availableSizes: _parseStringList(attrMap['available_sizes']),
      discount: double.tryParse(attrMap['discount']?.toString() ?? ''),
      careInstructions: attrMap['care_instructions'],
      fabricComposition: attrMap['fabric_composition'],
      countryOfOrigin: attrMap['country_of_origin'],
      gender: attrMap['gender'],
      ageGroup: attrMap['age_group'],
      pattern: attrMap['pattern'],
      fit: attrMap['fit'],
      neckline: attrMap['neckline'],
      sleeveLength: attrMap['sleeve_length'],
      occasion: attrMap['occasion'],
      isEcoFriendly: _parseBool(attrMap['is_eco_friendly']),
      isHandmade: _parseBool(attrMap['is_handmade']),
      isLimitedEdition: _parseBool(attrMap['is_limited_edition']),
      weight: double.tryParse(attrMap['weight']?.toString() ?? ''),
      measurements: _parseMeasurements(attrMap['measurements']),
      colors: _parseStringList(attrMap['colors']),
      designer: attrMap['designer'],
      collection: attrMap['collection'],
      yearReleased: int.tryParse(attrMap['year_released']?.toString() ?? ''),
      originalPrice:
          double.tryParse(attrMap['original_price']?.toString() ?? ''),
      sustainability: attrMap['sustainability'],
      sizeChart: _parseJsonMap(attrMap['size_chart']),
      tags: _parseStringList(attrMap['tags']),
    );
  }

  @override
  List<CustomAttribute> toCustomAttributes(FashionAttributes model) {
    final attributes = <CustomAttribute>[];

    _addAttributeIfNotNull(attributes, 'color', model.color);
    _addAttributeIfNotNull(attributes, 'size', model.size);
    _addAttributeIfNotNull(attributes, 'material', model.material);
    _addAttributeIfNotNull(attributes, 'brand', model.brand);
    _addAttributeIfNotNull(attributes, 'season', model.season);
    _addAttributeIfNotNull(
        attributes, 'available_sizes', _encodeStringList(model.availableSizes));
    _addAttributeIfNotNull(attributes, 'discount', model.discount?.toString());
    _addAttributeIfNotNull(
        attributes, 'care_instructions', model.careInstructions);
    _addAttributeIfNotNull(
        attributes, 'fabric_composition', model.fabricComposition);
    _addAttributeIfNotNull(
        attributes, 'country_of_origin', model.countryOfOrigin);
    _addAttributeIfNotNull(attributes, 'gender', model.gender);
    _addAttributeIfNotNull(attributes, 'age_group', model.ageGroup);
    _addAttributeIfNotNull(attributes, 'pattern', model.pattern);
    _addAttributeIfNotNull(attributes, 'fit', model.fit);
    _addAttributeIfNotNull(attributes, 'neckline', model.neckline);
    _addAttributeIfNotNull(attributes, 'sleeve_length', model.sleeveLength);
    _addAttributeIfNotNull(attributes, 'occasion', model.occasion);
    _addAttributeIfNotNull(
        attributes, 'is_eco_friendly', model.isEcoFriendly?.toString());
    _addAttributeIfNotNull(
        attributes, 'is_handmade', model.isHandmade?.toString());
    _addAttributeIfNotNull(
        attributes, 'is_limited_edition', model.isLimitedEdition?.toString());
    _addAttributeIfNotNull(attributes, 'weight', model.weight?.toString());
    _addAttributeIfNotNull(
        attributes, 'measurements', _encodeMeasurements(model.measurements));
    _addAttributeIfNotNull(
        attributes, 'colors', _encodeStringList(model.colors));
    _addAttributeIfNotNull(attributes, 'designer', model.designer);
    _addAttributeIfNotNull(attributes, 'collection', model.collection);
    _addAttributeIfNotNull(
        attributes, 'year_released', model.yearReleased?.toString());
    _addAttributeIfNotNull(
        attributes, 'original_price', model.originalPrice?.toString());
    _addAttributeIfNotNull(attributes, 'sustainability', model.sustainability);
    _addAttributeIfNotNull(
        attributes, 'size_chart', _encodeJsonMap(model.sizeChart));
    _addAttributeIfNotNull(attributes, 'tags', _encodeStringList(model.tags));

    return attributes;
  }

  @override
  ValidationResult validate(FashionAttributes model) {
    final errors = <String>[];
    final warnings = <String>[];

    // Validate discount
    if (model.discount != null) {
      if (model.discount! < 0 || model.discount! > 100) {
        errors.add('Discount must be between 0 and 100 percent');
      }
    }

    // Validate gender
    if (model.gender != null) {
      final validGenders = ['men', 'women', 'unisex', 'kids'];
      if (!validGenders.contains(model.gender!.toLowerCase())) {
        errors.add('Gender must be one of: ${validGenders.join(', ')}');
      }
    }

    // Validate age group
    if (model.ageGroup != null) {
      final validAgeGroups = ['adult', 'teen', 'kids', 'baby'];
      if (!validAgeGroups.contains(model.ageGroup!.toLowerCase())) {
        errors.add('Age group must be one of: ${validAgeGroups.join(', ')}');
      }
    }

    // Validate fit
    if (model.fit != null) {
      final validFits = ['slim', 'regular', 'loose', 'oversized'];
      if (!validFits.contains(model.fit!.toLowerCase())) {
        warnings.add(
            'Unusual fit type: ${model.fit}. Common fits are: ${validFits.join(', ')}');
      }
    }

    // Validate year
    if (model.yearReleased != null) {
      final currentYear = DateTime.now().year;
      if (model.yearReleased! < 1900 || model.yearReleased! > currentYear + 1) {
        errors.add('Year released must be between 1900 and ${currentYear + 1}');
      }
    }

    // Validate weight
    if (model.weight != null && model.weight! < 0) {
      errors.add('Weight cannot be negative');
    }

    // Validate original price
    if (model.originalPrice != null && model.originalPrice! < 0) {
      errors.add('Original price cannot be negative');
    }

    // Check for logical consistency
    if (model.discount != null &&
        model.discount! > 0 &&
        model.originalPrice == null) {
      warnings.add('Discount specified but no original price provided');
    }

    // Validate size consistency
    if (model.size != null && model.availableSizes != null) {
      if (!model.availableSizes!.contains(model.size)) {
        warnings.add('Current size is not in available sizes list');
      }
    }

    // Validate color consistency
    if (model.color != null && model.colors != null) {
      if (!model.colors!
          .any((c) => c.toLowerCase() == model.color!.toLowerCase())) {
        warnings.add('Current color is not in available colors list');
      }
    }

    return ValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }

  @override
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code) {
    final attr = attributes.firstWhere(
      (attr) => attr.attributeCode == code,
      orElse: () => const CustomAttribute(attributeCode: '', value: ''),
    );

    if (attr.value.isEmpty) return null;

    try {
      if (U == String) return attr.value as U?;
      if (U == int) return int.parse(attr.value) as U?;
      if (U == double) return double.parse(attr.value) as U?;
      if (U == bool) return (attr.value.toLowerCase() == 'true') as U?;
    } catch (e) {
      // Return null if parsing fails
    }

    return null;
  }

  @override
  Map<String, dynamic> buildSearchFilters(FashionAttributes model) {
    final filters = <String, dynamic>{};

    if (model.color != null) {
      filters['color'] = model.color;
    }
    if (model.size != null) {
      filters['size'] = model.size;
    }
    if (model.brand != null) {
      filters['brand'] = {'like': '%${model.brand}%'};
    }
    if (model.material != null) {
      filters['material'] = model.material;
    }
    if (model.gender != null) {
      filters['gender'] = model.gender;
    }
    if (model.season != null) {
      filters['season'] = {'like': '%${model.season}%'};
    }
    if (model.occasion != null) {
      filters['occasion'] = model.occasion;
    }
    if (model.isEcoFriendly == true) {
      filters['is_eco_friendly'] = 'true';
    }
    if (model.discount != null && model.discount! > 0) {
      filters['discount'] = {'gt': '0'};
    }
    if (model.designer != null) {
      filters['designer'] = {'like': '%${model.designer}%'};
    }
    if (model.collection != null) {
      filters['collection'] = model.collection;
    }

    return filters;
  }

  @override
  Map<String, dynamic> getAttributeMetadata(String attributeCode) {
    final metadata = <String, dynamic>{
      'type': 'string',
      'required': false,
      'searchable': true,
    };

    switch (attributeCode) {
      case 'color':
        metadata.addAll({
          'type': 'color',
          'description': 'Primary color of the item',
          'searchable': true,
          'filterable': true,
        });
        break;
      case 'size':
        metadata.addAll({
          'type': 'enum',
          'options': [
            'XS',
            'S',
            'M',
            'L',
            'XL',
            'XXL',
            '28',
            '30',
            '32',
            '34',
            '36',
            '38',
            '40'
          ],
          'description': 'Size of the clothing item',
        });
        break;
      case 'gender':
        metadata.addAll({
          'type': 'enum',
          'options': ['men', 'women', 'unisex', 'kids'],
          'description': 'Target gender for the item',
        });
        break;
      case 'age_group':
        metadata.addAll({
          'type': 'enum',
          'options': ['adult', 'teen', 'kids', 'baby'],
          'description': 'Target age group',
        });
        break;
      case 'fit':
        metadata.addAll({
          'type': 'enum',
          'options': ['slim', 'regular', 'loose', 'oversized'],
          'description': 'How the item fits',
        });
        break;
      case 'occasion':
        metadata.addAll({
          'type': 'enum',
          'options': ['casual', 'formal', 'sport', 'party', 'business'],
          'description': 'Suitable occasion for wearing',
        });
        break;
      case 'discount':
        metadata.addAll({
          'type': 'number',
          'min': 0,
          'max': 100,
          'description': 'Discount percentage',
        });
        break;
      case 'weight':
        metadata.addAll({
          'type': 'number',
          'min': 0,
          'unit': 'grams',
          'description': 'Weight of the item',
        });
        break;
      case 'is_eco_friendly':
      case 'is_handmade':
      case 'is_limited_edition':
        metadata.addAll({
          'type': 'boolean',
          'description': 'Boolean flag for special properties',
        });
        break;
    }

    return metadata;
  }

  @override
  dynamic transformAttributeValue(String attributeCode, String rawValue) {
    switch (attributeCode) {
      case 'discount':
      case 'weight':
      case 'original_price':
        return double.tryParse(rawValue);
      case 'year_released':
        return int.tryParse(rawValue);
      case 'is_eco_friendly':
      case 'is_handmade':
      case 'is_limited_edition':
        return _parseBool(rawValue);
      case 'available_sizes':
      case 'colors':
      case 'tags':
        return _parseStringList(rawValue);
      case 'measurements':
        return _parseMeasurements(rawValue);
      case 'size_chart':
        return _parseJsonMap(rawValue);
      default:
        return rawValue;
    }
  }

  @override
  bool isRequired(String attributeCode) {
    // In fashion, typically only basic attributes are required
    return ['color', 'size', 'material'].contains(attributeCode);
  }

  @override
  dynamic getDefaultValue(String attributeCode) {
    switch (attributeCode) {
      case 'gender':
        return 'unisex';
      case 'age_group':
        return 'adult';
      case 'fit':
        return 'regular';
      case 'discount':
        return 0.0;
      case 'is_eco_friendly':
      case 'is_handmade':
      case 'is_limited_edition':
        return false;
      default:
        return null;
    }
  }

  // Helper methods
  void _addAttributeIfNotNull(
      List<CustomAttribute> attributes, String code, String? value) {
    if (value != null && value.isNotEmpty) {
      attributes.add(CustomAttribute(attributeCode: code, value: value));
    }
  }

  bool? _parseBool(String? value) {
    if (value == null || value.isEmpty) return null;
    return value.toLowerCase() == 'true' || value == '1';
  }

  List<String>? _parseStringList(String? value) {
    if (value == null || value.isEmpty) return null;
    return value
        .split(',')
        .map((item) => item.trim())
        .where((item) => item.isNotEmpty)
        .toList();
  }

  String? _encodeStringList(List<String>? list) {
    if (list == null || list.isEmpty) return null;
    return list.join(',');
  }

  Map<String, String>? _parseMeasurements(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final Map<String, dynamic> decoded = json.decode(value);
      return decoded.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      return null;
    }
  }

  String? _encodeMeasurements(Map<String, String>? measurements) {
    if (measurements == null || measurements.isEmpty) return null;
    try {
      return json.encode(measurements);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? _parseJsonMap(String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      return json.decode(value) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  String? _encodeJsonMap(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) return null;
    try {
      return json.encode(map);
    } catch (e) {
      return null;
    }
  }
}
