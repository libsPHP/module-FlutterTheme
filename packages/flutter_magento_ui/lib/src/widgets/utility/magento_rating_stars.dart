import 'package:flutter/material.dart';

import '../../theme/magento_theme.dart';

/// Displays rating stars, optionally interactive.
class MagentoRatingStars extends StatelessWidget {
  /// The current rating (0.0 to [maxRating]).
  final double rating;

  /// Maximum rating value.
  final int maxRating;

  /// Whether the rating can be changed by tapping.
  final bool interactive;

  /// Called when rating changes (if [interactive] is true).
  final ValueChanged<double>? onRatingChanged;

  /// Size of each star.
  final double size;

  /// Color for filled stars.
  final Color? activeColor;

  /// Color for empty stars.
  final Color? inactiveColor;

  /// Spacing between stars.
  final double spacing;

  const MagentoRatingStars({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.interactive = false,
    this.onRatingChanged,
    this.size = 20,
    this.activeColor,
    this.inactiveColor,
    this.spacing = 2,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MagentoTheme.of(context);
    final active = activeColor ?? theme.ratingColor;
    final inactive = inactiveColor ?? theme.ratingInactiveColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        final starValue = index + 1;
        final fillAmount = (rating - index).clamp(0.0, 1.0);

        Widget star;
        if (fillAmount >= 1.0) {
          star = Icon(Icons.star, size: size, color: active);
        } else if (fillAmount > 0) {
          star = Stack(
            children: [
              Icon(Icons.star, size: size, color: inactive),
              ClipRect(
                clipper: _StarClipper(fillAmount),
                child: Icon(Icons.star, size: size, color: active),
              ),
            ],
          );
        } else {
          star = Icon(Icons.star, size: size, color: inactive);
        }

        if (interactive) {
          star = GestureDetector(
            onTap: () => onRatingChanged?.call(starValue.toDouble()),
            child: star,
          );
        }

        return Padding(
          padding: EdgeInsets.only(right: index < maxRating - 1 ? spacing : 0),
          child: star,
        );
      }),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillAmount;

  _StarClipper(this.fillAmount);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fillAmount, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) => fillAmount != oldClipper.fillAmount;
}
