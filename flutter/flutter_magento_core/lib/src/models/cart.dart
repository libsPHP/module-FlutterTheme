import 'money.dart';

/// Represents a shopping cart.
class Cart {
  /// Cart ID.
  final String id;

  /// Items in the cart.
  final List<CartItem> items;

  /// Cart totals.
  final CartTotals totals;

  /// Applied coupon code.
  final String? appliedCoupon;

  /// Applied discounts.
  final List<CartDiscount> discounts;

  /// Whether this is a guest cart.
  final bool isGuest;

  /// Currency code.
  final String currency;

  const Cart({
    required this.id,
    required this.items,
    required this.totals,
    this.appliedCoupon,
    this.discounts = const [],
    required this.isGuest,
    required this.currency,
  });

  /// Number of items in cart.
  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);

  /// Number of unique products.
  int get uniqueItemCount => items.length;

  /// Whether cart is empty.
  bool get isEmpty => items.isEmpty;
}

/// An item in the cart.
class CartItem {
  /// Cart item ID.
  final String id;

  /// Product SKU.
  final String sku;

  /// Product name.
  final String name;

  /// Quantity in cart.
  final int quantity;

  /// Price per unit.
  final Money price;

  /// Row total (price * quantity).
  final Money rowTotal;

  /// Product image URL.
  final String? imageUrl;

  /// Product URL key.
  final String? urlKey;

  /// Selected configurable options.
  final List<SelectedOption>? selectedOptions;

  /// Whether item is in stock.
  final bool inStock;

  /// Maximum available quantity.
  final int? maxQuantity;

  const CartItem({
    required this.id,
    required this.sku,
    required this.name,
    required this.quantity,
    required this.price,
    required this.rowTotal,
    this.imageUrl,
    this.urlKey,
    this.selectedOptions,
    this.inStock = true,
    this.maxQuantity,
  });
}

/// A selected option for a cart item.
class SelectedOption {
  /// Option label (e.g., "Size").
  final String label;

  /// Selected value (e.g., "Large").
  final String value;

  const SelectedOption({
    required this.label,
    required this.value,
  });
}

/// Cart totals breakdown.
class CartTotals {
  /// Subtotal before discounts and shipping.
  final Money subtotal;

  /// Total discount amount.
  final Money discount;

  /// Shipping cost.
  final Money? shipping;

  /// Tax amount.
  final Money tax;

  /// Grand total.
  final Money grandTotal;

  const CartTotals({
    required this.subtotal,
    required this.discount,
    this.shipping,
    required this.tax,
    required this.grandTotal,
  });
}

/// A discount applied to the cart.
class CartDiscount {
  /// Discount code.
  final String? code;

  /// Discount label.
  final String label;

  /// Discount amount.
  final Money amount;

  const CartDiscount({
    this.code,
    required this.label,
    required this.amount,
  });
}
