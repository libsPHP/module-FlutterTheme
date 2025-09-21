## 2.9.0+110

* **Major Code Improvements**: Comprehensive code quality enhancements and optimizations
* **Performance**: Added const constructors throughout codebase for better performance
* **API Updates**: Updated deprecated APIs (withOpacity → withValues, surfaceVariant → surfaceContainerHighest)
* **Code Style**: Fixed code style issues including proper braces in if-statements
* **Bug Fixes**: Fixed critical errors in example app authentication and test files
* **Type Safety**: Improved type safety and null handling across the codebase
* **Maintainability**: Enhanced code maintainability with better structure and consistency

## 2.8.1+109

* **Publishing Fixes**: Fixed all publishing validation errors for pub.dev
* **Import Issues**: Resolved Customer class import conflicts between auth_models and customer models
* **Code Quality**: Removed unnecessary .toList() calls in spread operators
* **Style Fixes**: Fixed unnecessary const keywords in TextStyle constructors
* **Git State**: Cleaned up git state for publishing requirements

## 2.8.0+108

* **Code Cleanup**: Removed unused _buildLoadingImage methods from widget files
* **Performance**: Improved widget rendering by removing dead code
* **Maintenance**: Code cleanup and optimization for better maintainability

## 2.7.0

* **Type Safety**: Fixed critical return type issues in cart API methods
* **Code Quality**: Resolved analyzer errors and improved type consistency
* **API Improvements**: Standardized cart model usage across all cart operations
* **Bug Fixes**: Fixed return type mismatches in flutter_magento_plugin.dart
* **Compatibility**: Prepared package for pub.dev publishing requirements

## 2.3.4

* **Bug Fixes**: Fixed critical analyzer errors in API classes
* **API Improvements**: Fixed method parameter issues in order_api.dart and wishlist_api.dart
* **Type Safety**: Improved type declarations and imports across API classes
* **Code Quality**: Resolved undefined parameter errors and type assignment issues

## 2.2.3

* **Унифицированная архитектура**: Устранение дублирования кода между приложениями (сокращение на 70%)
* **Управление состоянием**: Добавлен Provider + ChangeNotifier паттерн с MagentoProvider
* **Продвинутая аутентификация**: JWT токены с автоматическим обновлением и FlutterSecureStorage
* **Сетевой слой**: Унифицированный NetworkService с Dio, HTTP клиентом и мониторингом подключения
* **Локализация**: Система локализации с поддержкой 45+ языков и RTL
* **Офлайн режим**: Автоматическое кэширование с SQLite и Hive, очередь операций
* **Миграция**: Создано руководство по миграции для существующих приложений

## 2.1.2

* **Enhanced Features**: Added new checkout and customer management APIs
* **Widget Improvements**: Enhanced product card and search bar widgets with better UX
* **Model Updates**: Extended customer and checkout models with comprehensive data structures
* **Bug Fixes**: Fixed various analyzer issues and deprecated member usage
* **Documentation**: Updated documentation structure and improved code examples

## 2.0.1

* **Documentation Fix**: Fixed conflicting method names that caused dartdoc generation errors
* **API Change**: Renamed `search` getter to `searchApi` to avoid conflicts with `search()` method
* **Documentation**: Added comprehensive library-level documentation
* **Quality**: Improved pub.dev analysis score by resolving documentation issues

## 2.0.0

* **Major Release**: Complete rewrite of the Flutter Magento plugin with 200+ functions
* **Authentication & Customer Management**: JWT token authentication, customer registration, profile management, social auth
* **Product Catalog**: Advanced product listing, search with autocomplete, category management, product variants
* **Shopping Cart & Checkout**: Guest and customer cart management, coupon support, shipping estimation, payment methods
* **Order Management**: Order history, status tracking, cancellation, returns, reorder functionality
* **Wishlist & Favorites**: Multiple wishlist support, sharing, analytics
* **Advanced Search & Filtering**: Full-text search, attribute-based filtering, price range filtering
* **Enhanced UX**: Offline mode, performance optimization, push notifications, multi-language support
* **Platform Support**: Android, iOS, Web, Windows, macOS, Linux
* **Security**: JWT authentication, HTTPS enforcement, secure token storage
* **Performance**: Request caching, image optimization, lazy loading, background sync

## 0.0.1

* Initial release with basic Magento integration
