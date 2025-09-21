# API Reference - Обзор

Добро пожаловать в полную документацию API Flutter Magento Plugin 2.0! Этот раздел содержит детальное описание всех доступных методов, классов и интерфейсов.

## 📚 Структура API

Flutter Magento Plugin организован в несколько основных API модулей:

### 🔐 Authentication API
Управление аутентификацией и сессиями пользователей
- Вход и выход пользователей
- Регистрация новых клиентов
- Управление токенами JWT
- Восстановление паролей

### 🛍️ Products API
Работа с каталогом продуктов
- Получение списков продуктов
- Поиск и фильтрация
- Детальная информация о продуктах
- Управление категориями

### 🛒 Cart API
Управление корзиной покупок
- Создание и управление корзинами
- Добавление/удаление товаров
- Применение купонов и скидок
- Расчет стоимости доставки

### 📋 Orders API
Работа с заказами
- Создание заказов
- Получение истории заказов
- Управление статусами
- Отмена и возврат заказов

### 👤 Customers API
Управление профилями клиентов
- Информация о клиентах
- Управление адресами
- Настройки профиля
- Группы клиентов

### ❤️ Wishlist API
Управление списками желаний
- Создание списков желаний
- Добавление/удаление товаров
- Совместное использование списков
- Множественные списки

### 🔍 Search API
Поисковая функциональность
- Полнотекстовый поиск
- Автозаполнение
- Фасетный поиск
- Поисковые предложения

### 🎨 Enhanced Products API
Расширенная работа с продуктами и кастомными атрибутами
- Типизированные кастомные атрибуты
- Адаптеры для различных типов приложений
- Валидация данных
- Автоматическое определение адаптеров

## 🚀 Основной класс FlutterMagento

Главная точка входа для всех API операций:

```dart
class FlutterMagento {
  // Инициализация
  Future<bool> initialize({
    required String baseUrl,
    Map<String, String>? headers,
    int? connectionTimeout,
    int? receiveTimeout,
    List<CustomAttributesAdapter>? customAdapters,
  });
  
  // API модули
  AuthApi get auth;
  ProductApi get products;
  EnhancedProductApi get enhancedProducts;
  CartApi get cart;
  OrderApi get orders;
  CustomerApi get customers;
  WishlistApi get wishlist;
  SearchApi get search;
  CheckoutApi get checkout;
}
```

## 🔧 Конфигурация и инициализация

### Базовая инициализация
```dart
final magento = FlutterMagento();
await magento.initialize(
  baseUrl: 'https://your-magento-store.com',
);
```

### Расширенная конфигурация
```dart
await magento.initialize(
  baseUrl: 'https://your-magento-store.com',
  headers: {
    'Store': 'default',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer your-token',
  },
  connectionTimeout: 30000,
  receiveTimeout: 30000,
  customAdapters: [
    YourCustomAdapter(),
    AnotherCustomAdapter(),
  ],
);
```

## 📊 Модели данных

Все API используют строго типизированные модели, созданные с помощью Freezed:

### Основные модели
```dart
// Продукт
@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String sku,
    required String name,
    required String typeId,
    required double price,
    double? specialPrice,
    // ... другие поля
  }) = _Product;
}

// Клиент
@freezed
class Customer with _$Customer {
  const factory Customer({
    required int id,
    required String email,
    required String firstname,
    required String lastname,
    // ... другие поля
  }) = _Customer;
}

// Корзина
@freezed
class Cart with _$Cart {
  const factory Cart({
    int? id,
    List<CartItem>? items,
    double? grandTotal,
    double? subtotal,
    // ... другие поля
  }) = _Cart;
}
```

## 🔄 Обработка результатов

Все API методы возвращают типизированные результаты или выбрасывают исключения:

### Успешные результаты
```dart
try {
  final products = await magento.products.getProducts();
  print('Получено продуктов: ${products.items.length}');
} catch (e) {
  print('Ошибка: $e');
}
```

### Результаты с пагинацией
```dart
final response = await magento.products.getProducts(
  page: 1,
  pageSize: 20,
);

print('Текущая страница: ${response.currentPage}');
print('Всего страниц: ${response.totalPages}');
print('Всего товаров: ${response.totalCount}');
```

## ⚡ Асинхронные операции

Все API методы асинхронны и возвращают `Future`:

```dart
// Последовательные операции
final customer = await magento.auth.authenticateCustomer(
  email: 'user@example.com',
  password: 'password',
);

final cart = await magento.cart.createCart();

final updatedCart = await magento.cart.addToCart(
  cartId: cart.id!,
  sku: 'product-sku',
  quantity: 1,
);

// Параллельные операции
final futures = await Future.wait([
  magento.products.getProducts(page: 1),
  magento.products.getCategories(),
  magento.customers.getCurrentCustomer(),
]);
```

## 🛡️ Обработка ошибок

Плагин использует типизированные исключения:

