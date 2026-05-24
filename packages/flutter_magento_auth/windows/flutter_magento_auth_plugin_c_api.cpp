#include "include/flutter_magento_auth/flutter_magento_auth_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_auth_plugin.h"

void FlutterMagentoAuthPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_auth::FlutterMagentoAuthPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
