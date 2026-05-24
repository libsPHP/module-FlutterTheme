import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_core_method_channel.dart';

abstract class FlutterMagentoCorePlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoCorePlatform.
  FlutterMagentoCorePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoCorePlatform _instance = MethodChannelFlutterMagentoCore();

  /// The default instance of [FlutterMagentoCorePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoCore].
  static FlutterMagentoCorePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoCorePlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoCorePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
