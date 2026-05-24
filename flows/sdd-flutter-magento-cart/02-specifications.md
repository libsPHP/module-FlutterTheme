# Specifications: flutter_magento_cart

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_cart provides `CartRepository` implementation and `CartSessionManager` for automatic cart lifecycle. It handles guest/customer cart switching, configurable products, coupons, and totals calculation.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| MagentoCartRepository | Create | Implements CartRepository |
| CartSessionManager | Create | Auto cart lifecycle management |
| Cart model | Create | Full cart with items and totals |
| CartItem model | Create | Line item with product info |
| CartTotals model | Create | Subtotal, tax, discount, grand total |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    flutter_magento_cart                      │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │            CartSessionManager                       │     │
│  │    (Ensures cart exists, handles guest→customer)   │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌───────────────────────▼────────────────────────────┐     │
│  │          MagentoCartRepository                      │     │
│  │          implements CartRepository                  │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌──────────┐  ┌─────────▼───────┐  ┌──────────────────┐   │
│  │   Cart   │  │   CartItem      │  │   CartTotals     │   │
│  │  Model   │  │   Model         │  │   Model          │   │
│  └──────────┘  └─────────────────┘  └──────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### MagentoCartRepository

```dart
class MagentoCartRepository implements CartRepository {
  final MagentoTransport transport;
  final MagentoAuthStorage authStorage;
  final CartMapper _mapper;

  MagentoCartRepository({
    required this.transport,
    required this.authStorage,
  }) : _mapper = CartMapper();

  @override
  Future<Cart> getCurrentCart() async {
    final token = await authStorage.getCustomerToken();
    if (token != null) {
      return _getCustomerCart();
    }

    final cartId = await authStorage.getGuestCartId();
    if (cartId != null) {
      return _getGuestCart(cartId);
    }

    return createGuestCart();
  }

  @override
  Future<Cart> createGuestCart() async {
    final response = await transport.graphql(
      CartMutations.createEmptyCart,
      decoder: (json) => json['createEmptyCart'] as String,
    );
    final cartId = response.data;
    await authStorage.saveGuestCartId(cartId);
    return Cart.empty(id: cartId);
  }

  @override
  Future<Cart> addSimpleProduct({
    required String sku,
    required int quantity,
  });

  @override
  Future<Cart> addConfigurableProduct({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
  });

  @override
  Future<Cart> updateItemQuantity({
    required String itemId,
    required int quantity,
  });

  @override
  Future<Cart> removeItem(String itemId);

  @override
  Future<Cart> applyCoupon(String couponCode);

  @override
  Future<Cart> removeCoupon();

  @override
  Future<Cart> mergeGuestCartToCustomerCart() async {
    final guestCartId = await authStorage.getGuestCartId();
    if (guestCartId == null) {
      return getCurrentCart();
    }

    await transport.graphql(
      CartMutations.mergeCarts,
      variables: {'guestCartId': guestCartId},
      decoder: (_) => null,
    );

    await authStorage.clearGuestCartId();
    return getCurrentCart();
  }

  @override
  Future<void> clearCart();
}
```

### CartSessionManager

```dart
class CartSessionManager {
  final MagentoAuthStorage authStorage;
  final CartRepository cartRepository;
  final AuthRepository authRepository;

  CartSessionManager({
    required this.authStorage,
    required this.cartRepository,
    required this.authRepository,
  });

  /// Ensures a cart exists, creating one if needed
  Future<Cart> ensureCart() async {
    return cartRepository.getCurrentCart();
  }

  /// Handles login: merge guest cart to customer
  Future<Cart> onLogin() async {
    return cartRepository.mergeGuestCartToCustomerCart();
  }

  /// Handles logout: clear cart reference
  Future<void> onLogout() async {
    await authStorage.clearGuestCartId();
  }
}
```

## Data Models

### Cart

```dart
class Cart {
  final String id;
  final List<CartItem> items;
  final CartTotals totals;
  final String? appliedCoupon;
  final List<CartDiscount> discounts;
  final ShippingAddress? shippingAddress;
  final BillingAddress? billingAddress;
  final ShippingMethod? selectedShippingMethod;
  final String? email;

  const Cart({...});

  factory Cart.empty({required String id}) => Cart(
    id: id,
    items: const [],
    totals: CartTotals.zero(),
    discounts: const [],
  );

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  bool get isEmpty => items.isEmpty;
}
```

### CartItem

```dart
class CartItem {
  final String id;
  final String sku;
  final String name;
  final int quantity;
  final Money unitPrice;
  final Money rowTotal;
  final String? thumbnailUrl;
  final ProductType productType;
  final Map<String, String>? selectedOptions; // For configurables
  final List<String>? errors; // Stock issues, etc.

  const CartItem({...});
}
```

### CartTotals

```dart
class CartTotals {
  final Money subtotal;
  final Money subtotalWithDiscount;
  final Money grandTotal;
  final Money? shippingAmount;
  final Money? taxAmount;
  final Money? discountAmount;

  const CartTotals({...});

  factory CartTotals.zero() => CartTotals(
    subtotal: Money(value: 0, currency: 'USD'),
    subtotalWithDiscount: Money(value: 0, currency: 'USD'),
    grandTotal: Money(value: 0, currency: 'USD'),
  );
}

class CartDiscount {
  final String code;
  final String label;
  final Money amount;

  const CartDiscount({...});
}
```

## GraphQL Mutations

```graphql
mutation CreateEmptyCart {
  createEmptyCart
}

mutation AddSimpleProductsToCart($cartId: String!, $sku: String!, $quantity: Float!) {
  addSimpleProductsToCart(input: {
    cart_id: $cartId
    cart_items: [{ data: { sku: $sku, quantity: $quantity } }]
  }) {
    cart { ...CartFields }
  }
}

mutation AddConfigurableProductToCart($cartId: String!, $parentSku: String!,
                                       $variantSku: String!, $quantity: Float!) {
  addConfigurableProductsToCart(input: {
    cart_id: $cartId
    cart_items: [{
      parent_sku: $parentSku
      data: { sku: $variantSku, quantity: $quantity }
    }]
  }) {
    cart { ...CartFields }
  }
}

mutation UpdateCartItems($cartId: String!, $itemId: Int!, $quantity: Float!) {
  updateCartItems(input: {
    cart_id: $cartId
    cart_items: [{ cart_item_id: $itemId, quantity: $quantity }]
  }) {
    cart { ...CartFields }
  }
}

mutation RemoveItemFromCart($cartId: String!, $itemId: Int!) {
  removeItemFromCart(input: { cart_id: $cartId, cart_item_id: $itemId }) {
    cart { ...CartFields }
  }
}

mutation ApplyCouponToCart($cartId: String!, $couponCode: String!) {
  applyCouponToCart(input: { cart_id: $cartId, coupon_code: $couponCode }) {
    cart { ...CartFields }
  }
}

mutation MergeCarts($guestCartId: String!) {
  mergeCarts(source_cart_id: $guestCartId) {
    ...CartFields
  }
}
```

## Dependencies

### Requires

- flutter_magento_core

### Blocks

- flutter_magento_riverpod (cart providers)
- flutter_magento (umbrella)

## Package Structure

```
lib/
├── flutter_magento_cart.dart
└── src/
    ├── repository/
    │   └── magento_cart_repository.dart
    ├── services/
    │   └── cart_session_manager.dart
    ├── models/
    │   ├── cart.dart
    │   ├── cart_item.dart
    │   ├── cart_totals.dart
    │   └── cart_discount.dart
    ├── mappers/
    │   └── cart_mapper.dart
    └── mutations/
        └── cart_mutations.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
