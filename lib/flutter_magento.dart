
import 'flutter_magento_platform_interface.dart';

class FlutterMagento {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoPlatform.instance.getPlatformVersion();
  }
}
