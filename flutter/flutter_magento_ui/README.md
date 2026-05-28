# flutter_magento_ui

[![pub package](https://img.shields.io/pub/v/flutter_magento_ui.svg)](https://pub.dev/packages/flutter_magento_ui)

UI components for Flutter Magento SDK - themed widgets for e-commerce apps.

## Features

- Magento theme system (light/dark mode)
- Product cards and price display
- Cart badge and item widgets
- Rating stars
- Quantity selector
- Stock status indicator
- Cached network images

## Installation

```yaml
dependencies:
  flutter_magento_ui: ^1.0.0
```

## Usage

### Setup Theme

```dart
import 'package:flutter_magento_ui/flutter_magento_ui.dart';

MaterialApp(
  theme: MagentoTheme.light(),
  darkTheme: MagentoTheme.dark(),
);
```

### Custom Theme

```dart
final customTheme = MagentoThemeData(
  primaryColor: Colors.orange,
  accentColor: Colors.deepOrange,
  priceColor: Colors.green,
  salePriceColor: Colors.red,
  ratingColor: Colors.amber,
);

MaterialApp(
  theme: MagentoTheme.fromData(customTheme),
);
```

### Product Price

```dart
// Simple price
MagentoPrice(
  price: product.price,
)

// Price with discount
MagentoPrice(
  price: product.price,
  regularPrice: product.regularPrice,
  showDiscount: true,
)
```

### Product Card

```dart
MagentoProductCard(
  product: productSummary,
  onTap: () => Navigator.push(...),
  onAddToCart: () => cartController.add(product),
)
```

### Cart Badge

```dart
MagentoCartBadge(
  itemCount: cart.itemCount,
  onTap: () => Navigator.pushNamed(context, '/cart'),
)
```

### Rating Stars

```dart
MagentoRatingStars(
  rating: 4.5,
  reviewCount: 128,
  size: 16,
)
```

### Quantity Selector

```dart
MagentoQuantitySelector(
  quantity: item.quantity,
  minQuantity: 1,
  maxQuantity: 99,
  onChanged: (qty) => cartController.updateQuantity(item, qty),
)
```

### Stock Status

```dart
MagentoStockStatus(
  inStock: product.inStock,
  quantity: product.stockQuantity,
  showQuantity: true,
)
```

## Theme Properties

```dart
class MagentoThemeData {
  final Color primaryColor;
  final Color accentColor;
  final Color priceColor;
  final Color salePriceColor;
  final Color originalPriceColor;
  final Color ratingColor;
  final Color inStockColor;
  final Color outOfStockColor;
  final TextStyle priceStyle;
  final TextStyle productNameStyle;
  final BorderRadius cardBorderRadius;
  final double cardElevation;
}
```

## Accessing Theme

```dart
final magentoTheme = MagentoTheme.of(context);
print(magentoTheme.priceColor);
```

## API Reference

| Widget | Description |
|--------|-------------|
| `MagentoTheme` | Theme provider |
| `MagentoPrice` | Price display with discount |
| `MagentoProductCard` | Product card widget |
| `MagentoCartBadge` | Cart icon with count |
| `MagentoRatingStars` | Star rating display |
| `MagentoQuantitySelector` | +/- quantity control |
| `MagentoStockStatus` | In/out of stock indicator |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_localizations](https://pub.dev/packages/flutter_magento_localizations) - Formatting
- [flutter_magento_riverpod](https://pub.dev/packages/flutter_magento_riverpod) - State management
