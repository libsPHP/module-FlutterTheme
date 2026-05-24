import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_riverpod/flutter_magento_riverpod.dart';
import 'package:flutter_magento_riverpod/flutter_magento_riverpod_platform_interface.dart';
import 'package:flutter_magento_riverpod/flutter_magento_riverpod_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoRiverpodPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoRiverpodPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoRiverpodPlatform initialPlatform = FlutterMagentoRiverpodPlatform.instance;

  test('$MethodChannelFlutterMagentoRiverpod is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoRiverpod>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoRiverpod flutterMagentoRiverpodPlugin = FlutterMagentoRiverpod();
    MockFlutterMagentoRiverpodPlatform fakePlatform = MockFlutterMagentoRiverpodPlatform();
    FlutterMagentoRiverpodPlatform.instance = fakePlatform;

    expect(await flutterMagentoRiverpodPlugin.getPlatformVersion(), '42');
  });
}
