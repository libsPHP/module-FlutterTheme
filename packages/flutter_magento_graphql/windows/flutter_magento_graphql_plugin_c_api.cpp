#include "include/flutter_magento_graphql/flutter_magento_graphql_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_graphql_plugin.h"

void FlutterMagentoGraphqlPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_graphql::FlutterMagentoGraphqlPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
