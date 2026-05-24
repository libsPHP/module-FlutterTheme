import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_cart_method_channel.dart';

abstract class FlutterMagentoCartPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoCartPlatform.
  FlutterMagentoCartPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoCartPlatform _instance = MethodChannelFlutterMagentoCart();

  /// The default instance of [FlutterMagentoCartPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoCart].
  static FlutterMagentoCartPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoCartPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoCartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
