import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_core_platform_interface.dart';

/// An implementation of [FlutterMagentoCorePlatform] that uses method channels.
class MethodChannelFlutterMagentoCore extends FlutterMagentoCorePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_core');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
