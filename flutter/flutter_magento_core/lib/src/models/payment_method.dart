/// Represents an available payment method.
class PaymentMethod {
  /// Payment method code.
  final String code;

  /// Display title.
  final String title;

  /// Whether this method is active.
  final bool isActive;

  /// Additional data needed for this method.
  final Map<String, dynamic>? additionalData;

  /// Instructions for using this method.
  final String? instructions;

  const PaymentMethod({
    required this.code,
    required this.title,
    this.isActive = true,
    this.additionalData,
    this.instructions,
  });
}
