#include "include/flutter_magento_riverpod/flutter_magento_riverpod_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_riverpod_plugin.h"

void FlutterMagentoRiverpodPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_riverpod::FlutterMagentoRiverpodPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
