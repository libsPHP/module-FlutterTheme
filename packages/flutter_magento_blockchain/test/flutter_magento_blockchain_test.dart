import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_blockchain/flutter_magento_blockchain.dart';
import 'package:flutter_magento_blockchain/flutter_magento_blockchain_platform_interface.dart';
import 'package:flutter_magento_blockchain/flutter_magento_blockchain_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoBlockchainPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoBlockchainPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoBlockchainPlatform initialPlatform = FlutterMagentoBlockchainPlatform.instance;

  test('$MethodChannelFlutterMagentoBlockchain is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoBlockchain>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoBlockchain flutterMagentoBlockchainPlugin = FlutterMagentoBlockchain();
    MockFlutterMagentoBlockchainPlatform fakePlatform = MockFlutterMagentoBlockchainPlatform();
    FlutterMagentoBlockchainPlatform.instance = fakePlatform;

    expect(await flutterMagentoBlockchainPlugin.getPlatformVersion(), '42');
  });
}
