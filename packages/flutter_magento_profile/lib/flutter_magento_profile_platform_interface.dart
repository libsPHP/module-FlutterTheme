import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_profile_method_channel.dart';

abstract class FlutterMagentoProfilePlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoProfilePlatform.
  FlutterMagentoProfilePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoProfilePlatform _instance = MethodChannelFlutterMagentoProfile();

  /// The default instance of [FlutterMagentoProfilePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoProfile].
  static FlutterMagentoProfilePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoProfilePlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoProfilePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
