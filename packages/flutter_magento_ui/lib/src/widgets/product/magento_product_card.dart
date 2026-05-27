import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_magento_localizations/flutter_magento_localizations.dart';

import '../../theme/magento_theme.dart';
import '../../theme/magento_theme_data.dart';
import '../utility/magento_rating_stars.dart';
import 'magento_price.dart';

/// A product card for displaying in grids or lists.
class MagentoProductCard extends StatelessWidget {
  /// The product to display.
  final ProductSummary product;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Called when add to cart is tapped.
  final VoidCallback? onAddToCart;

  /// Whether to show the add to cart button.
  final bool showAddToCart;

  /// Whether to show the rating.
  final bool showRating;

  /// Custom style overrides.
  final MagentoProductCardStyle? style;

  const MagentoProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.showAddToCart = true,
    this.showRating = true,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MagentoTheme.of(context);
    final l10n = MagentoLocalizations.of(context);
    final cardStyle = style ?? theme.productCardStyle;

    return Card(
      elevation: cardStyle.elevation,
      color: cardStyle.backgroundColor,
      shape: cardStyle.borderRadius != null
          ? RoundedRectangleBorder(borderRadius: cardStyle.borderRadius!)
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(theme.cardBorderRadius),
            ),
      child: InkWell(
        onTap: onTap,
        borderRadius: cardStyle.borderRadius ??
            BorderRadius.circular(theme.cardBorderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            AspectRatio(
              aspectRatio: cardStyle.imageAspectRatio,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(theme.cardBorderRadius),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildImage(),
                    if (!product.inStock) _buildOutOfStockOverlay(l10n),
                    if (_hasDiscount) _buildDiscountBadge(theme),
                  ],
                ),
              ),
            ),

            // Product info
            Padding(
              padding: theme.cardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    product.name,
                    style: theme.productNameStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Rating
                  if (showRating && product.rating != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          MagentoRatingStars(
                            rating: (product.rating! / 20), // Convert 0-100 to 0-5
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${product.reviewCount})',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Price
                  MagentoPrice(
                    price: product.price,
                    regularPrice: product.regularPrice,
                  ),

                  // Add to cart button
                  if (showAddToCart && product.inStock) ...[
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onAddToCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        child: Text(l10n.addToCart),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get _hasDiscount =>
      product.regularPrice != null &&
      product.regularPrice!.value > product.price.value;

  double get _discountPercent {
    if (!_hasDiscount) return 0;
    return ((product.regularPrice!.value - product.price.value) /
            product.regularPrice!.value) *
        100;
  }

  Widget _buildImage() {
    if (product.thumbnailUrl == null) {
      return Container(
        color: Colors.grey[200],
        child: const Icon(
          Icons.image_not_supported,
          size: 48,
          color: Colors.grey,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: product.thumbnailUrl!,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[200],
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[200],
        child: const Icon(
          Icons.broken_image,
          size: 48,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildOutOfStockOverlay(MagentoLocalizations l10n) {
    return Container(
      color: Colors.black.withValues(alpha: 0.5),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            l10n.outOfStock,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiscountBadge(MagentoThemeData theme) {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: theme.saleColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '-${_discountPercent.round()}%',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
