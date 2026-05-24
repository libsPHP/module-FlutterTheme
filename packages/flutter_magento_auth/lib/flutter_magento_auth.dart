
import 'flutter_magento_auth_platform_interface.dart';

class FlutterMagentoAuth {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoAuthPlatform.instance.getPlatformVersion();
  }
}
