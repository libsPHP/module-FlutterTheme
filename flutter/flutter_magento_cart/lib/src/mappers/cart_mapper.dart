import 'package:flutter_magento_core/flutter_magento_core.dart';

class CartMapper {
  Cart mapCart(Map<String, dynamic> json, {required bool isGuest}) {
    final pricesJson = json['prices'] as Map<String, dynamic>?;
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    final couponsJson = json['applied_coupons'] as List<dynamic>?;
    final discountsJson = pricesJson?['discounts'] as List<dynamic>?;

    final subtotal = _mapMoney(
        pricesJson?['subtotal_excluding_tax'] as Map<String, dynamic>?);
    final grandTotal =
        _mapMoney(pricesJson?['grand_total'] as Map<String, dynamic>?);
    final tax = _calculateTax(pricesJson?['applied_taxes'] as List<dynamic>?);
    final discountTotal = _calculateDiscount(discountsJson);

    return Cart(
      id: json['id'] as String? ?? '',
      items: itemsJson.map((item) => _mapCartItem(item as Map<String, dynamic>)).toList(),
      totals: CartTotals(
        subtotal: subtotal,
        discount: discountTotal,
        shipping: null,
        tax: tax,
        grandTotal: grandTotal,
      ),
      appliedCoupon: _extractCouponCode(couponsJson),
      discounts: _mapDiscounts(discountsJson),
      isGuest: isGuest,
      currency: grandTotal.currency,
    );
  }

  CartItem _mapCartItem(Map<String, dynamic> json) {
    final productJson = json['product'] as Map<String, dynamic>?;
    final pricesJson = json['prices'] as Map<String, dynamic>?;
    final thumbnailJson = productJson?['thumbnail'] as Map<String, dynamic>?;
    final configurableOptions =
        json['configurable_options'] as List<dynamic>?;

    return CartItem(
      id: json['uid'] as String? ?? '',
      sku: productJson?['sku'] as String? ?? '',
      name: productJson?['name'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      price: _mapMoney(pricesJson?['price'] as Map<String, dynamic>?),
      rowTotal: _mapMoney(pricesJson?['row_total'] as Map<String, dynamic>?),
      imageUrl: thumbnailJson?['url'] as String?,
      urlKey: productJson?['url_key'] as String?,
      selectedOptions: _mapSelectedOptions(configurableOptions),
      inStock: productJson?['stock_status'] == 'IN_STOCK',
      maxQuantity: productJson?['only_x_left_in_stock'] as int?,
    );
  }

  String? _extractCouponCode(List<dynamic>? coupons) {
    if (coupons == null || coupons.isEmpty) return null;
    final first = coupons.first as Map<String, dynamic>?;
    return first?['code'] as String?;
  }

  List<SelectedOption>? _mapSelectedOptions(List<dynamic>? options) {
    if (options == null || options.isEmpty) return null;

    return options.map((opt) {
      final o = opt as Map<String, dynamic>;
      return SelectedOption(
        label: o['option_label'] as String? ?? '',
        value: o['value_label'] as String? ?? '',
      );
    }).toList();
  }

  Money _mapMoney(Map<String, dynamic>? json) {
    if (json == null) {
      return const Money(value: 0, currency: 'USD');
    }
    return Money(
      value: (json['value'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? 'USD',
    );
  }

  Money _calculateTax(List<dynamic>? taxes) {
    if (taxes == null || taxes.isEmpty) {
      return const Money(value: 0, currency: 'USD');
    }

    double total = 0;
    String currency = 'USD';

    for (final tax in taxes) {
      final t = tax as Map<String, dynamic>;
      final amount = t['amount'] as Map<String, dynamic>?;
      if (amount != null) {
        total += (amount['value'] as num?)?.toDouble() ?? 0;
        currency = amount['currency'] as String? ?? currency;
      }
    }

    return Money(value: total, currency: currency);
  }

  Money _calculateDiscount(List<dynamic>? discounts) {
    if (discounts == null || discounts.isEmpty) {
      return const Money(value: 0, currency: 'USD');
    }

    double total = 0;
    String currency = 'USD';

    for (final discount in discounts) {
      final d = discount as Map<String, dynamic>;
      final amount = d['amount'] as Map<String, dynamic>?;
      if (amount != null) {
        total += (amount['value'] as num?)?.toDouble() ?? 0;
        currency = amount['currency'] as String? ?? currency;
      }
    }

    return Money(value: total, currency: currency);
  }

  List<CartDiscount> _mapDiscounts(List<dynamic>? discounts) {
    if (discounts == null || discounts.isEmpty) return [];

    return discounts.map((d) {
      final discount = d as Map<String, dynamic>;
      final amount = discount['amount'] as Map<String, dynamic>?;
      return CartDiscount(
        label: discount['label'] as String? ?? '',
        amount: _mapMoney(amount),
      );
    }).toList();
  }
}
