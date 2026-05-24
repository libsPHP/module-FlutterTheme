import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_ui/flutter_magento_ui.dart';
import 'package:flutter_magento_ui/flutter_magento_ui_platform_interface.dart';
import 'package:flutter_magento_ui/flutter_magento_ui_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoUiPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoUiPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoUiPlatform initialPlatform = FlutterMagentoUiPlatform.instance;

  test('$MethodChannelFlutterMagentoUi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoUi>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoUi flutterMagentoUiPlugin = FlutterMagentoUi();
    MockFlutterMagentoUiPlatform fakePlatform = MockFlutterMagentoUiPlatform();
    FlutterMagentoUiPlatform.instance = fakePlatform;

    expect(await flutterMagentoUiPlugin.getPlatformVersion(), '42');
  });
}
