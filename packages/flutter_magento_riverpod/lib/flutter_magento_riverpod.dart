
import 'flutter_magento_riverpod_platform_interface.dart';

class FlutterMagentoRiverpod {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoRiverpodPlatform.instance.getPlatformVersion();
  }
}
