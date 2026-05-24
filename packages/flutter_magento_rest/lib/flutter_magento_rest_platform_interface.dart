import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_rest_method_channel.dart';

abstract class FlutterMagentoRestPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoRestPlatform.
  FlutterMagentoRestPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoRestPlatform _instance = MethodChannelFlutterMagentoRest();

  /// The default instance of [FlutterMagentoRestPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoRest].
  static FlutterMagentoRestPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoRestPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoRestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
