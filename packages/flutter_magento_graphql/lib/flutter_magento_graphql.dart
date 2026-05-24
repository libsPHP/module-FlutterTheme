
import 'flutter_magento_graphql_platform_interface.dart';

class FlutterMagentoGraphql {
  Future<String?> getPlatformVersion() {
    return FlutterMagentoGraphqlPlatform.instance.getPlatformVersion();
  }
}
