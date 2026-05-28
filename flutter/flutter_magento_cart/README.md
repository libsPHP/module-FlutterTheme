# flutter_magento_cart

[![pub package](https://img.shields.io/pub/v/flutter_magento_cart.svg)](https://pub.dev/packages/flutter_magento_cart)

Cart module for Flutter Magento SDK - shopping cart management and checkout.

## Features

- Add/remove/update cart items
- Simple and configurable product support
- Coupon code management
- Cart totals calculation
- Guest and customer carts
- Merge guest cart on login

## Installation

```yaml
dependencies:
  flutter_magento_cart: ^1.0.0
```

## Usage

### Setup

```dart
import 'package:flutter_magento_cart/flutter_magento_cart.dart';

final cartRepository = MagentoCartRepository(
  transport: myGraphQLTransport,
);
```

### Create/Get Cart

```dart
// Create new cart (guest)
final cartId = await cartRepository.createCart();

// Get cart contents
final cart = await cartRepository.getCart(cartId);
print('Items: ${cart.items.length}');
print('Total: ${cart.totals.grandTotal.formatted}');
```

### Add Simple Product

```dart
final cart = await cartRepository.addSimpleProduct(
  cartId: cartId,
  sku: 'SHIRT-001',
  quantity: 2,
);
```

### Add Configurable Product

```dart
final cart = await cartRepository.addConfigurableProduct(
  cartId: cartId,
  parentSku: 'SHIRT-CONFIG',
  variantSku: 'SHIRT-CONFIG-M-BLUE',
  quantity: 1,
);
```

### Update Quantity

```dart
final cart = await cartRepository.updateItem(
  cartId: cartId,
  itemId: cart.items.first.id,
  quantity: 3,
);
```

### Remove Item

```dart
final cart = await cartRepository.removeItem(
  cartId: cartId,
  itemId: itemToRemove.id,
);
```

### Apply Coupon

```dart
try {
  final cart = await cartRepository.applyCoupon(
    cartId: cartId,
    couponCode: 'SAVE20',
  );
  print('Coupon applied! New total: ${cart.totals.grandTotal.formatted}');
} on MagentoException catch (e) {
  print('Invalid coupon: ${e.message}');
}
```

### Remove Coupon

```dart
final cart = await cartRepository.removeCoupon(cartId);
```

### Merge Guest Cart

```dart
// After customer login, merge guest cart
await cartRepository.mergeCarts(
  guestCartId: guestCartId,
  customerCartId: customerCartId,
);
```

## Cart Model

```dart
class Cart {
  final String id;
  final List<CartItem> items;
  final CartTotals totals;
  final String? appliedCoupon;
  final int itemCount;
}

class CartItem {
  final String id;
  final String sku;
  final String name;
  final int quantity;
  final Money price;
  final Money rowTotal;
  final String? imageUrl;
  final List<SelectedOption> selectedOptions;
}

class CartTotals {
  final Money subtotal;
  final Money grandTotal;
  final List<CartDiscount> discounts;
  final Money? shippingAmount;
  final Money? taxAmount;
}
```

## API Reference

| Class | Description |
|-------|-------------|
| `MagentoCartRepository` | Main cart repository |
| `CartMapper` | Maps cart data |
| `CartQueries` | GraphQL queries |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_ui](https://pub.dev/packages/flutter_magento_ui) - Cart widgets
- [flutter_magento_riverpod](https://pub.dev/packages/flutter_magento_riverpod) - Cart state management
- [flutter_magento_offline](https://pub.dev/packages/flutter_magento_offline) - Offline cart queue
