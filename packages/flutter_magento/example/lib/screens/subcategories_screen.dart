import 'package:flutter/material.dart';
import '../providers/app_provider.dart';
import 'products_by_category_screen.dart';

class SubcategoriesScreen extends StatelessWidget {
  final MagentoCategory parentCategory;

  const SubcategoriesScreen({super.key, required this.parentCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(parentCategory.name),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: _buildSubcategoriesList(),
    );
  }

  Widget _buildSubcategoriesList() {
    if (parentCategory.children.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No subcategories found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This category has no subcategories',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: parentCategory.children.length,
      itemBuilder: (context, index) {
        final subcategory = parentCategory.children[index];
        return _SubcategoryCard(
          subcategory: subcategory,
          onTap: () => _onSubcategoryTap(context, subcategory),
        );
      },
    );
  }

  void _onSubcategoryTap(BuildContext context, MagentoCategory subcategory) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductsByCategoryScreen(category: subcategory),
      ),
    );
  }
}

class _SubcategoryCard extends StatelessWidget {
  final MagentoCategory subcategory;
  final VoidCallback? onTap;

  const _SubcategoryCard({required this.subcategory, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(
            context,
          ).primaryColor.withValues(alpha: 0.1),
          child: Icon(
            Icons.subdirectory_arrow_right,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          subcategory.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: subcategory.childrenCount > 0
            ? Text('${subcategory.childrenCount} subcategories')
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (subcategory.childrenCount > 0)
              Text(
                'Level ${subcategory.level}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
