#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_RIVERPOD_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_RIVERPOD_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_riverpod {

class FlutterMagentoRiverpodPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoRiverpodPlugin();

  virtual ~FlutterMagentoRiverpodPlugin();

  // Disallow copy and assign.
  FlutterMagentoRiverpodPlugin(const FlutterMagentoRiverpodPlugin&) = delete;
  FlutterMagentoRiverpodPlugin& operator=(const FlutterMagentoRiverpodPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_riverpod

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_RIVERPOD_PLUGIN_H_
