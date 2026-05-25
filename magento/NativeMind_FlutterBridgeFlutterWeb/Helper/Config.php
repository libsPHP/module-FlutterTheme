<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeFlutterWeb\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use Magento\Store\Model\ScopeInterface;
use NativeMind\FlutterBridgeCore\Helper\Config as CoreConfig;

class Config extends AbstractHelper
{
    private CoreConfig $coreConfig;

    public function __construct(Context $context, CoreConfig $coreConfig)
    {
        parent::__construct($context);
        $this->coreConfig = $coreConfig;
    }

    public function isEnabled(?int $storeId = null): bool
    {
        return $this->coreConfig->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            'nativemind_flutterbridge/flutterweb/enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getBaseUrl(?int $storeId = null): string
    {
        $url = (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/base_url',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );

        return rtrim($url, '/') . '/';
    }

    public function getLoaderTimeout(?int $storeId = null): int
    {
        return (int) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/loader_timeout',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 5000;
    }

    public function isServiceWorkerEnabled(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            'nativemind_flutterbridge/flutterweb/service_worker_enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isDebugMode(?int $storeId = null): bool
    {
        return $this->coreConfig->isDebugMode($storeId);
    }
}
