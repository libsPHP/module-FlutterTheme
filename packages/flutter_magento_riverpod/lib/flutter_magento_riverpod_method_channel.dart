import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_riverpod_platform_interface.dart';

/// An implementation of [FlutterMagentoRiverpodPlatform] that uses method channels.
class MethodChannelFlutterMagentoRiverpod extends FlutterMagentoRiverpodPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_riverpod');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
