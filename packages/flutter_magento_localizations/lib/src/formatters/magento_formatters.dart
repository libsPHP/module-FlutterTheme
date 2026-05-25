import 'dart:ui';

import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:intl/intl.dart';

/// Provides locale-aware formatting for currency, dates, and numbers.
class MagentoFormatters {
  /// The current locale.
  final Locale locale;

  /// The currency code (e.g., 'USD', 'EUR').
  final String currency;

  late final NumberFormat _currencyFormat;
  late final NumberFormat _numberFormat;
  late final NumberFormat _percentFormat;
  late final DateFormat _dateFormat;
  late final DateFormat _dateTimeFormat;
  late final DateFormat _timeFormat;

  MagentoFormatters({
    required this.locale,
    required this.currency,
  }) {
    final localeString = locale.toLanguageTag();
    _currencyFormat = NumberFormat.simpleCurrency(
      locale: localeString,
      name: currency,
    );
    _numberFormat = NumberFormat.decimalPattern(localeString);
    _percentFormat = NumberFormat.percentPattern(localeString);
    _dateFormat = DateFormat.yMMMd(localeString);
    _dateTimeFormat = DateFormat.yMMMd(localeString).add_jm();
    _timeFormat = DateFormat.jm(localeString);
  }

  /// Creates formatters from a [MagentoStoreContext].
  factory MagentoFormatters.fromContext(MagentoStoreContext context) {
    final parts = context.locale.split('_');
    final languageCode = parts.first;
    final countryCode = parts.length > 1 ? parts[1] : null;

    return MagentoFormatters(
      locale: countryCode != null
          ? Locale(languageCode, countryCode)
          : Locale(languageCode),
      currency: context.currency,
    );
  }

  /// Formats a [Money] value with the currency symbol.
  String formatMoney(Money money) {
    return _currencyFormat.format(money.value);
  }

  /// Formats a plain number with locale-appropriate grouping.
  String formatNumber(num value, {int? decimalPlaces}) {
    if (decimalPlaces != null) {
      final format = NumberFormat.decimalPatternDigits(
        locale: locale.toLanguageTag(),
        decimalDigits: decimalPlaces,
      );
      return format.format(value);
    }
    return _numberFormat.format(value);
  }

  /// Formats a quantity (integer).
  String formatQuantity(int quantity) {
    return _numberFormat.format(quantity);
  }

  /// Formats a date without time.
  String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }

  /// Formats a date with time.
  String formatDateTime(DateTime dateTime) {
    return _dateTimeFormat.format(dateTime);
  }

  /// Formats time only.
  String formatTime(DateTime time) {
    return _timeFormat.format(time);
  }

  /// Formats a relative time (e.g., "2 days ago", "just now").
  String formatRelative(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return formatDate(dateTime);
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'just now';
    }
  }

  /// Formats a weight value with unit.
  String formatWeight(double weight, {String unit = 'kg'}) {
    final formatted = formatNumber(weight, decimalPlaces: 2);
    return '$formatted $unit';
  }

  /// Formats a percentage value.
  String formatPercent(double value) {
    return _percentFormat.format(value);
  }

  /// Formats a discount percentage.
  String formatDiscount(double percentage) {
    return '-${formatPercent(percentage / 100)}';
  }
}
