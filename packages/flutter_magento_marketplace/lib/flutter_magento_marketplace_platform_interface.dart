import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_marketplace_method_channel.dart';

abstract class FlutterMagentoMarketplacePlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoMarketplacePlatform.
  FlutterMagentoMarketplacePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoMarketplacePlatform _instance = MethodChannelFlutterMagentoMarketplace();

  /// The default instance of [FlutterMagentoMarketplacePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoMarketplace].
  static FlutterMagentoMarketplacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoMarketplacePlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoMarketplacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
