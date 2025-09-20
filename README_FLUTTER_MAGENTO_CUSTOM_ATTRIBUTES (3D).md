# Flutter Magento Custom Attributes Implementation Guide

## Обзор

Данный документ описывает возможную реализацию работы с кастомными атрибутами продуктов в библиотеке `flutter_magento` для поддержки AR-специфичных полей и расширенной функциональности.

## Проблематика

Стандартная библиотека `flutter_magento` не поддерживает специфичные для AR-приложений атрибуты продуктов, такие как:

- `model_path` - путь к 3D модели
- `sound_path` - путь к аудио файлу
- `ar_reference_image` - URL референсного изображения для AR
- `ar_width`, `ar_height` - размеры AR объекта
- `artist_name`, `artist_bio` - информация об авторе
- `view_count`, `interaction_count` - аналитические данные
- `orientation` - ориентация модели (portrait/landscape)
- `model_scale`, `offset`, `extend` - параметры масштабирования

## Предлагаемая архитектура

### 1. Расширение модели Product

```dart
// lib/src/models/product_models_extended.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_models.dart';

part 'product_models_extended.freezed.dart';
part 'product_models_extended.g.dart';

@freezed
class ExtendedProduct with _$ExtendedProduct {
  const factory ExtendedProduct({
    // Стандартные поля Product
    required int id,
    required String sku,
    required String name,
    String? description,
    String? shortDescription,
    double? price,
    String? image,
    List<MediaGalleryEntry>? mediaGallery,
    List<CustomAttribute>? customAttributes,
    
    // AR-специфичные поля
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
  }) = _ExtendedProduct;

  factory ExtendedProduct.fromJson(Map<String, dynamic> json) =>
      _$ExtendedProductFromJson(json);
      
  // Конвертация из стандартного Product
  factory ExtendedProduct.fromProduct(Product product) {
    final customAttrs = <String, dynamic>{};
    
    if (product.customAttributes != null) {
      for (final attr in product.customAttributes!) {
        customAttrs[attr.attributeCode] = attr.value;
      }
    }
    
    return ExtendedProduct(
      id: product.id,
      sku: product.sku,
      name: product.name,
      description: product.description,
      shortDescription: product.shortDescription,
      price: product.price,
      image: product.image,
      mediaGallery: product.mediaGallery,
      customAttributes: product.customAttributes,
      // Маппинг кастомных атрибутов
      modelPath: customAttrs['model_path'],
      soundPath: customAttrs['sound_path'],
      arReferenceImage: customAttrs['ar_reference_image'],
      arWidth: double.tryParse(customAttrs['ar_width']?.toString() ?? ''),
      arHeight: double.tryParse(customAttrs['ar_height']?.toString() ?? ''),
      artistName: customAttrs['artist_name'],
      artistBio: customAttrs['artist_bio'],
      artistWebsite: customAttrs['artist_website'],
      viewCount: int.tryParse(customAttrs['view_count']?.toString() ?? '0'),
      interactionCount: int.tryParse(customAttrs['interaction_count']?.toString() ?? '0'),
      averageRating: double.tryParse(customAttrs['average_rating']?.toString() ?? '0'),
      ratingCount: int.tryParse(customAttrs['rating_count']?.toString() ?? '0'),
      orientation: customAttrs['orientation'],
      modelScale: double.tryParse(customAttrs['model_scale']?.toString() ?? '1.0'),
      offset: double.tryParse(customAttrs['offset']?.toString() ?? '0.0'),
      extend: _parseExtendMap(customAttrs['extend']),
      tags: customAttrs['tags']?.toString().split(','),
    );
  }
  
  static Map<String, double>? _parseExtendMap(dynamic extend) {
    if (extend == null) return null;
    if (extend is Map) {
      return extend.map((key, value) => 
        MapEntry(key.toString(), double.tryParse(value.toString()) ?? 1.0));
    }
    return null;
  }
}
```

### 2. Расширенный Catalog Service

```dart
// lib/src/services/extended_catalog_service.dart

class ExtendedCatalogService extends CatalogService {
  
  /// Получить продукты с расширенными атрибутами
  Future<List<ExtendedProduct>> getExtendedProducts({
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    List<String>? categoryIds,
    Map<String, dynamic>? customFilters,
  }) async {
    // Сначала получаем стандартные продукты
    final products = await getProducts(
      page: page,
      pageSize: pageSize,
      searchQuery: searchQuery,
      categoryIds: categoryIds,
    );
    
    // Конвертируем в расширенные продукты
    return products.map((product) => ExtendedProduct.fromProduct(product)).toList();
  }
  
  /// Получить продукт с расширенными атрибутами по ID
  Future<ExtendedProduct?> getExtendedProduct(String productId) async {
    final product = await getProduct(productId);
    if (product == null) return null;
    
    return ExtendedProduct.fromProduct(product);
  }
  
  /// Фильтрация по AR-специфичным атрибутам
  Future<List<ExtendedProduct>> getARProducts({
    String? orientation,
    String? artistName,
    double? minRating,
    List<String>? tags,
  }) async {
    final filters = <String, dynamic>{};
    
    if (orientation != null) {
      filters['orientation'] = {'eq': orientation};
    }
    
    if (artistName != null) {
      filters['artist_name'] = {'like': '%$artistName%'};
    }
    
    if (minRating != null) {
      filters['average_rating'] = {'gteq': minRating.toString()};
    }
    
    if (tags != null && tags.isNotEmpty) {
      filters['tags'] = {'in': tags};
    }
    
    return getExtendedProducts(customFilters: filters);
  }
}
```

