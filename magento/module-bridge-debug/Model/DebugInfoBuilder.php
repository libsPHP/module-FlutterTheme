<?php
declare(strict_types=1);

namespace NativeMind\BridgeDebug\Model;

use Magento\Framework\Module\Manager as ModuleManager;
use Magento\Store\Model\StoreManagerInterface;
use NativeMind\BridgeDebug\Helper\Config;

class DebugInfoBuilder
{
    private Config $config;
    private ModuleManager $moduleManager;
    private StoreManagerInterface $storeManager;

    public function __construct(
        Config $config,
        ModuleManager $moduleManager,
        StoreManagerInterface $storeManager
    ) {
        $this->config = $config;
        $this->moduleManager = $moduleManager;
        $this->storeManager = $storeManager;
    }

    public function build(): array
    {
        if (!$this->config->isDebugMode()) {
            return ['error' => 'Debug mode is disabled'];
        }

        try {
            $store = $this->storeManager->getStore();

            return [
                'version' => $this->config->getVersion(),
                'enabled' => $this->config->isEnabled(),
                'debug_mode' => $this->config->isDebugMode(),
                'store' => [
                    'id' => (int) $store->getId(),
                    'code' => $store->getCode(),
                    'name' => $store->getName(),
                    'base_url' => $store->getBaseUrl()
                ],
                'modules' => $this->getModuleStatus(),
                'php_version' => PHP_VERSION,
                'timestamp' => date('c')
            ];
        } catch (\Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }

    private function getModuleStatus(): array
    {
        $modules = [
            'NativeMind_BridgeCore',
            'NativeMind_BridgeRoutes',
            'NativeMind_BridgeSeo',
            'NativeMind_BridgeAppLinks',
            'NativeMind_BridgeAppBanner',
            'NativeMind_BridgeFlutterWeb',
            'NativeMind_BridgeDebug'
        ];

        $status = [];
        foreach ($modules as $module) {
            $status[$module] = $this->moduleManager->isEnabled($module);
        }

        return $status;
    }

    public function toJson(): string
    {
        return json_encode($this->build(), JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
    }
}
