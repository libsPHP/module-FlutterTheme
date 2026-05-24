import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_riverpod_method_channel.dart';

abstract class FlutterMagentoRiverpodPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoRiverpodPlatform.
  FlutterMagentoRiverpodPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoRiverpodPlatform _instance = MethodChannelFlutterMagentoRiverpod();

  /// The default instance of [FlutterMagentoRiverpodPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoRiverpod].
  static FlutterMagentoRiverpodPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoRiverpodPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoRiverpodPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
