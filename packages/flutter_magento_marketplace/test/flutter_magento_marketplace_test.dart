import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_marketplace/flutter_magento_marketplace.dart';
import 'package:flutter_magento_marketplace/flutter_magento_marketplace_platform_interface.dart';
import 'package:flutter_magento_marketplace/flutter_magento_marketplace_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoMarketplacePlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoMarketplacePlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoMarketplacePlatform initialPlatform = FlutterMagentoMarketplacePlatform.instance;

  test('$MethodChannelFlutterMagentoMarketplace is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoMarketplace>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoMarketplace flutterMagentoMarketplacePlugin = FlutterMagentoMarketplace();
    MockFlutterMagentoMarketplacePlatform fakePlatform = MockFlutterMagentoMarketplacePlatform();
    FlutterMagentoMarketplacePlatform.instance = fakePlatform;

    expect(await flutterMagentoMarketplacePlugin.getPlatformVersion(), '42');
  });
}
