import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_localizations_method_channel.dart';

abstract class FlutterMagentoLocalizationsPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoLocalizationsPlatform.
  FlutterMagentoLocalizationsPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoLocalizationsPlatform _instance = MethodChannelFlutterMagentoLocalizations();

  /// The default instance of [FlutterMagentoLocalizationsPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoLocalizations].
  static FlutterMagentoLocalizationsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoLocalizationsPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoLocalizationsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
