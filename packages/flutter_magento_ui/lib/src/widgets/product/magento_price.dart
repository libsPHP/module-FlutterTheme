import 'package:flutter/material.dart';
import 'package:flutter_magento_localizations/flutter_magento_localizations.dart';

import '../../theme/magento_theme.dart';
import '../../theme/magento_theme_data.dart';

/// Displays a price with optional sale/regular price styling.
class MagentoPrice extends StatelessWidget {
  /// The current price to display.
  final Money price;

  /// The regular price (shown crossed out when on sale).
  final Money? regularPrice;

  /// Whether to show the currency symbol.
  final bool showCurrency;

  /// Custom style overrides.
  final MagentoPriceStyle? style;

  /// Custom formatters for price formatting.
  final MagentoFormatters? formatters;

  const MagentoPrice({
    super.key,
    required this.price,
    this.regularPrice,
    this.showCurrency = true,
    this.style,
    this.formatters,
  });

  bool get _isOnSale =>
      regularPrice != null && regularPrice!.value > price.value;

  @override
  Widget build(BuildContext context) {
    final theme = MagentoTheme.of(context);
    final fmt = formatters ??
        MagentoFormatters(
          locale: Localizations.localeOf(context),
          currency: price.currency,
        );

    if (_isOnSale) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            fmt.formatMoney(price),
            style: style?.salePriceTextStyle ?? theme.salePriceStyle,
          ),
          const SizedBox(width: 8),
          Text(
            fmt.formatMoney(regularPrice!),
            style: style?.regularPriceTextStyle ?? theme.regularPriceStyle,
          ),
        ],
      );
    }

    return Text(
      fmt.formatMoney(price),
      style: style?.priceTextStyle ?? theme.priceStyle,
    );
  }
}
