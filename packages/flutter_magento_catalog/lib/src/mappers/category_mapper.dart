import 'package:flutter_magento_core/flutter_magento_core.dart';

class CategoryMapper {
  Category mapCategory(Map<String, dynamic> json) {
    final children = json['children'] as List<dynamic>?;

    return Category(
      id: json['uid'] as String? ?? json['id']?.toString() ?? '',
      name: json['name'] as String? ?? '',
      urlKey: json['url_key'] as String? ?? '',
      urlPath: json['url_path'] as String? ?? '',
      description: json['description'] as String?,
      imageUrl: json['image'] as String?,
      productCount: json['product_count'] as int? ?? 0,
      parentId: json['parent_id']?.toString(),
      position: json['position'] as int? ?? 0,
      level: json['level'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      includeInMenu: json['include_in_menu'] as bool? ?? true,
      children: children
              ?.map((child) => mapCategory(child as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  List<Category> mapCategoryTree(Map<String, dynamic> json) {
    final categories = json['categories'] as Map<String, dynamic>?;
    final items = categories?['items'] as List<dynamic>?;

    if (items == null || items.isEmpty) return [];

    return items
        .map((item) => mapCategory(item as Map<String, dynamic>))
        .toList();
  }

  Category? mapSingleCategory(Map<String, dynamic> json) {
    final categories = json['categories'] as Map<String, dynamic>?;
    final items = categories?['items'] as List<dynamic>?;

    if (items == null || items.isEmpty) return null;

    return mapCategory(items.first as Map<String, dynamic>);
  }
}
