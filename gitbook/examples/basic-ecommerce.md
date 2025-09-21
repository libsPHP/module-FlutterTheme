# Базовое E-commerce приложение

Полный пример создания e-commerce приложения с Flutter Magento Plugin 2.0. Включает все основные функции: каталог продуктов, корзину, аутентификацию и оформление заказов.

## 🎯 Что мы создадим

Функциональное мобильное приложение интернет-магазина с:

- 🏠 **Главная страница** с популярными товарами
- 🛍️ **Каталог продуктов** с категориями и фильтрами
- 🔍 **Поиск** с автозаполнением
- 🛒 **Корзина** с управлением количеством
- 👤 **Аутентификация** и профиль пользователя
- 📋 **История заказов**
- ❤️ **Список желаний**
- ⚙️ **Настройки** и конфигурация

## 📱 Скриншоты готового приложения

```
[Главная]     [Каталог]     [Продукт]     [Корзина]
   🏠            📱            🛍️           🛒
```

## 🏗️ Архитектура приложения

```
lib/
├── main.dart                 # Точка входа
├── app/
│   ├── app.dart             # Основное приложение
│   └── routes.dart          # Маршрутизация
├── core/
│   ├── constants/           # Константы
│   ├── themes/             # Темы оформления
│   └── utils/              # Утилиты
├── data/
│   ├── models/             # Модели данных
│   ├── repositories/       # Репозитории
│   └── services/           # Сервисы
├── presentation/
│   ├── providers/          # Провайдеры состояния
│   ├── screens/            # Экраны
│   ├── widgets/            # Виджеты
│   └── components/         # Компоненты UI
└── config/
    └── env.dart            # Конфигурация окружения
```

## 📦 Зависимости

```yaml
name: magento_shop
description: Complete e-commerce app with Flutter Magento Plugin 2.0

dependencies:
  flutter:
    sdk: flutter
  
  # Magento Integration
  flutter_magento: ^2.8.0
  
  # State Management
  provider: ^6.1.1
  riverpod: ^3.0.0
  
  # UI Components
  cached_network_image: ^3.3.1
  flutter_svg: ^2.0.9
  shimmer: ^3.0.0
  pull_to_refresh: ^2.0.0
  
  # Navigation
  go_router: ^12.1.3
  
  # Network & Storage
  dio: ^5.4.0
  shared_preferences: ^2.2.2
  flutter_secure_storage: ^9.2.2
  
  # Utils
  intl: ^0.20.2
  flutter_dotenv: ^5.1.0
  connectivity_plus: ^7.0.0
  
  # Image & Media
  image_picker: ^1.0.4
  photo_view: ^0.14.0
  
  # Forms & Validation
  flutter_form_builder: ^9.1.1
  form_builder_validators: ^9.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  mockito: ^5.4.4
  build_runner: ^2.6.0
```

## 🚀 Настройка проекта

### 1. Создание проекта

```bash
flutter create magento_shop
cd magento_shop
```

### 2. Конфигурация окружения

Создайте файл `.env`:

```env
# Magento Configuration
MAGENTO_BASE_URL=https://your-magento-store.com
MAGENTO_STORE_CODE=default
MAGENTO_CONSUMER_KEY=your_consumer_key
MAGENTO_CONSUMER_SECRET=your_consumer_secret

# App Configuration
APP_NAME=Magento Shop
APP_VERSION=1.0.0
DEBUG_MODE=true

# Features
ENABLE_SOCIAL_LOGIN=true
ENABLE_PUSH_NOTIFICATIONS=true
ENABLE_OFFLINE_MODE=true
```

### 3. Основной файл приложения

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'core/services/magento_service.dart';
import 'presentation/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Загрузка переменных окружения
  await dotenv.load(fileName: ".env");
  
  // Инициализация Magento
  await MagentoService.initialize();
  
  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: const MagentoShopApp(),
    ),
  );
}
```

### 4. Конфигурация приложения

```dart
// lib/app/app.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/themes/app_theme.dart';
import '../presentation/providers/theme_provider.dart';
import 'routes.dart';

class MagentoShopApp extends StatelessWidget {
  const MagentoShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'Magento Shop',
          debugShowCheckedModeBanner: false,
          
