# Flutter Magento Marketplace Example

This example demonstrates the **multi-seller marketplace** functionality of the Flutter Magento plugin.

## Features

This example showcases:

- 🏪 **Seller Management** - Browse, search, and manage sellers
- 📝 **Seller Registration** - Allow users to register as sellers
- 📊 **Seller Dashboard** - Manage products, orders, and statistics
- ⭐ **Seller Ratings & Reviews** - Rate and review sellers
- 🔍 **Advanced Seller Search** - Filter sellers by various criteria
- 📦 **Seller Products** - View products grouped by seller
- 📈 **Seller Statistics** - View sales, ratings, and performance metrics

## Prerequisites

Before running this example, ensure you have:

1. **Flutter SDK** (3.24.0 or higher)
2. **Magento 2** instance with marketplace module installed
3. **module-marketplace** backend module (included in parent directory)

## Backend Setup

### Install Magento Marketplace Module

```bash
# Navigate to Magento root directory
cd /path/to/magento

# Copy marketplace module
cp -r /path/to/flutter_magento/../module-marketplace app/code/NativeMind/Marketplace

# Enable module
php bin/magento module:enable NativeMind_Marketplace
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento cache:flush

# Set up database
php bin/magento setup:db-schema:upgrade
```

## Configuration

### 1. Environment Setup

Copy `.env.example` to `.env` and configure:

```bash
cp env.example .env
```

Edit `.env`:

```env
# Enable marketplace mode
MARKETPLACE=true

# Your Magento API URL
MAGENTO_API_URL=https://your-magento-store.com/

# Marketplace features
ENABLE_SELLER_REGISTRATION=true
ENABLE_SELLER_DASHBOARD=true
ENABLE_PRODUCT_REVIEWS=true
ENABLE_SELLER_RATINGS=true

# Connection settings
MAGENTO_CONNECTION_TIMEOUT=30000
MAGENTO_RECEIVE_TIMEOUT=30000
```

### 2. Install Dependencies

```bash
flutter pub get
```

## Running the Example

### iOS Simulator

```bash
flutter run -d "iPhone 14 Pro"
```

### Android Emulator

```bash
flutter run -d emulator-5554
```

### Chrome (Web)

```bash
flutter run -d chrome
```

### macOS Desktop

```bash
flutter run -d macos
```

## Project Structure

```
example_marketplace/
├── lib/
│   ├── main.dart                 # Entry point
│   ├── screens/
│   │   ├── sellers_screen.dart   # Sellers list
│   │   ├── seller_detail_screen.dart
│   │   ├── seller_registration_screen.dart
│   │   └── seller_dashboard_screen.dart
│   ├── providers/
│   │   └── marketplace_provider.dart
│   └── widgets/
│       ├── seller_card.dart
│       └── rating_stars.dart
├── .env                          # Environment configuration
├── pubspec.yaml
└── README.md
```

## Available Screens

### 1. Sellers List
Browse all registered sellers with filtering and sorting options.

### 2. Seller Detail
View detailed information about a seller including:
- Company information
- Ratings and reviews
- Product catalog
- Business hours
- Contact information

### 3. Seller Registration
Register as a new seller with:
- Company details
- Business license
- Tax information
- Contact details

### 4. Seller Dashboard
For sellers to manage:
- Products
- Orders
- Statistics
- Reviews
- Profile settings

## API Endpoints Used

The example uses the following marketplace API endpoints:

- `GET /rest/V1/marketplace/sellers` - List sellers
- `GET /rest/V1/marketplace/sellers/:id` - Get seller details
- `POST /rest/V1/marketplace/sellers` - Register seller
- `PUT /rest/V1/marketplace/sellers/:id` - Update seller
- `GET /rest/V1/marketplace/sellers/:id/products` - Get seller products
- `GET /rest/V1/marketplace/sellers/:id/reviews` - Get seller reviews
- `POST /rest/V1/marketplace/sellers/:id/reviews` - Add review

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `MARKETPLACE` | Enable marketplace mode | `true` |
| `MAGENTO_API_URL` | Magento API base URL | Required |
| `ENABLE_SELLER_REGISTRATION` | Allow seller registration | `true` |
| `ENABLE_SELLER_DASHBOARD` | Enable seller dashboard | `true` |
| `ENABLE_PRODUCT_REVIEWS` | Enable product reviews | `true` |
| `ENABLE_SELLER_RATINGS` | Enable seller ratings | `true` |

## Differences from Standard Example

Unlike the standard `example/` app, this marketplace example:

- ✅ Focuses on **multi-seller features**
- ✅ Includes **seller-specific UI components**
- ✅ Demonstrates **seller dashboard functionality**
- ✅ Shows **advanced search and filtering**
- ✅ Implements **seller ratings and reviews**

## Testing

### Test Credentials

```
Email: test@scandipwa.com
Password: Test@123456
```

### Test Sellers

The demo environment includes several test sellers:
- Electronics Store
- Fashion Boutique  
- Home & Garden
- Sports Equipment

## Troubleshooting

### Marketplace Mode Not Working

1. Ensure `.env` file exists and `MARKETPLACE=true`
2. Check that marketplace module is installed on Magento backend
3. Verify API URL is correct

### API Connection Issues

1. Check `MAGENTO_API_URL` in `.env`
2. Verify network connectivity
3. Check CORS settings on Magento server

### Build Errors

```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

## Documentation

For more information, see:

- [Flutter Magento Documentation](../doc/README.md)
- [Marketplace API Reference](../doc/marketplace_api.md)
- [Backend Module Documentation](../module-marketplace/README.md)

## Support

- 📧 Email: contact@nativemind.net
- 🐛 Issues: https://github.com/your-repo/issues
- 📖 Docs: https://docs.flutter-magento.com

## License

MIT License - See LICENSE file for details
