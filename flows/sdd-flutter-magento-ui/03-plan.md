# Implementation Plan: flutter_magento_ui

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_ui provides reusable Flutter widgets for e-commerce patterns. Widgets consume SDK models directly, are themeable via MagentoTheme, and state-management agnostic. Organized by domain: product, cart, forms, search, utility.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_ui/lib/flutter_magento_ui.dart` - Modify
  - `packages/flutter_magento_ui/lib/flutter_magento_ui_method_channel.dart` - Delete
  - `packages/flutter_magento_ui/lib/flutter_magento_ui_platform_interface.dart` - Delete
  - `packages/flutter_magento_ui/android/` - Delete
  - `packages/flutter_magento_ui/ios/` - Delete
  - `packages/flutter_magento_ui/linux/` - Delete
  - `packages/flutter_magento_ui/macos/` - Delete
  - `packages/flutter_magento_ui/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, cached_network_image
- **Files**:
  - `packages/flutter_magento_ui/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Theme System

#### Task 2.1: Create MagentoThemeData
- **Description**: Theme data class with colors, typography, spacing
- **Files**:
  - `packages/flutter_magento_ui/lib/src/theme/magento_theme_data.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Defaults work
- **Complexity**: Medium

#### Task 2.2: Create MagentoTheme InheritedWidget
- **Description**: Theme provider widget
- **Files**:
  - `packages/flutter_magento_ui/lib/src/theme/magento_theme.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Theme accessible from context
- **Complexity**: Low

#### Task 2.3: Create Style Classes
- **Description**: MagentoProductCardStyle, MagentoPriceStyle
- **Files**:
  - `packages/flutter_magento_ui/lib/src/theme/styles/product_card_style.dart` - Create
  - `packages/flutter_magento_ui/lib/src/theme/styles/price_style.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Styles apply correctly
- **Complexity**: Low

### Phase 3: Utility Widgets

#### Task 3.1: Create MagentoRatingStars
- **Description**: Rating stars display/input
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/utility/magento_rating_stars.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Interactive and display modes work
- **Complexity**: Low

#### Task 3.2: Create MagentoQuantitySelector
- **Description**: +/- quantity input
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/utility/magento_quantity_selector.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Min/max constraints work
- **Complexity**: Low

#### Task 3.3: Create MagentoStockStatus
- **Description**: In/out of stock indicator
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/utility/magento_stock_status.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Low stock threshold works
- **Complexity**: Low

#### Task 3.4: Create MagentoDiscountBadge
- **Description**: Sale percentage badge
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/utility/magento_discount_badge.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Badge displays correctly
- **Complexity**: Low

### Phase 4: Product Widgets

#### Task 4.1: Create MagentoPrice
- **Description**: Price display with regular/sale styling
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/product/magento_price.dart` - Create
- **Dependencies**: Task 2.3
- **Verification**: Sale price strikethrough works
- **Complexity**: Low

#### Task 4.2: Create MagentoProductCard
- **Description**: Product card for grid/list views
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/product/magento_product_card.dart` - Create
- **Dependencies**: Task 4.1, Task 3.1, Task 3.3, Task 3.4
- **Verification**: Card renders with all elements
- **Complexity**: Medium

#### Task 4.3: Create MagentoProductGallery
- **Description**: Image gallery with thumbnails and zoom
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/product/magento_product_gallery.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Gallery swipe and zoom work
- **Complexity**: Medium

#### Task 4.4: Create MagentoOptionSelector
- **Description**: Configurable product option selector
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/product/magento_option_selector.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Swatch and dropdown options work
- **Complexity**: Medium

### Phase 5: Cart Widgets

#### Task 5.1: Create MagentoCartBadge
- **Description**: Badge showing cart item count
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/cart/magento_cart_badge.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Badge shows/hides correctly
- **Complexity**: Low

#### Task 5.2: Create MagentoCartItemRow
- **Description**: Cart item display with quantity controls
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/cart/magento_cart_item_row.dart` - Create
- **Dependencies**: Task 3.2, Task 4.1
- **Verification**: Quantity update and remove work
- **Complexity**: Medium

#### Task 5.3: Create MagentoCartTotals
- **Description**: Cart totals summary
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/cart/magento_cart_totals.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: All totals display
- **Complexity**: Low

#### Task 5.4: Create MagentoCouponField
- **Description**: Coupon input with apply/remove
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/cart/magento_coupon_field.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Apply and remove work
- **Complexity**: Low

### Phase 6: Form and Search Widgets

#### Task 6.1: Create MagentoAddressForm
- **Description**: Address form with validation
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/forms/magento_address_form.dart` - Create
- **Dependencies**: Task 6.2
- **Verification**: Form validation works
- **Complexity**: High

#### Task 6.2: Create MagentoCountrySelector
- **Description**: Country/region dropdown
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/forms/magento_country_selector.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Region updates on country change
- **Complexity**: Medium

#### Task 6.3: Create MagentoSearchBar
- **Description**: Search with suggestions
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/search/magento_search_bar.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Debounce and suggestions work
- **Complexity**: Medium

#### Task 6.4: Create MagentoFilterPanel
- **Description**: Filter panel from aggregations
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/search/magento_filter_panel.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Filter selection works
- **Complexity**: Medium

#### Task 6.5: Create MagentoSortSelector
- **Description**: Sort dropdown
- **Files**:
  - `packages/flutter_magento_ui/lib/src/widgets/search/magento_sort_selector.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: Sort selection works
- **Complexity**: Low

### Phase 7: Exports and Tests

#### Task 7.1: Create Money Extensions
- **Description**: Extension methods for Money formatting
- **Files**:
  - `packages/flutter_magento_ui/lib/src/extensions/money_extensions.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Format methods work
- **Complexity**: Low

#### Task 7.2: Create Public Export File
- **Description**: Export all widgets and theme
- **Files**:
  - `packages/flutter_magento_ui/lib/flutter_magento_ui.dart` - Modify
- **Dependencies**: All previous tasks
- **Verification**: All types accessible
- **Complexity**: Low

#### Task 7.3: Create Widget Tests
- **Description**: Test key widgets
- **Files**:
  - `packages/flutter_magento_ui/test/magento_product_card_test.dart` - Create
  - `packages/flutter_magento_ui/test/magento_cart_badge_test.dart` - Create
  - `packages/flutter_magento_ui/test/magento_theme_test.dart` - Create
- **Dependencies**: Task 7.2
- **Verification**: All tests pass
- **Complexity**: Medium

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_ui.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/theme/*.dart` | Create | Theme system |
| `lib/src/widgets/product/*.dart` | Create | Product widgets |
| `lib/src/widgets/cart/*.dart` | Create | Cart widgets |
| `lib/src/widgets/forms/*.dart` | Create | Form widgets |
| `lib/src/widgets/search/*.dart` | Create | Search widgets |
| `lib/src/widgets/utility/*.dart` | Create | Utility widgets |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Image loading performance | Medium | Low | Use cached_network_image |
| Theme integration issues | Low | Medium | Test with Material and Cupertino |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Widgets render correctly

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
