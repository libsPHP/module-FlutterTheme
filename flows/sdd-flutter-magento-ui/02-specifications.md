# Specifications: flutter_magento_ui

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_ui provides reusable Flutter widgets for common e-commerce patterns. Widgets consume SDK models directly and are themeable. State management agnostic - works with any provider.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| Product widgets | Create | Cards, gallery, price |
| Cart widgets | Create | Badge, item row, totals |
| Form widgets | Create | Address, search |
| Theme system | Create | MagentoTheme, colors |
| Utility widgets | Create | Rating, quantity |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    flutter_magento_ui                        │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │                  MagentoTheme                       │     │
│  │          (InheritedWidget for theming)              │     │
│  └────────────────────────────────────────────────────┘     │
│                          │                                   │
│  ┌───────────┬───────────┼───────────┬───────────────┐      │
│  ▼           ▼           ▼           ▼               ▼      │
│ ┌─────┐   ┌─────┐   ┌─────┐   ┌─────────┐   ┌───────┐      │
│ │Prod-│   │Cart │   │Forms│   │ Utility │   │Search │      │
│ │uct  │   │Widg │   │     │   │ Widgets │   │       │      │
│ └─────┘   └─────┘   └─────┘   └─────────┘   └───────┘      │
└─────────────────────────────────────────────────────────────┘
           │
           ▼
┌─────────────────────────────────────────────────────────────┐
│                    flutter_magento_core                      │
│              ProductSummary, Cart, Money, etc.               │
└─────────────────────────────────────────────────────────────┘
```

## Widgets

### Product Widgets

```dart
/// Product card for grid/list views
class MagentoProductCard extends StatelessWidget {
  final ProductSummary product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final bool showAddToCart;
  final bool showRating;
  final MagentoProductCardStyle? style;

  const MagentoProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.showAddToCart = true,
    this.showRating = true,
    this.style,
  });
}

/// Product image gallery with zoom
class MagentoProductGallery extends StatelessWidget {
  final List<ProductImage> images;
  final int initialIndex;
  final bool showThumbnails;
  final bool enableZoom;

  const MagentoProductGallery({...});
}

/// Price display with regular/sale styling
class MagentoPrice extends StatelessWidget {
  final Money price;
  final Money? regularPrice;
  final bool showCurrency;
  final MagentoPriceStyle? style;

  const MagentoPrice({...});
}

/// Configurable product option selector
class MagentoOptionSelector extends StatelessWidget {
  final List<ConfigurableOption> options;
  final Map<String, String> selectedOptions;
  final ValueChanged<Map<String, String>> onSelectionChanged;

  const MagentoOptionSelector({...});
}
```

### Cart Widgets

```dart
/// Badge showing cart item count
class MagentoCartBadge extends StatelessWidget {
  final int itemCount;
  final Widget child;
  final Color? badgeColor;
  final TextStyle? countStyle;

  const MagentoCartBadge({...});
}

/// Cart item row
class MagentoCartItemRow extends StatelessWidget {
  final CartItem item;
  final ValueChanged<int>? onQuantityChanged;
  final VoidCallback? onRemove;

  const MagentoCartItemRow({...});
}

/// Cart totals summary
class MagentoCartTotals extends StatelessWidget {
  final CartTotals totals;
  final List<CartDiscount>? discounts;
  final bool showShipping;

  const MagentoCartTotals({...});
}

/// Coupon input field
class MagentoCouponField extends StatelessWidget {
  final String? appliedCoupon;
  final ValueChanged<String> onApply;
  final VoidCallback? onRemove;

  const MagentoCouponField({...});
}
```

### Form Widgets

```dart
/// Address form with validation
class MagentoAddressForm extends StatelessWidget {
  final Address? initialAddress;
  final List<Country> countries;
  final ValueChanged<Address> onSubmit;
  final bool showSetDefault;

  const MagentoAddressForm({...});
}

/// Country/region selector
class MagentoCountrySelector extends StatelessWidget {
  final List<Country> countries;
  final String? selectedCountryCode;
  final String? selectedRegionCode;
  final ValueChanged<CountrySelection> onChanged;

  const MagentoCountrySelector({...});
}
```

### Search Widgets

```dart
/// Search bar with suggestions
class MagentoSearchBar extends StatelessWidget {
  final String? initialQuery;
  final ValueChanged<String> onSearch;
  final Stream<List<String>>? suggestions;
  final Duration debounce;

