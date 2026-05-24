# Specifications: flutter_magento_marketplace

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_marketplace provides multi-vendor marketplace support as extensions to the core SDK. It handles seller management, vendor-filtered catalog, split checkout, and commission tracking.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| SellerRepository | Create | Seller CRUD operations |
| SellerProductExtension | Create | Product-seller relationship |
| MarketplaceCartExtension | Create | Split cart handling |
| MarketplaceCheckoutExtension | Create | Multi-vendor checkout |
| Seller model | Create | Seller entity |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                flutter_magento_marketplace                   │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │              SellerRepository                       │     │
│  │    (extends pattern from core repositories)         │     │
│  └────────────────────────────────────────────────────┘     │
│                                                              │
│  ┌────────────────────────────────────────────────────┐     │
│  │              Product Extensions                      │     │
│  │  ┌──────────────┐  ┌──────────────┐               │     │
│  │  │SellerProduct │  │ Commission   │               │     │
│  │  │  Extension   │  │  Extension   │               │     │
│  │  └──────────────┘  └──────────────┘               │     │
│  └────────────────────────────────────────────────────┘     │
│                                                              │
│  ┌────────────────────────────────────────────────────┐     │
│  │              Checkout Extensions                     │     │
│  │  ┌──────────────┐  ┌──────────────┐               │     │
│  │  │ SplitCart    │  │ MultiVendor  │               │     │
│  │  │  Handler     │  │  Shipping    │               │     │
│  │  └──────────────┘  └──────────────┘               │     │
│  └────────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
           │
           ▼
┌─────────────────────────────────────────────────────────────┐
│                   flutter_magento_core                       │
│          MagentoExtensionRegistry, Repositories              │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### SellerRepository

```dart
abstract interface class SellerRepository {
  Future<SellerPage> getSellers({
    required int page,
    required int pageSize,
    SellerFilter? filter,
    SellerSort? sort,
  });

  Future<Seller> getSellerById(String sellerId);

  Future<Seller> getSellerByUrlKey(String urlKey);

  Future<List<Seller>> getFeaturedSellers();

  Future<SellerStatistics> getSellerStatistics(String sellerId);

  Future<List<SellerReview>> getSellerReviews({
    required String sellerId,
    required int page,
    required int pageSize,
  });

  Future<void> submitSellerReview({
    required String sellerId,
    required int rating,
    required String review,
  });
}

class MagentoSellerRepository implements SellerRepository {
  final MagentoTransport transport;

  MagentoSellerRepository(this.transport);

  // Implementation using GraphQL/REST
}
```

### SellerProductExtension

```dart
class SellerProductExtension implements MagentoProductExtension<SellerInfo> {
  @override
  String get code => 'seller';

  @override
  SellerInfo fromProduct(ProductDetails product) {
    final sellerId = product.attr<String>('seller_id');
    final sellerName = product.attr<String>('seller_name');
    final sellerUrl = product.attr<String>('seller_url');

    if (sellerId == null) return SellerInfo.none();

    return SellerInfo(
      sellerId: sellerId,
      sellerName: sellerName ?? 'Unknown Seller',
      sellerUrl: sellerUrl,
      rating: product.attr<double>('seller_rating'),
      productCount: product.attr<int>('seller_product_count'),
    );
  }
}

class SellerInfo {
  final String sellerId;
  final String sellerName;
  final String? sellerUrl;
  final double? rating;
  final int? productCount;

  const SellerInfo({...});

  factory SellerInfo.none() => SellerInfo(sellerId: '', sellerName: '');

  bool get hasSeller => sellerId.isNotEmpty;
}
```

### MarketplaceCartExtension

```dart
class MarketplaceCartExtension {
  final CartRepository cartRepository;
  final SellerRepository sellerRepository;

  MarketplaceCartExtension({
    required this.cartRepository,
    required this.sellerRepository,
  });

  /// Group cart items by seller
  Future<Map<Seller, List<CartItem>>> getCartBySeller(Cart cart) async {
    final grouped = <String, List<CartItem>>{};

    for (final item in cart.items) {
      final sellerId = item.customAttributes['seller_id'] as String?;
      if (sellerId != null) {
        grouped.putIfAbsent(sellerId, () => []).add(item);
      }
    }

    final result = <Seller, List<CartItem>>{};
    for (final entry in grouped.entries) {
      final seller = await sellerRepository.getSellerById(entry.key);
      result[seller] = entry.value;
    }

    return result;
  }

  /// Get subtotals per seller
  Map<String, Money> getSubtotalsBySeller(Cart cart);
}
```

