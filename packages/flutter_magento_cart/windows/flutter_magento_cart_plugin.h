#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_CART_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_CART_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_cart {

class FlutterMagentoCartPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoCartPlugin();

  virtual ~FlutterMagentoCartPlugin();

  // Disallow copy and assign.
  FlutterMagentoCartPlugin(const FlutterMagentoCartPlugin&) = delete;
  FlutterMagentoCartPlugin& operator=(const FlutterMagentoCartPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_cart

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_CART_PLUGIN_H_
