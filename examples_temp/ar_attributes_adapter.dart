import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/product_models.dart';
import '../adapters/custom_attributes_adapter.dart';
import '../adapters/validation_result.dart';

part 'ar_attributes_adapter.freezed.dart';
part 'ar_attributes_adapter.g.dart';

/// AR/3D attributes model for Samskara-like applications
@freezed
class ARAttributes with _$ARAttributes {
  const factory ARAttributes({
    String? modelPath,
    String? soundPath,
    String? arReferenceImage,
    double? arWidth,
    double? arHeight,
    String? artistName,
    String? artistBio,
    String? artistWebsite,
    int? viewCount,
    int? interactionCount,
    double? averageRating,
    int? ratingCount,
    String? orientation, // 'portrait' | 'landscape'
    double? modelScale,
    double? offset,
    Map<String, double>? extend,
    List<String>? tags,
    String? category,
    String? difficulty, // 'beginner' | 'intermediate' | 'advanced'
    int? downloadCount,
    String? license,
    DateTime? lastUpdated,
    Map<String, dynamic>? metadata,
  }) = _ARAttributes;

  factory ARAttributes.fromJson(Map<String, dynamic> json) =>
      _$ARAttributesFromJson(json);

  const ARAttributes._();

  /// Check if this is a valid AR model
  bool get isValidARModel =>
      modelPath != null &&
      modelPath!.isNotEmpty &&
      (modelPath!.endsWith('.glb') || modelPath!.endsWith('.gltf'));

  /// Check if has audio component
  bool get hasAudio => soundPath != null && soundPath!.isNotEmpty;

  /// Check if has AR tracking image
  bool get hasARTracking =>
      arReferenceImage != null &&
      arReferenceImage!.isNotEmpty &&
      arWidth != null &&
      arHeight != null;

  /// Get popularity score based on views and interactions
  double get popularityScore {
    final views = viewCount ?? 0;
    final interactions = interactionCount ?? 0;
    final rating = averageRating ?? 0.0;

    return (views * 0.3) + (interactions * 0.5) + (rating * 20);
  }

  /// Check if this is a premium/featured content
  bool get isPremium =>
      license != null &&
      (license!.toLowerCase().contains('premium') ||
          license!.toLowerCase().contains('pro'));

  /// Get display orientation
  String get displayOrientation => orientation ?? 'landscape';

  /// Get safe model scale
  double get safeModelScale => modelScale ?? 1.0;

  /// Get safe offset
  double get safeOffset => offset ?? 0.0;

  /// Get extend dimensions with defaults
  Map<String, double> get safeExtend =>
      extend ?? {'x': 1.0, 'y': 1.0, 'z': 1.0};
}

/// Custom attributes adapter for AR/3D applications like Samskara
class SamskaraARAdapter extends CustomAttributesAdapter<ARAttributes> {
  @override
  String get adapterId => 'samskara_ar';

  @override
  String get version => '1.0.0';

  @override
  List<String> get supportedAttributeCodes => [
        'model_path',
        'sound_path',
        'ar_reference_image',
        'ar_width',
        'ar_height',
        'artist_name',
        'artist_bio',
        'artist_website',
        'view_count',
        'interaction_count',
        'average_rating',
        'rating_count',
        'orientation',
        'model_scale',
        'offset',
        'extend',
        'tags',
        'category',
        'difficulty',
        'download_count',
        'license',
        'last_updated',
        'metadata',
      ];

  @override
  ARAttributes fromCustomAttributes(List<CustomAttribute> attributes) {
    final attrMap = {
      for (var attr in attributes) attr.attributeCode: attr.value
    };

    return ARAttributes(
      modelPath: attrMap['model_path'],
      soundPath: attrMap['sound_path'],
      arReferenceImage: attrMap['ar_reference_image'],
      arWidth: double.tryParse(attrMap['ar_width']?.toString() ?? ''),
      arHeight: double.tryParse(attrMap['ar_height']?.toString() ?? ''),
      artistName: attrMap['artist_name'],
      artistBio: attrMap['artist_bio'],
      artistWebsite: attrMap['artist_website'],
      viewCount: int.tryParse(attrMap['view_count']?.toString() ?? '0'),
      interactionCount:
          int.tryParse(attrMap['interaction_count']?.toString() ?? '0'),
      averageRating:
          double.tryParse(attrMap['average_rating']?.toString() ?? '0'),
      ratingCount: int.tryParse(attrMap['rating_count']?.toString() ?? '0'),
      orientation: attrMap['orientation'],
      modelScale: double.tryParse(attrMap['model_scale']?.toString() ?? '1.0'),
      offset: double.tryParse(attrMap['offset']?.toString() ?? '0.0'),
      extend: _parseExtendMap(attrMap['extend']),
      tags: _parseTagsList(attrMap['tags']),
      category: attrMap['category'],
      difficulty: attrMap['difficulty'],
      downloadCount: int.tryParse(attrMap['download_count']?.toString() ?? '0'),
      license: attrMap['license'],
      lastUpdated: _parseDateTime(attrMap['last_updated']),
      metadata: _parseMetadata(attrMap['metadata']),
    );
  }

