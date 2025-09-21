# Быстрый старт

Это руководство поможет вам создать ваше первое Flutter приложение с интеграцией Magento всего за 15 минут!

## 🎯 Что мы создадим

В этом руководстве мы создадим простое e-commerce приложение с возможностями:
- 📱 Просмотр каталога продуктов
- 🔍 Поиск товаров
- 🛒 Добавление товаров в корзину
- 🔐 Аутентификация пользователей

## 🚀 Шаг 1: Создание нового проекта

```bash
# Создание нового Flutter проекта
flutter create magento_shop
cd magento_shop

# Добавление зависимостей
flutter pub add flutter_magento provider cached_network_image connectivity_plus
```

## 📝 Шаг 2: Настройка pubspec.yaml

```yaml
name: magento_shop
description: Flutter Magento Shop Example

dependencies:
  flutter:
    sdk: flutter
  
  # Magento Integration
  flutter_magento: ^2.8.0
  
  # State Management
  provider: ^6.1.1
  
  # UI Components
  cached_network_image: ^3.3.1
  
  # Network
  connectivity_plus: ^7.0.0
  dio: ^5.4.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0

flutter:
  uses-material-design: true
```

## 🔧 Шаг 3: Создание сервиса Magento

Создайте файл `lib/services/magento_service.dart`:

```dart
import 'package:flutter_magento/flutter_magento.dart';

class MagentoService {
  static final FlutterMagento _instance = FlutterMagento();
  
  static FlutterMagento get instance => _instance;
  
  static Future<bool> initialize() async {
    try {
      return await _instance.initialize(
        baseUrl: 'https://magento2-demo.magebit.com', // Demo store
        headers: {
          'Store': 'default',
          'Content-Type': 'application/json',
        },
        connectionTimeout: 30000,
        receiveTimeout: 30000,
      );
    } catch (e) {
      print('Ошибка инициализации Magento: $e');
      return false;
    }
  }
}
```

## 🎨 Шаг 4: Создание провайдера для управления состоянием

Создайте файл `lib/providers/shop_provider.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_magento/flutter_magento.dart';
import '../services/magento_service.dart';

class ShopProvider extends ChangeNotifier {
  final FlutterMagento _magento = MagentoService.instance;
  
  // Состояние загрузки
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  // Продукты
  List<Product> _products = [];
  List<Product> get products => _products;
  
  // Корзина
  Cart? _cart;
  Cart? get cart => _cart;
  
  // Ошибки
  String? _error;
  String? get error => _error;
  
  // Аутентификация
  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;
  
  Customer? _customer;
  Customer? get customer => _customer;
  
  /// Загрузка продуктов
  Future<void> loadProducts({int page = 1, int pageSize = 20}) async {
    _setLoading(true);
    _clearError();
    
    try {
      final response = await _magento.getProducts(
        page: page,
        pageSize: pageSize,
      );
      
      if (page == 1) {
        _products = response.items;
      } else {
        _products.addAll(response.items);
      }
      
      notifyListeners();
    } catch (e) {
      _setError('Ошибка загрузки продуктов: $e');
    } finally {
      _setLoading(false);
    }
  }
  
  /// Поиск продуктов
  Future<void> searchProducts(String query) async {
    if (query.isEmpty) {
      loadProducts();
      return;
    }
    
    _setLoading(true);
    _clearError();
    
    try {
      final response = await _magento.searchProducts(
        query,
        page: 1,
        pageSize: 20,
      );
      
      _products = response.items;
      notifyListeners();
    } catch (e) {
      _setError('Ошибка поиска: $e');
    } finally {
      _setLoading(false);
    }
  }
  
  /// Создание корзины
  Future<void> createCart() async {
    try {
      _cart = await _magento.createCart();
      notifyListeners();
    } catch (e) {
      _setError('Ошибка создания корзины: $e');
    }
  }
  
  /// Добавление товара в корзину
  Future<void> addToCart(Product product, {int quantity = 1}) async {
    if (_cart == null) {
      await createCart();
    }
    
    if (_cart == null) return;
    
    try {
      _cart = await _magento.addToCart(
        cartId: _cart!.id!,
        sku: product.sku,
        quantity: quantity,
      );
      
      notifyListeners();
      
      // Показываем уведомление об успешном добавлении
      _setError(null);
    } catch (e) {
      _setError('Ошибка добавления в корзину: $e');
    }
  }
  
  /// Аутентификация
  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _clearError();
    
    try {
      final authResponse = await _magento.authenticateCustomer(
        email: email,
        password: password,
      );
      
      _isAuthenticated = true;
      _customer = authResponse.customer;
      
      // Загружаем корзину пользователя
      await _loadCustomerCart();
      
      notifyListeners();
      return true;
    } catch (e) {
      _setError('Ошибка входа: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }
  
  /// Выход
  Future<void> logout() async {
    try {
      await _magento.logout();
      _isAuthenticated = false;
      _customer = null;
      _cart = null;
      notifyListeners();
    } catch (e) {
      _setError('Ошибка выхода: $e');
    }
  }
  
  /// Загрузка корзины пользователя
  Future<void> _loadCustomerCart() async {
    if (!_isAuthenticated) return;
    
    try {
      _cart = await _magento.getCustomerCart();
      notifyListeners();
    } catch (e) {
      // Если корзины нет, создаем новую
      await createCart();
    }
  }
  
  /// Утилиты
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }
  
  void _clearError() {
    _error = null;
  }
}
```

