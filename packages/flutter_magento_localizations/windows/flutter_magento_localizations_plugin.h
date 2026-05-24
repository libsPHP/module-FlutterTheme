#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_LOCALIZATIONS_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_LOCALIZATIONS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_localizations {

class FlutterMagentoLocalizationsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoLocalizationsPlugin();

  virtual ~FlutterMagentoLocalizationsPlugin();

  // Disallow copy and assign.
  FlutterMagentoLocalizationsPlugin(const FlutterMagentoLocalizationsPlugin&) = delete;
  FlutterMagentoLocalizationsPlugin& operator=(const FlutterMagentoLocalizationsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_localizations

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_LOCALIZATIONS_PLUGIN_H_
