import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_ui_method_channel.dart';

abstract class FlutterMagentoUiPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoUiPlatform.
  FlutterMagentoUiPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoUiPlatform _instance = MethodChannelFlutterMagentoUi();

  /// The default instance of [FlutterMagentoUiPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoUi].
  static FlutterMagentoUiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoUiPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoUiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