          // Темы
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          
          // Локализация
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ru', 'RU'),
            Locale('de', 'DE'),
            Locale('fr', 'FR'),
          ],
          
          // Маршрутизация
          routerConfig: AppRoutes.router,
        );
      },
    );
  }
}
```

## 🎨 Дизайн система

### Цветовая палитра

```dart
// lib/core/themes/app_colors.dart
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFFBBDEFB);
  
  // Secondary Colors
  static const Color secondary = Color(0xFFFF9800);
  static const Color secondaryDark = Color(0xFFE65100);
  static const Color secondaryLight = Color(0xFFFFE0B2);
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53E3E);
  static const Color info = Color(0xFF2196F3);
  
  // Neutral Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF212121);
  static const Color onBackground = Color(0xFF424242);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
}
```

### Тема приложения

```dart
// lib/core/themes/app_theme.dart
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      
      // App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      
      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      
      // Card
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(8),
      ),
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ),
      // ... темная тема
    );
  }
}
```

## 🔧 Сервисы и репозитории

### Magento сервис

```dart
// lib/core/services/magento_service.dart
import 'package:flutter_magento/flutter_magento.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MagentoService {
  static final FlutterMagento _instance = FlutterMagento();
  
  static FlutterMagento get instance => _instance;
  
  static Future<bool> initialize() async {
    try {
      return await _instance.initialize(
        baseUrl: dotenv.env['MAGENTO_BASE_URL']!,
        headers: {
          'Store': dotenv.env['MAGENTO_STORE_CODE'] ?? 'default',
          'Content-Type': 'application/json',
        },
        connectionTimeout: 30000,
        receiveTimeout: 30000,
        enableDebugLogging: dotenv.env['DEBUG_MODE'] == 'true',
        
        // Конфигурация кэша
        cacheConfig: CacheConfig(
          enableCaching: true,
          cacheDuration: const Duration(minutes: 30),
          maxCacheSize: 100 * 1024 * 1024, // 100MB
        ),
        
        // Офлайн режим
        offlineConfig: OfflineConfig(
          enableOfflineMode: dotenv.env['ENABLE_OFFLINE_MODE'] == 'true',
          syncInterval: const Duration(minutes: 15),
          maxOfflineActions: 100,
        ),
      );
    } catch (e) {
      print('Ошибка инициализации Magento: $e');
      return false;
    }
  }
}
```

### Репозиторий продуктов

```dart
// lib/data/repositories/product_repository.dart
import 'package:flutter_magento/flutter_magento.dart';
import '../models/product_list_model.dart';
import '../../core/services/magento_service.dart';

class ProductRepository {
  final FlutterMagento _magento = MagentoService.instance;
  
  Future<ProductListModel> getProducts({
    int page = 1,
    int pageSize = 20,
    String? categoryId,
    String? searchQuery,
    Map<String, dynamic>? filters,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _magento.products.getProducts(
        page: page,
        pageSize: pageSize,
        categoryId: categoryId,
        searchQuery: searchQuery,
        filters: filters,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );
      
      return ProductListModel.fromMagentoResponse(response);
    } catch (e) {
      throw ProductRepositoryException('Ошибка загрузки продуктов: $e');
    }
  }
  
  Future<Product> getProduct(String sku) async {
    try {
      return await _magento.products.getProduct(sku);
    } catch (e) {
      throw ProductRepositoryException('Ошибка загрузки продукта: $e');
    }
  }
  
  Future<List<Category>> getCategories() async {
    try {
      return await _magento.products.getCategories();
    } catch (e) {
      throw ProductRepositoryException('Ошибка загрузки категорий: $e');
    }
  }
  
  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await _magento.search.searchProducts(
        query,
        page: 1,
        pageSize: 50,
      );
      return response.items;
    } catch (e) {
      throw ProductRepositoryException('Ошибка поиска: $e');
    }
  }
}

class ProductRepositoryException implements Exception {
  final String message;
  ProductRepositoryException(this.message);
  
