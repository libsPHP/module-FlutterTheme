import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_graphql/flutter_magento_graphql.dart';
import 'package:flutter_magento_graphql/flutter_magento_graphql_platform_interface.dart';
import 'package:flutter_magento_graphql/flutter_magento_graphql_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoGraphqlPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoGraphqlPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoGraphqlPlatform initialPlatform = FlutterMagentoGraphqlPlatform.instance;

  test('$MethodChannelFlutterMagentoGraphql is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoGraphql>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoGraphql flutterMagentoGraphqlPlugin = FlutterMagentoGraphql();
    MockFlutterMagentoGraphqlPlatform fakePlatform = MockFlutterMagentoGraphqlPlatform();
    FlutterMagentoGraphqlPlatform.instance = fakePlatform;

    expect(await flutterMagentoGraphqlPlugin.getPlatformVersion(), '42');
  });
}
