#include "include/flutter_magento_offline/flutter_magento_offline_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_offline_plugin.h"

void FlutterMagentoOfflinePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_offline::FlutterMagentoOfflinePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
