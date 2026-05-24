
import 'flutter_magento_catalog_platform_interface.dart';

class FlutterMagentoCatalog {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoCatalogPlatform.instance.getPlatformVersion();
  }
}
