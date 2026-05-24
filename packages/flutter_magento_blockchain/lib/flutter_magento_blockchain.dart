
import 'flutter_magento_blockchain_platform_interface.dart';

class FlutterMagentoBlockchain {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoBlockchainPlatform.instance.getPlatformVersion();
  }
}