### 3. GraphQL запросы для кастомных атрибутов

```dart
// lib/src/graphql/extended_product_queries.dart

class ExtendedProductQueries {
  static const String getProductsWithCustomAttributes = '''
    query GetProductsWithCustomAttributes(
      \$pageSize: Int!,
      \$currentPage: Int!,
      \$filter: ProductAttributeFilterInput
    ) {
      products(pageSize: \$pageSize, currentPage: \$currentPage, filter: \$filter) {
        items {
          id
          name
          sku
          description {
            html
          }
          short_description {
            html
          }
          price_range {
            minimum_price {
              regular_price {
                value
                currency
              }
            }
          }
          image {
            url
            label
          }
          media_gallery {
            url
            label
          }
          categories {
            id
            name
          }
          # Кастомные атрибуты
          model_path
          sound_path
          ar_reference_image
          ar_width
          ar_height
          artist_name
          artist_bio
          artist_website
          view_count
          interaction_count
          average_rating
          rating_count
          orientation
          model_scale
          offset
          extend
          tags
        }
        page_info {
          current_page
          page_size
          total_pages
        }
        total_count
      }
    }
  ''';
  
  static const String updateProductCustomAttributes = '''
    mutation UpdateProductCustomAttributes(
      \$sku: String!,
      \$customAttributes: [ProductCustomAttributeInput!]!
    ) {
      updateProduct(
        input: {
          sku: \$sku,
          custom_attributes: \$customAttributes
        }
      ) {
        product {
          id
          sku
          name
        }
      }
    }
  ''';
}
```

### 4. Аналитический сервис

```dart
// lib/src/services/analytics_service.dart

class ProductAnalyticsService {
  final GraphQLClient _client;
  
  ProductAnalyticsService(this._client);
  
  /// Увеличить счетчик просмотров
  Future<void> incrementViewCount(String productSku) async {
    const mutation = '''
      mutation IncrementViewCount(\$sku: String!) {
        updateProductCustomAttribute(
          input: {
            sku: \$sku,
            attribute_code: "view_count",
            value: "increment"
          }
        ) {
          success
        }
      }
    ''';
    
    await _client.mutate(MutationOptions(
      document: gql(mutation),
      variables: {'sku': productSku},
    ));
  }
  
  /// Увеличить счетчик взаимодействий
  Future<void> incrementInteractionCount(String productSku) async {
    const mutation = '''
      mutation IncrementInteractionCount(\$sku: String!) {
        updateProductCustomAttribute(
          input: {
            sku: \$sku,
            attribute_code: "interaction_count",
            value: "increment"
          }
        ) {
          success
        }
      }
    ''';
    
    await _client.mutate(MutationOptions(
      document: gql(mutation),
      variables: {'sku': productSku},
    ));
  }
  
  /// Обновить рейтинг продукта
  Future<void> updateRating(String productSku, double rating) async {
    const mutation = '''
      mutation UpdateProductRating(
        \$sku: String!,
        \$rating: Float!
      ) {
        updateProductRating(
          input: {
            sku: \$sku,
            rating: \$rating
          }
        ) {
          average_rating
          rating_count
        }
      }
    ''';
    
    await _client.mutate(MutationOptions(
      document: gql(mutation),
      variables: {
        'sku': productSku,
        'rating': rating,
      },
    ));
  }
}
```

### 5. Интеграция в основной FlutterMagento класс

```dart
// lib/src/flutter_magento_plugin_extended.dart

class FlutterMagentoExtended extends FlutterMagento {
  late ExtendedCatalogService _extendedCatalog;
  late ProductAnalyticsService _analytics;
  
  ExtendedCatalogService get extendedCatalog => _extendedCatalog;
  ProductAnalyticsService get analytics => _analytics;
  
  @override
  Future<bool> initialize({
    required String baseUrl,
    required String storeCode,
    String? accessToken,
    Map<String, String>? headers,
  }) async {
    final success = await super.initialize(
      baseUrl: baseUrl,
      storeCode: storeCode,
      accessToken: accessToken,
      headers: headers,
    );
    
    if (success) {
      _extendedCatalog = ExtendedCatalogService();
      _analytics = ProductAnalyticsService(_graphqlClient);
    }
    
    return success;
  }
}
```

