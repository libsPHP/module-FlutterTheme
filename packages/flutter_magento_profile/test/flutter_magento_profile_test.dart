import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_profile/flutter_magento_profile.dart';
import 'package:flutter_magento_profile/flutter_magento_profile_platform_interface.dart';
import 'package:flutter_magento_profile/flutter_magento_profile_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoProfilePlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoProfilePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoProfilePlatform initialPlatform = FlutterMagentoProfilePlatform.instance;

  test('$MethodChannelFlutterMagentoProfile is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoProfile>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoProfile flutterMagentoProfilePlugin = FlutterMagentoProfile();
    MockFlutterMagentoProfilePlatform fakePlatform = MockFlutterMagentoProfilePlatform();
    FlutterMagentoProfilePlatform.instance = fakePlatform;

    expect(await flutterMagentoProfilePlugin.getPlatformVersion(), '42');
  });
}