  const MagentoSearchBar({...});
}

/// Filter panel for product search
class MagentoFilterPanel extends StatelessWidget {
  final List<Aggregation> aggregations;
  final ProductFilter currentFilter;
  final ValueChanged<ProductFilter> onFilterChanged;

  const MagentoFilterPanel({...});
}

/// Sort selector
class MagentoSortSelector extends StatelessWidget {
  final ProductSort currentSort;
  final ValueChanged<ProductSort> onSortChanged;

  const MagentoSortSelector({...});
}
```

### Utility Widgets

```dart
/// Rating stars display/input
class MagentoRatingStars extends StatelessWidget {
  final double rating;
  final int maxRating;
  final bool interactive;
  final ValueChanged<double>? onRatingChanged;
  final double size;
  final Color? activeColor;
  final Color? inactiveColor;

  const MagentoRatingStars({...});
}

/// Quantity selector +/-
class MagentoQuantitySelector extends StatelessWidget {
  final int quantity;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const MagentoQuantitySelector({...});
}

/// Stock status indicator
class MagentoStockStatus extends StatelessWidget {
  final bool inStock;
  final int? stockQty;
  final int lowStockThreshold;

  const MagentoStockStatus({...});
}

/// Discount badge
class MagentoDiscountBadge extends StatelessWidget {
  final double discountPercent;
  final Color? backgroundColor;

  const MagentoDiscountBadge({...});
}
```

## Theme System

```dart
class MagentoTheme extends InheritedWidget {
  final MagentoThemeData data;

  const MagentoTheme({
    super.key,
    required this.data,
    required super.child,
  });

  static MagentoThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<MagentoTheme>();
    return theme?.data ?? MagentoThemeData.defaults();
  }
}

class MagentoThemeData {
  // Colors
  final Color primaryColor;
  final Color saleColor;
  final Color inStockColor;
  final Color outOfStockColor;
  final Color ratingColor;

  // Typography
  final TextStyle priceStyle;
  final TextStyle salePriceStyle;
  final TextStyle regularPriceStyle;
  final TextStyle productNameStyle;

  // Card styling
  final MagentoProductCardStyle productCardStyle;

  // Spacing
  final EdgeInsets cardPadding;
  final double cardBorderRadius;

  const MagentoThemeData({...});

  factory MagentoThemeData.defaults() => MagentoThemeData(...);

  factory MagentoThemeData.fromMaterial(ThemeData theme) => MagentoThemeData(...);
}
```

## Style Classes

```dart
class MagentoProductCardStyle {
  final double imageAspectRatio;
  final bool showBorder;
  final Color? backgroundColor;
  final double elevation;
  final BorderRadius? borderRadius;

  const MagentoProductCardStyle({...});
}

class MagentoPriceStyle {
  final TextStyle? priceTextStyle;
  final TextStyle? salePriceTextStyle;
  final TextStyle? regularPriceTextStyle;
  final bool showStrikethrough;
  final String currencyFormat;

  const MagentoPriceStyle({...});
}
```

## Dependencies

### Requires

- flutter_magento_core (models)
- flutter (SDK)
- cached_network_image: ^3.3.0

### Blocks

- flutter_magento (umbrella)

## Package Structure

```
lib/
├── flutter_magento_ui.dart
└── src/
    ├── theme/
    │   ├── magento_theme.dart
    │   ├── magento_theme_data.dart
    │   └── styles/
    ├── widgets/
    │   ├── product/
    │   │   ├── magento_product_card.dart
    │   │   ├── magento_product_gallery.dart
    │   │   ├── magento_price.dart
    │   │   └── magento_option_selector.dart
    │   ├── cart/
    │   │   ├── magento_cart_badge.dart
    │   │   ├── magento_cart_item_row.dart
    │   │   ├── magento_cart_totals.dart
    │   │   └── magento_coupon_field.dart
    │   ├── forms/
    │   │   ├── magento_address_form.dart
    │   │   └── magento_country_selector.dart
    │   ├── search/
    │   │   ├── magento_search_bar.dart
    │   │   ├── magento_filter_panel.dart
    │   │   └── magento_sort_selector.dart
    │   └── utility/
    │       ├── magento_rating_stars.dart
    │       ├── magento_quantity_selector.dart
    │       ├── magento_stock_status.dart
    │       └── magento_discount_badge.dart
    └── extensions/
        └── money_extensions.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
