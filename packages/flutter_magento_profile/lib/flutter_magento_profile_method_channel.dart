import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_profile_platform_interface.dart';

/// An implementation of [FlutterMagentoProfilePlatform] that uses method channels.
class MethodChannelFlutterMagentoProfile extends FlutterMagentoProfilePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_profile');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
