import 'package:flutter/material.dart';

import '../../theme/magento_theme.dart';

/// A quantity selector with +/- buttons.
class MagentoQuantitySelector extends StatelessWidget {
  /// Current quantity.
  final int quantity;

  /// Minimum allowed quantity.
  final int min;

  /// Maximum allowed quantity.
  final int max;

  /// Called when quantity changes.
  final ValueChanged<int> onChanged;

  /// Size of the buttons.
  final double buttonSize;

  /// Whether the control is enabled.
  final bool enabled;

  const MagentoQuantitySelector({
    super.key,
    required this.quantity,
    this.min = 1,
    this.max = 99,
    required this.onChanged,
    this.buttonSize = 32,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MagentoTheme.of(context);
    final canDecrease = enabled && quantity > min;
    final canIncrease = enabled && quantity < max;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QuantityButton(
          icon: Icons.remove,
          onPressed: canDecrease ? () => onChanged(quantity - 1) : null,
          size: buttonSize,
          color: theme.primaryColor,
        ),
        Container(
          constraints: BoxConstraints(minWidth: buttonSize),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _QuantityButton(
          icon: Icons.add,
          onPressed: canIncrease ? () => onChanged(quantity + 1) : null,
          size: buttonSize,
          color: theme.primaryColor,
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final Color color;

  const _QuantityButton({
    required this.icon,
    required this.onPressed,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;

    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: isEnabled ? color.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(size / 4),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(size / 4),
          child: Icon(
            icon,
            size: size * 0.6,
            color: isEnabled ? color : Colors.grey,
          ),
        ),
      ),
    );
  }
}
