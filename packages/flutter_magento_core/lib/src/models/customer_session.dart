import 'customer.dart';

/// Represents an authenticated customer session.
class CustomerSession {
  /// The authenticated customer.
  final Customer customer;

  /// The authentication token.
  final String token;

  const CustomerSession({
    required this.customer,
    required this.token,
  });
}
