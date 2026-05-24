
import 'flutter_magento_ui_platform_interface.dart';

class FlutterMagentoUi {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoUiPlatform.instance.getPlatformVersion();
  }
}
