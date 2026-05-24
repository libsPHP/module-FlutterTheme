import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_auth_method_channel.dart';

abstract class FlutterMagentoAuthPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoAuthPlatform.
  FlutterMagentoAuthPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoAuthPlatform _instance = MethodChannelFlutterMagentoAuth();

  /// The default instance of [FlutterMagentoAuthPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoAuth].
  static FlutterMagentoAuthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoAuthPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoAuthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
