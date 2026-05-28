import 'package:dio/dio.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Dio interceptor that prefixes paths and adds store context headers.
///
/// Transforms request paths to Magento's REST API format:
/// `/products` -> `/rest/{storeCode}/V1/products`
///
/// Also adds store-related headers:
/// - Content-Currency
/// - Accept-Language
class MagentoStoreInterceptor extends Interceptor {
  final MagentoStoreContext _storeContext;

  MagentoStoreInterceptor(this._storeContext);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // Prepend store code to path if not already prefixed
    final path = options.path;
    if (!path.startsWith('/rest/')) {
      options.path = '/rest/${_storeContext.storeCode}/V1$path';
    }

    // Add store context headers
    options.headers['Content-Currency'] = _storeContext.currency;
    options.headers['Accept-Language'] = _storeContext.locale;

    handler.next(options);
  }
}
