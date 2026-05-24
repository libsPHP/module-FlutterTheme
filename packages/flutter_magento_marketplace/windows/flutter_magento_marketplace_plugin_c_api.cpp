#include "include/flutter_magento_marketplace/flutter_magento_marketplace_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_marketplace_plugin.h"

void FlutterMagentoMarketplacePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_marketplace::FlutterMagentoMarketplacePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
