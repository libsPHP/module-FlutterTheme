# Кастомизация данных предзагрузки в Flutter Magento

Начиная с версии 3.1.1, Flutter Magento поддерживает систему кастомизации данных предзагрузки, которая позволяет каждому приложению иметь свои релевантные продукты, категории и другой контент для отображения в офлайн режиме или при недоступности API.

## Обзор системы

Система данных предзагрузки состоит из следующих компонентов:

- **PreloadDataProvider** - абстрактный интерфейс для предоставления данных предзагрузки
- **PreloadDataManager** - менеджер для управления провайдерами данных предзагрузки
- **DefaultPreloadDataProvider** - стандартный провайдер с базовыми данными предзагрузки
- **JsonPreloadDataProvider** - провайдер для загрузки данных из JSON файлов

## Быстрый старт

### 1. Базовое использование

```dart
import 'package:flutter_magento/flutter_magento.dart';

void main() async {
  // Инициализация с данными предзагрузки по умолчанию
  final magento = FlutterMagento();
  await magento.initialize(
    baseUrl: 'https://yourstore.com',
    enablePreloadData: true, // Включаем данные предзагрузки
  );
  
  // Получение продуктов предзагрузки
  final preloadProducts = magento.getPreloadProducts();
  print('Доступно ${preloadProducts.length} продуктов предзагрузки');
}
```

### 2. Кастомный провайдер данных предзагрузки

Создайте свой провайдер, реализовав интерфейс `PreloadDataProvider`:

```dart
import 'package:flutter_magento/flutter_magento.dart';

class ElectronicsPreloadDataProvider implements PreloadDataProvider {
  @override
  String get providerName => 'Electronics Preload Data';
  
  @override
  String get providerDescription => 'Preload data for electronics store';
  
  @override
  bool supportsDataType(String dataType) {
    return ['products', 'categories', 'cart', 'customer'].contains(dataType);
  }
  
  @override
  List<Product> getInitialPreloadProducts() {
    return [
      Product(
        id: '1',
        name: 'iPhone 15 Pro',
        sku: 'IPHONE-15-PRO',
        price: 999.99,
        specialPrice: 949.99,
        inStock: true,
        imageUrl: 'https://example.com/iphone15pro.jpg',
        description: 'The latest iPhone with advanced camera system.',
        categories: ['Smartphones', 'Apple'],
      ),
      // ... другие продукты
    ];
  }
  
  @override
  List<Category> getInitialPreloadCategories() {
    return [
      Category(
        id: '1',
        name: 'Smartphones',
        urlKey: 'smartphones',
        childrenCount: 2,
        level: 1,
        children: [
          Category(
            id: '11',
            name: 'Apple',
            urlKey: 'smartphones-apple',
            childrenCount: 0,
            level: 2,
          ),
          // ... другие подкатегории
        ],
      ),
      // ... другие категории
    ];
  }
  
  @override
  List<CartItem> getInitialPreloadCartItems() {
    return [
      CartItem(
        id: 1,
        sku: 'IPHONE-15-PRO',
        name: 'iPhone 15 Pro',
        price: 999.99,
        quantity: 1,
        rowTotal: 999.99,
        image: 'https://example.com/iphone15pro.jpg',
      ),
      // ... другие элементы корзины
    ];
  }
  
  @override
  Map<String, dynamic>? getInitialPreloadCustomer() {
    return {
      'id': '1',
      'email': 'preload@example.com',
      'firstname': 'Preload',
      'lastname': 'User',
      'is_active': true,
    };
  }
}
```

### 3. Использование кастомного провайдера

```dart
void main() async {
  final magento = FlutterMagento();
  
  // Создаем кастомный провайдер
  final customProvider = ElectronicsPreloadDataProvider();
  
  // Инициализируем с кастомным провайдером
  await magento.initialize(
    baseUrl: 'https://yourstore.com',
    preloadDataProvider: customProvider,
    enablePreloadData: true,
  );
  
  // Теперь все данные предзагрузки будут из вашего провайдера
  final products = magento.getPreloadProducts();
  final categories = magento.getPreloadCategories();
}
```

## JSON-конфигурация

### 1. Создание JSON файла с данными предзагрузки

Создайте файл `assets/preload_data/electronics_preload.json`:

```json
{
  "products": [
    {
      "id": "1",
      "name": "iPhone 15 Pro",
      "sku": "IPHONE-15-PRO",
      "price": 999.99,
      "specialPrice": 949.99,
      "inStock": true,
      "imageUrl": "https://example.com/iphone15pro.jpg",
      "description": "The latest iPhone with advanced camera system.",
      "categories": ["Smartphones", "Apple"]
    }
  ],
  "categories": [
    {
      "id": "1",
      "name": "Smartphones",
      "urlKey": "smartphones",
      "childrenCount": 2,
      "level": 1,
      "children": [
        {
          "id": "11",
          "name": "Apple",
          "urlKey": "smartphones-apple",
          "childrenCount": 0,
          "level": 2
        }
      ]
    }
  ],
  "cart": [
    {
      "id": 1,
      "sku": "IPHONE-15-PRO",
      "name": "iPhone 15 Pro",
      "price": 999.99,
      "quantity": 1,
      "rowTotal": 999.99,
      "image": "https://example.com/iphone15pro.jpg"
    }
  ],
  "customer": {
    "id": "1",
    "email": "preload@example.com",
    "firstname": "Preload",
    "lastname": "User",
    "is_active": true
  }
}
```

### 2. Загрузка из JSON

