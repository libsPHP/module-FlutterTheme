import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Configuration for creating a MagentoClient.
class MagentoConfig {
  /// The transport for making API requests.
  final MagentoTransport transport;

  /// Storage for authentication tokens.
  final MagentoAuthStorage authStorage;

  /// Store context for multi-store setup.
  final MagentoStoreContext storeContext;

  /// Optional logger for debugging.
  final MagentoLogger? logger;

  const MagentoConfig({
    required this.transport,
    required this.authStorage,
    required this.storeContext,
    this.logger,
  });
}
