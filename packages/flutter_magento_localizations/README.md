# flutter_magento_localizations

[![pub package](https://img.shields.io/pub/v/flutter_magento_localizations.svg)](https://pub.dev/packages/flutter_magento_localizations)

Localization module for Flutter Magento SDK - i18n, currency, and formatting.

## Features

- Multi-language support
- Currency formatting per store
- Date/time localization
- Number formatting
- Store locale resolution
- Magento-specific UI strings

## Installation

```yaml
dependencies:
  flutter_magento_localizations: ^1.0.0
```

## Usage

### Setup

```dart
import 'package:flutter_magento_localizations/flutter_magento_localizations.dart';

// In your MaterialApp
MaterialApp(
  localizationsDelegates: [
    MagentoLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('en', 'US'),
    Locale('de', 'DE'),
    Locale('fr', 'FR'),
  ],
);
```

### Currency Formatting

```dart
final formatters = MagentoFormatters(
  locale: Locale('en', 'US'),
  currencyCode: 'USD',
);

// Format money
final price = Money(value: 29.99, currency: 'USD');
print(formatters.formatMoney(price)); // $29.99

// Format with different currency
final euroPrice = Money(value: 24.99, currency: 'EUR');
print(formatters.formatMoney(euroPrice)); // €24.99
```

### Date Formatting

```dart
final date = DateTime.now();

print(formatters.formatDate(date)); // May 27, 2024
print(formatters.formatDateTime(date)); // May 27, 2024 2:30 PM
print(formatters.formatTime(date)); // 2:30 PM
```

### Number Formatting

```dart
print(formatters.formatNumber(1234.56)); // 1,234.56
print(formatters.formatPercent(0.25)); // 25%
```

### Store Locale Resolution

```dart
// Resolve locale from Magento store code
final resolver = StoreLocaleResolver(
  storeLocales: {
    'default': Locale('en', 'US'),
    'german': Locale('de', 'DE'),
    'french': Locale('fr', 'FR'),
  },
);

final locale = resolver.resolveLocale('german'); // Locale('de', 'DE')
```

### Access Localized Strings

```dart
final l10n = MagentoLocalizations.of(context);

print(l10n.addToCart); // "Add to Cart"
print(l10n.outOfStock); // "Out of Stock"
print(l10n.itemsInCart(5)); // "5 items in cart"
```

## Available Strings

| Key | English |
|-----|---------|
| `addToCart` | Add to Cart |
| `removeFromCart` | Remove |
| `checkout` | Checkout |
| `continueShopping` | Continue Shopping |
| `outOfStock` | Out of Stock |
| `inStock` | In Stock |
| `itemsInCart` | {count} items in cart |
| `subtotal` | Subtotal |
| `total` | Total |
| `shipping` | Shipping |
| `tax` | Tax |
| `discount` | Discount |

## API Reference

| Class | Description |
|-------|-------------|
| `MagentoFormatters` | Currency, date, number formatting |
| `StoreLocaleResolver` | Maps store codes to locales |
| `MagentoLocalizations` | Localized UI strings |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_ui](https://pub.dev/packages/flutter_magento_ui) - Localized widgets
