#ifndef FLUTTER_PLUGIN_FLUTTER_MAGENTO_BLOCKCHAIN_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_MAGENTO_BLOCKCHAIN_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_magento_blockchain {

class FlutterMagentoBlockchainPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterMagentoBlockchainPlugin();

  virtual ~FlutterMagentoBlockchainPlugin();

  // Disallow copy and assign.
  FlutterMagentoBlockchainPlugin(const FlutterMagentoBlockchainPlugin&) = delete;
  FlutterMagentoBlockchainPlugin& operator=(const FlutterMagentoBlockchainPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_magento_blockchain

#endif  // FLUTTER_PLUGIN_FLUTTER_MAGENTO_BLOCKCHAIN_PLUGIN_H_
