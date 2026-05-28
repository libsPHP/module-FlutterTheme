import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsMagentoAuthStorage implements MagentoAuthStorage {
  final SharedPreferences _prefs;

  static const _tokenKey = 'magento_customer_token';
  static const _guestCartIdKey = 'magento_guest_cart_id';

  SharedPrefsMagentoAuthStorage(this._prefs);

  static Future<SharedPrefsMagentoAuthStorage> create() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefsMagentoAuthStorage(prefs);
  }

  @override
  Future<String?> getCustomerToken() async => _prefs.getString(_tokenKey);

  @override
  Future<void> saveCustomerToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  @override
  Future<void> clearCustomerToken() async {
    await _prefs.remove(_tokenKey);
  }

  @override
  Future<String?> getGuestCartId() async => _prefs.getString(_guestCartIdKey);

  @override
  Future<void> saveGuestCartId(String cartId) async {
    await _prefs.setString(_guestCartIdKey, cartId);
  }

  @override
  Future<void> clearGuestCartId() async {
    await _prefs.remove(_guestCartIdKey);
  }

  @override
  Future<void> clearAll() async {
    await _prefs.remove(_tokenKey);
    await _prefs.remove(_guestCartIdKey);
  }

  @override
  Future<bool> hasCustomerToken() async {
    final token = await getCustomerToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<bool> get isAuthenticated => hasCustomerToken();
}
