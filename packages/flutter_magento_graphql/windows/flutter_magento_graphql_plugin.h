#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_GRAPHQL_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_GRAPHQL_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_graphql {

class FlutterMagentoGraphqlPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoGraphqlPlugin();

  virtual ~FlutterMagentoGraphqlPlugin();

  // Disallow copy and assign.
  FlutterMagentoGraphqlPlugin(const FlutterMagentoGraphqlPlugin&) = delete;
  FlutterMagentoGraphqlPlugin& operator=(const FlutterMagentoGraphqlPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_graphql

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_GRAPHQL_PLUGIN_H_
