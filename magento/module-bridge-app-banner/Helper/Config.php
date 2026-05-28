<?php
declare(strict_types=1);

namespace NativeMind\BridgeAppBanner\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use Magento\Framework\UrlInterface;
use Magento\Store\Model\ScopeInterface;
use Magento\Store\Model\StoreManagerInterface;
use NativeMind\BridgeCore\Helper\Config as CoreConfig;

class Config extends AbstractHelper
{
    private CoreConfig $coreConfig;
    private StoreManagerInterface $storeManager;

    public function __construct(
        Context $context,
        CoreConfig $coreConfig,
        StoreManagerInterface $storeManager
    ) {
        parent::__construct($context);
        $this->coreConfig = $coreConfig;
        $this->storeManager = $storeManager;
    }

    public function isEnabled(?int $storeId = null): bool
    {
        return $this->coreConfig->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            'nativemind_Bridge/appbanner/enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getAppName(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/appbanner/app_name',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getAppIcon(?int $storeId = null): string
    {
        $icon = $this->scopeConfig->getValue(
            'nativemind_Bridge/appbanner/app_icon',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );

        if (empty($icon)) {
            return '';
        }

        try {
            $mediaUrl = $this->storeManager->getStore()->getBaseUrl(UrlInterface::URL_TYPE_MEDIA);
            return $mediaUrl . 'nativemind/appbanner/' . $icon;
        } catch (\Exception $e) {
            return '';
        }
    }

    public function getAndroidStoreUrl(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/appbanner/android_store_url',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getIosStoreUrl(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/appbanner/ios_store_url',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getCtaText(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/appbanner/cta_text',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'Open in App';
    }

    public function getPosition(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/appbanner/position',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'top';
    }

    public function getDismissDuration(?int $storeId = null): int
    {
        return (int) $this->scopeConfig->getValue(
            'nativemind_Bridge/appbanner/dismiss_duration',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 7;
    }
}