## Использование

### Инициализация

```dart
final magento = FlutterMagentoExtended();
await magento.initialize(
  baseUrl: 'https://your-store.com',
  storeCode: 'default',
);
```

### Получение AR продуктов

```dart
// Получить все AR продукты
final arProducts = await magento.extendedCatalog.getExtendedProducts();

// Фильтрация по ориентации
final portraitProducts = await magento.extendedCatalog.getARProducts(
  orientation: 'portrait',
);

// Фильтрация по автору
final artistProducts = await magento.extendedCatalog.getARProducts(
  artistName: 'John Doe',
);

// Поиск с высоким рейтингом
final topRatedProducts = await magento.extendedCatalog.getARProducts(
  minRating: 4.0,
);
```

### Работа с аналитикой

```dart
// Увеличить просмотры
await magento.analytics.incrementViewCount('product-sku');

// Увеличить взаимодействия
await magento.analytics.incrementInteractionCount('product-sku');

// Обновить рейтинг
await magento.analytics.updateRating('product-sku', 4.5);
```

### Конвертация в модель Art

```dart
Art convertExtendedProductToArt(ExtendedProduct product) {
  return Art(
    id: product.id.toString(),
    reference: product.sku,
    title: product.name,
    description: product.description ?? '',
    shortDescription: product.shortDescription,
    artist: Artist(
      name: product.artistName ?? 'Unknown Artist',
      bio: product.artistBio,
      website: product.artistWebsite,
    ),
    category: _parseCategory(product.categories?.first.name ?? 'sculpture'),
    tags: product.tags ?? [],
    media: Media(
      images: _convertMediaGallery(product.mediaGallery),
      audio: product.soundPath != null 
        ? Audio(url: product.soundPath, title: product.name)
        : null,
      arReferenceImage: product.arReferenceImage != null
        ? ARReferenceImage(
            url: product.arReferenceImage!,
            width: product.arWidth ?? 1.0,
            height: product.arHeight ?? 1.0,
          )
        : null,
    ),
    analytics: Analytics(
      viewCount: product.viewCount ?? 0,
      interactionCount: product.interactionCount ?? 0,
      averageRating: product.averageRating ?? 0.0,
      ratingCount: product.ratingCount ?? 0,
    ),
    status: ArtStatus.published,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    // Legacy поля
    modelPath: product.modelPath,
    soundPath: product.soundPath,
    modelScale: product.modelScale ?? 1.0,
    offset: product.offset ?? 0.0,
    extend: product.extend ?? {'x': 1.0, 'y': 1.0},
    orientation: product.orientation == 'portrait' 
      ? Orientation.portrait 
      : Orientation.landscape,
  );
}
```

## Настройка Magento Admin

### Создание кастомных атрибутов

В админ панели Magento необходимо создать следующие атрибуты продуктов:

```php
// app/code/YourModule/Setup/InstallData.php

$attributes = [
    'model_path' => [
        'type' => 'text',
        'label' => '3D Model Path',
        'input' => 'text',
        'required' => false,
        'visible' => true,
        'user_defined' => true,
        'searchable' => false,
        'filterable' => false,
        'comparable' => false,
        'visible_on_front' => true,
        'used_in_product_listing' => true,
    ],
    'sound_path' => [
        'type' => 'text',
        'label' => 'Sound Path',
        'input' => 'text',
        // ... другие параметры
    ],
    'ar_reference_image' => [
        'type' => 'text',
        'label' => 'AR Reference Image URL',
        'input' => 'text',
        // ... другие параметры
    ],
    // ... остальные атрибуты
];
```

## Преимущества данного подхода

1. **Типобезопасность** - строгая типизация всех AR-атрибутов
2. **Расширяемость** - легко добавлять новые кастомные поля
3. **Совместимость** - работает с существующим API Magento
4. **Производительность** - эффективные GraphQL запросы
5. **Аналитика** - встроенная система аналитики продуктов
6. **Гибкость** - поддержка различных фильтров и поисковых критериев

## Ограничения

1. **Зависимость от Magento** - требует настройки кастомных атрибутов в Magento
2. **Сложность миграции** - необходимо обновить существующие продукты
3. **Производительность** - дополнительные запросы для кастомных атрибутов
4. **Версионирование** - требует синхронизации с обновлениями flutter_magento

## Заключение

Данная реализация позволяет полноценно работать с AR-специфичными атрибутами продуктов в рамках библиотеки flutter_magento, обеспечивая типобезопасность, расширяемость и производительность для AR-приложений.
