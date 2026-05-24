import 'package:flutter/material.dart';

/// Widget for displaying rating stars
class RatingStars extends StatelessWidget {
  final double rating;
  final int maxRating;
  final double size;
  final Color? activeColor;
  final Color? inactiveColor;

  const RatingStars({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 16.0,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final activeStarColor = activeColor ?? Colors.amber;
    final inactiveStarColor = inactiveColor ?? Colors.grey.shade300;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        final starRating = index + 1.0;
        if (starRating <= rating) {
          return Icon(
            Icons.star,
            size: size,
            color: activeStarColor,
          );
        } else if (starRating - 0.5 <= rating) {
          return Icon(
            Icons.star_half,
            size: size,
            color: activeStarColor,
          );
        } else {
          return Icon(
            Icons.star_border,
            size: size,
            color: inactiveStarColor,
          );
        }
      }),
    );
  }
}
