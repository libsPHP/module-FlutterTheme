# Test Cases: Cart Management

> Version: 1.0 (Retrospective)  
> Status: APPROVED  
> Last Updated: March 1, 2026

---

## Overview

Test cases for cart management functionality. Each test maps to a requirement from `01-requirements.md`.

---

## Test: Add Item to Cart

**ID**: T001  
**Requirement**: R001 - Add products to cart  
**Type**: Functional

### Scenario

**Given**: User is viewing a product  
**When**: User taps "Add to Cart" button  
**Then**: Item is added to cart, cart count increments

### Examples

| Product SKU | Quantity | Expected Cart Count |
|-------------|----------|---------------------|
| PROD-001 | 1 | 1 |
| PROD-002 | 2 | 3 |
| PROD-003 | 1 | 4 |

### Edge Cases

- Product already in cart → quantity should increase
- Out of stock product → show error, don't add
- Network error → show error, retry option

---

## Test: Update Item Quantity

**ID**: T002  
**Requirement**: R002 - Update quantities  
**Type**: Functional

### Scenario

**Given**: Cart has 1 item with quantity 1  
**When**: User changes quantity to 3  
**Then**: Item quantity updates, total recalculates

### Examples

| Initial Qty | New Qty | Total Change |
|-------------|---------|--------------|
| 1 | 2 | +100% |
| 1 | 5 | +400% |
| 3 | 1 | -66% |

### Edge Cases

- Quantity = 0 → Remove item from cart
- Quantity > stock → Show max available
- Negative quantity → Invalid, reject

---

## Test: Remove Item from Cart

**ID**: T003  
**Requirement**: R003 - Remove items  
**Type**: Functional

### Scenario

**Given**: Cart has 3 items  
**When**: User removes 1 item  
**Then**: Cart has 2 items, total updates

### Examples

| Initial Items | Remove Item | Final Items |
|---------------|-------------|-------------|
| 3 | Item 1 | 2 |
| 2 | Item 2 | 1 |
| 1 | Item 1 | 0 |

### Edge Cases

- Last item removed → Show "Cart is empty"
- Remove non-existent item → No error, silent fail
- Network error → Show error, item remains

---

## Test: Empty Cart Display

**ID**: T004  
**Requirement**: R004 - Empty cart state  
**Type**: Functional

### Scenario

**Given**: Cart is empty  
**When**: User opens cart screen  
**Then**: Shows "Cart is empty" message with CTA

### Expected UI

```
+------------------+
|                  |
|    🛒 (icon)     |
|                  |
|  Your cart is    |
|     empty        |
|                  |
|  [Start Shopping]|
|                  |
+------------------+
```

---

## Test: Guest Cart

**ID**: T005  
**Requirement**: R005 - Guest cart support  
**Type**: Functional

### Scenario

**Given**: User is not logged in (guest)  
**When**: User adds items to cart  
**Then**: Items stored locally, cart works normally

### Examples

| Action | Expected Result |
|--------|-----------------|
| Add item | Item appears in cart |
| Update qty | Quantity updates |
| Remove item | Item removed |

### Edge Cases

- Guest logs in → Merge guest cart with customer cart
- Guest closes app → Cart persists on return
- Clear app data → Guest cart lost

---

## Test: Cart Persistence

**ID**: T006  
**Requirement**: R006 - Cart persistence  
**Type**: Functional

### Scenario

**Given**: User has 2 items in cart  
**When**: User closes and reopens app  
**Then**: Cart still has 2 items

### Examples

| Time Gap | Expected Cart State |
|----------|---------------------|
| 1 minute | Same items |
| 1 hour | Same items |
| 1 day | Same items |
| 7 days | Same items (if store allows) |

---

## Test: Cart Total Calculation

**ID**: T007  
**Requirement**: Should Have - Automatic totals  
**Type**: Functional

### Scenario

**Given**: Cart has multiple items  
**When**: Items are added/updated/removed  
**Then**: Grand total updates automatically

### Examples

| Items | Subtotal | Tax | Shipping | Total |
|-------|----------|-----|----------|-------|
| 1x $50 | $50 | $5 | $10 | $65 |
| 2x $50 | $100 | $10 | $10 | $120 |
| 1x $50 + 1x $30 | $80 | $8 | $10 | $98 |

---

## Integration Flow: Complete Shopping Flow

End-to-end test across multiple components:

```
Browse Products → Add to Cart → View Cart → Update Qty → Checkout
```

### Scenario

**Given**: User is on products screen  
**When**: User completes full shopping flow  
**Then**: Order is placed successfully

### Steps

1. Browse products, select 2 products
2. Add both to cart (1 each)
3. Navigate to cart screen
4. Verify 2 items in cart
5. Update quantity of item 1 to 2
6. Remove item 2 from cart
7. Verify only item 1 remains with qty 2
8. Proceed to checkout

### Verification Points

- ✅ Cart count updates after each add
- ✅ Cart total recalculates on qty change
- ✅ Removed item no longer in cart
- ✅ Checkout receives correct cart data

---

## Error Scenarios

### Test: Network Error on Add to Cart

**ID**: E001  
**Requirement**: R001  
**Type**: Error

**Given**: Device is offline  
**When**: User tries to add item to cart  
**Then**: 
- System displays error: "No internet connection"
- Item NOT added to cart
- User can retry when online

---

### Test: Out of Stock Product

**ID**: E002  
**Requirement**: R001  
**Type**: Error

**Given**: Product is out of stock  
**When**: User tries to add to cart  
**Then**:
- System displays: "Out of stock"
- "Add to Cart" button disabled
- Item NOT added

---

### Test: Cart Merge on Login

**ID**: E003  
**Requirement**: R005  
**Type**: Integration

**Given**: Guest cart has 2 items  
**When**: User logs in (customer cart has 1 item)  
**Then**:
- Guest cart items merge with customer cart
- Total items: 3 (or quantities merged if same product)
- No items lost

---

## Test Coverage Matrix

| Requirement ID | Test IDs | Status |
|----------------|----------|--------|
| R001 (Add to cart) | T001, E001, E002 | Covered |
| R002 (Update qty) | T002 | Covered |
| R003 (Remove) | T003 | Covered |
| R004 (Empty cart) | T004 | Covered |
| R005 (Guest cart) | T005, E003 | Covered |
| R006 (Persistence) | T006 | Covered |
| Should Have (Totals) | T007 | Covered |

---

## Notes

- All tests should run on iOS, Android, Web
- Mock Magento API for unit tests
- Use real API for integration tests
- Test with various product types (simple, configurable)

---

## Approval

- [x] Reviewed by: AI Assistant (Retrospective)
- [x] Approved on: March 1, 2026
