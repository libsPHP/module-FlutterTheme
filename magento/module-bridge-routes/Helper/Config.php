<?php
/**
 * NativeMind BridgeRoutes Configuration Helper
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use Magento\Store\Model\ScopeInterface;
use NativeMind\BridgeCore\Helper\Config as CoreConfig;

class Config extends AbstractHelper
{
    private const XML_PATH_ENABLED = 'nativemind_Bridge/route/enabled';
    private const XML_PATH_STANDARD_VERSION = 'nativemind_Bridge/route/standard_version';
    private const XML_PATH_PRODUCT_ROUTE = 'nativemind_Bridge/route/product_app_route';
    private const XML_PATH_CATEGORY_ROUTE = 'nativemind_Bridge/route/category_app_route';
    private const XML_PATH_CMS_ROUTE = 'nativemind_Bridge/route/cms_app_route';
    private const XML_PATH_SEARCH_ROUTE = 'nativemind_Bridge/route/search_app_route';
    private const XML_PATH_CART_ROUTE = 'nativemind_Bridge/route/cart_app_route';
    private const XML_PATH_CHECKOUT_ROUTE = 'nativemind_Bridge/route/checkout_app_route';
    private const XML_PATH_CUSTOMER_ROUTE = 'nativemind_Bridge/route/customer_app_route';
    private const XML_PATH_HOME_ROUTE = 'nativemind_Bridge/route/home_app_route';

    private CoreConfig $coreConfig;

    public function __construct(
        Context $context,
        CoreConfig $coreConfig
    ) {
        parent::__construct($context);
        $this->coreConfig = $coreConfig;
    }

    public function isRouteEnabled(?int $storeId = null): bool
    {
        return $this->coreConfig->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getRouteStandardVersion(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_STANDARD_VERSION,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'flutter_magento_v1';
    }

    public function getProductAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_PRODUCT_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/product/{sku}';
    }

    public function getCategoryAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_CATEGORY_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/category/{id}';
    }

    public function getCmsAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_CMS_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/page/{identifier}';
    }

    public function getSearchAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_SEARCH_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/search?q={query}';
    }

    public function getCartAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_CART_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/cart';
    }

    public function getCheckoutAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_CHECKOUT_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/checkout';
    }

    public function getCustomerAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_CUSTOMER_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/account';
    }

    public function getHomeAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_HOME_ROUTE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/';
    }
}
