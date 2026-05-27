import 'magento_route_payload.dart';
import 'magento_route_type.dart';

/// Parser utilities for Magento routes
class MagentoRouteParser {
  /// Parse route payload from Universal Link URI
  ///
  /// This attempts to detect route type from URL patterns:
  /// - /product-url-key.html -> product
  /// - /category-path -> category
  /// - /catalogsearch/result/?q=... -> search
  /// - /checkout/cart/ -> cart
  /// - /checkout/ -> checkout
  /// - /customer/account/ -> customer
  static MagentoRoutePayload? fromUniversalLink(
    Uri uri, {
    String? storeCode,
    String? currencyCode,
  }) {
    final path = uri.path;

    // Search
    if (path.contains('catalogsearch/result')) {
      final query = uri.queryParameters['q'] ?? '';
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.search,
        canonicalUrl: uri.replace(queryParameters: {'q': query}),
        webPath: path,
        appRoute: '/search?q=${Uri.encodeComponent(query)}',
        entity: {'query': query},
      );
    }

    // Cart
    if (path.contains('checkout/cart')) {
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.cart,
        canonicalUrl: uri,
        webPath: path,
        appRoute: '/cart',
        entity: const {},
      );
    }

    // Checkout
    if (path.contains('checkout') && !path.contains('cart')) {
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.checkout,
        canonicalUrl: uri,
        webPath: path,
        appRoute: '/checkout',
        entity: const {},
      );
    }

    // Customer
    if (path.contains('customer/account')) {
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.customer,
        canonicalUrl: uri,
        webPath: path,
        appRoute: '/account',
        entity: const {},
      );
    }

    // Home
    if (path == '/' || path.isEmpty) {
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.home,
        canonicalUrl: uri,
        webPath: '/',
        appRoute: '/',
        entity: const {},
      );
    }

    // Product (ends with .html typically)
    if (path.endsWith('.html')) {
      final urlKey = path.split('/').last.replaceAll('.html', '');
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.product,
        canonicalUrl: uri,
        webPath: path,
        appRoute: '/product/$urlKey',
        entity: {'urlKey': urlKey},
      );
    }

    // Category (path segments without .html)
    if (path.isNotEmpty && !path.contains('.')) {
      final urlPath = path.startsWith('/') ? path.substring(1) : path;
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.category,
        canonicalUrl: uri,
        webPath: path,
        appRoute: '/category/$urlPath',
        entity: {'urlPath': urlPath},
      );
    }

    return null;
  }

  /// Parse app route string to route payload
  ///
  /// Supported formats:
  /// - /product/{id} or /product/{sku}
  /// - /category/{id} or /category/{urlPath}
  /// - /cms/{identifier}
  /// - /search?q={query}
  /// - /cart
  /// - /checkout
  /// - /account
  /// - /
  static MagentoRoutePayload? fromAppRoute(String route) {
    final uri = Uri.parse(route);
    final segments = uri.pathSegments;

    if (segments.isEmpty) {
      return MagentoRoutePayload(
        standard: 'flutter_magento_v1',
        type: MagentoRouteType.home,
        canonicalUrl: Uri.parse('/'),
        webPath: '/',
        appRoute: '/',
        entity: const {},
      );
    }

    final firstSegment = segments.first;

    switch (firstSegment) {
      case 'product':
        final identifier = segments.length > 1 ? segments[1] : '';
        final isNumeric = int.tryParse(identifier) != null;
        return MagentoRoutePayload(
          standard: 'flutter_magento_v1',
          type: MagentoRouteType.product,
          canonicalUrl: Uri.parse('/'),
          webPath: '',
          appRoute: route,
          entity: isNumeric
              ? {'id': int.parse(identifier)}
              : {'sku': identifier},
        );

      case 'category':
        final identifier = segments.length > 1
            ? segments.sublist(1).join('/')
            : '';
        final isNumeric = int.tryParse(identifier) != null;
        return MagentoRoutePayload(
          standard: 'flutter_magento_v1',
          type: MagentoRouteType.category,
          canonicalUrl: Uri.parse('/'),
          webPath: '',
          appRoute: route,
          entity: isNumeric
              ? {'id': int.parse(identifier)}
              : {'urlPath': identifier},
        );

      case 'cms':
        final identifier = segments.length > 1 ? segments[1] : '';
        return MagentoRoutePayload(
          standard: 'flutter_magento_v1',
          type: MagentoRouteType.cms,
          canonicalUrl: Uri.parse('/'),
          webPath: '',
          appRoute: route,
          entity: {'identifier': identifier},
        );

      case 'search':
        final query = uri.queryParameters['q'] ?? '';
        return MagentoRoutePayload(
          standard: 'flutter_magento_v1',
          type: MagentoRouteType.search,
          canonicalUrl: Uri.parse('/'),
          webPath: '',
          appRoute: route,
          entity: {'query': query},
        );

      case 'cart':
        return MagentoRoutePayload(
          standard: 'flutter_magento_v1',
          type: MagentoRouteType.cart,
          canonicalUrl: Uri.parse('/'),
          webPath: '',
          appRoute: '/cart',
          entity: const {},
        );

      case 'checkout':
        return MagentoRoutePayload(
          standard: 'flutter_magento_v1',
          type: MagentoRouteType.checkout,
          canonicalUrl: Uri.parse('/'),
          webPath: '',
          appRoute: '/checkout',
          entity: const {},
        );

      case 'account':
        return MagentoRoutePayload(
          standard: 'flutter_magento_v1',
          type: MagentoRouteType.customer,
          canonicalUrl: Uri.parse('/'),
          webPath: '',
          appRoute: '/account',
          entity: const {},
        );

      default:
        return null;
    }
  }
}
