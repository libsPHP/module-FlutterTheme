import 'package:json_annotation/json_annotation.dart';

part 'device_info_model.g.dart';

/// Модель для хранения информации об устройстве
///
/// Унифицированная модель для всех платформ, содержащая:
/// - Базовую информацию об устройстве
/// - Системную информацию
/// - Характеристики производительности
/// - Дополнительные данные для аналитики
@JsonSerializable()
class DeviceInfoModel {
  /// Платформа (Android, iOS, Web, Windows, macOS, Linux)
  final String platform;

  /// Уникальный идентификатор устройства
  final String deviceId;

  /// Модель устройства
  final String model;

  /// Бренд/производитель устройства
  final String brand;

  /// Название операционной системы
  final String systemName;

  /// Версия операционной системы
  final String systemVersion;

  /// Разрешение экрана в формате "ширина x высота"
  final String screenResolution;

  /// Является ли устройство физическим (не эмулятором)
  final bool isPhysicalDevice;

  /// Объем оперативной памяти в МБ (если доступно)
  final int? ramMb;

  /// Объем хранилища в ГБ (если доступно)
  final int? storageGb;

  /// Дополнительная информация, специфичная для платформы
  final Map<String, dynamic> additionalInfo;

  const DeviceInfoModel({
    required this.platform,
    required this.deviceId,
    required this.model,
    required this.brand,
    required this.systemName,
    required this.systemVersion,
    required this.screenResolution,
    required this.isPhysicalDevice,
    this.ramMb,
    this.storageGb,
    required this.additionalInfo,
  });

  /// Создание экземпляра из JSON
  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoModelFromJson(json);

  /// Преобразование в JSON
  Map<String, dynamic> toJson() => _$DeviceInfoModelToJson(this);

  /// Получение краткого описания устройства
  String get shortDescription => '$brand $model ($systemName $systemVersion)';

  /// Получение полного описания устройства
  String get fullDescription =>
      '$brand $model running $systemName $systemVersion on $platform';

  /// Проверка, является ли устройство мобильным
  bool get isMobile => platform == 'Android' || platform == 'iOS';

  /// Проверка, является ли устройство планшетом
  bool get isTablet {
    if (platform == 'Android') {
      // Для Android проверяем размер экрана или модель
      final screenRes = screenResolution.split('x');
      if (screenRes.length == 2) {
        final width = int.tryParse(screenRes[0]) ?? 0;
        final height = int.tryParse(screenRes[1]) ?? 0;
        final minDimension = width < height ? width : height;
        final maxDimension = width > height ? width : height;

        // Приблизительная логика определения планшета по разрешению
        return minDimension > 800 && maxDimension > 1200;
      }
      return model.toLowerCase().contains('tablet');
    } else if (platform == 'iOS') {
      return model.toLowerCase().contains('ipad');
    }
    return false;
  }

  /// Проверка, является ли устройство настольным
  bool get isDesktop =>
      platform == 'Windows' || platform == 'macOS' || platform == 'Linux';

  /// Проверка, является ли устройство веб-браузером
  bool get isWeb => platform == 'Web';

  /// Получение основной версии системы
  String get majorSystemVersion {
    final parts = systemVersion.split('.');
    return parts.isNotEmpty ? parts[0] : systemVersion;
  }

