<?php
/**
 * Route Meta Block
 *
 * Outputs flutter_magento route metadata JSON.
 * Delegates payload building to specialized services.
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridgeRoutes\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use Magento\Store\Model\StoreManagerInterface;
use Magento\Framework\App\Request\Http as HttpRequest;
use NativeMind\FlutterBridgeRoutes\Helper\Config;
use NativeMind\FlutterBridgeRoutes\Model\Route\RoutePayload;
use NativeMind\FlutterBridgeRoutes\Model\Route\RouteType;
use NativeMind\FlutterBridgeRoutes\Model\Route\RoutePayloadBuilderPool;

class RouteMeta extends Template
{
    private Config $config;
    private StoreManagerInterface $storeManager;
    private HttpRequest $request;
    private RoutePayloadBuilderPool $builderPool;

    public function __construct(
        Context $context,
        Config $config,
        StoreManagerInterface $storeManager,
        HttpRequest $request,
        RoutePayloadBuilderPool $builderPool,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->config = $config;
        $this->storeManager = $storeManager;
        $this->request = $request;
        $this->builderPool = $builderPool;
    }

    public function isEnabled(): bool
    {
        return $this->config->isRouteEnabled();
    }

    public function hasRoutePayload(): bool
    {
        return $this->detectRouteType() !== RouteType::UNKNOWN;
    }

    public function getRoutePayloadJson(): string
    {
        $payload = $this->buildRoutePayload();
        return $payload ? $payload->toJson() : '{}';
    }

    private function buildRoutePayload(): ?RoutePayload
    {
        $type = $this->detectRouteType();
        if ($type === RouteType::UNKNOWN) {
            return null;
        }

        $storeData = $this->getStoreData();
        return $this->builderPool->build($type, $storeData);
    }

    private function detectRouteType(): string
    {
        $fullActionName = $this->request->getFullActionName();

        $mapping = [
            'catalog_product_view' => RouteType::PRODUCT,
            'catalog_category_view' => RouteType::CATEGORY,
            'cms_page_view' => RouteType::CMS,
            'cms_index_index' => RouteType::HOME,
            'catalogsearch_result_index' => RouteType::SEARCH,
            'catalogsearch_advanced_result' => RouteType::SEARCH,
            'checkout_cart_index' => RouteType::CART,
            'checkout_index_index' => RouteType::CHECKOUT,
            'checkout_onepage_index' => RouteType::CHECKOUT,
            'customer_account_index' => RouteType::CUSTOMER,
            'customer_account_login' => RouteType::CUSTOMER,
            'customer_account_create' => RouteType::CUSTOMER,
        ];

        return $mapping[$fullActionName] ?? RouteType::UNKNOWN;
    }

    private function getStoreData(): array
    {
        try {
            $store = $this->storeManager->getStore();
            $website = $this->storeManager->getWebsite();

            return [
                'websiteCode' => $website->getCode(),
                'storeCode' => $store->getCode(),
                'currency' => $store->getCurrentCurrencyCode(),
                'locale' => $this->_scopeConfig->getValue(
                    'general/locale/code',
                    \Magento\Store\Model\ScopeInterface::SCOPE_STORE,
                    $store->getId()
                ),
            ];
        } catch (\Exception $e) {
            return [];
        }
    }
}
