#include "include/flutter_magento_catalog/flutter_magento_catalog_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_catalog_plugin.h"

void FlutterMagentoCatalogPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_catalog::FlutterMagentoCatalogPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
