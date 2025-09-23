# Кастомизация демо-данных в Flutter Magento

Начиная с версии 3.1.1, Flutter Magento поддерживает систему кастомизации демо-данных, которая позволяет каждому приложению иметь свои релевантные демо-продукты, категории и другой контент для отображения в офлайн режиме или при недоступности API.

## Обзор системы

Система демо-данных состоит из следующих компонентов:

- **DemoDataProvider** - абстрактный интерфейс для предоставления демо-данных
- **DemoDataManager** - менеджер для управления провайдерами демо-данных
- **DefaultDemoDataProvider** - стандартный провайдер с базовыми демо-данными
- **JsonDemoDataProvider** - провайдер для загрузки данных из JSON файлов

## Быстрый старт

### 1. Базовое использование

```dart
import 'package:flutter_magento/flutter_magento.dart';

void main() async {
  // Инициализация с демо-данными по умолчанию
  final magento = FlutterMagento();
  await magento.initialize(
    baseUrl: 'https://yourstore.com',
    enableDemoData: true, // Включаем демо-данные
  );
  
  // Получение демо-продуктов
  final demoProducts = magento.getDemoProducts();
  print('Доступно ${demoProducts.length} демо-продуктов');
}
```

### 2. Кастомный провайдер демо-данных

Создайте свой провайдер, реализовав интерфейс `DemoDataProvider`:

```dart
import 'package:flutter_magento/flutter_magento.dart';

class ElectronicsDemoDataProvider implements DemoDataProvider {
  @override
  String get providerName => 'Electronics Demo Data';
  
  @override
  String get providerDescription => 'Demo data for electronics store';
  
  @override
  bool supportsDataType(String dataType) {
    return ['products', 'categories', 'cart', 'customer'].contains(dataType);
  }
  
  @override
  List<Product> getDemoProducts() {
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
  List<Category> getDemoCategories() {
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
  List<CartItem> getDemoCartItems() {
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
  Map<String, dynamic>? getDemoCustomer() {
    return {
      'id': '1',
      'email': 'demo@example.com',
      'firstname': 'Demo',
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
  final customProvider = ElectronicsDemoDataProvider();
  
  // Инициализируем с кастомным провайдером
  await magento.initialize(
    baseUrl: 'https://yourstore.com',
    demoDataProvider: customProvider,
    enableDemoData: true,
  );
  
  // Теперь все демо-данные будут из вашего провайдера
  final products = magento.getDemoProducts();
  final categories = magento.getDemoCategories();
}
```

## JSON-конфигурация

### 1. Создание JSON файла с демо-данными

Создайте файл `assets/demo_data/electronics_demo.json`:

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
    "email": "demo@example.com",
    "firstname": "Demo",
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
  final jsonString = await rootBundle.loadString('assets/demo_data/electronics_demo.json');
  
  // Создаем JSON провайдер
  final jsonProvider = JsonDemoDataProvider(
    jsonData: jsonString,
    providerName: 'Electronics JSON Demo',
    providerDescription: 'Demo data loaded from JSON file',
  );
  
  // Регистрируем провайдер
  DemoDataManager.registerProvider('electronics', jsonProvider);
  DemoDataManager.setDefaultProvider('electronics');
  
  // Инициализируем Magento
  final magento = FlutterMagento();
  await magento.initialize(
    baseUrl: 'https://yourstore.com',
    enableDemoData: true,
  );
}
```

## Управление провайдерами

### Регистрация нескольких провайдеров

```dart
// Регистрируем разные провайдеры для разных типов контента
DemoDataManager.registerProvider('electronics', ElectronicsDemoDataProvider());
DemoDataManager.registerProvider('clothing', ClothingDemoDataProvider());
DemoDataManager.registerProvider('books', BooksDemoDataProvider());

// Переключаемся между провайдерами
DemoDataManager.setDefaultProvider('electronics');
```

### Получение информации о провайдерах

```dart
// Получить список всех зарегистрированных провайдеров
final providers = DemoDataManager.registeredProviders;
print('Зарегистрированные провайдеры: $providers');

// Получить информацию о текущем провайдере
final info = DemoDataManager.getCurrentProviderInfo();
print('Текущий провайдер: ${info['providerName']}');

// Получить статистику
final stats = DemoDataManager.getStatistics();
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
    final customProvider = ElectronicsDemoDataProvider();
    
    final success = await _magento.initialize(
      baseUrl: baseUrl,
      demoDataProvider: customProvider,
      enableDemoData: true,
    );
    
    return success;
  }
  
  Future<void> loadProducts() async {
    try {
      // Пытаемся загрузить реальные данные
      final response = await _magento.getProducts();
      _products = response.items;
    } catch (e) {
      // При ошибке используем демо-данные из системы
      final demoProducts = _magento.getDemoProducts();
      _products = demoProducts.map((product) => MagentoProduct(
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

### 1. Структура демо-данных

- **Продукты**: Включайте релевантные для вашей тематики товары
- **Категории**: Создавайте иерархическую структуру, соответствующую вашему каталогу
- **Изображения**: Используйте реальные URL изображений или placeholder'ы
- **Цены**: Указывайте реалистичные цены в вашей валюте

### 2. Производительность

- Ограничивайте количество демо-продуктов (рекомендуется 10-20)
- Используйте оптимизированные изображения
- Кэшируйте демо-данные при необходимости

### 3. Тестирование

```dart
// Тестирование демо-данных
void testDemoData() {
  final provider = ElectronicsDemoDataProvider();
  
  // Проверяем, что провайдер поддерживает нужные типы данных
  assert(provider.supportsDataType('products'));
  assert(provider.supportsDataType('categories'));
  
  // Проверяем количество продуктов
  final products = provider.getDemoProducts();
  assert(products.length > 0);
  
  // Проверяем структуру категорий
  final categories = provider.getDemoCategories();
  assert(categories.isNotEmpty);
}
```

## Миграция с версии 3.0.x

Если вы используете старую систему демо-данных:

1. **Удалите старые методы** `_createDemoProducts()` и `_createDemoCategories()`
2. **Создайте кастомный провайдер** на основе ваших существующих демо-данных
3. **Обновите инициализацию** для использования новой системы
4. **Протестируйте** работу в офлайн режиме

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

Система кастомизации демо-данных в Flutter Magento 3.1.1+ позволяет каждому приложению иметь релевантный контент для отображения в офлайн режиме. Это улучшает пользовательский опыт и позволяет тестировать приложение без подключения к реальному API.

Для получения дополнительной информации обратитесь к [документации API](https://gitlab.com/libsFlutter/flutter_magento/-/wikis) или создайте [issue](https://gitlab.com/libsFlutter/flutter_magento/-/issues) в репозитории.
