import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_catalog/flutter_magento_catalog.dart';
import 'package:flutter_magento_catalog/flutter_magento_catalog_platform_interface.dart';
import 'package:flutter_magento_catalog/flutter_magento_catalog_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoCatalogPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoCatalogPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoCatalogPlatform initialPlatform = FlutterMagentoCatalogPlatform.instance;

  test('$MethodChannelFlutterMagentoCatalog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoCatalog>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoCatalog flutterMagentoCatalogPlugin = FlutterMagentoCatalog();
    MockFlutterMagentoCatalogPlatform fakePlatform = MockFlutterMagentoCatalogPlatform();
    FlutterMagentoCatalogPlatform.instance = fakePlatform;

    expect(await flutterMagentoCatalogPlugin.getPlatformVersion(), '42');
  });
}
