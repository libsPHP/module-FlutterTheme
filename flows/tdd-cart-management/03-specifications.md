# Specifications: Cart Management

> Version: 1.0 (Retrospective)  
> Status: APPROVED  
> Last Updated: March 1, 2026  
> Requirements: [01-requirements.md](01-requirements.md)  
> Tests: [02-tests.md](02-tests.md)

---

## Overview

Cart management system with support for guest and customer carts, item operations, persistence, and automatic totals calculation.

---

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `CartService` | Create | Core cart management service |
| `CartApi` | Create | API client for cart endpoints |
| `CartModels` | Create | Cart, CartItem models |
| `AuthService` | Integrate | Guest vs customer cart handling |

---

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                      UI Layer                                │
│  (CartScreen, ProductCard, MiniCart)                        │
└────────────────────┬────────────────────────────────────────┘
                     │ uses
┌────────────────────▼────────────────────────────────────────┐
│                   CartService                                │
│  - createCart()                                              │
│  - addItem()                                                 │
│  - updateItem()                                              │
│  - removeItem()                                              │
│  - getCart()                                                 │
└──────────┬─────────────────────────────────┬────────────────┘
           │                                 │
┌──────────▼──────────┐           ┌─────────▼────────────────┐
│    CartApi          │           │   AuthService            │
│  - REST calls       │           │  - Guest vs Customer     │
│  - /carts/*         │           │  - Cart merge on login   │
│  - /guest-carts/*   │           └──────────────────────────┘
└──────────┬──────────┘
           │
┌──────────▼──────────────────────────────────────────────────┐
│              Storage Layer                                   │
│  ┌────────────────────┐  ┌────────────────────────────────┐ │
│  │ SharedPreferences  │  │  Local Cart (Guest)            │ │
│  │ - cart_id          │  │  - Temporary storage           │ │
│  │ - cart data        │  │  - Merge on login              │ │
│  └────────────────────┘  └────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

---

## Data Models

### Cart

```dart
@freezed
class Cart with _$Cart {
  const factory Cart({
    String? id,
    required List<CartItem> items,
    required double grandTotal,
    required double subtotal,
    double? tax,
    double? shippingCost,
    String? couponCode,
  }) = _Cart;
  
  int get itemCount => items.fold(0, (sum, item) => sum + item.qty);
  bool get isEmpty => items.isEmpty;
}
```

### CartItem

```dart
@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int itemId,
    required String sku,
    required String name,
    required double price,
    required int qty,
    String? imageUrl,
    Map<String, dynamic>? productOptions,
  }) = _CartItem;
  
  double get rowTotal => price * qty;
}
```

---

## Interfaces

### CartService Public API

```dart
class CartService {
  // State
  Cart? get currentCart;
  int get itemsCount;
  double get cartTotal;
  
  // Operations
  Future<String> createCart();
  Future<void> addItem(String sku, int qty, {Map<String, dynamic>? options});
  Future<void> updateItem(int itemId, int qty);
  Future<void> removeItem(int itemId);
  Future<Cart> getCart();
  Future<void> clearCart();
}
```

---

## Behavior Specifications

### Happy Path - Add to Cart

1. User views product
2. Taps "Add to Cart"
3. CartService checks if cart exists
4. If no cart → creates new cart
5. Calls CartApi.addItem()
6. Magento returns updated cart
7. CartService updates state
8. UI shows success message, updates cart count

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Guest adds items | Not logged in | Create guest cart, store locally |
| Guest logs in | Has guest cart | Merge guest cart with customer cart |
| Add same product twice | SKU already in cart | Increase quantity, don't duplicate |
| Add configurable product | Has options | Store options with item |

---

## Testing Strategy

### Unit Tests (from 02-tests.md)

- [ ] T001: Add item to cart
- [ ] T002: Update item quantity
- [ ] T003: Remove item from cart
- [ ] T004: Empty cart display
- [ ] T005: Guest cart
- [ ] T006: Cart persistence
- [ ] T007: Cart total calculation

### Integration Tests

- [ ] Complete shopping flow
- [ ] Cart merge on login
- [ ] Network error handling

---

## Approval

- [x] Reviewed by: AI Assistant (Retrospective)
- [x] Approved on: March 1, 2026
