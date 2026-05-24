
import 'flutter_magento_localizations_platform_interface.dart';

class FlutterMagentoLocalizations {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoLocalizationsPlatform.instance.getPlatformVersion();
  }
}
