import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_graphql_method_channel.dart';

abstract class FlutterMagentoGraphqlPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoGraphqlPlatform.
  FlutterMagentoGraphqlPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoGraphqlPlatform _instance = MethodChannelFlutterMagentoGraphql();

  /// The default instance of [FlutterMagentoGraphqlPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagentoGraphql].
  static FlutterMagentoGraphqlPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoGraphqlPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoGraphqlPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
