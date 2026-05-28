/// REST transport implementation for flutter_magento SDK.
///
/// Provides [RestMagentoTransport] which implements [MagentoTransport]
/// for Magento's REST API using Dio.
///
/// Example:
/// ```dart
/// import 'package:flutter_magento_rest/flutter_magento_rest.dart';
///
/// final transport = RestMagentoTransport(
///   baseUrl: 'https://magento.example.com',
///   storeContext: MagentoStoreContext.defaults(),
///   authStorage: MemoryMagentoAuthStorage(),
/// );
/// ```
library;

// Re-export core types for convenience
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show
        MagentoTransport,
        MagentoResponse,
        MagentoRequestOptions,
        MagentoStoreContext,
        MagentoAuthStorage,
        MagentoException,
        MagentoNetworkException,
        MagentoAuthException,
        MagentoValidationException,
        MagentoServerException,
        MagentoNotFoundException,
        MagentoRateLimitException;

// Transport
export 'src/rest_magento_transport.dart';

// Error mapping
export 'src/rest_error_mapper.dart';

// Interceptors
export 'src/interceptors/magento_auth_interceptor.dart';
export 'src/interceptors/magento_store_interceptor.dart';
export 'src/interceptors/magento_error_interceptor.dart';

// Plugin boilerplate (preserved)
import 'flutter_magento_rest_platform_interface.dart';

class FlutterMagentoRest {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoRestPlatform.instance.getPlatformVersion();
  }
}
