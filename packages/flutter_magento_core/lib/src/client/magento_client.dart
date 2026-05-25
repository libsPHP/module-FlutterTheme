import '../transport/magento_transport.dart';
import '../context/magento_store_context.dart';
import '../storage/magento_auth_storage.dart';
import '../logging/magento_logger.dart';
import '../extensions/magento_extension_registry.dart';
import '../repositories/auth_repository.dart';
import '../repositories/catalog_repository.dart';
import '../repositories/cart_repository.dart';
import '../repositories/checkout_repository.dart';
import '../repositories/customer_repository.dart';
import '../repositories/order_repository.dart';
import '../repositories/wishlist_repository.dart';
import 'magento_observer.dart';

/// Main entry point for the Magento SDK.
///
/// Provides access to all domain repositories and SDK configuration.
///
/// The client is immutable - to change configuration, create a new client.
///
/// Example:
/// ```dart
/// final client = MagentoClient(
///   transport: GraphQlMagentoTransport(baseUrl: 'https://shop.com/graphql'),
///   authStorage: SecureMagentoAuthStorage(),
///   storeContext: MagentoStoreContext(
///     storeCode: 'default',
///     currency: 'USD',
///     locale: 'en_US',
///   ),
/// );
///
/// // Use repositories
/// final products = await client.catalog.searchProducts(
///   query: 'phone',
///   page: 1,
///   pageSize: 20,
/// );
///
/// await client.cart.addSimpleProduct(sku: 'ABC123', quantity: 1);
/// ```
class MagentoClient {
  /// The transport layer for API communication.
  final MagentoTransport transport;

  /// Storage for authentication tokens.
  final MagentoAuthStorage authStorage;

  /// Store context (store code, currency, locale).
  final MagentoStoreContext storeContext;

  /// Logger instance.
  final MagentoLogger? logger;

  /// Extension registry for custom modules.
  final MagentoExtensionRegistry extensions;

  /// Observer for transport events.
  final MagentoObserver observer;

  // Repository instances - must be provided by implementing packages
  final AuthRepository? _auth;
  final CatalogRepository? _catalog;
  final CartRepository? _cart;
  final CheckoutRepository? _checkout;
  final CustomerRepository? _customer;
  final OrderRepository? _orders;
  final WishlistRepository? _wishlist;

  /// Creates a new MagentoClient.
  ///
  /// The [transport] and [authStorage] are required.
  /// [storeContext] defaults to 'default' store with USD/en_US.
  MagentoClient({
    required this.transport,
    required this.authStorage,
    MagentoStoreContext? storeContext,
    this.logger,
    MagentoExtensionRegistry? extensions,
    MagentoObserver? observer,
    AuthRepository? auth,
    CatalogRepository? catalog,
    CartRepository? cart,
    CheckoutRepository? checkout,
    CustomerRepository? customer,
    OrderRepository? orders,
    WishlistRepository? wishlist,
  })  : storeContext = storeContext ?? const MagentoStoreContext.defaults(),
        extensions = extensions ?? MagentoExtensionRegistry(),
        observer = observer ?? const NoOpMagentoObserver(),
        _auth = auth,
        _catalog = catalog,
        _cart = cart,
        _checkout = checkout,
        _customer = customer,
        _orders = orders,
        _wishlist = wishlist;

  /// Authentication repository.
  ///
  /// Throws [StateError] if not initialized.
  AuthRepository get auth {
    if (_auth == null) {
      throw StateError(
        'AuthRepository not initialized. '
        'Use a transport package (flutter_magento_graphql) to create the client, '
        'or provide the repository explicitly.',
      );
    }
    return _auth!;
  }

  /// Catalog repository.
  ///
  /// Throws [StateError] if not initialized.
  CatalogRepository get catalog {
    if (_catalog == null) {
      throw StateError(
        'CatalogRepository not initialized. '
        'Use a transport package (flutter_magento_graphql) to create the client, '
        'or provide the repository explicitly.',
      );
    }
    return _catalog!;
  }

  /// Cart repository.
  ///
  /// Throws [StateError] if not initialized.
  CartRepository get cart {
    if (_cart == null) {
      throw StateError(
        'CartRepository not initialized. '
        'Use a transport package (flutter_magento_graphql) to create the client, '
        'or provide the repository explicitly.',
      );
    }
    return _cart!;
  }

  /// Checkout repository.
  ///
  /// Throws [StateError] if not initialized.
  CheckoutRepository get checkout {
    if (_checkout == null) {
      throw StateError(
        'CheckoutRepository not initialized. '
        'Use a transport package (flutter_magento_graphql) to create the client, '
        'or provide the repository explicitly.',
      );
    }
    return _checkout!;
  }

  /// Customer repository.
  ///
  /// Throws [StateError] if not initialized.
  CustomerRepository get customer {
    if (_customer == null) {
      throw StateError(
        'CustomerRepository not initialized. '
        'Use a transport package (flutter_magento_graphql) to create the client, '
        'or provide the repository explicitly.',
      );
    }
    return _customer!;
  }

  /// Order repository.
  ///
  /// Throws [StateError] if not initialized.
  OrderRepository get orders {
    if (_orders == null) {
      throw StateError(
        'OrderRepository not initialized. '
        'Use a transport package (flutter_magento_graphql) to create the client, '
        'or provide the repository explicitly.',
      );
    }
    return _orders!;
  }

  /// Wishlist repository.
  ///
  /// Throws [StateError] if not initialized.
  WishlistRepository get wishlist {
    if (_wishlist == null) {
      throw StateError(
        'WishlistRepository not initialized. '
        'Use a transport package (flutter_magento_graphql) to create the client, '
        'or provide the repository explicitly.',
      );
    }
    return _wishlist!;
  }

  /// Checks if a repository is available.
  bool hasRepository<T>() {
    if (T == AuthRepository) return _auth != null;
    if (T == CatalogRepository) return _catalog != null;
    if (T == CartRepository) return _cart != null;
    if (T == CheckoutRepository) return _checkout != null;
    if (T == CustomerRepository) return _customer != null;
    if (T == OrderRepository) return _orders != null;
    if (T == WishlistRepository) return _wishlist != null;
    return false;
  }

  /// Creates a copy with the given repositories replaced.
  MagentoClient copyWith({
    MagentoTransport? transport,
    MagentoAuthStorage? authStorage,
    MagentoStoreContext? storeContext,
    MagentoLogger? logger,
    MagentoExtensionRegistry? extensions,
    MagentoObserver? observer,
    AuthRepository? auth,
    CatalogRepository? catalog,
    CartRepository? cart,
    CheckoutRepository? checkout,
    CustomerRepository? customer,
    OrderRepository? orders,
    WishlistRepository? wishlist,
  }) {
    return MagentoClient(
      transport: transport ?? this.transport,
      authStorage: authStorage ?? this.authStorage,
      storeContext: storeContext ?? this.storeContext,
      logger: logger ?? this.logger,
      extensions: extensions ?? this.extensions,
      observer: observer ?? this.observer,
      auth: auth ?? _auth,
      catalog: catalog ?? _catalog,
      cart: cart ?? _cart,
      checkout: checkout ?? _checkout,
      customer: customer ?? _customer,
      orders: orders ?? _orders,
      wishlist: wishlist ?? _wishlist,
    );
  }
}
