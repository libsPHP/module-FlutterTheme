# Flutter Magento - Standard Example

This is the **standard example** demonstrating core e-commerce functionality without marketplace features.

## What's Included

This example showcases:

- 🛒 **Product Catalog** - Browse products and categories
- 🔐 **Authentication** - Login, register, and manage account
- 🛍️ **Shopping Cart** - Add to cart, update quantities
- 📦 **Orders** - View order history and details
- ⭐ **Wishlist** - Save favorite products
- 🔍 **Search** - Find products by keyword
- 👤 **Profile** - Manage customer information
- 🌍 **Localization** - Multi-language support
- 📱 **Device Info** - Platform-specific features
- 💾 **Offline Mode** - RADA format data preloading

## For Marketplace Features

If you need **multi-seller marketplace** functionality (sellers, ratings, seller dashboard), use the **[example_marketplace](../example_marketplace/)** instead.

## Quick Start

### 1. Configure Environment

```bash
cp env.example .env
```

Edit `.env`:

```env
# Standard mode (marketplace disabled)
MARKETPLACE=false

# Your Magento API URL
MAGENTO_API_URL=https://luma-demo.scandipwa.com/

# Test Credentials:
# Email: test@scandipwa.com
# Password: Test@123456
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run

```bash
# iOS
flutter run -d "iPhone 14 Pro"

# Android
flutter run -d emulator-5554

# Chrome
flutter run -d chrome
```

## Project Structure

```
example/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── products_screen.dart
│   │   ├── cart_screen.dart
│   │   ├── auth_screen.dart
│   │   ├── profile_screen.dart
│   │   └── categories_screen.dart
│   ├── providers/
│   │   └── app_provider.dart
│   └── preload_data/
│       └── custom_initial_preload_data_provider.dart
├── .env
├── pubspec.yaml
└── README.md
```

## Features Demonstrated

### Authentication
- Customer registration
- Login/Logout
- Password reset
- Token management

### Product Catalog
- Product listing
- Category browsing
- Product details
- Custom attributes
- Product images
- Price tiers

### Shopping Cart
- Add to cart
- Update quantities
- Remove items
- Apply coupons
- Cart totals

### Orders
- Order placement
- Order history
- Order details
- Order tracking

### Customer Profile
- View profile
- Edit information
- Address management
- Order history

### RADA Format
- Offline data preloading
- Custom data providers
- Data export/import

## Examples vs example_marketplace

| Feature | example/ | example_marketplace/ |
|---------|----------|---------------------|
| Product Catalog | ✅ | ✅ |
| Shopping Cart | ✅ | ✅ |
| Checkout | ✅ | ✅ |
| Orders | ✅ | ✅ |
| **Multi-Seller** | ❌ | ✅ |
| **Seller Dashboard** | ❌ | ✅ |
| **Seller Registration** | ❌ | ✅ |
| **Seller Ratings** | ❌ | ✅ |
| **Seller Search** | ❌ | ✅ |

## Test Credentials

```
Email: test@scandipwa.com
Password: Test@123456
```

## Documentation

- [Getting Started](../doc/getting-started.md)
- [Authentication Guide](../doc/auth.md)
- [Cart Guide](../doc/cart.md)
- [Catalog Guide](../doc/catalog.md)
- [Orders Guide](../doc/orders.md)
- [RADA Format](../doc/RADA_README.md)

## API Endpoints

This example uses standard Magento REST API:

- `POST /rest/V1/integration/customer/token` - Customer login
- `GET /rest/V1/products` - Product listing
- `GET /rest/V1/categories` - Category tree
- `POST /rest/V1/carts/mine` - Create cart
- `POST /rest/V1/carts/mine/items` - Add to cart
- `POST /rest/V1/orders` - Place order

## Need Marketplace?

For multi-seller marketplace features, see **[example_marketplace](../example_marketplace/)**

## Support

- 📧 Email: contact@nativemind.net
- 🐛 Issues: https://github.com/your-repo/issues
- 📖 Docs: https://docs.flutter-magento.com

## License

MIT License
