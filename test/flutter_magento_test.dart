import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:flutter_magento/flutter_magento_platform_interface.dart';
import 'package:flutter_magento/flutter_magento_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoPlatform initialPlatform = FlutterMagentoPlatform.instance;

  test('$MethodChannelFlutterMagento is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagento>());
  });

  test('getPlatformVersion', () async {
    FlutterMagento flutterMagentoPlugin = FlutterMagento();
    MockFlutterMagentoPlatform fakePlatform = MockFlutterMagentoPlatform();
    FlutterMagentoPlatform.instance = fakePlatform;

    expect(await flutterMagentoPlugin.getPlatformVersion(), '42');
  });
}
