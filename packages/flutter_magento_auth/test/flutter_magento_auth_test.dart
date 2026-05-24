import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_auth/flutter_magento_auth.dart';
import 'package:flutter_magento_auth/flutter_magento_auth_platform_interface.dart';
import 'package:flutter_magento_auth/flutter_magento_auth_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoAuthPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoAuthPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoAuthPlatform initialPlatform = FlutterMagentoAuthPlatform.instance;

  test('$MethodChannelFlutterMagentoAuth is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoAuth>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoAuth flutterMagentoAuthPlugin = FlutterMagentoAuth();
    MockFlutterMagentoAuthPlatform fakePlatform = MockFlutterMagentoAuthPlatform();
    FlutterMagentoAuthPlatform.instance = fakePlatform;

    expect(await flutterMagentoAuthPlugin.getPlatformVersion(), '42');
  });
}