  @override
  List<CustomAttribute> toCustomAttributes(ARAttributes model) {
    final attributes = <CustomAttribute>[];

    _addAttributeIfNotNull(attributes, 'model_path', model.modelPath);
    _addAttributeIfNotNull(attributes, 'sound_path', model.soundPath);
    _addAttributeIfNotNull(
        attributes, 'ar_reference_image', model.arReferenceImage);
    _addAttributeIfNotNull(attributes, 'ar_width', model.arWidth?.toString());
    _addAttributeIfNotNull(attributes, 'ar_height', model.arHeight?.toString());
    _addAttributeIfNotNull(attributes, 'artist_name', model.artistName);
    _addAttributeIfNotNull(attributes, 'artist_bio', model.artistBio);
    _addAttributeIfNotNull(attributes, 'artist_website', model.artistWebsite);
    _addAttributeIfNotNull(
        attributes, 'view_count', model.viewCount?.toString());
    _addAttributeIfNotNull(
        attributes, 'interaction_count', model.interactionCount?.toString());
    _addAttributeIfNotNull(
        attributes, 'average_rating', model.averageRating?.toString());
    _addAttributeIfNotNull(
        attributes, 'rating_count', model.ratingCount?.toString());
    _addAttributeIfNotNull(attributes, 'orientation', model.orientation);
    _addAttributeIfNotNull(
        attributes, 'model_scale', model.modelScale?.toString());
    _addAttributeIfNotNull(attributes, 'offset', model.offset?.toString());
    _addAttributeIfNotNull(
        attributes, 'extend', _encodeExtendMap(model.extend));
    _addAttributeIfNotNull(attributes, 'tags', _encodeTagsList(model.tags));
    _addAttributeIfNotNull(attributes, 'category', model.category);
    _addAttributeIfNotNull(attributes, 'difficulty', model.difficulty);
    _addAttributeIfNotNull(
        attributes, 'download_count', model.downloadCount?.toString());
    _addAttributeIfNotNull(attributes, 'license', model.license);
    _addAttributeIfNotNull(
        attributes, 'last_updated', model.lastUpdated?.toIso8601String());
    _addAttributeIfNotNull(
        attributes, 'metadata', _encodeMetadata(model.metadata));

    return attributes;
  }

  @override
  ValidationResult validate(ARAttributes model) {
    final errors = <String>[];
    final warnings = <String>[];

    // Validate model path
    if (model.modelPath != null) {
      if (!model.modelPath!.endsWith('.glb') &&
          !model.modelPath!.endsWith('.gltf')) {
        errors.add('Model path must be a .glb or .gltf file');
      }
      if (!Uri.tryParse(model.modelPath!)?.isAbsolute == true) {
        warnings.add('Model path should be an absolute URL');
      }
    }

    // Validate AR dimensions
    if (model.arWidth != null && model.arWidth! <= 0) {
      errors.add('AR width must be positive');
    }
    if (model.arHeight != null && model.arHeight! <= 0) {
      errors.add('AR height must be positive');
    }

    // Validate ratings
    if (model.averageRating != null) {
      if (model.averageRating! < 0 || model.averageRating! > 5) {
        errors.add('Average rating must be between 0 and 5');
      }
    }

    // Validate counts
    if (model.viewCount != null && model.viewCount! < 0) {
      errors.add('View count cannot be negative');
    }
    if (model.interactionCount != null && model.interactionCount! < 0) {
      errors.add('Interaction count cannot be negative');
    }

    // Validate orientation
    if (model.orientation != null &&
        !['portrait', 'landscape'].contains(model.orientation!.toLowerCase())) {
      errors.add('Orientation must be "portrait" or "landscape"');
    }

    // Validate difficulty
    if (model.difficulty != null &&
        !['beginner', 'intermediate', 'advanced']
            .contains(model.difficulty!.toLowerCase())) {
      errors
          .add('Difficulty must be "beginner", "intermediate", or "advanced"');
    }

    // Validate model scale
    if (model.modelScale != null && model.modelScale! <= 0) {
      errors.add('Model scale must be positive');
    }

    // Check for missing required fields for AR functionality
    if (model.modelPath == null || model.modelPath!.isEmpty) {
      warnings.add('Model path is recommended for AR functionality');
    }
    if (model.arReferenceImage != null &&
        (model.arWidth == null || model.arHeight == null)) {
      warnings.add(
          'AR width and height are required when reference image is provided');
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
      if (U == DateTime) return DateTime.parse(attr.value) as U?;
    } catch (e) {
      // Return null if parsing fails
    }

    return null;
  }

