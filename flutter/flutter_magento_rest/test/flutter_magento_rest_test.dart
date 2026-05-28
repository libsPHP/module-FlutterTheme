import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_rest/flutter_magento_rest.dart';
import 'package:flutter_magento_rest/flutter_magento_rest_platform_interface.dart';
import 'package:flutter_magento_rest/flutter_magento_rest_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoRestPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoRestPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoRestPlatform initialPlatform = FlutterMagentoRestPlatform.instance;

  test('$MethodChannelFlutterMagentoRest is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoRest>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoRest flutterMagentoRestPlugin = FlutterMagentoRest();
    MockFlutterMagentoRestPlatform fakePlatform = MockFlutterMagentoRestPlatform();
    FlutterMagentoRestPlatform.instance = fakePlatform;

    expect(await flutterMagentoRestPlugin.getPlatformVersion(), '42');
  });
}
