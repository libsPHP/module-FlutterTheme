#include "include/flutter_magento_core/flutter_magento_core_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_core_plugin.h"

void FlutterMagentoCorePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_core::FlutterMagentoCorePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
