import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_magento_method_channel.dart';

abstract class FlutterMagentoPlatform extends PlatformInterface {
  /// Constructs a FlutterMagentoPlatform.
  FlutterMagentoPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMagentoPlatform _instance = MethodChannelFlutterMagento();

  /// The default instance of [FlutterMagentoPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMagento].
  static FlutterMagentoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMagentoPlatform] when
  /// they register themselves.
  static set instance(FlutterMagentoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
