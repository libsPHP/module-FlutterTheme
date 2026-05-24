import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_ui_platform_interface.dart';

/// An implementation of [FlutterMagentoUiPlatform] that uses method channels.
class MethodChannelFlutterMagentoUi extends FlutterMagentoUiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_ui');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
