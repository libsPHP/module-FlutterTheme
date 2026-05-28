import 'magento_auth_storage.dart';

/// In-memory implementation of [MagentoAuthStorage].
///
/// Useful for testing and development. Data is lost when the
/// application restarts.
class MemoryMagentoAuthStorage implements MagentoAuthStorage {
  String? _customerToken;
  String? _guestCartId;

  @override
  Future<String?> getCustomerToken() async => _customerToken;

  @override
  Future<void> saveCustomerToken(String token) async {
    _customerToken = token;
  }

  @override
  Future<void> clearCustomerToken() async {
    _customerToken = null;
  }

  @override
  Future<String?> getGuestCartId() async => _guestCartId;

  @override
  Future<void> saveGuestCartId(String cartId) async {
    _guestCartId = cartId;
  }

  @override
  Future<void> clearGuestCartId() async {
    _guestCartId = null;
  }

  @override
  Future<void> clearAll() async {
    _customerToken = null;
    _guestCartId = null;
  }

  @override
  Future<bool> hasCustomerToken() async =>
      _customerToken != null && _customerToken!.isNotEmpty;

  @override
  Future<bool> get isAuthenticated => hasCustomerToken();
}
