import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_offline_method_channel.dart';

abstract class FlutterMagentoOfflinePlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoOfflinePlatform.
  FlutterMagentoOfflinePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoOfflinePlatform _instance = MethodChannelFlutterMagentoOffline();

  /// The default instance of [FlutterMagentoOfflinePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoOffline].
  static FlutterMagentoOfflinePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoOfflinePlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoOfflinePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
