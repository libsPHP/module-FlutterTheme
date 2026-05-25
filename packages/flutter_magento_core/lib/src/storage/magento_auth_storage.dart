/// Interface for storing authentication tokens and cart IDs.
///
/// Implementations should persist data securely. The SDK provides
/// several implementations:
/// - `SecureMagentoAuthStorage` - Uses flutter_secure_storage
/// - `SharedPrefsMagentoAuthStorage` - Uses shared_preferences
/// - `MemoryMagentoAuthStorage` - In-memory for testing
abstract interface class MagentoAuthStorage {
  /// Gets the customer authentication token.
  Future<String?> getCustomerToken();

  /// Saves the customer authentication token.
  Future<void> saveCustomerToken(String token);

  /// Clears the customer authentication token.
  Future<void> clearCustomerToken();

  /// Gets the guest cart ID.
  Future<String?> getGuestCartId();

  /// Saves the guest cart ID.
  Future<void> saveGuestCartId(String cartId);

  /// Clears the guest cart ID.
  Future<void> clearGuestCartId();

  /// Clears all stored authentication data.
  Future<void> clearAll();

  /// Returns true if a customer token exists.
  Future<bool> hasCustomerToken() async {
    final token = await getCustomerToken();
    return token != null && token.isNotEmpty;
  }

  /// Returns true if authenticated as a customer.
  Future<bool> get isAuthenticated => hasCustomerToken();
}
