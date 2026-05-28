import 'package:flutter/material.dart';

/// Theme data for Magento UI widgets.
class MagentoThemeData {
  /// Primary color used throughout the UI.
  final Color primaryColor;

  /// Color for sale prices and discounts.
  final Color saleColor;

  /// Color for in-stock indicators.
  final Color inStockColor;

  /// Color for out-of-stock indicators.
  final Color outOfStockColor;

  /// Color for rating stars.
  final Color ratingColor;

  /// Color for inactive/empty rating stars.
  final Color ratingInactiveColor;

  /// Text style for prices.
  final TextStyle priceStyle;

  /// Text style for sale prices.
  final TextStyle salePriceStyle;

  /// Text style for crossed-out regular prices.
  final TextStyle regularPriceStyle;

  /// Text style for product names.
  final TextStyle productNameStyle;

  /// Padding inside cards.
  final EdgeInsets cardPadding;

  /// Border radius for cards.
  final double cardBorderRadius;

  /// Product card style.
  final MagentoProductCardStyle productCardStyle;

  const MagentoThemeData({
    required this.primaryColor,
    required this.saleColor,
    required this.inStockColor,
    required this.outOfStockColor,
    required this.ratingColor,
    required this.ratingInactiveColor,
    required this.priceStyle,
    required this.salePriceStyle,
    required this.regularPriceStyle,
    required this.productNameStyle,
    required this.cardPadding,
    required this.cardBorderRadius,
    required this.productCardStyle,
  });

  /// Creates default theme data.
  factory MagentoThemeData.defaults() => MagentoThemeData(
        primaryColor: const Color(0xFF1976D2),
        saleColor: const Color(0xFFD32F2F),
        inStockColor: const Color(0xFF388E3C),
        outOfStockColor: const Color(0xFF757575),
        ratingColor: const Color(0xFFFFC107),
        ratingInactiveColor: const Color(0xFFE0E0E0),
        priceStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),
        salePriceStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFFD32F2F),
        ),
        regularPriceStyle: const TextStyle(
          fontSize: 14,
          decoration: TextDecoration.lineThrough,
          color: Color(0xFF757575),
        ),
        productNameStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        cardPadding: const EdgeInsets.all(12),
        cardBorderRadius: 8,
        productCardStyle: const MagentoProductCardStyle(),
      );

  /// Creates theme data from a Material ThemeData.
  factory MagentoThemeData.fromMaterial(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    return MagentoThemeData(
      primaryColor: colorScheme.primary,
      saleColor: colorScheme.error,
      inStockColor: Colors.green,
      outOfStockColor: colorScheme.outline,
      ratingColor: Colors.amber,
      ratingInactiveColor: colorScheme.outlineVariant,
      priceStyle: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ) ??
          const TextStyle(fontWeight: FontWeight.bold),
      salePriceStyle: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.error,
          ) ??
          TextStyle(fontWeight: FontWeight.bold, color: colorScheme.error),
      regularPriceStyle: theme.textTheme.bodyMedium?.copyWith(
            decoration: TextDecoration.lineThrough,
            color: colorScheme.outline,
          ) ??
          TextStyle(
            decoration: TextDecoration.lineThrough,
            color: colorScheme.outline,
          ),
      productNameStyle: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ) ??
          const TextStyle(fontWeight: FontWeight.w500),
      cardPadding: const EdgeInsets.all(12),
      cardBorderRadius: 12,
      productCardStyle: MagentoProductCardStyle(
        backgroundColor: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  /// Creates a copy with the given fields replaced.
  MagentoThemeData copyWith({
    Color? primaryColor,
    Color? saleColor,
    Color? inStockColor,
    Color? outOfStockColor,
    Color? ratingColor,
    Color? ratingInactiveColor,
    TextStyle? priceStyle,
    TextStyle? salePriceStyle,
    TextStyle? regularPriceStyle,
    TextStyle? productNameStyle,
    EdgeInsets? cardPadding,
    double? cardBorderRadius,
    MagentoProductCardStyle? productCardStyle,
  }) {
    return MagentoThemeData(
      primaryColor: primaryColor ?? this.primaryColor,
      saleColor: saleColor ?? this.saleColor,
      inStockColor: inStockColor ?? this.inStockColor,
      outOfStockColor: outOfStockColor ?? this.outOfStockColor,
      ratingColor: ratingColor ?? this.ratingColor,
      ratingInactiveColor: ratingInactiveColor ?? this.ratingInactiveColor,
      priceStyle: priceStyle ?? this.priceStyle,
      salePriceStyle: salePriceStyle ?? this.salePriceStyle,
      regularPriceStyle: regularPriceStyle ?? this.regularPriceStyle,
      productNameStyle: productNameStyle ?? this.productNameStyle,
      cardPadding: cardPadding ?? this.cardPadding,
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
      productCardStyle: productCardStyle ?? this.productCardStyle,
    );
  }
}

/// Style for product cards.
class MagentoProductCardStyle {
  /// Image aspect ratio (width / height).
  final double imageAspectRatio;

  /// Whether to show a border.
  final bool showBorder;

  /// Background color.
  final Color? backgroundColor;

  /// Card elevation.
  final double elevation;

  /// Border radius.
  final BorderRadius? borderRadius;

  const MagentoProductCardStyle({
    this.imageAspectRatio = 1.0,
    this.showBorder = false,
    this.backgroundColor,
    this.elevation = 1,
    this.borderRadius,
  });
}

/// Style for price display.
class MagentoPriceStyle {
  /// Text style for the main price.
  final TextStyle? priceTextStyle;

  /// Text style for sale prices.
  final TextStyle? salePriceTextStyle;

  /// Text style for regular (crossed-out) prices.
  final TextStyle? regularPriceTextStyle;

  /// Whether to show strikethrough on regular price when on sale.
  final bool showStrikethrough;

  const MagentoPriceStyle({
    this.priceTextStyle,
    this.salePriceTextStyle,
    this.regularPriceTextStyle,
    this.showStrikethrough = true,
  });
}
