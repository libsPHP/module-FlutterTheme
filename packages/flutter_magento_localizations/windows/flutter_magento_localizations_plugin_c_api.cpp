#include "include/flutter_magento_localizations/flutter_magento_localizations_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_magento_localizations_plugin.h"

void FlutterMagentoLocalizationsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_magento_localizations::FlutterMagentoLocalizationsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
