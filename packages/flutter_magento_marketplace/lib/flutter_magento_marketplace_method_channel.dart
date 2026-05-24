import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_marketplace_platform_interface.dart';

/// An implementation of [FlutterMagentoMarketplacePlatform] that uses method channels.
class MethodChannelFlutterMagentoMarketplace extends FlutterMagentoMarketplacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_marketplace');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
