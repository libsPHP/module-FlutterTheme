
import 'flutter_magento_cart_platform_interface.dart';

class FlutterMagentoCart {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoCartPlatform.instance.getPlatformVersion();
  }
}
