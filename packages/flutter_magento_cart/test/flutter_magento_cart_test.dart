import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_cart/flutter_magento_cart.dart';
import 'package:flutter_magento_cart/flutter_magento_cart_platform_interface.dart';
import 'package:flutter_magento_cart/flutter_magento_cart_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoCartPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoCartPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoCartPlatform initialPlatform = FlutterMagentoCartPlatform.instance;

  test('$MethodChannelFlutterMagentoCart is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoCart>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoCart flutterMagentoCartPlugin = FlutterMagentoCart();
    MockFlutterMagentoCartPlatform fakePlatform = MockFlutterMagentoCartPlatform();
    FlutterMagentoCartPlatform.instance = fakePlatform;

    expect(await flutterMagentoCartPlugin.getPlatformVersion(), '42');
  });
}
