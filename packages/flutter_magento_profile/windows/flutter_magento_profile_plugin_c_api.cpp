#include "include/flutter_magento_profile/flutter_magento_profile_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_profile_plugin.h"

void FlutterMagentoProfilePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_profile::FlutterMagentoProfilePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
