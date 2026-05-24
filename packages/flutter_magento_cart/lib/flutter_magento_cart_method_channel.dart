import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_cart_platform_interface.dart';

/// An implementation of [FlutterMagentoCartPlatform] that uses method channels.
class MethodChannelFlutterMagentoCart extends FlutterMagentoCartPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_cart');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
