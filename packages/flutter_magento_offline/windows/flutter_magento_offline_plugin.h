#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_OFFLINE_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_OFFLINE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_offline {

class FlutterMagentoOfflinePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoOfflinePlugin();

  virtual ~FlutterMagentoOfflinePlugin();

  // Disallow copy and assign.
  FlutterMagentoOfflinePlugin(const FlutterMagentoOfflinePlugin&) = delete;
  FlutterMagentoOfflinePlugin& operator=(const FlutterMagentoOfflinePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_offline

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_OFFLINE_PLUGIN_H_
