import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_magento_core/flutter_magento_core_platform_interface.dart';
import 'package:flutter_magento_core/flutter_magento_core_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoCorePlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoCorePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoCorePlatform initialPlatform = FlutterMagentoCorePlatform.instance;

  test('$MethodChannelFlutterMagentoCore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoCore>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoCore flutterMagentoCorePlugin = FlutterMagentoCore();
    MockFlutterMagentoCorePlatform fakePlatform = MockFlutterMagentoCorePlatform();
    FlutterMagentoCorePlatform.instance = fakePlatform;

    expect(await flutterMagentoCorePlugin.getPlatformVersion(), '42');
  });
}
