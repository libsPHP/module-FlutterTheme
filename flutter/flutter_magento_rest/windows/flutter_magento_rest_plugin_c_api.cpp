#include "include/flutter_magento_rest/flutter_magento_rest_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_rest_plugin.h"

void FlutterMagentoRestPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_rest::FlutterMagentoRestPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
