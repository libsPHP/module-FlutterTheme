<?php
declare(strict_types=1);

namespace NativeMind\BridgeSeo\Helper;

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

    public function isCanonicalEnabled(?int $storeId = null): bool
    {
        return $this->coreConfig->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            'nativemind_Bridge/canonical/enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getProductCanonicalMode(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/canonical/product_mode',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'shortest';
    }

    public function shouldStripUtm(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            'nativemind_Bridge/canonical/strip_utm',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function shouldStripTracking(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            'nativemind_Bridge/canonical/strip_tracking',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isJsonLdEnabled(?int $storeId = null): bool
    {
        return $this->coreConfig->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            'nativemind_Bridge/jsonld/enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isProductJsonLdEnabled(?int $storeId = null): bool
    {
        return $this->isJsonLdEnabled($storeId) && $this->scopeConfig->isSetFlag(
            'nativemind_Bridge/jsonld/product_enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getSearchRobots(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/robots/search_robots',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'noindex,follow';
    }

    public function getCartRobots(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_Bridge/robots/cart_robots',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'noindex,nofollow';
    }
}
