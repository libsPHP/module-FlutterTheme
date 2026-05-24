import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_rest_platform_interface.dart';

/// An implementation of [FlutterMagentoRestPlatform] that uses method channels.
class MethodChannelFlutterMagentoRest extends FlutterMagentoRestPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_rest');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