### MarketplaceCheckoutExtension

```dart
class MarketplaceCheckoutExtension {
  final CheckoutRepository checkoutRepository;
  final SellerRepository sellerRepository;

  MarketplaceCheckoutExtension({
    required this.checkoutRepository,
    required this.sellerRepository,
  });

  /// Get shipping methods per seller
  Future<Map<String, List<ShippingMethod>>> getShippingMethodsBySeller(
    Cart cart,
  ) async;

  /// Set shipping method for specific seller
  Future<Cart> setSellerShippingMethod({
    required String sellerId,
    required ShippingMethodCode method,
  });

  /// Place split order (one order per seller)
  Future<List<OrderResult>> placeSplitOrder({
    required String paymentMethodCode,
    Map<String, dynamic>? paymentData,
  });
}
```

## Data Models

### Seller

```dart
class Seller extends MagentoEntity {
  final String id;
  final String name;
  final String? description;
  final String? logoUrl;
  final String? bannerUrl;
  final String urlKey;
  final double rating;
  final int reviewCount;
  final int productCount;
  final bool isVerified;
  final bool isVacationMode;
  final DateTime joinedAt;
  final SellerLocation? location;
  final Map<String, String>? socialLinks;
  final List<String>? badges;

  const Seller({...});
}

class SellerLocation {
  final String? city;
  final String? region;
  final String countryCode;

  const SellerLocation({...});
}

class SellerStatistics {
  final int totalOrders;
  final int completedOrders;
  final double fulfillmentRate;
  final Duration avgShippingTime;
  final Money totalSales;
  final double commissionRate;

  const SellerStatistics({...});
}

class SellerReview {
  final String id;
  final String customerId;
  final String customerName;
  final int rating;
  final String? title;
  final String review;
  final DateTime createdAt;

  const SellerReview({...});
}
```

### SellerFilter

```dart
class SellerFilter {
  final String? location;
  final double? minRating;
  final List<String>? categories;
  final bool? verified;
  final bool? featured;

  const SellerFilter({...});

  Map<String, dynamic> toGraphQl() => {...};
}

enum SellerSortField { name, rating, productCount, joinedAt }

class SellerSort {
  final SellerSortField field;
  final SortDirection direction;

  const SellerSort({...});
}
```

## GraphQL Queries

```graphql
query GetSellers($filter: SellerFilterInput, $sort: SellerSortInput,
                 $pageSize: Int!, $currentPage: Int!) {
  marketplace_sellers(
    filter: $filter
    sort: $sort
    pageSize: $pageSize
    currentPage: $currentPage
  ) {
    items {
      id name url_key description
      logo_url banner_url
      rating review_count product_count
      is_verified vacation_mode
      created_at
      location { city region country_code }
    }
    total_count
    page_info { current_page page_size total_pages }
  }
}

query GetSellerById($id: String!) {
  marketplace_seller(id: $id) {
    id name description
    # ... full seller fields
    statistics {
      total_orders completed_orders
      fulfillment_rate avg_shipping_time
    }
  }
}
```

## Registration

```dart
// In app initialization
final magento = MagentoClient(...);

// Register marketplace extensions
final sellerRepo = MagentoSellerRepository(magento.transport);

magento.extensions.register<SellerRepository>(sellerRepo);

magento.extensions.register<SellerProductExtension>(
  SellerProductExtension(),
);

magento.extensions.register<MarketplaceCartExtension>(
  MarketplaceCartExtension(
    cartRepository: magento.cart,
    sellerRepository: sellerRepo,
  ),
);

magento.extensions.register<MarketplaceCheckoutExtension>(
  MarketplaceCheckoutExtension(
    checkoutRepository: magento.checkout,
    sellerRepository: sellerRepo,
  ),
);
```

## Dependencies

### Requires

- flutter_magento_core
- flutter_magento_cart
- flutter_magento_catalog

## Package Structure

```
lib/
├── flutter_magento_marketplace.dart
└── src/
    ├── repositories/
    │   └── magento_seller_repository.dart
    ├── extensions/
    │   ├── seller_product_extension.dart
    │   ├── marketplace_cart_extension.dart
    │   └── marketplace_checkout_extension.dart
    ├── models/
    │   ├── seller.dart
    │   ├── seller_info.dart
    │   ├── seller_statistics.dart
    │   ├── seller_review.dart
    │   ├── seller_filter.dart
    │   └── seller_sort.dart
    └── mappers/
        └── seller_mapper.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
