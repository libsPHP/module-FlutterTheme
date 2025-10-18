import 'package:intl/intl.dart';

class Formatters {
  /// Format currency
  static String currency(double amount, {String symbol = '\$'}) {
    final formatter = NumberFormat.currency(symbol: symbol, decimalDigits: 2);
    return formatter.format(amount);
  }

  /// Format date
  static String date(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  /// Format date with time
  static String dateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy HH:mm').format(date);
  }

  /// Format relative time (e.g., "2 days ago")
  static String relativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
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
      return 'Just now';
    }
  }

  /// Format number with abbreviation (e.g., 1.2K, 1.5M)
  static String abbreviateNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }

  /// Format percentage
  static String percentage(double value, {int decimals = 1}) {
    return '${(value * 100).toStringAsFixed(decimals)}%';
  }

  /// Format rating
  static String rating(double rating) {
    return rating.toStringAsFixed(1);
  }
}

