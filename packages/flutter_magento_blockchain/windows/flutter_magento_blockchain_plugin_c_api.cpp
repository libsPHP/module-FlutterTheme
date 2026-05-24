#include "include/flutter_magento_blockchain/flutter_magento_blockchain_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_blockchain_plugin.h"

void FlutterMagentoBlockchainPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_blockchain::FlutterMagentoBlockchainPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
