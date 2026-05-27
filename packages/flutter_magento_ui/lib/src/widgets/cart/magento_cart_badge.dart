import 'package:flutter/material.dart';

import '../../theme/magento_theme.dart';

/// A badge showing cart item count on top of a child widget.
class MagentoCartBadge extends StatelessWidget {
  /// Number of items in cart.
  final int itemCount;

  /// The widget to show the badge on (typically an icon).
  final Widget child;

  /// Badge background color.
  final Color? badgeColor;

  /// Text style for the count.
  final TextStyle? countStyle;

  /// Whether to show the badge when count is 0.
  final bool showZero;

  /// Badge position offset.
  final Offset offset;

  const MagentoCartBadge({
    super.key,
    required this.itemCount,
    required this.child,
    this.badgeColor,
    this.countStyle,
    this.showZero = false,
    this.offset = const Offset(12, -4),
  });

  @override
  Widget build(BuildContext context) {
    final theme = MagentoTheme.of(context);

    if (itemCount == 0 && !showZero) {
      return child;
    }

    final displayCount = itemCount > 99 ? '99+' : itemCount.toString();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          right: offset.dx,
          top: offset.dy,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: badgeColor ?? theme.saleColor,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              displayCount,
              style: countStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
