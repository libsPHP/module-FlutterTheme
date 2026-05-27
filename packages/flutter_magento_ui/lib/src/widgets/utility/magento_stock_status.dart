import 'package:flutter/material.dart';
import 'package:flutter_magento_localizations/flutter_magento_localizations.dart';

import '../../theme/magento_theme.dart';

/// Displays stock status indicator.
class MagentoStockStatus extends StatelessWidget {
  /// Whether the product is in stock.
  final bool inStock;

  /// Current stock quantity (optional).
  final int? stockQty;

  /// Threshold for showing "low stock" warning.
  final int lowStockThreshold;

  /// Whether to show the quantity number.
  final bool showQuantity;

  const MagentoStockStatus({
    super.key,
    required this.inStock,
    this.stockQty,
    this.lowStockThreshold = 5,
    this.showQuantity = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MagentoTheme.of(context);
    final l10n = MagentoLocalizations.of(context);

    if (!inStock) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: theme.outOfStockColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            l10n.outOfStock,
            style: TextStyle(
              color: theme.outOfStockColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    final isLowStock = stockQty != null && stockQty! <= lowStockThreshold;
    final color = isLowStock ? Colors.orange : theme.inStockColor;

    String text = l10n.inStock;
    if (showQuantity && stockQty != null) {
      if (isLowStock) {
        text = 'Only $stockQty left';
      } else {
        text = '$stockQty in stock';
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
