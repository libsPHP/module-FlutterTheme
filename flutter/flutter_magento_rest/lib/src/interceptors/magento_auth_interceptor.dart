import 'package:dio/dio.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Dio interceptor that adds Authorization header from auth storage.
///
/// Reads the customer token from [MagentoAuthStorage] and adds it
/// as a Bearer token to outgoing requests.
class MagentoAuthInterceptor extends Interceptor {
  final MagentoAuthStorage _authStorage;

  MagentoAuthInterceptor(this._authStorage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip auth if explicitly requested
    if (options.extra['skipAuth'] == true) {
      handler.next(options);
      return;
    }

    final token = await _authStorage.getCustomerToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
