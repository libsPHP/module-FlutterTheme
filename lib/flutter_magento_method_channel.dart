import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_platform_interface.dart';

/// An implementation of [FlutterMagentoPlatform] that uses method channels.
class MethodChannelFlutterMagento extends FlutterMagentoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
