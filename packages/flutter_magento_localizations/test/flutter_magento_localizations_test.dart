import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento_localizations/flutter_magento_localizations.dart';
import 'package:flutter_magento_localizations/flutter_magento_localizations_platform_interface.dart';
import 'package:flutter_magento_localizations/flutter_magento_localizations_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMagentoLocalizationsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterMagentoLocalizationsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterMagentoLocalizationsPlatform initialPlatform = FlutterMagentoLocalizationsPlatform.instance;

  test('$MethodChannelFlutterMagentoLocalizations is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterMagentoLocalizations>());
  });

  test('getPlatformVersion', () async {
    FlutterMagentoLocalizations flutterMagentoLocalizationsPlugin = FlutterMagentoLocalizations();
    MockFlutterMagentoLocalizationsPlatform fakePlatform = MockFlutterMagentoLocalizationsPlatform();
    FlutterMagentoLocalizationsPlatform.instance = fakePlatform;

    expect(await flutterMagentoLocalizationsPlugin.getPlatformVersion(), '42');
  });
}
