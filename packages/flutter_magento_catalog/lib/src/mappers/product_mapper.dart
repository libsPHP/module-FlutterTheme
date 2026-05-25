import 'package:flutter_magento_core/flutter_magento_core.dart';

class ProductMapper {
  ProductSummary mapProductSummary(Map<String, dynamic> json) {
    final priceRange = json['price_range'] as Map<String, dynamic>?;
    final minPrice = priceRange?['minimum_price'] as Map<String, dynamic>?;
    final finalPrice = minPrice?['final_price'] as Map<String, dynamic>?;
    final regularPrice = minPrice?['regular_price'] as Map<String, dynamic>?;

    final thumbnail = json['thumbnail'] as Map<String, dynamic>?;

    return ProductSummary(
      id: int.tryParse(json['id']?.toString() ?? '') ?? 0,
      sku: json['sku'] as String? ?? '',
      name: json['name'] as String? ?? '',
      urlKey: json['url_key'] as String? ?? json['sku'] as String? ?? '',
      price: _mapMoney(finalPrice),
      regularPrice: regularPrice != null ? _mapMoney(regularPrice) : null,
      thumbnailUrl: thumbnail?['url'] as String?,
      inStock: json['stock_status'] == 'IN_STOCK',
      type: _mapProductType(json['__typename'] as String?),
      rating: (json['rating_summary'] as num?)?.toDouble(),
      reviewCount: json['review_count'] as int? ?? 0,
    );
  }

  ProductDetails mapProductDetails(Map<String, dynamic> json) {
    final priceRange = json['price_range'] as Map<String, dynamic>?;
    final minPrice = priceRange?['minimum_price'] as Map<String, dynamic>?;

    final description = json['description'] as Map<String, dynamic>?;
    final shortDescription = json['short_description'] as Map<String, dynamic>?;

    final mediaGallery = json['media_gallery'] as List<dynamic>?;
    final images = mediaGallery
            ?.map((img) => _mapProductImage(img as Map<String, dynamic>))
            .toList() ??
        [];

    final thumbnail = json['thumbnail'] as Map<String, dynamic>?;

    return ProductDetails(
      id: int.tryParse(json['id']?.toString() ?? '') ?? 0,
      sku: json['sku'] as String? ?? '',
      name: json['name'] as String? ?? '',
      urlKey: json['url_key'] as String? ?? json['sku'] as String? ?? '',
      type: _mapProductType(json['__typename'] as String?),
      price: _mapMoney(minPrice?['final_price'] as Map<String, dynamic>?),
      regularPrice: minPrice != null
          ? _mapMoney(minPrice['regular_price'] as Map<String, dynamic>?)
          : null,
      thumbnailUrl: thumbnail?['url'] as String?,
      imageUrl: images.isNotEmpty ? images.first.url : null,
      inStock: json['stock_status'] == 'IN_STOCK',
      rating: (json['rating_summary'] as num?)?.toDouble(),
      reviewCount: json['review_count'] as int? ?? 0,
      description: description?['html'] as String?,
      shortDescription: shortDescription?['html'] as String?,
      images: images,
      configurableOptions: _mapConfigurableOptions(
          json['configurable_options'] as List<dynamic>?),
      variants: _mapVariants(json['variants'] as List<dynamic>?),
      relatedProducts: _mapRelatedProducts(
          json['related_products'] as List<dynamic>?),
      metaTitle: json['meta_title'] as String?,
      metaDescription: json['meta_description'] as String?,
    );
  }

  ProductPage mapProductPage(Map<String, dynamic> json) {
    final items = json['items'] as List<dynamic>? ?? [];
    final pageInfo = json['page_info'] as Map<String, dynamic>?;
    final aggregationsJson = json['aggregations'] as List<dynamic>?;

    final aggregations = aggregationsJson
            ?.map((agg) => _mapAggregation(agg as Map<String, dynamic>))
            .toList() ??
        [];

    return ProductPage(
      items: items
          .map((item) => mapProductSummary(item as Map<String, dynamic>))
          .toList(),
      totalCount: json['total_count'] as int? ?? 0,
      page: pageInfo?['current_page'] as int? ?? 1,
      pageSize: pageInfo?['page_size'] as int? ?? 20,
      aggregations: aggregations,
    );
  }