```dart
try {
  await magento.auth.authenticateCustomer(
    email: 'invalid@email.com',
    password: 'wrong-password',
  );
} on MagentoAuthException catch (e) {
  print('Ошибка аутентификации: ${e.message}');
} on MagentoNetworkException catch (e) {
  print('Сетевая ошибка: ${e.message}');
} on MagentoException catch (e) {
  print('Общая ошибка Magento: ${e.message}');
} catch (e) {
  print('Неизвестная ошибка: $e');
}
```

### Типы исключений
- `MagentoAuthException` - ошибки аутентификации
- `MagentoNetworkException` - сетевые ошибки
- `MagentoValidationException` - ошибки валидации
- `MagentoNotFoundException` - ресурс не найден
- `MagentoPermissionException` - недостаточно прав
- `MagentoException` - базовое исключение

## 🔍 Фильтрация и поиск

Многие API поддерживают расширенную фильтрацию:

### Фильтры продуктов
```dart
final products = await magento.products.getProducts(
  filters: {
    'price': {'gt': '10.00', 'lt': '100.00'},
    'status': '1',
    'visibility': {'in': ['2', '3', '4']},
    'category_id': '123',
  },
  sortBy: 'price',
  sortOrder: 'asc',
);
```

### Поисковые операторы
- `eq` - равно
- `neq` - не равно
- `gt` - больше
- `gte` / `gteq` - больше или равно
- `lt` - меньше
- `lte` / `lteq` - меньше или равно
- `like` - содержит (для строк)
- `nlike` - не содержит
- `in` - входит в список
- `nin` - не входит в список
- `range` - диапазон значений

## 📱 Поддержка платформ

API поддерживает все платформы Flutter:

| Платформа | Статус | Примечания |
|-----------|--------|------------|
| Android | ✅ Полная поддержка | API 21+ |
| iOS | ✅ Полная поддержка | iOS 12.0+ |
| Web | ✅ Полная поддержка | Требует настройки CORS |
| Windows | ✅ Полная поддержка | Windows 10+ |
| macOS | ✅ Полная поддержка | macOS 10.14+ |
| Linux | ✅ Полная поддержка | Ubuntu 18.04+ |

## 🔧 Настройка HTTP клиента

Плагин использует Dio для HTTP запросов с возможностью кастомизации:

```dart
await magento.initialize(
  baseUrl: 'https://your-store.com',
  headers: {
    'User-Agent': 'MyApp/1.0',
    'Accept-Language': 'ru-RU,ru;q=0.9,en;q=0.8',
  },
  connectionTimeout: 30000,
  receiveTimeout: 30000,
  // Кастомные настройки Dio
  dioOptions: BaseOptions(
    followRedirects: true,
    maxRedirects: 5,
  ),
);
```

## 📈 Производительность

### Кэширование
```dart
// Включение кэширования
await magento.initialize(
  baseUrl: 'https://your-store.com',
  cacheConfig: CacheConfig(
    enableCaching: true,
    cacheDuration: Duration(minutes: 30),
    maxCacheSize: 100 * 1024 * 1024, // 100MB
  ),
);
```

### Пагинация
```dart
// Эффективная загрузка больших списков
Future<void> loadAllProducts() async {
  int page = 1;
  const pageSize = 50;
  List<Product> allProducts = [];
  
  do {
    final response = await magento.products.getProducts(
      page: page,
      pageSize: pageSize,
    );
    
    allProducts.addAll(response.items);
    page++;
    
  } while (page <= response.totalPages);
}
```

## 🔐 Безопасность

### Токены доступа
```dart
// Установка токена администратора
await magento.setAdminToken('your-admin-token');

// Установка токена клиента
await magento.setCustomerToken('customer-jwt-token');

// Автоматическое обновление токенов
await magento.enableAutoTokenRefresh(true);
```

### Безопасное хранение
```dart
// Токены автоматически сохраняются в FlutterSecureStorage
// Нет необходимости в ручном управлении
```

## 📚 Дополнительные ресурсы

- **[Authentication API](authentication-api.md)** - Подробная документация по аутентификации
- **[Products API](products-api.md)** - Работа с каталогом продуктов
- **[Cart API](cart-api.md)** - Управление корзиной
- **[Orders API](orders-api.md)** - Работа с заказами
- **[Customers API](customers-api.md)** - Управление клиентами
- **[Search API](search-api.md)** - Поисковая функциональность
- **[Wishlist API](wishlist-api.md)** - Списки желаний

## 🆘 Получение помощи

Если у вас возникли вопросы по API:

1. Проверьте [FAQ](../support/faq.md)
2. Изучите [примеры использования](../examples/basic-ecommerce.md)
3. Обратитесь к [сообществу](../resources/community.md)
4. Создайте issue в [GitHub репозитории](https://github.com/nativemind/flutter_magento/issues)

---

**Следующий шаг:** Изучите [Authentication API](authentication-api.md) для начала работы с аутентификацией пользователей.
