# Specifications: flutter_magento_profile

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_profile provides implementations for `CustomerRepository`, `OrderRepository`, and `WishlistRepository`. It manages customer account data including addresses, order history, and wishlist.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| MagentoCustomerRepository | Create | Customer CRUD, addresses |
| MagentoOrderRepository | Create | Order history, details |
| MagentoWishlistRepository | Create | Wishlist management |
| Address model | Create | Shipping/billing addresses |
| Order model | Create | Order with items and status |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                   flutter_magento_profile                    │
├─────────────────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │  Customer    │  │    Order     │  │   Wishlist   │       │
│  │  Repository  │  │  Repository  │  │  Repository  │       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │   Address    │  │    Order     │  │   Wishlist   │       │
│  │    Model     │  │    Model     │  │    Model     │       │
│  └──────────────┘  └──────────────┘  └──────────────┘       │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### MagentoCustomerRepository

```dart
class MagentoCustomerRepository implements CustomerRepository {
  final MagentoTransport transport;

  @override
  Future<Customer> getCustomer();

  @override
  Future<Customer> updateCustomer(CustomerUpdate update);

  @override
  Future<List<Address>> getAddresses();

  @override
  Future<Address> addAddress(Address address);

  @override
  Future<Address> updateAddress(Address address);

  @override
  Future<void> deleteAddress(String addressId);

  @override
  Future<void> setDefaultShippingAddress(String addressId);

  @override
  Future<void> setDefaultBillingAddress(String addressId);
}
```

### MagentoOrderRepository

```dart
class MagentoOrderRepository implements OrderRepository {
  final MagentoTransport transport;

  @override
  Future<OrderPage> getOrders({
    required int page,
    required int pageSize,
  });

  @override
  Future<Order> getOrder(String orderId);

  @override
  Future<List<OrderItem>> getOrderItems(String orderId);

  Future<void> reorder(String orderId);
}
```

### MagentoWishlistRepository

```dart
class MagentoWishlistRepository implements WishlistRepository {
  final MagentoTransport transport;

  @override
  Future<Wishlist> getWishlist();

  @override
  Future<Wishlist> addItem(String sku);

  @override
  Future<Wishlist> removeItem(String itemId);

  @override
  Future<Cart> moveToCart(String itemId);

  Future<Cart> moveAllToCart();
}
```

## Data Models

### Address

```dart
class Address {
  final String? id;
  final String firstName;
  final String lastName;
  final String? company;
  final List<String> street;
  final String city;
  final String? region;
  final String? regionCode;
  final String postcode;
  final String countryCode;
  final String telephone;
  final bool isDefaultShipping;
  final bool isDefaultBilling;

  const Address({...});
}
```

### Order

```dart
class Order {
  final String id;
  final String orderNumber;
  final DateTime createdAt;
  final OrderStatus status;
  final Money grandTotal;
  final Money subtotal;
  final Money? shippingAmount;
  final Money? taxAmount;
  final Money? discountAmount;
  final ShippingAddress shippingAddress;
  final BillingAddress billingAddress;
  final String shippingMethod;
  final String paymentMethod;
  final List<OrderItem> items;
  final List<Shipment>? shipments;
  final List<Invoice>? invoices;

  const Order({...});
}

enum OrderStatus {
  pending,
  processing,
  complete,
  canceled,
  closed,
  holded,
}

class OrderItem {
  final String id;
  final String sku;
  final String name;
  final int quantityOrdered;
  final int quantityShipped;
  final int quantityRefunded;
  final Money price;
  final Money rowTotal;
  final String? thumbnailUrl;
  final Map<String, String>? selectedOptions;

  const OrderItem({...});
}

class OrderPage {
  final List<Order> items;
  final int totalCount;
  final int currentPage;
  final int pageSize;

  const OrderPage({...});
}
```

### Wishlist

```dart
class Wishlist {
  final String id;
  final List<WishlistItem> items;
  final int itemCount;

  const Wishlist({...});
}

class WishlistItem {
  final String id;
  final String sku;
  final String name;
  final Money price;
  final String? thumbnailUrl;
  final bool inStock;
  final DateTime addedAt;

  const WishlistItem({...});
}
```

### CustomerUpdate

```dart
class CustomerUpdate {
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? dateOfBirth;
  final Gender? gender;
  final bool? isSubscribedToNewsletter;

  const CustomerUpdate({...});
}
```

## GraphQL Queries

```graphql
query GetCustomerAddresses {
  customer {
    addresses {
      id firstname lastname company
      street city region { region_code region }
      postcode country_code telephone
      default_shipping default_billing
    }
  }
}

query GetCustomerOrders($pageSize: Int!, $currentPage: Int!) {
  customer {
    orders(pageSize: $pageSize, currentPage: $currentPage) {
      items {
        id number created_at status
        total { grand_total { value currency } }
        shipping_address { ... }
        items { ... }
      }
      total_count
      page_info { current_page page_size total_pages }
    }
  }
}

query GetWishlist {
  customer {
    wishlists {
      id items_count
      items_v2 {
        items {
          id product { sku name thumbnail { url } price_range { ... } }
          added_at
        }
      }
    }
  }
}
```

## Dependencies

### Requires

- flutter_magento_core
- flutter_magento_auth (for Customer model)

### Blocks

- flutter_magento_riverpod (profile providers)

## Package Structure

```
lib/
├── flutter_magento_profile.dart
└── src/
    ├── repositories/
    │   ├── magento_customer_repository.dart
    │   ├── magento_order_repository.dart
    │   └── magento_wishlist_repository.dart
    ├── models/
    │   ├── address.dart
    │   ├── order.dart
    │   ├── order_item.dart
    │   ├── wishlist.dart
    │   └── customer_update.dart
    └── mappers/
        ├── address_mapper.dart
        ├── order_mapper.dart
        └── wishlist_mapper.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
