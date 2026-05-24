#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_PROFILE_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_PROFILE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_profile {

class FlutterMagentoProfilePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoProfilePlugin();

  virtual ~FlutterMagentoProfilePlugin();

  // Disallow copy and assign.
  FlutterMagentoProfilePlugin(const FlutterMagentoProfilePlugin&) = delete;
  FlutterMagentoProfilePlugin& operator=(const FlutterMagentoProfilePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_profile

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_PROFILE_PLUGIN_H_