  /// Получение информации о производительности на основе характеристик
  DevicePerformanceInfo get performanceInfo {
    int score = 50; // Базовый балл

    // Анализ по платформе
    if (platform == 'iOS') {
      score += 20; // iOS обычно более оптимизирована
      if (model.contains('Pro')) score += 15;
      if (model.contains('15') || model.contains('14')) score += 10;
    } else if (platform == 'Android') {
      final sdkInt = additionalInfo['version.sdkInt'] as int? ?? 0;
      if (sdkInt >= 31) {
        score += 15;
      } else if (sdkInt >= 28) {
        score += 10;
      } else if (sdkInt >= 24) {
        score += 5;
      }

      if (brand.toLowerCase() == 'samsung' && model.contains('Galaxy S')) {
        score += 10;
      }
    } else if (isDesktop) {
      score += 25; // Настольные системы обычно мощнее
    } else if (isWeb) {
      score -= 10; // Веб может быть медленнее из-за браузера
    }

    // Анализ RAM
    if (ramMb != null) {
      if (ramMb! >= 8000) {
        score += 15;
      } else if (ramMb! >= 6000) {
        score += 10;
      } else if (ramMb! >= 4000) {
        score += 5;
      } else if (ramMb! < 2000) {
        score -= 10;
      }
    }

    // Проверка на эмулятор
    if (!isPhysicalDevice) {
      score -= 15;
    }

    return DevicePerformanceInfo(
      score: score.clamp(0, 100),
      category: _getPerformanceCategoryFromScore(score),
      recommendations: _getPerformanceRecommendations(score),
    );
  }

  DevicePerformanceCategory _getPerformanceCategoryFromScore(int score) {
    if (score >= 75) return DevicePerformanceCategory.high;
    if (score >= 50) return DevicePerformanceCategory.medium;
    return DevicePerformanceCategory.low;
  }

  List<String> _getPerformanceRecommendations(int score) {
    final recommendations = <String>[];

    if (score < 40) {
      recommendations.addAll([
        'Reduce animation complexity',
        'Limit concurrent network requests',
        'Use image compression',
        'Implement lazy loading',
      ]);
    } else if (score < 65) {
      recommendations.addAll([
        'Optimize image loading',
        'Use efficient list rendering',
        'Implement caching strategies',
      ]);
    } else {
      recommendations.addAll([
        'Can use advanced animations',
        'Support high-quality images',
        'Enable all features',
      ]);
    }

    return recommendations;
  }

  @override
  String toString() => shortDescription;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceInfoModel &&
          runtimeType == other.runtimeType &&
          platform == other.platform &&
          deviceId == other.deviceId &&
          model == other.model &&
          brand == other.brand &&
          systemName == other.systemName &&
          systemVersion == other.systemVersion;

  @override
  int get hashCode =>
      platform.hashCode ^
      deviceId.hashCode ^
      model.hashCode ^
      brand.hashCode ^
      systemName.hashCode ^
      systemVersion.hashCode;

  /// Создание копии с изменениями
  DeviceInfoModel copyWith({
    String? platform,
    String? deviceId,
    String? model,
    String? brand,
    String? systemName,
    String? systemVersion,
    String? screenResolution,
    bool? isPhysicalDevice,
    int? ramMb,
    int? storageGb,
    Map<String, dynamic>? additionalInfo,
  }) {
    return DeviceInfoModel(
      platform: platform ?? this.platform,
      deviceId: deviceId ?? this.deviceId,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      systemName: systemName ?? this.systemName,
      systemVersion: systemVersion ?? this.systemVersion,
      screenResolution: screenResolution ?? this.screenResolution,
      isPhysicalDevice: isPhysicalDevice ?? this.isPhysicalDevice,
      ramMb: ramMb ?? this.ramMb,
      storageGb: storageGb ?? this.storageGb,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }
}

/// Информация о производительности устройства
class DevicePerformanceInfo {
  /// Общий балл производительности (0-100)
  final int score;

  /// Категория производительности
  final DevicePerformanceCategory category;

  /// Рекомендации по оптимизации
  final List<String> recommendations;

  const DevicePerformanceInfo({
    required this.score,
    required this.category,
    required this.recommendations,
  });

  @override
  String toString() => 'Performance: $score/100 ($category)';
}

/// Категории производительности устройства
enum DevicePerformanceCategory {
  low('Low'),
  medium('Medium'),
  high('High');

  const DevicePerformanceCategory(this.displayName);
  final String displayName;

  @override
  String toString() => displayName;
}
