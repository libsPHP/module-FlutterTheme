/// Represents a monetary value with currency.
class Money {
  /// The numeric value.
  final double value;

  /// The currency code (e.g., 'USD', 'EUR').
  final String currency;

  const Money({
    required this.value,
    required this.currency,
  });

  /// Creates a zero value with the given currency.
  const Money.zero(this.currency) : value = 0;

  /// Creates Money from a JSON map.
  factory Money.fromJson(Map<String, dynamic> json) {
    return Money(
      value: (json['value'] as num).toDouble(),
      currency: json['currency'] as String,
    );
  }

  /// Converts to JSON map.
  Map<String, dynamic> toJson() => {
        'value': value,
        'currency': currency,
      };

  /// Returns true if value is zero.
  bool get isZero => value == 0;

  /// Returns true if value is positive.
  bool get isPositive => value > 0;

  /// Returns true if value is negative.
  bool get isNegative => value < 0;

  /// Adds two Money values. Must have same currency.
  Money operator +(Money other) {
    assert(currency == other.currency, 'Cannot add different currencies');
    return Money(value: value + other.value, currency: currency);
  }

  /// Subtracts two Money values. Must have same currency.
  Money operator -(Money other) {
    assert(currency == other.currency, 'Cannot subtract different currencies');
    return Money(value: value - other.value, currency: currency);
  }

  /// Multiplies Money by a factor.
  Money operator *(num factor) {
    return Money(value: value * factor, currency: currency);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Money && value == other.value && currency == other.currency;

  @override
  int get hashCode => Object.hash(value, currency);

  @override
  String toString() => 'Money($value $currency)';
}