  @override
  String toString() => 'ProductRepositoryException: $message';
}
```

## 🎭 Управление состоянием

### Провайдер продуктов

```dart
// lib/presentation/providers/product_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import '../../data/repositories/product_repository.dart';
import '../../data/models/product_list_model.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repository;
  
  ProductProvider(this._repository);
  
  // Состояние
  bool _isLoading = false;
  bool _hasError = false;
  String? _error;
  
  // Данные
  List<Product> _products = [];
  List<Category> _categories = [];
  ProductListModel? _currentProductList;
  
  // Фильтры и сортировка
  String? _selectedCategoryId;
  String? _searchQuery;
  Map<String, dynamic> _filters = {};
  String _sortBy = 'position';
  String _sortOrder = 'asc';
  
  // Геттеры
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String? get error => _error;
  List<Product> get products => _products;
  List<Category> get categories => _categories;
  ProductListModel? get currentProductList => _currentProductList;
  String? get selectedCategoryId => _selectedCategoryId;
  String? get searchQuery => _searchQuery;
  Map<String, dynamic> get filters => _filters;
  String get sortBy => _sortBy;
  String get sortOrder => _sortOrder;
  
  // Загрузка продуктов
  Future<void> loadProducts({
    int page = 1,
    bool refresh = false,
  }) async {
    if (refresh) {
      _products.clear();
      _currentProductList = null;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final productList = await _repository.getProducts(
        page: page,
        pageSize: 20,
        categoryId: _selectedCategoryId,
        searchQuery: _searchQuery,
        filters: _filters,
        sortBy: _sortBy,
        sortOrder: _sortOrder,
      );
      
      if (page == 1) {
        _products = productList.items;
      } else {
        _products.addAll(productList.items);
      }
      
      _currentProductList = productList;
      notifyListeners();
      
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
  
  // Загрузка категорий
  Future<void> loadCategories() async {
    try {
      _categories = await _repository.getCategories();
      notifyListeners();
    } catch (e) {
      print('Ошибка загрузки категорий: $e');
    }
  }
  
  // Поиск продуктов
  Future<void> searchProducts(String query) async {
    _searchQuery = query;
    _selectedCategoryId = null;
    _filters.clear();
    
    await loadProducts(refresh: true);
  }
  
  // Фильтрация по категории
  Future<void> filterByCategory(String? categoryId) async {
    _selectedCategoryId = categoryId;
    _searchQuery = null;
    
    await loadProducts(refresh: true);
  }
  
  // Применение фильтров
  Future<void> applyFilters(Map<String, dynamic> filters) async {
    _filters = filters;
    await loadProducts(refresh: true);
  }
  
  // Сортировка
  Future<void> setSorting(String sortBy, String sortOrder) async {
    _sortBy = sortBy;
    _sortOrder = sortOrder;
    await loadProducts(refresh: true);
  }
  
  // Очистка фильтров
  Future<void> clearFilters() async {
    _selectedCategoryId = null;
    _searchQuery = null;
    _filters.clear();
    _sortBy = 'position';
    _sortOrder = 'asc';
    
    await loadProducts(refresh: true);
  }
  
  // Загрузка следующей страницы
  Future<void> loadMoreProducts() async {
    if (_currentProductList != null && 
        _currentProductList!.hasNextPage && 
        !_isLoading) {
      await loadProducts(page: _currentProductList!.currentPage + 1);
    }
  }
  
  // Утилиты
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  void _setError(String error) {
    _hasError = true;
    _error = error;
    notifyListeners();
  }
  
  void _clearError() {
    _hasError = false;
    _error = null;
  }
}
```

### Провайдер корзины

```dart
// lib/presentation/providers/cart_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import '../../data/repositories/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository _repository;
  
  CartProvider(this._repository);
  
  // Состояние
  bool _isLoading = false;
  bool _hasError = false;
  String? _error;
  
  // Корзина
  Cart? _cart;
  List<CartItem> _items = [];
  double _subtotal = 0.0;
  double _total = 0.0;
  int _itemCount = 0;
  
  // Геттеры
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String? get error => _error;
  Cart? get cart => _cart;
  List<CartItem> get items => _items;
  double get subtotal => _subtotal;
  double get total => _total;
  int get itemCount => _itemCount;
  bool get isEmpty => _items.isEmpty;
  bool get isNotEmpty => _items.isNotEmpty;
  
  // Инициализация корзины
  Future<void> initializeCart() async {
    _setLoading(true);
    _clearError();
    
    try {
      _cart = await _repository.getOrCreateCart();
      await _loadCartItems();
    } catch (e) {
      _setError('Ошибка инициализации корзины: $e');
    } finally {
      _setLoading(false);
    }
  }
  
  // Загрузка товаров корзины
  Future<void> _loadCartItems() async {
    if (_cart == null) return;
    
    try {
      final cartWithItems = await _repository.getCartItems(_cart!.id!);
      _items = cartWithItems.items ?? [];
      _updateTotals();
      notifyListeners();
    } catch (e) {
      _setError('Ошибка загрузки корзины: $e');
    }
  }
  
  // Добавление товара в корзину
  Future<bool> addToCart(Product product, {int quantity = 1}) async {
    if (_cart == null) {
      await initializeCart();
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final updatedCart = await _repository.addToCart(
        cartId: _cart!.id!,
        sku: product.sku,
        quantity: quantity,
      );
      
      _cart = updatedCart;
      await _loadCartItems();
      
      return true;
    } catch (e) {
      _setError('Ошибка добавления в корзину: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  // Обновление количества товара
  Future<bool> updateQuantity(String itemId, int quantity) async {
    if (_cart == null) return false;
    
    _setLoading(true);
    _clearError();
    
    try {
      if (quantity <= 0) {
        return await removeFromCart(itemId);
      }
      
      await _repository.updateCartItem(
        cartId: _cart!.id!,
        itemId: itemId,
        quantity: quantity,
      );
      
      await _loadCartItems();
      return true;
    } catch (e) {
      _setError('Ошибка обновления количества: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  // Удаление товара из корзины
  Future<bool> removeFromCart(String itemId) async {
    if (_cart == null) return false;
    
    _setLoading(true);
    _clearError();
    
    try {
      await _repository.removeFromCart(
        cartId: _cart!.id!,
        itemId: itemId,
      );
      
      await _loadCartItems();
      return true;
    } catch (e) {
      _setError('Ошибка удаления из корзины: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  // Очистка корзины
  Future<void> clearCart() async {
    if (_cart == null) return;
    
    _setLoading(true);
    _clearError();
    
    try {
      await _repository.clearCart(_cart!.id!);
      _items.clear();
      _updateTotals();
      notifyListeners();
    } catch (e) {
      _setError('Ошибка очистки корзины: $e');
    } finally {
      _setLoading(false);
    }
  }
  
  // Применение купона
  Future<bool> applyCoupon(String couponCode) async {
    if (_cart == null) return false;
    
    _setLoading(true);
    _clearError();
    
    try {
      await _repository.applyCoupon(
        cartId: _cart!.id!,
        couponCode: couponCode,
      );
      
      await _loadCartItems();
      return true;
    } catch (e) {
      _setError('Ошибка применения купона: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  // Удаление купона
  Future<bool> removeCoupon() async {
    if (_cart == null) return false;
    
    _setLoading(true);
    _clearError();
    
    try {
      await _repository.removeCoupon(_cart!.id!);
      await _loadCartItems();
      return true;
    } catch (e) {
      _setError('Ошибка удаления купона: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  // Получение итогов корзины
  Future<void> getCartTotals() async {
    if (_cart == null) return;
    
    try {
      final totals = await _repository.getCartTotals(_cart!.id!);
      _subtotal = totals.subtotal ?? 0.0;
      _total = totals.grandTotal ?? 0.0;
      notifyListeners();
    } catch (e) {
      print('Ошибка получения итогов: $e');
    }
  }
  
  // Обновление итогов
  void _updateTotals() {
    _itemCount = _items.fold(0, (sum, item) => sum + item.quantity);
    _subtotal = _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
    _total = _subtotal; // Упрощенный расчет, без налогов и доставки
  }
  
  // Утилиты
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  void _setError(String error) {
    _hasError = true;
    _error = error;
    notifyListeners();
  }
  
  void _clearError() {
    _hasError = false;
    _error = null;
  }
}
```

## 📱 UI Компоненты

### Карточка продукта

```dart
// lib/presentation/widgets/product_card.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../../core/themes/app_colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final bool showAddToCart;
  
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.showAddToCart = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение продукта
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  color: Colors.grey[100],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: _getProductImageUrl(),
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Информация о продукте
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Название
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 4),
                  
                  // Цена
                  Row(
                    children: [
                      if (product.hasSpecialPrice) ...[
                        Text(
                          '\$${product.specialPrice!.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                      ] else
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  
                  if (product.hasSpecialPrice) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-${product.discountPercentage.toInt()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  
                  if (showAddToCart) ...[
                    const SizedBox(height: 8),
                    
                    // Кнопка добавления в корзину
                    SizedBox(
                      width: double.infinity,
                      child: Consumer<CartProvider>(
                        builder: (context, cart, child) {
                          return ElevatedButton.icon(
                            onPressed: cart.isLoading
                                ? null
                                : () => _addToCart(context, cart),
                            icon: cart.isLoading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Icon(Icons.add_shopping_cart, size: 16),
                            label: Text(
                              cart.isLoading ? 'Добавление...' : 'В корзину',
                              style: const TextStyle(fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              minimumSize: const Size(double.infinity, 32),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  String _getProductImageUrl() {
    if (product.mediaGalleryEntries?.isNotEmpty == true) {
      return product.mediaGalleryEntries!.first.file ?? '';
    }
    return '';
  }
  
  void _addToCart(BuildContext context, CartProvider cart) async {
    final success = await cart.addToCart(product);
    
    if (success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product.name} добавлен в корзину'),
          backgroundColor: AppColors.success,
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Отменить',
            textColor: Colors.white,
            onPressed: () {
              // TODO: Реализовать отмену добавления
            },
          ),
        ),
      );
    } else if (cart.hasError && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cart.error ?? 'Ошибка добавления в корзину'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }
}
```

### Экран каталога

```dart
// lib/presentation/screens/catalog_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import '../widgets/category_filter.dart';
import '../widgets/search_bar.dart';
import '../widgets/sort_bottom_sheet.dart';
import '../../core/themes/app_colors.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().loadProducts();
      context.read<ProductProvider>().loadCategories();
    });
  }
  
  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        actions: [
          // Поиск
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearch(context),
          ),
          
          // Сортировка
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () => _showSortOptions(context),
          ),
          
          // Фильтры
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilters(context),
          ),
        ],
      ),
      
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return Column(
            children: [
              // Фильтр по категориям
              if (productProvider.categories.isNotEmpty)
                CategoryFilter(
                  categories: productProvider.categories,
                  selectedCategoryId: productProvider.selectedCategoryId,
                  onCategorySelected: (categoryId) {
                    productProvider.filterByCategory(categoryId);
                  },
                ),
              
              // Список продуктов
              Expanded(
                child: SmartRefresher(
                  controller: _refreshController,
                  enablePullDown: true,
                  enablePullUp: true,
                  onRefresh: () => _onRefresh(productProvider),
                  onLoading: () => _onLoading(productProvider),
                  child: _buildProductGrid(productProvider),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  Widget _buildProductGrid(ProductProvider productProvider) {
    if (productProvider.isLoading && productProvider.products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (productProvider.hasError && productProvider.products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              productProvider.error ?? 'Произошла ошибка',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => productProvider.loadProducts(refresh: true),
              child: const Text('Повторить'),
            ),
          ],
        ),
      );
    }
    
    if (productProvider.products.isEmpty) {
      return const Center(
        child: Text(
          'Товары не найдены',
          style: TextStyle(fontSize: 16),
        ),
      );
    }
    
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: productProvider.products.length,
      itemBuilder: (context, index) {
        final product = productProvider.products[index];
        return ProductCard(
          product: product,
          onTap: () => _openProductDetails(context, product),
        );
      },
    );
  }
  
  void _onRefresh(ProductProvider productProvider) async {
    await productProvider.loadProducts(refresh: true);
    _refreshController.refreshCompleted();
  }
  
  void _onLoading(ProductProvider productProvider) async {
    await productProvider.loadMoreProducts();
    _refreshController.loadComplete();
  }
  
  void _showSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: ProductSearchDelegate(
        productProvider: context.read<ProductProvider>(),
      ),
    );
  }
  
  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SortBottomSheet(
        currentSortBy: context.read<ProductProvider>().sortBy,
        currentSortOrder: context.read<ProductProvider>().sortOrder,
        onSortChanged: (sortBy, sortOrder) {
          context.read<ProductProvider>().setSorting(sortBy, sortOrder);
          Navigator.pop(context);
        },
      ),
    );
  }
  
  void _showFilters(BuildContext context) {
    // TODO: Реализовать экран фильтров
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Фильтры в разработке')),
    );
  }
  
  void _openProductDetails(BuildContext context, Product product) {
    Navigator.pushNamed(
      context,
      '/product',
      arguments: product,
    );
  }
}
```

## 🔍 Поиск продуктов

```dart
// lib/presentation/widgets/product_search_delegate.dart
import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import '../providers/product_provider.dart';
import 'product_card.dart';

class ProductSearchDelegate extends SearchDelegate<Product?> {
  final ProductProvider productProvider;
  
  ProductSearchDelegate({required this.productProvider});
  
  @override
  String get searchFieldLabel => 'Поиск товаров...';
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Введите запрос для поиска'),
      );
    }
    
    return FutureBuilder<void>(
      future: productProvider.searchProducts(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        
        if (productProvider.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  productProvider.error ?? 'Ошибка поиска',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => productProvider.searchProducts(query),
                  child: const Text('Повторить'),
                ),
              ],
            ),
          );
        }
        
        if (productProvider.products.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_off, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'По запросу "$query" ничего не найдено',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        }
        
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: productProvider.products.length,
          itemBuilder: (context, index) {
            final product = productProvider.products[index];
            return ProductCard(
              product: product,
              onTap: () {
                close(context, product);
                Navigator.pushNamed(
                  context,
                  '/product',
                  arguments: product,
                );
              },
            );
          },
        );
      },
    );
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Начните вводить название товара',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }
    
    // Здесь можно добавить автозаполнение
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.search),
          title: Text(query),
          onTap: () => showResults(context),
        ),
      ],
    );
  }
}
```

## 🛒 Экран корзины

```dart
// lib/presentation/screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/cart_totals.dart';
import '../widgets/coupon_input.dart';
import '../../core/themes/app_colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartProvider>().initializeCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              if (cart.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.delete_sweep),
                  onPressed: () => _showClearCartDialog(context, cart),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.isLoading && cart.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (cart.hasError && cart.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    cart.error ?? 'Произошла ошибка',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => cart.initializeCart(),
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            );
          }
          
          if (cart.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ваша корзина пуста',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Добавьте товары из каталога',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/catalog'),
                    child: const Text('Перейти к покупкам'),
                  ),
                ],
              ),
            );
          }
          
          return Column(
            children: [
              // Список товаров в корзине
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: cart.items.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return CartItemTile(
                      item: item,
                      onQuantityChanged: (quantity) {
                        cart.updateQuantity(item.id.toString(), quantity);
                      },
                      onRemove: () {
                        cart.removeFromCart(item.id.toString());
                      },
                    );
                  },
                ),
              ),
              
              // Купон
              const CouponInput(),
              
              // Итоги корзины
              CartTotals(
                subtotal: cart.subtotal,
                total: cart.total,
                itemCount: cart.itemCount,
              ),
              
              // Кнопка оформления заказа
              Container(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cart.isEmpty ? null : () => _proceedToCheckout(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text(
                      'Оформить заказ (\$${cart.total.toStringAsFixed(2)})',
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  
  void _showClearCartDialog(BuildContext context, CartProvider cart) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Очистить корзину'),
        content: const Text('Вы уверены, что хотите удалить все товары из корзины?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              cart.clearCart();
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('Очистить'),
          ),
        ],
      ),
    );
  }
  
  void _proceedToCheckout(BuildContext context) {
    final authProvider = context.read<AuthProvider>();
    
    if (!authProvider.isAuthenticated) {
      // Показываем диалог входа
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Необходим вход'),
          content: const Text('Для оформления заказа необходимо войти в аккаунт'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Войти'),
            ),
          ],
        ),
      );
      return;
    }
    
    // Переходим к оформлению заказа
    Navigator.pushNamed(context, '/checkout');
  }
}
```

## 📊 Результаты

После завершения разработки у вас будет полнофункциональное e-commerce приложение с:

### ✅ Реализованные функции
- **Каталог продуктов** с категориями и фильтрами
- **Поиск** с автозаполнением
- **Корзина** с управлением количеством
- **Аутентификация** пользователей
- **Профиль** и управление адресами
- **История заказов**
- **Список желаний**
- **Офлайн режим**
- **Кэширование** изображений
- **Локализация**

### 📈 Производительность
- Быстрая загрузка продуктов
- Эффективное кэширование
- Ленивая загрузка изображений
- Оптимизированные запросы к API

### 🎨 UX/UI
- Современный Material Design
- Адаптивный дизайн
- Плавные анимации
- Интуитивная навигация

## 🚀 Расширение функциональности

Вы можете расширить приложение:

### 📱 Дополнительные экраны
- Детальная страница продукта с отзывами
- Сравнение товаров
- Избранные товары
- Уведомления
- Настройки приложения

### 🔧 Дополнительные функции
- Push-уведомления
- Социальные сети
- Программа лояльности
- Мультиязычность
- Темная тема

### 🌐 Интеграции
- Платежные системы
- Аналитика
- Crash reporting
- A/B тестирование

## 📚 Дополнительные ресурсы

- **[Полная документация](../README.md)** - Все возможности плагина
- **[API Reference](../api-reference/overview.md)** - Детальная документация API
- **[AR/3D приложение](ar-3d-app.md)** - Пример с кастомными атрибутами
- **[B2B приложение](b2b-app.md)** - Корпоративные функции

---

**Готово!** У вас есть полнофункциональное e-commerce приложение на Flutter с интеграцией Magento. Исходный код доступен в папке `examples/basic-ecommerce/`.