## 🏠 Шаг 5: Создание главного экрана

Создайте файл `lib/screens/home_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_magento/flutter_magento.dart';
import '../providers/shop_provider.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    // Загружаем продукты при инициализации
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShopProvider>().loadProducts();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Magento Shop'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          // Кнопка корзины
          Consumer<ShopProvider>(
            builder: (context, shop, child) {
              final itemCount = shop.cart?.items?.length ?? 0;
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () => _showCart(context),
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$itemCount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
          // Кнопка входа/выхода
          Consumer<ShopProvider>(
            builder: (context, shop, child) {
              return IconButton(
                icon: Icon(shop.isAuthenticated ? Icons.logout : Icons.login),
                onPressed: () {
                  if (shop.isAuthenticated) {
                    shop.logout();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Поиск
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Поиск товаров...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    context.read<ShopProvider>().loadProducts();
                  },
                ),
              ),
              onSubmitted: (query) {
                context.read<ShopProvider>().searchProducts(query);
              },
            ),
          ),
          
          // Список продуктов
          Expanded(
            child: Consumer<ShopProvider>(
              builder: (context, shop, child) {
                if (shop.isLoading && shop.products.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                
                if (shop.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 64, color: Colors.red),
                        SizedBox(height: 16),
                        Text(
                          shop.error!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => shop.loadProducts(),
                          child: Text('Повторить'),
                        ),
                      ],
                    ),
                  );
                }
                
                if (shop.products.isEmpty) {
                  return Center(
                    child: Text('Товары не найдены'),
                  );
                }
                
                return GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: shop.products.length,
                  itemBuilder: (context, index) {
                    final product = shop.products[index];
                    return ProductCard(product: product);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
  void _showCart(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CartBottomSheet(),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  
  const ProductCard({Key? key, required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Изображение продукта
          Expanded(
            child: Container(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: product.mediaGalleryEntries?.first.file ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[200],
                  child: Icon(Icons.image_not_supported),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Название
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                
                // Цена
                Text(
                  '\$${product.currentPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                
                SizedBox(height: 8),
                
                // Кнопка добавления в корзину
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<ShopProvider>().addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Товар добавлен в корзину'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text('В корзину'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopProvider>(
      builder: (context, shop, child) {
        final cart = shop.cart;
        
        if (cart == null || cart.items?.isEmpty == true) {
          return Container(
            height: 200,
            child: Center(
              child: Text('Корзина пуста'),
            ),
          );
        }
        
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Корзина',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              
              // Список товаров в корзине
              ...cart.items!.map((item) => ListTile(
                title: Text(item.name),
                subtitle: Text('Количество: ${item.quantity}'),
                trailing: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
              )),
              
              Divider(),
              
              // Итого
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итого:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${cart.grandTotal?.toStringAsFixed(2) ?? '0.00'}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16),
              
              // Кнопка оформления заказа
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Реализовать оформление заказа
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Оформление заказа в разработке')),
                    );
                  },
                  child: Text('Оформить заказ'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
```

