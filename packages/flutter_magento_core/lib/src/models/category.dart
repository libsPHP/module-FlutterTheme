import 'magento_entity.dart';

/// Represents a Magento category.
class Category extends MagentoEntity {
  /// Category ID.
  final String id;

  /// Category name.
  final String name;

  /// URL key for routing.
  final String urlKey;

  /// Full URL path.
  final String urlPath;

  /// Category description (HTML).
  final String? description;

  /// Category image URL.
  final String? imageUrl;

  /// Number of products in this category.
  final int productCount;

  /// Parent category ID (null for root).
  final String? parentId;

  /// Position/sort order.
  final int position;

  /// Nesting level (0 for root).
  final int level;

  /// Whether category is active.
  final bool isActive;

  /// Child categories.
  final List<Category> children;

  /// Whether to include in menu.
  final bool includeInMenu;

  const Category({
    required this.id,
    required this.name,
    required this.urlKey,
    required this.urlPath,
    this.description,
    this.imageUrl,
    this.productCount = 0,
    this.parentId,
    this.position = 0,
    this.level = 0,
    this.isActive = true,
    this.children = const [],
    this.includeInMenu = true,
    super.customAttributes,
  });

  /// Whether this is a root category.
  bool get isRoot => parentId == null;

  /// Whether this category has children.
  bool get hasChildren => children.isNotEmpty;

  /// Flattens the category tree to a list.
  List<Category> flatten() {
    final result = <Category>[this];
    for (final child in children) {
      result.addAll(child.flatten());
    }
    return result;
  }
}
