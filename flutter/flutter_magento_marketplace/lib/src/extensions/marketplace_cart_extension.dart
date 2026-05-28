import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../models/seller.dart';
import '../repositories/seller_repository.dart';

/// Function type for extracting seller ID from cart item.
typedef SellerIdExtractor = String? Function(CartItem item);

/// Extension for marketplace cart functionality.
///
/// Groups cart items by seller and calculates per-seller subtotals.
///
/// Usage:
/// ```dart
/// final extension = MarketplaceCartExtension(
///   sellerRepository: sellerRepo,
///   sellerIdExtractor: (item) => item.selectedOptions
///       ?.firstWhere((o) => o.label == 'Seller')?.value,
/// );
///
/// final groupedCart = await extension.getCartBySeller(cart);
/// for (final entry in groupedCart.entries) {
///   print('${entry.key.name}: ${entry.value.length} items');
/// }
/// ```
class MarketplaceCartExtension {
  final SellerRepository sellerRepository;

  /// Function to extract seller ID from cart item.
  final SellerIdExtractor sellerIdExtractor;

  MarketplaceCartExtension({
    required this.sellerRepository,
    SellerIdExtractor? sellerIdExtractor,
  }) : sellerIdExtractor = sellerIdExtractor ?? _defaultSellerIdExtractor;

  /// Default extractor looks for seller info in selected options.
  static String? _defaultSellerIdExtractor(CartItem item) {
    // Try to find seller ID in selected options
    final sellerOption = item.selectedOptions?.firstWhere(
      (o) => o.label.toLowerCase().contains('seller'),
      orElse: () => const SelectedOption(label: '', value: ''),
    );
    if (sellerOption != null && sellerOption.value.isNotEmpty) {
      return sellerOption.value;
    }
    return null;
  }

  /// Groups cart items by seller.
  ///
  /// Returns a map of seller to their items.
  /// Items without a seller are grouped under a null key.
  Future<Map<Seller?, List<CartItem>>> getCartBySeller(Cart cart) async {
    // Group items by seller ID
    final grouped = <String?, List<CartItem>>{};

    for (final item in cart.items) {
      final sellerId = sellerIdExtractor(item);
      grouped.putIfAbsent(sellerId, () => []).add(item);
    }

    // Fetch seller details
    final result = <Seller?, List<CartItem>>{};
    for (final entry in grouped.entries) {
      if (entry.key != null && entry.key!.isNotEmpty) {
        try {
          final seller = await sellerRepository.getSellerById(entry.key!);
          result[seller] = entry.value;
        } catch (_) {
          // If seller not found, group under null
          result[null] = [...(result[null] ?? []), ...entry.value];
        }
      } else {
        result[null] = entry.value;
      }
    }

    return result;
  }

  /// Gets subtotals per seller ID.
  ///
  /// Returns a map of seller ID to subtotal.
  Map<String?, Money> getSubtotalsBySeller(Cart cart) {
    final subtotals = <String?, Money>{};

    for (final item in cart.items) {
      final sellerId = sellerIdExtractor(item);
      final current = subtotals[sellerId];

      if (current == null) {
        subtotals[sellerId] = item.rowTotal;
      } else {
        subtotals[sellerId] = Money(
          value: current.value + item.rowTotal.value,
          currency: current.currency,
        );
      }
    }

    return subtotals;
  }

  /// Gets item count per seller ID.
  Map<String?, int> getItemCountBySeller(Cart cart) {
    final counts = <String?, int>{};

    for (final item in cart.items) {
      final sellerId = sellerIdExtractor(item);
      counts[sellerId] = (counts[sellerId] ?? 0) + item.quantity;
    }

    return counts;
  }

  /// Gets unique seller IDs in the cart.
  Set<String> getSellerIds(Cart cart) {
    final ids = <String>{};

    for (final item in cart.items) {
      final sellerId = sellerIdExtractor(item);
      if (sellerId != null && sellerId.isNotEmpty) {
        ids.add(sellerId);
      }
    }

    return ids;
  }

  /// Whether cart has items from multiple sellers.
  bool hasMultipleSellers(Cart cart) {
    return getSellerIds(cart).length > 1;
  }
}
