# Specifications: flutter_magento_localizations

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_localizations provides formatting utilities and generated localizations for magento_ui widgets. It handles currency, dates, and UI strings with multi-store awareness.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| MagentoFormatters | Create | Currency, date, number formatting |
| MagentoLocalizations | Create | Generated l10n delegate |
| ARB files | Create | Translation strings |
| StoreLocale resolver | Create | Maps store context to Locale |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                flutter_magento_localizations                 │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │            MagentoLocalizations                     │     │
│  │         (Generated LocalizationsDelegate)           │     │
│  └────────────────────────────────────────────────────┘     │
│                          │                                   │
│  ┌───────────┬───────────┼───────────┬───────────────┐      │
│  ▼           ▼           ▼           ▼               ▼      │
│ ┌─────┐   ┌─────┐   ┌─────┐   ┌─────────┐   ┌───────┐      │
│ │Money│   │Date │   │Number│  │ Store   │   │ RTL   │      │
│ │Fmt  │   │Fmt  │   │Fmt   │  │ Locale  │   │Support│      │
│ └─────┘   └─────┘   └─────┘  └─────────┘   └───────┘      │
└─────────────────────────────────────────────────────────────┘
```

## Formatters

### MagentoFormatters

```dart
class MagentoFormatters {
  final Locale locale;
  final String currency;

  MagentoFormatters({
    required this.locale,
    required this.currency,
  });

  factory MagentoFormatters.fromContext(MagentoStoreContext context) {
    return MagentoFormatters(
      locale: Locale(context.locale.split('_').first),
      currency: context.currency,
    );
  }

  /// Format money value
  String formatMoney(Money money);

  /// Format plain number
  String formatNumber(num value, {int? decimalPlaces});

  /// Format quantity
  String formatQuantity(int quantity);

  /// Format date only
  String formatDate(DateTime date);

  /// Format date and time
  String formatDateTime(DateTime dateTime);

  /// Format relative time
  String formatRelative(DateTime dateTime);

  /// Format weight
  String formatWeight(double weight, {String unit = 'kg'});

  /// Format percentage
  String formatPercent(double value);
}
```

### StoreLocaleResolver

```dart
class StoreLocaleResolver {
  static Locale resolveLocale(MagentoStoreContext context);
  static bool isRtl(MagentoStoreContext context);
  static TextDirection textDirection(MagentoStoreContext context);
}
```

## Generated Localizations

```dart
abstract class MagentoLocalizations {
  static MagentoLocalizations of(BuildContext context);
  static const LocalizationsDelegate<MagentoLocalizations> delegate;
  static const List<Locale> supportedLocales;

  // Cart strings
  String get cartTitle;
  String get cartEmpty;
  String get cartSubtotal;
  String get cartTotal;
  String get cartCheckout;
  String cartItemCount(int count);

  // Product strings
  String get addToCart;
  String get outOfStock;
  String get inStock;

  // Checkout strings
  String get shippingAddress;
  String get billingAddress;
  String get paymentMethod;
  String get placeOrder;

  // Form strings
  String get firstName;
  String get lastName;
  String get email;
  // ... etc
}
```

## ARB Files

```
lib/l10n/
├── magento_en.arb
├── magento_es.arb
├── magento_de.arb
├── magento_fr.arb
└── magento_ar.arb
```

## Dependencies

### Requires

- flutter_magento_core (MagentoStoreContext, Money)
- intl: ^0.19.0
- flutter_localizations (SDK)

## Package Structure

```
lib/
├── flutter_magento_localizations.dart
├── l10n/
│   └── *.arb files
└── src/
    ├── formatters/
    │   └── magento_formatters.dart
    ├── locale/
    │   └── store_locale_resolver.dart
    └── generated/
        └── magento_localizations.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
