#include "include/flutter_magento_cart/flutter_magento_cart_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_cart_plugin.h"

void FlutterMagentoCartPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_cart::FlutterMagentoCartPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
