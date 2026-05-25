import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureMagentoAuthStorage implements MagentoAuthStorage {
  final FlutterSecureStorage _storage;

  static const _tokenKey = 'magento_customer_token';
  static const _guestCartIdKey = 'magento_guest_cart_id';

  SecureMagentoAuthStorage({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
              iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
            );

  @override
  Future<String?> getCustomerToken() => _storage.read(key: _tokenKey);

  @override
  Future<void> saveCustomerToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  @override
  Future<void> clearCustomerToken() => _storage.delete(key: _tokenKey);

  @override
  Future<String?> getGuestCartId() => _storage.read(key: _guestCartIdKey);

  @override
  Future<void> saveGuestCartId(String cartId) =>
      _storage.write(key: _guestCartIdKey, value: cartId);

  @override
  Future<void> clearGuestCartId() => _storage.delete(key: _guestCartIdKey);

  @override
  Future<void> clearAll() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _guestCartIdKey);
  }

  @override
  Future<bool> hasCustomerToken() async {
    final token = await getCustomerToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<bool> get isAuthenticated => hasCustomerToken();
}
