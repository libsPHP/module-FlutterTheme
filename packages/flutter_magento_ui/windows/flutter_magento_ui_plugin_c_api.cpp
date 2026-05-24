#include "include/flutter_magento_ui/flutter_magento_ui_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_ui_plugin.h"

void FlutterMagentoUiPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_ui::FlutterMagentoUiPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
