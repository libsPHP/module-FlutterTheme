import '../models/product.dart';
import '../models/product_page.dart';
import '../models/product_filter.dart';
import '../models/product_sort.dart';
import '../models/category.dart';

/// Repository interface for catalog operations.
abstract interface class CatalogRepository {
  /// Searches products with optional filters and sorting.
  ///
  /// Returns a paginated [ProductPage] of matching products.
  Future<ProductPage> searchProducts({
    String? query,
    ProductFilter? filter,
    ProductSort? sort,
    required int page,
    required int pageSize,
  });

  /// Gets detailed product information by SKU.
  ///
  /// Returns a [ProductDetails] with full product data.
  /// Throws [MagentoNotFoundException] if product doesn't exist.
  Future<ProductDetails> getProductBySku(String sku);

  /// Gets detailed product information by ID.
  ///
  /// Returns a [ProductDetails] with full product data.
  /// Throws [MagentoNotFoundException] if product doesn't exist.
  Future<ProductDetails> getProductById(int id);

  /// Gets the full category tree.
  ///
  /// Returns a list of root [Category] objects with nested children.
  Future<List<Category>> getCategoryTree();

  /// Gets products belonging to a category.
  ///
  /// Returns a paginated [ProductPage] of products in the category.
  Future<ProductPage> getProductsByCategory({
    required String categoryId,
    required int page,
    required int pageSize,
    ProductSort? sort,
    ProductFilter? filter,
  });

  /// Gets a single category by ID.
  ///
  /// Returns a [Category] with category details.
  /// Throws [MagentoNotFoundException] if category doesn't exist.
  Future<Category> getCategoryById(String categoryId);
}
