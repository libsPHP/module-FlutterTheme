import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_magento_graphql_platform_interface.dart';

/// An implementation of [FlutterMagentoGraphqlPlatform] that uses method channels.
class MethodChannelFlutterMagentoGraphql extends FlutterMagentoGraphqlPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_magento_graphql');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
