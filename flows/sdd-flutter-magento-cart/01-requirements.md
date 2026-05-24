# Requirements: flutter_magento_cart

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24

## Problem Statement

Cart management is complex in Magento: guest vs customer carts, configurable products, coupons, cart rules. The cart package provides `CartRepository` implementation that handles all complexity transparently, so Flutter app just works with a simple cart interface.

## User Stories

### Primary

**As a** Flutter developer
**I want** transparent guest/customer cart handling
**So that** my UI code doesn't branch on authentication state

**As a** Flutter developer
**I want** to add any product type (simple, configurable, bundle)
**So that** I can build a complete shopping experience

**As a** Flutter developer
**I want** real-time cart totals with taxes and discounts
**So that** I can show accurate pricing

### Secondary

**As a** Flutter developer
**I want** optimistic updates
**So that** UI feels responsive during cart operations

**As a** Flutter developer
**I want** cart persistence across sessions
**So that** users don't lose their selections

## Acceptance Criteria

### Must Have

1. **Given** no cart exists
   **When** `getCurrentCart()` is called
   **Then** new guest cart is created automatically

2. **Given** guest cart exists and user logs in
   **When** `mergeGuestCartToCustomerCart()` is called
   **Then** items transfer to customer cart

3. **Given** configurable product
   **When** `addConfigurableProduct()` is called with options
   **Then** correct variant is added to cart

4. **Given** valid coupon code
   **When** `applyCoupon()` is called
   **Then** discount is applied and totals updated

5. **Given** item in cart
   **When** `updateItemQuantity()` or `removeItem()` is called
   **Then** cart updates and totals recalculate

### Should Have

- CartSessionManager for automatic cart lifecycle
- Cart item validation (stock check)
- Price change notifications
- Save for later functionality

### Won't Have (This Iteration)

- Multi-cart support
- Wishlist integration (separate package)
- Gift wrapping

## Constraints

- **Technical**: Depend on flutter_magento_core
- **Business**: Respect Magento's cart rules and minimum order

## References

- Magento GraphQL Cart API
- Magento Cart Rules documentation
