
import 'flutter_magento_rest_platform_interface.dart';

class FlutterMagentoRest {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoRestPlatform.instance.getPlatformVersion();
  }
}
