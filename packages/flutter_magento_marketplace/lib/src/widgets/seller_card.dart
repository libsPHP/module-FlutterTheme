import 'package:flutter/material.dart';
import 'package:flutter_magento_marketplace/src/models/seller.dart';
import 'package:flutter_magento_marketplace/src/widgets/rating_stars.dart';
import 'package:flutter_magento_marketplace/src/utils/marketplace_utils.dart';

/// Widget for displaying seller information in a card format
class SellerCard extends StatelessWidget {
  final Seller seller;
  final VoidCallback? onTap;
  final bool showStatistics;
  final bool showActions;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const SellerCard({
    super.key,
    required this.seller,
    this.onTap,
    this.showStatistics = true,
    this.showActions = false,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: padding ?? const EdgeInsets.all(8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 12),
              _buildContent(context),
              if (showStatistics) ...[
                const SizedBox(height: 12),
                _buildStatistics(context),
              ],
              if (showActions) ...[
                const SizedBox(height: 12),
                _buildActions(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(context),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                seller.companyName,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (seller.subdomain != null) ...[
                const SizedBox(height: 2),
                Text(
                  '@${seller.subdomain}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ],
          ),
        ),
        _buildStatusBadge(context),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      backgroundImage: seller.profileImage != null
          ? NetworkImage(seller.profileImage!)
          : null,
      child: seller.profileImage == null
          ? Text(
              seller.companyName.isNotEmpty
                  ? seller.companyName[0].toUpperCase()
                  : 'S',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          : null,
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    Color badgeColor;
    String badgeText;

    switch (seller.approvalStatus) {
      case SellerApprovalStatus.approved:
        badgeColor = Colors.green;
        badgeText = 'Verified';
        break;
      case SellerApprovalStatus.pending:
        badgeColor = Colors.orange;
        badgeText = 'Pending';
        break;
      case SellerApprovalStatus.rejected:
        badgeColor = Colors.red;
        badgeText = 'Rejected';
        break;
      default:
        badgeColor = Colors.grey;
        badgeText = 'Unknown';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: badgeColor.withOpacity(0.3)),
      ),
      child: Text(
        badgeText,
        style: TextStyle(
          color: badgeColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (seller.description != null) ...[
          Text(
            seller.description!,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            RatingStars(rating: seller.rating, size: 16),
            const SizedBox(width: 8),
            Text(
              '${seller.rating.toStringAsFixed(1)} (${seller.reviewCount})',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        if (seller.location != null) ...[
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${seller.location!.city}, ${seller.location!.region}',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildStatistics(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            context,
            'Products',
            seller.productCount.toString(),
            Icons.inventory_2,
          ),
          _buildStatItem(
            context,
            'Sales',
            MarketplaceUtils.formatCurrency(seller.totalSales),
            Icons.shopping_cart,
          ),
          _buildStatItem(
            context,
            'Reviews',
            seller.reviewCount.toString(),
            Icons.star,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // Navigate to seller profile
            },
            icon: const Icon(Icons.person),
            label: const Text('View Profile'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // Contact seller
            },
            icon: const Icon(Icons.message),
            label: const Text('Contact'),
          ),
        ),
      ],
    );
  }
}

/// Compact version of seller card
class SellerCardCompact extends StatelessWidget {
  final Seller seller;
  final VoidCallback? onTap;

  const SellerCardCompact({super.key, required this.seller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: seller.profileImage != null
                    ? NetworkImage(seller.profileImage!)
                    : null,
                child: seller.profileImage == null
                    ? Text(
                        seller.companyName.isNotEmpty
                            ? seller.companyName[0].toUpperCase()
                            : 'S',
                        style: const TextStyle(fontSize: 16),
                      )
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      seller.companyName,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        RatingStars(rating: seller.rating, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          seller.rating.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
