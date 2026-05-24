
import 'flutter_magento_offline_platform_interface.dart';

class FlutterMagentoOffline {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoOfflinePlatform.instance.getPlatformVersion();
  }
}
