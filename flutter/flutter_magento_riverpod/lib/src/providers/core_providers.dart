import 'package:flutter_magento_auth/flutter_magento_auth.dart';
import 'package:flutter_magento_cart/flutter_magento_cart.dart';
import 'package:flutter_magento_catalog/flutter_magento_catalog.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_magento_profile/flutter_magento_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/magento_config.dart';

/// Configuration provider - must be overridden in app.
///
/// Example:
/// ```dart
/// void main() {
///   runApp(
///     ProviderScope(
///       overrides: [
///         magentoConfigProvider.overrideWithValue(
///           MagentoConfig(
///             transport: MagentoGraphqlTransport(
///               endpoint: 'https://magento.example.com/graphql',
///             ),
///             authStorage: SecureMagentoAuthStorage(),
///             storeContext: MagentoStoreContext.defaults(),
///           ),
///         ),
///       ],
///       child: MyApp(),
///     ),
///   );
/// }
/// ```
final magentoConfigProvider = Provider<MagentoConfig>((ref) {
  throw UnimplementedError(
    'magentoConfigProvider must be overridden in your app',
  );
});

/// Auth storage provider.
final authStorageProvider = Provider<MagentoAuthStorage>((ref) {
  return ref.watch(magentoConfigProvider).authStorage;
});

/// Transport provider.
final transportProvider = Provider<MagentoTransport>((ref) {
  return ref.watch(magentoConfigProvider).transport;
});

/// Store context provider.
final storeContextProvider = Provider<MagentoStoreContext>((ref) {
  return ref.watch(magentoConfigProvider).storeContext;
});

/// Auth repository provider.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final transport = ref.watch(transportProvider);
  final authStorage = ref.watch(authStorageProvider);
  return MagentoAuthRepository(
    transport: transport,
    authStorage: authStorage,
  );
});

/// Catalog repository provider.
final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  final transport = ref.watch(transportProvider);
  return MagentoCatalogRepository(transport);
});

/// Cart repository provider.
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final transport = ref.watch(transportProvider);
  final authStorage = ref.watch(authStorageProvider);
  return MagentoCartRepository(
    transport: transport,
    authStorage: authStorage,
  );
});

/// Customer repository provider.
final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  final transport = ref.watch(transportProvider);
  return MagentoCustomerRepository(transport: transport);
});
