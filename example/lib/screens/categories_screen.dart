import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'products_by_category_screen.dart';
import 'subcategories_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AppProvider>();
      if (provider.isInitialized && provider.categories.isEmpty) {
        provider.loadCategories();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final provider = context.read<AppProvider>();
              if (provider.isInitialized) {
                provider.loadCategories();
              }
            },
          ),
        ],
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (!provider.isInitialized) {
            return _buildNotConfigured();
          }

          if (provider.isLoading && provider.categories.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.categories.isEmpty) {
            return _buildEmptyState();
          }

          return _buildCategoriesList(provider.categories);
        },
      ),
    );
  }

  Widget _buildNotConfigured() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Magento not configured',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please configure Magento API in the Config tab first',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No categories found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Categories will appear here once loaded from Magento',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList(List<MagentoCategory> categories) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return _CategoryCard(
          category: category,
          onTap: () => _onCategoryTap(category),
        );
      },
    );
  }

  void _onCategoryTap(MagentoCategory category) {
    // Если есть подкатегории, показываем меню выбора
    if (category.children.isNotEmpty) {
      _showCategoryOptions(context, category);
    } else {
      // Переходим к экрану продуктов с фильтром по категории
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductsByCategoryScreen(category: category),
        ),
      );
    }
  }

  void _showCategoryOptions(BuildContext context, MagentoCategory category) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                category.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('View Products in this Category'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductsByCategoryScreen(category: category),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.subdirectory_arrow_right),
                title: Text('View ${category.children.length} Subcategories'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SubcategoriesScreen(parentCategory: category),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CategoryCard extends StatefulWidget {
  final MagentoCategory category;
  final VoidCallback? onTap;

  const _CategoryCard({required this.category, this.onTap});

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.1),
              child: Icon(
                Icons.category,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(
              widget.category.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: widget.category.childrenCount > 0
                ? Text('${widget.category.childrenCount} subcategories')
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.category.childrenCount > 0)
                  Text(
                    'Level ${widget.category.level}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                const SizedBox(width: 8),
                if (widget.category.childrenCount > 0)
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    size: 20,
                  )
                else
                  const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: widget.category.childrenCount > 0
                ? () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  }
                : widget.onTap,
          ),
          if (_isExpanded && widget.category.children.isNotEmpty)
            _buildSubcategoriesList(),
        ],
      ),
    );
  }

  Widget _buildSubcategoriesList() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: widget.category.children.map((subcategory) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 16),
              leading: CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(
                  context,
                ).primaryColor.withValues(alpha: 0.1),
                child: Icon(
                  Icons.subdirectory_arrow_right,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                ),
              ),
              title: Text(
                subcategory.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              subtitle: subcategory.childrenCount > 0
                  ? Text(
                      '${subcategory.childrenCount} subcategories',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    )
                  : null,
              trailing: subcategory.childrenCount > 0
                  ? Text(
                      'Level ${subcategory.level}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 11),
                    )
                  : const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () => widget.onTap?.call(),
            ),
          );
        }).toList(),
      ),
    );
  }
}
