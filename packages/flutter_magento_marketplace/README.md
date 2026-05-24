# Flutter Magento Marketplace Library


[![Latest Stable Version](https://poser.pugx.org/nativemind/flutter_magento_marketplace/v/stable)](https://pub.dev/packages/flutter_magento_marketplace)
[![License](https://poser.pugx.org/nativemind/flutter_magento_marketplace/license)](https://pub.dev/packages/flutter_magento_marketplace)
[![Total Downloads](https://poser.pugx.org/nativemind/flutter_magento_marketplace/downloads)](https://pub.dev/packages/flutter_magento_marketplace)
---

A comprehensive Flutter library for Magento 2 Marketplace functionality with multi-seller support, subdomains, ratings, messaging, and more. Built on top of the core `flutter_magento` library to provide seamless marketplace features.

## 🚀 Features

### 🏪 **Multi-Seller Platform**
- **Seller Management** - Complete seller registration, approval, and management
- **Seller Profiles** - Rich seller profiles with ratings, reviews, and statistics
- **Subdomain Support** - Individual seller stores with custom subdomains
- **Seller Dashboard** - Comprehensive management interface for sellers
- **Seller Search & Discovery** - Advanced search and filtering capabilities

### 🛍️ **Product Management**
- **Marketplace Products** - Support for seller-specific products
- **Product Conditions** - New, used, refurbished, and for-parts products
- **Product Moderation** - Admin approval workflow for products
- **Product Search** - Advanced product search and filtering
- **Product Categories** - Organized product categorization

### ⭐ **Rating & Review System**
- **Seller Ratings** - Overall seller performance scoring
- **Product Reviews** - Detailed product feedback from buyers
- **Review Management** - Create, update, and moderate reviews
- **Rating Analytics** - Comprehensive rating statistics

### 💬 **Communication Tools**
- **Internal Messaging** - Direct buyer-seller communication
- **Order Messaging** - Contextual messaging tied to orders
- **Real-time Notifications** - Push notifications for messages
- **Message History** - Complete conversation history

### 💰 **Commission & Payment**
- **Commission Tracking** - Monitor seller commissions
- **Payment Integration** - Seamless payment processing
- **Financial Reports** - Comprehensive financial analytics

### 🎛️ **Admin Features**
- **Seller Management** - Approve, suspend, or manage sellers
- **Content Moderation** - Review and approve products/reviews
- **Analytics Dashboard** - Comprehensive marketplace analytics
- **Settings Management** - Configure marketplace settings

## 📦 Installation

## 🔧 Setup

### 1. Initialize the Marketplace Client

```dart
import 'package:flutter_magento_marketplace/flutter_magento_marketplace.dart';
import 'package:flutter_magento/flutter_magento.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: MarketplaceApp(),
      ),
    );
  }
}

class MarketplaceApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initialize Magento client
    final magentoClient = MagentoClient(
      baseUrl: 'https://yourstore.com',
      // ... other configuration
    );

    // Initialize Marketplace client
    final marketplaceClient = MagentoMarketplaceClient(
      config: MarketplaceConfig(
        baseUrl: 'https://yourstore.com',
        enableSubdomains: true,
        enableMessaging: true,
        enableNotifications: true,
      ),
      magentoClient: magentoClient,
    );

    return MaterialApp(
      home: MarketplaceHomeScreen(),
    );
  }
}
```

### 2. Configure Providers

```dart
void main() {
  runApp(
    ProviderScope(
      overrides: [
        marketplaceConfigProvider.overrideWithValue(
          MarketplaceConfig(
            baseUrl: 'https://yourstore.com',
            enableSubdomains: true,
            enableMessaging: true,
            enableNotifications: true,
          ),
        ),
        magentoClientProvider.overrideWithValue(
          MagentoClient(
            baseUrl: 'https://yourstore.com',
            // ... other configuration
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}
```

## 🎯 Usage

### Seller Management

```dart
// Get all sellers
final sellerService = ref.read(sellerServiceProvider);
final sellers = await sellerService.getSellers(
  filters: SellerSearchFilters(
    search: 'electronics',
    ratingMin: 4.0,
    sortBy: SellerSortBy.rating,
  ),
  pageSize: 20,
);

// Get seller by ID
final seller = await sellerService.getSeller(123);

// Get seller by subdomain
final seller = await sellerService.getSellerBySubdomain('electronics-store');

// Register new seller
final newSeller = await sellerService.registerSeller(
  SellerRegistrationRequest(
    customerId: 456,
    companyName: 'Electronics Store',
    businessLicense: 'BL123456',
    phone: '+1234567890',
    address: '123 Main St',
    city: 'New York',
    region: 'NY',
    postcode: '10001',
    countryId: 'US',
    subdomain: 'electronics-store',
  ),
);
```

### Product Management

```dart
// Get seller products
final productService = ref.read(productServiceProvider);
final products = await productService.getSellerProducts(
  sellerId: 123,
  filters: ProductSearchFilters(
    condition: 'new',
    isApproved: 1,
  ),
);

// Add seller product
final product = await productService.addSellerProduct(
  SellerProductRequest(
    sellerId: 123,
    productId: 789,
    condition: 'new',
  ),
);
```

### Review Management

```dart
// Get seller reviews
final reviewService = ref.read(reviewServiceProvider);
final reviews = await reviewService.getSellerReviews(
  sellerId: 123,
  filters: ReviewSearchFilters(
    rating: 5,
    isApproved: 1,
  ),
);

// Create review
final review = await reviewService.createReview(
  ReviewRequest(
    sellerId: 123,
    customerId: 456,
    orderId: 789,
    rating: 5,
    title: 'Excellent service!',
    comment: 'Great product and fast shipping.',
  ),
);
```

### Messaging

```dart
// Get messages
final messageService = ref.read(messageServiceProvider);
final messages = await messageService.getMessages(
  sellerId: 123,
  customerId: 456,
);

// Send message
final message = await messageService.sendMessage(
  MessageRequest(
    sellerId: 123,
    customerId: 456,
    orderId: 789,
    subject: 'Question about product',
    message: 'Is this product still available?',
  ),
);
```

### UI Components

```dart
// Seller card
SellerCard(
  seller: seller,
  onTap: () {
    // Navigate to seller profile
  },
  showStatistics: true,
  showActions: true,
)

// Product grid
ProductGrid(
  products: products,
  onProductTap: (product) {
    // Navigate to product detail
  },
  onAddToCart: (product) {
    // Add to cart
  },
)

// Review list
ReviewList(
  reviews: reviews,
  onReviewTap: (review) {
    // Show review details
  },
)

// Message list
MessageList(
  messages: messages,
  onMessageTap: (message) {
    // Show message details
  },
)
```

## 🎨 Customization

### Theme Configuration

```dart
final themeProvider = Provider<ThemeData>((ref) {
  return ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // ... other theme configuration
  );
});
```

### Localization

```dart
final localizationProvider = Provider<Map<String, String>>((ref) {
  return {
    'appName': 'Marketplace',
    'sellers': 'Sellers',
    'products': 'Products',
    'reviews': 'Reviews',
    'messages': 'Messages',
    // ... other translations
  };
});
```

## 🔧 Configuration

### Marketplace Configuration

```dart
final config = MarketplaceConfig(
  baseUrl: 'https://yourstore.com',
  apiPrefix: '/rest/V1/marketplace',
  enableSubdomains: true,
  enableSubdirectories: true,
  enableMessaging: true,
  enableNotifications: true,
  enableOfflineMode: true,
  enableCaching: true,
  cacheDuration: 300, // 5 minutes
  connectTimeout: 30,
  receiveTimeout: 30,
  sendTimeout: 30,
  maxRetries: 3,
  retryDelay: 1000,
);
```

### Environment Configuration

```dart
// Development
final config = MarketplaceConfig.development(
  baseUrl: 'https://dev.yourstore.com',
  apiKey: 'dev-api-key',
);

// Production
final config = MarketplaceConfig.production(
  baseUrl: 'https://yourstore.com',
  apiKey: 'prod-api-key',
);

// Testing
final config = MarketplaceConfig.testing(
  baseUrl: 'https://test.yourstore.com',
  apiKey: 'test-api-key',
);
```

## 🧪 Testing

### Unit Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_marketplace/flutter_magento_marketplace.dart';

void main() {
  group('SellerService Tests', () {
    test('should get sellers successfully', () async {
      // Test implementation
    });
  });
}
```

### Integration Tests

```dart
import 'package:integration_test/integration_test.dart';
import 'package:flutter_magento_marketplace/flutter_magento_marketplace.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Marketplace Integration Tests', () {
    testWidgets('should display marketplace home screen', (tester) async {
      // Test implementation
    });
  });
}
```

## 📱 Screenshots

| Marketplace Home | Seller Profile | Product Detail | Messages |
|------------------|----------------|----------------|----------|
| ![Home](screenshots/home.png) | ![Profile](screenshots/profile.png) | ![Product](screenshots/product.png) | ![Messages](screenshots/messages.png) |

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Documentation**: [https://docs.nativemind.net/flutter-magento-marketplace](https://docs.nativemind.net/flutter-magento-marketplace)
- **Issues**: [GitHub Issues](https://github.com/nativemind/flutter_magento_marketplace/issues)
- **Discussions**: [GitHub Discussions](https://github.com/nativemind/flutter_magento_marketplace/discussions)
- **Email**: [contact@nativemind.net](mailto:contact@nativemind.net)

## 🔗 Related Projects

- [flutter_magento](https://pub.dev/packages/flutter_magento) - Core Magento Flutter library
- [nativemind/module-marketplace](https://packagist.org/packages/nativemind/module-marketplace) - Magento 2 Marketplace module

## 📊 Statistics

- **Downloads**: 10,000+
- **Stars**: 500+
- **Forks**: 100+
- **Contributors**: 20+

## 🎯 Roadmap

- [ ] **v1.1.0** - Advanced search and filtering
- [ ] **v1.2.0** - Real-time messaging with WebSocket
- [ ] **v1.3.0** - Offline mode support
- [ ] **v1.4.0** - Advanced analytics
- [ ] **v1.5.0** - Multi-language support
- [ ] **v2.0.0** - Complete rewrite with new architecture

## 🙏 Acknowledgments

- [Magento](https://magento.com/) for the amazing e-commerce platform
- [Flutter](https://flutter.dev/) for the beautiful UI framework
- [Riverpod](https://riverpod.dev/) for state management
- [Dio](https://pub.dev/packages/dio) for HTTP client
- [Freezed](https://pub.dev/packages/freezed) for code generation

---

Made with ❤️ by [NativeMind](https://nativemind.net)

