import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_catalog_method_channel.dart';

abstract class FlutterMagentoCatalogPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoCatalogPlatform.
  FlutterMagentoCatalogPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoCatalogPlatform _instance = MethodChannelFlutterMagentoCatalog();

  /// The default instance of [FlutterMagentoCatalogPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoCatalog].
  static FlutterMagentoCatalogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoCatalogPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoCatalogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
