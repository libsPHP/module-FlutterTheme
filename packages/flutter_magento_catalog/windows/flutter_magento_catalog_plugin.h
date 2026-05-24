#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_CATALOG_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_CATALOG_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_catalog {

class FlutterMagentoCatalogPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoCatalogPlugin();

  virtual ~FlutterMagentoCatalogPlugin();

  // Disallow copy and assign.
  FlutterMagentoCatalogPlugin(const FlutterMagentoCatalogPlugin&) = delete;
  FlutterMagentoCatalogPlugin& operator=(const FlutterMagentoCatalogPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_catalog

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_CATALOG_PLUGIN_H_
