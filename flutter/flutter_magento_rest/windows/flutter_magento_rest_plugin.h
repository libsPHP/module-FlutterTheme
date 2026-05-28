#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_REST_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_REST_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_rest {

class FlutterMagentoRestPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoRestPlugin();

  virtual ~FlutterMagentoRestPlugin();

  // Disallow copy and assign.
  FlutterMagentoRestPlugin(const FlutterMagentoRestPlugin&) = delete;
  FlutterMagentoRestPlugin& operator=(const FlutterMagentoRestPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_rest

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_REST_PLUGIN_H_