## 🔐 Шаг 6: Создание экрана входа

Создайте файл `lib/screens/login_screen.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shop_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вход'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Логотип
              Icon(
                Icons.shopping_bag,
                size: 80,
                color: Colors.blue,
              ),
              SizedBox(height: 32),
              
              // Email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Введите email';
                  }
                  if (!value!.contains('@')) {
                    return 'Введите корректный email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              // Пароль
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Введите пароль';
                  }
                  if (value!.length < 6) {
                    return 'Пароль должен содержать минимум 6 символов';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              
              // Кнопка входа
              Consumer<ShopProvider>(
                builder: (context, shop, child) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: shop.isLoading ? null : () async {
                        if (_formKey.currentState!.validate()) {
                          final success = await shop.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                          
                          if (success) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Добро пожаловать!')),
                            );
                          } else if (shop.error != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(shop.error!),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: shop.isLoading 
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Войти'),
                    ),
                  );
                },
              ),
              
              SizedBox(height: 16),
              
              // Ссылка на регистрацию
              TextButton(
                onPressed: () {
                  // TODO: Реализовать регистрацию
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Регистрация в разработке')),
                  );
                },
                child: Text('Нет аккаунта? Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

## 📱 Шаг 7: Обновление main.dart

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/magento_service.dart';
import 'providers/shop_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Инициализация Magento
  final initialized = await MagentoService.initialize();
  
  if (!initialized) {
    print('Ошибка инициализации Magento');
  }
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShopProvider()),
      ],
      child: MaterialApp(
        title: 'Magento Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
```

## 🚀 Шаг 8: Запуск приложения

```bash
# Запуск приложения
flutter run
```

## ✅ Что получилось

Поздравляем! Вы создали функциональное e-commerce приложение с:

- ✅ **Каталог продуктов** - просмотр товаров с изображениями и ценами
- ✅ **Поиск** - поиск товаров по названию
- ✅ **Корзина** - добавление товаров и просмотр содержимого
- ✅ **Аутентификация** - вход в систему
- ✅ **Адаптивный UI** - красивый интерфейс для всех устройств

## 🎯 Следующие шаги

Теперь вы можете расширить приложение:

1. **[Добавить детальную страницу товара](../catalog/products.md)**
2. **[Реализовать оформление заказа](../cart/checkout-process.md)**
3. **[Добавить регистрацию пользователей](../authentication/overview.md)**
4. **[Настроить офлайн режим](../offline/offline-architecture.md)**
5. **[Добавить список желаний](../wishlist/wishlist-management.md)**

## 🔧 Дополнительные возможности

### Кастомизация UI
```dart
// Изменение темы приложения
theme: ThemeData(
  primarySwatch: Colors.green,
  fontFamily: 'Roboto',
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),
),
```

### Добавление фильтров
```dart
// В ShopProvider
Future<void> loadProductsByCategory(String categoryId) async {
  final response = await _magento.getProducts(
    categoryId: categoryId,
    page: 1,
    pageSize: 20,
  );
  
  _products = response.items;
  notifyListeners();
}
```

### Настройка кэширования
```dart
// В MagentoService
static Future<bool> initialize() async {
  return await _instance.initialize(
    baseUrl: 'https://your-store.com',
    cacheConfig: CacheConfig(
      enableCaching: true,
      cacheDuration: Duration(minutes: 30),
    ),
  );
}
```

## 💡 Полезные советы

- Используйте **demo магазин** для тестирования
- Добавьте **обработку ошибок** для лучшего UX
- Настройте **кэширование** для улучшения производительности
- Используйте **провайдеры** для управления состоянием
- Добавьте **индикаторы загрузки** для лучшего UX

## 🆘 Возникли проблемы?

Если у вас возникли проблемы:

1. Проверьте подключение к интернету
2. Убедитесь, что URL Magento корректный
3. Проверьте логи в консоли
4. Обратитесь к [разделу устранения неполадок](../support/common-issues.md)

---

**Готово!** Вы создали свое первое приложение с Flutter Magento Plugin. Теперь изучите [полную документацию](../README.md) для добавления дополнительных возможностей.
