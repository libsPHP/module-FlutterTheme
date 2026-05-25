<?php
/**
 * Route Meta Block
 *
 * Outputs flutter_magento route metadata JSON.
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridgeRoutes\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use Magento\Framework\Registry;
use Magento\Store\Model\StoreManagerInterface;
use Magento\Framework\App\Request\Http as HttpRequest;
use NativeMind\FlutterBridgeRoutes\Helper\Config;
use NativeMind\FlutterBridgeRoutes\Model\Route\RoutePayload;
use NativeMind\FlutterBridgeRoutes\Model\Route\RouteType;

class RouteMeta extends Template
{
    private Config $config;
    private Registry $registry;
    private StoreManagerInterface $storeManager;
    private HttpRequest $request;

    public function __construct(
        Context $context,
        Config $config,
        Registry $registry,
        StoreManagerInterface $storeManager,
        HttpRequest $request,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->config = $config;
        $this->registry = $registry;
        $this->storeManager = $storeManager;
        $this->request = $request;
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
        $store = $this->getStoreData();

        switch ($type) {
            case RouteType::PRODUCT:
                return $this->buildProductPayload($store);
            case RouteType::CATEGORY:
                return $this->buildCategoryPayload($store);
            case RouteType::CMS:
                return $this->buildCmsPayload($store);
            case RouteType::SEARCH:
                return $this->buildSearchPayload($store);
            case RouteType::CART:
                return $this->buildSimplePayload(RouteType::CART, $this->config->getCartAppRoute(), $store);
            case RouteType::CHECKOUT:
                return $this->buildSimplePayload(RouteType::CHECKOUT, $this->config->getCheckoutAppRoute(), $store);
            case RouteType::CUSTOMER:
                return $this->buildSimplePayload(RouteType::CUSTOMER, $this->config->getCustomerAppRoute(), $store);
            case RouteType::HOME:
                return $this->buildSimplePayload(RouteType::HOME, $this->config->getHomeAppRoute(), $store);
            default:
                return null;
        }
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

    private function buildProductPayload(array $store): ?RoutePayload
    {
        $product = $this->registry->registry('current_product');
        if (!$product) {
            return null;
        }

        $canonicalUrl = $product->getProductUrl();
        $webPath = parse_url($canonicalUrl, PHP_URL_PATH) ?: '';

        $appRoutePattern = $this->config->getProductAppRoute();
        $appRoute = str_replace(
            ['{id}', '{sku}', '{urlKey}'],
            [$product->getId(), $product->getSku(), $product->getUrlKey()],
            $appRoutePattern
        );

        return new RoutePayload(
            RouteType::PRODUCT,
            $canonicalUrl,
            $webPath,
            $appRoute,
            [
                'id' => (int) $product->getId(),
                'sku' => $product->getSku(),
                'urlKey' => $product->getUrlKey(),
            ],
            $store,
            $this->config->getRouteStandardVersion()
        );
    }

    private function buildCategoryPayload(array $store): ?RoutePayload
    {
        $category = $this->registry->registry('current_category');
        if (!$category) {
            return null;
        }

        $canonicalUrl = $category->getUrl();
        $webPath = parse_url($canonicalUrl, PHP_URL_PATH) ?: '';

        $appRoutePattern = $this->config->getCategoryAppRoute();
        $appRoute = str_replace(
            ['{id}', '{urlKey}', '{urlPath}'],
            [$category->getId(), $category->getUrlKey(), $category->getUrlPath()],
            $appRoutePattern
        );

        return new RoutePayload(
            RouteType::CATEGORY,
            $canonicalUrl,
            $webPath,
            $appRoute,
            [
                'id' => (int) $category->getId(),
                'urlKey' => $category->getUrlKey(),
                'urlPath' => $category->getUrlPath(),
            ],
            $store,
            $this->config->getRouteStandardVersion()
        );
    }

    private function buildCmsPayload(array $store): ?RoutePayload
    {
        $page = $this->registry->registry('cms_page');
        if (!$page) {
            return null;
        }

        try {
            $canonicalUrl = $this->storeManager->getStore()->getBaseUrl() . $page->getIdentifier();
        } catch (\Exception $e) {
            $canonicalUrl = '';
        }
        $webPath = '/' . $page->getIdentifier();

        $appRoutePattern = $this->config->getCmsAppRoute();
        $appRoute = str_replace(
            ['{id}', '{identifier}'],
            [$page->getId(), $page->getIdentifier()],
            $appRoutePattern
        );

        return new RoutePayload(
            RouteType::CMS,
            $canonicalUrl,
            $webPath,
            $appRoute,
            [
                'id' => (int) $page->getId(),
                'identifier' => $page->getIdentifier(),
            ],
            $store,
            $this->config->getRouteStandardVersion()
        );
    }

    private function buildSearchPayload(array $store): ?RoutePayload
    {
        $query = $this->request->getParam('q', '');

        try {
            $canonicalUrl = $this->storeManager->getStore()->getBaseUrl() . 'catalogsearch/result/?q=' . urlencode($query);
        } catch (\Exception $e) {
            $canonicalUrl = '';
        }
        $webPath = '/catalogsearch/result/';

        $appRoutePattern = $this->config->getSearchAppRoute();
        $appRoute = str_replace('{query}', urlencode($query), $appRoutePattern);

        return new RoutePayload(
            RouteType::SEARCH,
            $canonicalUrl,
            $webPath,
            $appRoute,
            [
                'query' => $query,
            ],
            $store,
            $this->config->getRouteStandardVersion()
        );
    }

    private function buildSimplePayload(string $type, string $appRoute, array $store): RoutePayload
    {
        try {
            $baseUrl = $this->storeManager->getStore()->getBaseUrl();
        } catch (\Exception $e) {
            $baseUrl = '';
        }

        $pathMap = [
            RouteType::CART => 'checkout/cart/',
            RouteType::CHECKOUT => 'checkout/',
            RouteType::CUSTOMER => 'customer/account/',
            RouteType::HOME => '',
        ];

        $webPath = '/' . ($pathMap[$type] ?? '');
        $canonicalUrl = $baseUrl . ltrim($webPath, '/');

        return new RoutePayload(
            $type,
            $canonicalUrl,
            $webPath,
            $appRoute,
            [],
            $store,
            $this->config->getRouteStandardVersion()
        );
    }
}
