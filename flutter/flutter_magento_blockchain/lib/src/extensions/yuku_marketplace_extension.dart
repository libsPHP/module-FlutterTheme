import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../models/yuku_listing.dart';

/// Abstract interface for Yuku API client.
///
/// Implement this to connect to Yuku marketplace.
abstract interface class YukuClient {
  /// Gets the authenticated seller ID.
  String? get sellerId;

  /// Creates a new listing on Yuku.
  Future<YukuListing> createListing({
    required String title,
    required String description,
    required double price,
    required String category,
    required List<String> imageUrls,
    Map<String, dynamic>? metadata,
  });

  /// Updates an existing listing.
  Future<YukuListing> updateListing({
    required String listingId,
    String? title,
    String? description,
    double? price,
    String? category,
    List<String>? imageUrls,
    YukuListingStatus? status,
  });

  /// Deletes a listing.
  Future<void> deleteListing(String listingId);

  /// Gets a listing by ID.
  Future<YukuListing?> getListing(String listingId);

  /// Gets all listings for the authenticated seller.
  Future<List<YukuListing>> getSellerListings({
    int page = 1,
    int pageSize = 20,
    YukuListingStatus? status,
  });

  /// Searches listings.
  Future<List<YukuListing>> searchListings({
    String? query,
    String? category,
    double? minPrice,
    double? maxPrice,
    int page = 1,
    int pageSize = 20,
  });
}

/// Extension for syncing Magento products to Yuku marketplace.
///
/// Usage:
/// ```dart
/// final yuku = YukuMarketplaceExtension(
///   yukuClient: myYukuClient,
///   catalogRepository: myCatalogRepo,
/// );
///
/// // Sync a single product
/// final listing = await yuku.syncProduct(product);
///
/// // Bulk sync products
/// final result = await yuku.syncProducts(products);
/// ```
class YukuMarketplaceExtension {
  final YukuClient _yukuClient;
  final YukuProductMapper _mapper;

  YukuMarketplaceExtension({
    required YukuClient yukuClient,
    YukuProductMapper? mapper,
  })  : _yukuClient = yukuClient,
        _mapper = mapper ?? const DefaultYukuProductMapper();

  /// Gets the authenticated Yuku seller ID.
  String? get sellerId => _yukuClient.sellerId;

  /// Syncs a single Magento product to Yuku.
  Future<YukuListing> syncProduct(ProductDetails product) async {
    final existingListing = await _findExistingListing(product.sku);

    if (existingListing != null) {
      return _updateListing(existingListing, product);
    } else {
      return _createListing(product);
    }
  }

  /// Syncs multiple products to Yuku.
  Future<YukuSyncResult> syncProducts(List<ProductDetails> products) async {
    int synced = 0;
    int failed = 0;
    final errors = <String, String>{};
    final createdListings = <String>[];
    final updatedListings = <String>[];

    for (final product in products) {
      try {
        final existing = await _findExistingListing(product.sku);
        final listing = existing != null
            ? await _updateListing(existing, product)
            : await _createListing(product);

        synced++;
        if (existing != null) {
          updatedListings.add(listing.id);
        } else {
          createdListings.add(listing.id);
        }
      } catch (e) {
        failed++;
        errors[product.sku] = e.toString();
      }
    }

    return YukuSyncResult(
      synced: synced,
      failed: failed,
      errors: errors,
      createdListings: createdListings,
      updatedListings: updatedListings,
    );
  }

  /// Gets the Yuku listing for a Magento product.
  Future<YukuListing?> getListingForProduct(String sku) async {
    return _findExistingListing(sku);
  }

  /// Deactivates a product listing on Yuku.
  Future<void> deactivateProduct(String sku) async {
    final listing = await _findExistingListing(sku);
    if (listing != null) {
      await _yukuClient.updateListing(
        listingId: listing.id,
        status: YukuListingStatus.inactive,
      );
    }
  }

  /// Deletes a product listing from Yuku.
  Future<void> deleteProduct(String sku) async {
    final listing = await _findExistingListing(sku);
    if (listing != null) {
      await _yukuClient.deleteListing(listing.id);
    }
  }

  /// Gets all seller listings from Yuku.
  Future<List<YukuListing>> getSellerListings({
    int page = 1,
    int pageSize = 20,
    YukuListingStatus? status,
  }) {
    return _yukuClient.getSellerListings(
      page: page,
      pageSize: pageSize,
      status: status,
    );
  }

  Future<YukuListing?> _findExistingListing(String sku) async {
    final listings = await _yukuClient.getSellerListings(pageSize: 100);
    try {
      return listings.firstWhere((l) => l.sku == sku);
    } catch (_) {
      return null;
    }
  }

  Future<YukuListing> _createListing(ProductDetails product) async {
    final mapped = _mapper.mapProduct(product);

    return _yukuClient.createListing(
      title: mapped.title,
      description: mapped.description,
      price: mapped.price,
      category: mapped.category,
      imageUrls: mapped.imageUrls,
      metadata: {'magento_sku': product.sku},
    );
  }

  Future<YukuListing> _updateListing(
    YukuListing existing,
    ProductDetails product,
  ) async {
    final mapped = _mapper.mapProduct(product);

    return _yukuClient.updateListing(
      listingId: existing.id,
      title: mapped.title,
      description: mapped.description,
      price: mapped.price,
      category: mapped.category,
      imageUrls: mapped.imageUrls,
    );
  }
}

/// Mapped product data for Yuku listing.
class YukuMappedProduct {
  final String title;
  final String description;
  final double price;
  final String category;
  final List<String> imageUrls;

  const YukuMappedProduct({
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrls,
  });
}

/// Abstract mapper for converting Magento products to Yuku format.
abstract class YukuProductMapper {
  const YukuProductMapper();

  YukuMappedProduct mapProduct(ProductDetails product);
}

/// Default implementation of product mapper.
class DefaultYukuProductMapper extends YukuProductMapper {
  const DefaultYukuProductMapper();

  @override
  YukuMappedProduct mapProduct(ProductDetails product) {
    return YukuMappedProduct(
      title: product.name,
      description: product.description ?? '',
      price: product.price.value,
      category: _mapCategory(product),
      imageUrls: product.images.map((i) => i.url).toList(),
    );
  }

  String _mapCategory(ProductDetails product) {
    // Default category mapping - uses custom attribute
    // Override this mapper for custom logic
    final categoryAttr = product.customAttributes['category_ids'];
    if (categoryAttr == null) {
      return 'Other';
    }
    if (categoryAttr is List && categoryAttr.isNotEmpty) {
      return categoryAttr.first.toString();
    }
    return categoryAttr.toString();
  }
}