```dart
import 'package:flutter/services.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() async {
  // Загружаем JSON из assets
  final jsonString = await rootBundle.loadString('assets/preload_data/electronics_preload.json');
  
  // Создаем JSON провайдер
  final jsonProvider = JsonPreloadDataProvider(
    jsonData: jsonString,
    providerName: 'Electronics JSON Preload',
    providerDescription: 'Preload data loaded from JSON file',
  );
  
  // Регистрируем провайдер
  PreloadDataManager.registerProvider('electronics', jsonProvider);
  PreloadDataManager.setDefaultProvider('electronics');
  
  // Инициализируем Magento
  final magento = FlutterMagento();
  await magento.initialize(
    baseUrl: 'https://yourstore.com',
    enablePreloadData: true,
  );
}
```

## Управление провайдерами

### Регистрация нескольких провайдеров

```dart
// Регистрируем разные провайдеры для разных типов контента
PreloadDataManager.registerProvider('electronics', ElectronicsPreloadDataProvider());
PreloadDataManager.registerProvider('clothing', ClothingPreloadDataProvider());
PreloadDataManager.registerProvider('books', BooksPreloadDataProvider());

// Переключаемся между провайдерами
PreloadDataManager.setDefaultProvider('electronics');
```

### Получение информации о провайдерах

```dart
// Получить список всех зарегистрированных провайдеров
final providers = PreloadDataManager.registeredProviders;
print('Зарегистрированные провайдеры: $providers');

// Получить информацию о текущем провайдере
final info = PreloadDataManager.getCurrentProviderInfo();
print('Текущий провайдер: ${info['providerName']}');

// Получить статистику
final stats = PreloadDataManager.getStatistics();
print('Всего провайдеров: ${stats['totalProviders']}');
```

## Интеграция с существующим кодом

### Обновление AppProvider

```dart
class AppProvider extends ChangeNotifier {
  late FlutterMagento _magento;
  
  Future<bool> initializeMagento(String baseUrl) async {
    _magento = FlutterMagento();
    
    // Создаем кастомный провайдер
    final customProvider = ElectronicsPreloadDataProvider();
    
    final success = await _magento.initialize(
      baseUrl: baseUrl,
      preloadDataProvider: customProvider,
      enablePreloadData: true,
    );
    
    return success;
  }
  
  Future<void> loadProducts() async {
    try {
      // Пытаемся загрузить реальные данные
      final response = await _magento.getProducts();
      _products = response.items;
    } catch (e) {
      // При ошибке используем данные предзагрузки из системы
      final preloadProducts = _magento.getPreloadProducts();
      _products = preloadProducts.map((product) => MagentoProduct(
        id: product.id,
        name: product.name,
        sku: product.sku,
        price: product.price,
        // ... другие поля
      )).toList();
    }
    notifyListeners();
  }
}
```

## Лучшие практики

### 1. Структура данных предзагрузки

- **Продукты**: Включайте релевантные для вашей тематики товары
- **Категории**: Создавайте иерархическую структуру, соответствующую вашему каталогу
- **Изображения**: Используйте реальные URL изображений или placeholder'ы
- **Цены**: Указывайте реалистичные цены в вашей валюте

### 2. Производительность

- Ограничивайте количество продуктов предзагрузки (рекомендуется 10-20)
- Используйте оптимизированные изображения
- Кэшируйте данные предзагрузки при необходимости

### 3. Тестирование

```dart
// Тестирование данных предзагрузки
void testPreloadData() {
  final provider = ElectronicsPreloadDataProvider();
  
  // Проверяем, что провайдер поддерживает нужные типы данных
  assert(provider.supportsDataType('products'));
  assert(provider.supportsDataType('categories'));
  
  // Проверяем количество продуктов
  final products = provider.getInitialPreloadProducts();
  assert(products.length > 0);
  
  // Проверяем структуру категорий
  final categories = provider.getInitialPreloadCategories();
  assert(categories.isNotEmpty);
}
```

## Миграция с версии 3.0.x

Если вы используете старую систему демо-данных:

1. **Обновите названия классов** `DemoDataProvider` → `PreloadDataProvider`
2. **Обновите названия методов** `getDemoProducts()` → `getPreloadProducts()`
3. **Обновите названия параметров** `enableDemoData` → `enablePreloadData`
4. **Создайте кастомный провайдер** на основе ваших существующих данных
5. **Протестируйте** работу в офлайн режиме

## Примеры для разных типов приложений

### Электроника
- Смартфоны, ноутбуки, планшеты
- Категории: Smartphones, Laptops, Tablets, Audio, Wearables
- Бренды: Apple, Samsung, Sony, Dell

### Одежда
- Мужская и женская одежда
- Категории: Men, Women, Accessories
- Подкатегории: Tops, Bottoms, Shoes, Bags

### Книги
- Художественная и техническая литература
- Категории: Fiction, Non-Fiction, Technical, Children
- Авторы и издательства

### Продукты питания
- Продукты питания и напитки
- Категории: Fresh, Frozen, Beverages, Snacks
- Бренды и производители

## Заключение

Система кастомизации данных предзагрузки в Flutter Magento 3.1.1+ позволяет каждому приложению иметь релевантный контент для отображения в офлайн режиме. Это улучшает пользовательский опыт и позволяет тестировать приложение без подключения к реальному API.

Для получения дополнительной информации обратитесь к [документации API](https://gitlab.com/libsFlutter/flutter_magento/-/wikis) или создайте [issue](https://gitlab.com/libsFlutter/flutter_magento/-/issues) в репозитории.

