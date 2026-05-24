import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_blockchain_method_channel.dart';

abstract class FlutterMagentoBlockchainPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoBlockchainPlatform.
  FlutterMagentoBlockchainPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoBlockchainPlatform _instance = MethodChannelFlutterMagentoBlockchain();

  /// The default instance of [FlutterMagentoBlockchainPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoBlockchain].
  static FlutterMagentoBlockchainPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoBlockchainPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoBlockchainPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
