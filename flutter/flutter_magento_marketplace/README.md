# flutter_magento_marketplace

[![pub package](https://img.shields.io/pub/v/flutter_magento_marketplace.svg)](https://pub.dev/packages/flutter_magento_marketplace)

Multi-vendor marketplace support for Flutter Magento SDK.

## Features

- Seller profiles and listings
- Seller ratings and reviews
- Product-seller relationships
- Cart grouping by seller
- Split checkout support
- Seller filtering and search

## Installation

```yaml
dependencies:
  flutter_magento_marketplace: ^1.0.0
```

## Usage

### Setup

```dart
import 'package:flutter_magento_marketplace/flutter_magento_marketplace.dart';

final sellerRepository = MagentoSellerRepository(
  transport: myGraphQLTransport,
);
```

### Get Sellers

```dart
final sellers = await sellerRepository.getSellers(
  page: 1,
  pageSize: 20,
  filter: SellerFilter(
    isVerified: true,
    minRating: 4.0,
  ),
  sort: SellerSort.rating,
);

for (final seller in sellers.items) {
  print('${seller.name} - ${seller.rating} stars');
}
```

### Get Seller Details

```dart
final seller = await sellerRepository.getSellerById('seller-123');

print(seller.name);
print(seller.description);
print('Rating: ${seller.rating} (${seller.reviewCount} reviews)');
print('Products: ${seller.productCount}');

if (seller.location != null) {
  print('Location: ${seller.location!.city}, ${seller.location!.country}');
}
```

### Featured Sellers

```dart
final featured = await sellerRepository.getFeaturedSellers(limit: 5);
```

### Seller Products Extension

```dart
final extension = SellerProductExtension(
  sellerRepository: sellerRepository,
);

// Get seller info for a product
final sellerInfo = await extension.getSellerForProduct(product);
if (sellerInfo != null) {
  print('Sold by: ${sellerInfo.name}');
}

// Enrich products with seller data
final enrichedProducts = await extension.enrichWithSellerInfo(products);
```

### Cart by Seller

```dart
final cartExtension = MarketplaceCartExtension(
  sellerRepository: sellerRepository,
);

// Group cart items by seller
final cartBySeller = await cartExtension.getCartBySeller(cart);

for (final entry in cartBySeller.entries) {
  final seller = entry.key;
  final items = entry.value;

  print('${seller?.name ?? "Unknown Seller"}:');
  for (final item in items) {
    print('  - ${item.name} x${item.quantity}');
  }
}
```

### Split Checkout

```dart
final checkoutExtension = MarketplaceCheckoutExtension(
  sellerRepository: sellerRepository,
);

// Create separate orders per seller
final orders = await checkoutExtension.createSplitOrders(
  cart: cart,
  shippingAddress: address,
  paymentMethod: payment,
);

for (final order in orders) {
  print('Order ${order.orderId} for seller ${order.sellerId}');
}
```

## Models

```dart
class Seller extends MagentoEntity {
  final String id;
  final String name;
  final String urlKey;
  final String? logo;
  final String? banner;
  final String? description;
  final double rating;
  final int reviewCount;
  final int productCount;
  final bool isVerified;
  final SellerLocation? location;
  final SellerStatistics? statistics;
}

class SellerLocation {
  final String? address;
  final String? city;
  final String? region;
  final String? country;
  final double? latitude;
  final double? longitude;
}

class SellerReview {
  final String id;
  final String sellerId;
  final String customerName;
  final int rating;
  final String? title;
  final String? comment;
  final DateTime createdAt;
}
```

## API Reference

| Class | Description |
|-------|-------------|
| `SellerRepository` | Seller operations interface |
| `MagentoSellerRepository` | Seller repository implementation |
| `SellerProductExtension` | Product-seller enrichment |
| `MarketplaceCartExtension` | Cart grouping by seller |
| `MarketplaceCheckoutExtension` | Split checkout |
| `SellerMapper` | Maps seller data |
| `SellerQueries` | GraphQL queries |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_catalog](https://pub.dev/packages/flutter_magento_catalog) - Product catalog
- [flutter_magento_cart](https://pub.dev/packages/flutter_magento_cart) - Shopping cart
