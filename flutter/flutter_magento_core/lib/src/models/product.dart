import 'magento_entity.dart';
import 'money.dart';
import 'product_type.dart';

/// Basic product information for lists.
class ProductSummary extends MagentoEntity {
  /// Product ID.
  final int id;

  /// Product SKU.
  final String sku;

  /// Product name.
  final String name;

  /// URL key for routing.
  final String urlKey;

  /// Product type.
  final ProductType type;

  /// Current price.
  final Money price;

  /// Original price (before discounts).
  final Money? regularPrice;

  /// Main product image URL.
  final String? imageUrl;

  /// Thumbnail image URL.
  final String? thumbnailUrl;

  /// Whether the product is in stock.
  final bool inStock;

  /// Average rating (0-5).
  final double? rating;

  /// Number of reviews.
  final int reviewCount;

  const ProductSummary({
    required this.id,
    required this.sku,
    required this.name,
    required this.urlKey,
    required this.type,
    required this.price,
    this.regularPrice,
    this.imageUrl,
    this.thumbnailUrl,
    required this.inStock,
    this.rating,
    this.reviewCount = 0,
    super.customAttributes,
  });

  /// Whether product has a discount.
  bool get hasDiscount =>
      regularPrice != null && regularPrice!.value > price.value;

  /// Discount percentage (0-100).
  double get discountPercent {
    if (!hasDiscount) return 0;
    return ((regularPrice!.value - price.value) / regularPrice!.value) * 100;
  }
}

/// Full product details.
class ProductDetails extends ProductSummary {
  /// Product description (HTML).
  final String? description;

  /// Short description.
  final String? shortDescription;

  /// All product images.
  final List<ProductImage> images;

  /// Configurable options (for configurable products).
  final List<ConfigurableOption>? configurableOptions;

  /// Product variants (for configurable products).
  final List<ProductVariant>? variants;

  /// Related products.
  final List<ProductSummary> relatedProducts;

  /// Meta title for SEO.
  final String? metaTitle;

  /// Meta description for SEO.
  final String? metaDescription;

  /// Meta keywords for SEO.
  final String? metaKeywords;

  /// Stock quantity (if visible).
  final int? stockQuantity;

  const ProductDetails({
    required super.id,
    required super.sku,
    required super.name,
    required super.urlKey,
    required super.type,
    required super.price,
    super.regularPrice,
    super.imageUrl,
    super.thumbnailUrl,
    required super.inStock,
    super.rating,
    super.reviewCount,
    super.customAttributes,
    this.description,
    this.shortDescription,
    this.images = const [],
    this.configurableOptions,
    this.variants,
    this.relatedProducts = const [],
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.stockQuantity,
  });
}

/// Product image.
class ProductImage {
  /// Image URL.
  final String url;

  /// Image label/alt text.
  final String? label;

  /// Position/sort order.
  final int position;

  /// Whether this is the main image.
  final bool isMain;

  const ProductImage({
    required this.url,
    this.label,
    this.position = 0,
    this.isMain = false,
  });
}

/// Configurable product option (e.g., Size, Color).
class ConfigurableOption {
  /// Attribute ID.
  final String attributeId;

  /// Attribute code.
  final String attributeCode;

  /// Display label.
  final String label;

  /// Available values.
  final List<ConfigurableOptionValue> values;

  const ConfigurableOption({
    required this.attributeId,
    required this.attributeCode,
    required this.label,
    required this.values,
  });
}

/// A value for a configurable option.
class ConfigurableOptionValue {
  /// Value ID.
  final String valueId;

  /// Display label.
  final String label;

  /// Swatch data (color hex, image URL, etc.).
  final String? swatchData;

  /// Swatch type (color, image, text).
  final SwatchType? swatchType;

  const ConfigurableOptionValue({
    required this.valueId,
    required this.label,
    this.swatchData,
    this.swatchType,
  });
}

/// Swatch type for configurable options.
enum SwatchType { color, image, text }

/// A product variant.
class ProductVariant {
  /// Variant product.
  final ProductSummary product;

  /// Selected attribute values.
  final Map<String, String> attributes;

  const ProductVariant({
    required this.product,
    required this.attributes,
  });
}
