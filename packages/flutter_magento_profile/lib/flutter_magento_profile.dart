
import 'flutter_magento_profile_platform_interface.dart';

class FlutterMagentoProfile {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoProfilePlatform.instance.getPlatformVersion();
  }
}