  Money _mapMoney(Map<String, dynamic>? json) {
    if (json == null) {
      return const Money(value: 0, currency: 'USD');
    }
    return Money(
      value: (json['value'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'USD',
    );
  }

  ProductType _mapProductType(String? typename) {
    switch (typename) {
      case 'SimpleProduct':
        return ProductType.simple;
      case 'ConfigurableProduct':
        return ProductType.configurable;
      case 'BundleProduct':
        return ProductType.bundle;
      case 'GroupedProduct':
        return ProductType.grouped;
      case 'VirtualProduct':
        return ProductType.virtual;
      case 'DownloadableProduct':
        return ProductType.downloadable;
      default:
        return ProductType.simple;
    }
  }

  ProductImage _mapProductImage(Map<String, dynamic> json) {
    return ProductImage(
      url: json['url'] as String? ?? '',
      label: json['label'] as String?,
      position: json['position'] as int? ?? 0,
      isMain: json['position'] == 1,
    );
  }

  List<ProductVariant>? _mapVariants(List<dynamic>? variants) {
    if (variants == null || variants.isEmpty) return null;

    return variants.map((v) {
      final variant = v as Map<String, dynamic>;
      final product = variant['product'] as Map<String, dynamic>?;
      final attributes = variant['attributes'] as List<dynamic>? ?? [];

      return ProductVariant(
        product: mapProductSummary(product ?? {}),
        attributes: Map.fromEntries(
          attributes.map((attr) {
            final a = attr as Map<String, dynamic>;
            return MapEntry(
              a['code'] as String? ?? '',
              a['label'] as String? ?? '',
            );
          }),
        ),
      );
    }).toList();
  }

  List<ConfigurableOption>? _mapConfigurableOptions(List<dynamic>? options) {
    if (options == null || options.isEmpty) return null;

    return options.map((opt) {
      final option = opt as Map<String, dynamic>;
      final values = option['values'] as List<dynamic>? ?? [];

      return ConfigurableOption(
        attributeId: option['attribute_uid'] as String? ?? '',
        attributeCode: option['attribute_code'] as String? ?? '',
        label: option['label'] as String? ?? '',
        values: values.map((val) {
          final v = val as Map<String, dynamic>;
          final swatchData = v['swatch_data'] as Map<String, dynamic>?;

          return ConfigurableOptionValue(
            valueId: v['uid'] as String? ?? '',
            label: v['label'] as String? ?? '',
            swatchData: swatchData?['value'] as String? ??
                swatchData?['thumbnail'] as String?,
            swatchType: _mapSwatchType(swatchData),
          );
        }).toList(),
      );
    }).toList();
  }

  SwatchType? _mapSwatchType(Map<String, dynamic>? swatchData) {
    if (swatchData == null) return null;
    if (swatchData.containsKey('thumbnail')) return SwatchType.image;
    final value = swatchData['value'] as String?;
    if (value != null && value.startsWith('#')) {
      return SwatchType.color;
    }
    return SwatchType.text;
  }

  List<ProductSummary> _mapRelatedProducts(List<dynamic>? products) {
    if (products == null || products.isEmpty) return [];

    return products
        .map((p) => mapProductSummary(p as Map<String, dynamic>))
        .toList();
  }

  Aggregation _mapAggregation(Map<String, dynamic> json) {
    final optionsList = json['options'] as List<dynamic>? ?? [];

    final options = optionsList.map((opt) {
      final o = opt as Map<String, dynamic>;
      return AggregationOption(
        label: o['label'] as String? ?? '',
        value: o['value'] as String? ?? '',
        count: o['count'] as int? ?? 0,
      );
    }).toList();

    return Aggregation(
      attributeCode: json['attribute_code'] as String? ?? '',
      label: json['label'] as String? ?? '',
      options: options,
      count: options.length,
    );
  }
}
