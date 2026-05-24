
import 'flutter_magento_core_platform_interface.dart';

class FlutterMagentoCore {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoCorePlatform.instance.getPlatformVersion();
  }
}
