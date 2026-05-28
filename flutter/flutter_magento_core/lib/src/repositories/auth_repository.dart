import '../models/customer.dart';
import '../models/customer_session.dart';

/// Repository interface for authentication operations.
abstract interface class AuthRepository {
  /// Logs in a customer with email and password.
  ///
  /// Returns a [CustomerSession] containing the customer data and token.
  /// Throws [MagentoAuthException] if credentials are invalid.
  Future<CustomerSession> login({
    required String email,
    required String password,
  });

  /// Logs out the current customer.
  ///
  /// Clears the authentication token and related session data.
  Future<void> logout();

  /// Gets the current authenticated customer's profile.
  ///
  /// Throws [MagentoAuthException] if not authenticated.
  Future<Customer> me();

  /// Registers a new customer account.
  ///
  /// Returns a [CustomerSession] for the newly created account.
  /// Throws [MagentoValidationException] if registration data is invalid.
  Future<CustomerSession> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  /// Requests a password reset email.
  ///
  /// Sends an email with password reset instructions to the given address.
  Future<void> requestPasswordReset(String email);

  /// Resets password using a reset token.
  ///
  /// The token is typically received via email.
  Future<void> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword,
  });
}