  @override
  Map<String, dynamic> buildSearchFilters(ARAttributes model) {
    final filters = <String, dynamic>{};

    if (model.orientation != null) {
      filters['orientation'] = model.orientation;
    }
    if (model.artistName != null) {
      filters['artist_name'] = {'like': '%${model.artistName}%'};
    }
    if (model.category != null) {
      filters['category'] = model.category;
    }
    if (model.difficulty != null) {
      filters['difficulty'] = model.difficulty;
    }
    if (model.averageRating != null && model.averageRating! > 0) {
      filters['average_rating'] = {'gteq': model.averageRating.toString()};
    }
    if (model.tags != null && model.tags!.isNotEmpty) {
      filters['tags'] = {'in': model.tags};
    }
    if (model.isPremium) {
      filters['license'] = {'like': '%premium%'};
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
      case 'model_path':
        metadata.addAll({
          'type': 'url',
          'required': true,
          'description': 'Path to 3D model file (.glb or .gltf)',
          'validation': r'.*\.(glb|gltf)$',
        });
        break;
      case 'ar_width':
      case 'ar_height':
        metadata.addAll({
          'type': 'number',
          'min': 0.01,
          'description': 'AR tracking image dimensions in meters',
        });
        break;
      case 'average_rating':
        metadata.addAll({
          'type': 'number',
          'min': 0,
          'max': 5,
          'description': 'Average user rating (0-5 stars)',
        });
        break;
      case 'orientation':
        metadata.addAll({
          'type': 'enum',
          'options': ['portrait', 'landscape'],
          'description': 'Display orientation of the model',
        });
        break;
      case 'difficulty':
        metadata.addAll({
          'type': 'enum',
          'options': ['beginner', 'intermediate', 'advanced'],
          'description': 'Complexity level of the AR experience',
        });
        break;
      case 'tags':
        metadata.addAll({
          'type': 'array',
          'description': 'Comma-separated list of tags',
        });
        break;
    }

    return metadata;
  }

  @override
  dynamic transformAttributeValue(String attributeCode, String rawValue) {
    switch (attributeCode) {
      case 'ar_width':
      case 'ar_height':
      case 'average_rating':
      case 'model_scale':
      case 'offset':
        return double.tryParse(rawValue);
      case 'view_count':
      case 'interaction_count':
      case 'rating_count':
      case 'download_count':
        return int.tryParse(rawValue);
      case 'tags':
        return rawValue
            .split(',')
            .map((tag) => tag.trim())
            .where((tag) => tag.isNotEmpty)
            .toList();
      case 'extend':
        return _parseExtendMap(rawValue);
      case 'metadata':
        return _parseMetadata(rawValue);
      case 'last_updated':
        return _parseDateTime(rawValue);
      default:
        return rawValue;
    }
  }

  @override
  bool isRequired(String attributeCode) {
    return attributeCode == 'model_path';
  }

  @override
  dynamic getDefaultValue(String attributeCode) {
    switch (attributeCode) {
      case 'orientation':
        return 'landscape';
      case 'model_scale':
        return 1.0;
      case 'offset':
        return 0.0;
      case 'average_rating':
        return 0.0;
      case 'view_count':
      case 'interaction_count':
      case 'rating_count':
      case 'download_count':
        return 0;
      case 'difficulty':
        return 'beginner';
      case 'extend':
        return {'x': 1.0, 'y': 1.0, 'z': 1.0};
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

  Map<String, double>? _parseExtendMap(String? extendString) {
    if (extendString == null || extendString.isEmpty) return null;

    try {
      final Map<String, dynamic> decoded = json.decode(extendString);
      return decoded.map((key, value) =>
          MapEntry(key, double.tryParse(value.toString()) ?? 1.0));
    } catch (e) {
      // Try parsing as comma-separated values (x,y,z)
      final parts = extendString.split(',');
      if (parts.length >= 3) {
        return {
          'x': double.tryParse(parts[0].trim()) ?? 1.0,
          'y': double.tryParse(parts[1].trim()) ?? 1.0,
          'z': double.tryParse(parts[2].trim()) ?? 1.0,
        };
      }
    }

    return null;
  }

  String? _encodeExtendMap(Map<String, double>? extend) {
    if (extend == null || extend.isEmpty) return null;
    return json.encode(extend);
  }

  List<String>? _parseTagsList(String? tagsString) {
    if (tagsString == null || tagsString.isEmpty) return null;
    return tagsString
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toList();
  }

  String? _encodeTagsList(List<String>? tags) {
    if (tags == null || tags.isEmpty) return null;
    return tags.join(',');
  }

  DateTime? _parseDateTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? _parseMetadata(String? metadataString) {
    if (metadataString == null || metadataString.isEmpty) return null;
    try {
      return json.decode(metadataString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  String? _encodeMetadata(Map<String, dynamic>? metadata) {
    if (metadata == null || metadata.isEmpty) return null;
    try {
      return json.encode(metadata);
    } catch (e) {
      return null;
    }
  }
}
