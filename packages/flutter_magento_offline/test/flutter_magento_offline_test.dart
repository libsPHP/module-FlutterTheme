import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_offline/flutter_magento_offline.dart';
import 'package:flutter_magento_offline/flutter_magento_offline_platform_interface.dart';
import 'package:flutter_magento_offline/flutter_magento_offline_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoOfflinePlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoOfflinePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoOfflinePlatform initialPlatform = FlutterMagentoOfflinePlatform.instance;

  test('$MethodChannelFlutterMagentoOffline is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoOffline>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoOffline flutterMagentoOfflinePlugin = FlutterMagentoOffline();
    MockFlutterMagentoOfflinePlatform fakePlatform = MockFlutterMagentoOfflinePlatform();
    FlutterMagentoOfflinePlatform.instance = fakePlatform;

    expect(await flutterMagentoOfflinePlugin.getPlatformVersion(), '42');
  });
}
