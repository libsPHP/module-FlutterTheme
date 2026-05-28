<?php
declare(strict_types=1);

namespace NativeMind\BridgeAppLinks\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use Magento\Store\Model\ScopeInterface;
use NativeMind\BridgeCore\Helper\Config as CoreConfig;

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
            'nativemind_Bridge/applinks/enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getAndroidPackageName(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/applinks/android_package_name',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getAndroidSha256Fingerprints(?int $storeId = null): array
    {
        $fingerprints = (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/applinks/android_sha256_fingerprints',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );

        if (empty($fingerprints)) {
            return [];
        }

        return array_filter(array_map('trim', explode("\n", $fingerprints)));
    }

    public function getIosAppId(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/applinks/ios_app_id',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }
}
