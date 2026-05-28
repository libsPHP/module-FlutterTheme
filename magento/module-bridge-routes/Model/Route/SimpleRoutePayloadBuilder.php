<?php
/**
 * Simple Route Payload Builder
 *
 * Handles cart, checkout, customer, home routes
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Model\Route;

use Magento\Framework\App\Request\Http as HttpRequest;
use Magento\Store\Model\StoreManagerInterface;
use NativeMind\BridgeRoutes\Helper\Config;

class SimpleRoutePayloadBuilder implements RoutePayloadBuilderInterface
{
    private Config $config;
    private CanonicalResolverInterface $canonicalResolver;
    private HttpRequest $request;
    private StoreManagerInterface $storeManager;

    private const SUPPORTED_TYPES = [
        RouteType::CART,
        RouteType::CHECKOUT,
        RouteType::CUSTOMER,
        RouteType::HOME,
    ];

    private const PATH_MAP = [
        RouteType::CART => 'checkout/cart/',
        RouteType::CHECKOUT => 'checkout/',
        RouteType::CUSTOMER => 'customer/account/',
        RouteType::HOME => '',
    ];

    public function __construct(
        Config $config,
        CanonicalResolverInterface $canonicalResolver,
        HttpRequest $request,
        StoreManagerInterface $storeManager
    ) {
        $this->config = $config;
        $this->canonicalResolver = $canonicalResolver;
        $this->request = $request;
        $this->storeManager = $storeManager;
    }

    public function supports(string $routeType): bool
    {
        return in_array($routeType, self::SUPPORTED_TYPES, true);
    }

    public function build(array $storeData): ?RoutePayload
    {
        // This builder needs the route type passed in differently
        // For now, detect from request
        $routeType = $this->detectRouteType();
        if ($routeType === null) {
            return null;
        }

        $canonicalUrl = $this->canonicalResolver->getSimpleCanonical($routeType);
        $sourceUrl = $this->buildSourceUrl();
        $webPath = '/' . (self::PATH_MAP[$routeType] ?? '');
        $appRoute = $this->getAppRoute($routeType);

        return new RoutePayload(
            $routeType,
            $canonicalUrl,
            $webPath,
            $appRoute,
            [],
            $storeData,
            $this->config->getRouteStandardVersion(),
            $sourceUrl
        );
    }

    private function detectRouteType(): ?string
    {
        $fullActionName = $this->request->getFullActionName();

        $mapping = [
            'checkout_cart_index' => RouteType::CART,
            'checkout_index_index' => RouteType::CHECKOUT,
            'checkout_onepage_index' => RouteType::CHECKOUT,
            'customer_account_index' => RouteType::CUSTOMER,
            'customer_account_login' => RouteType::CUSTOMER,
            'customer_account_create' => RouteType::CUSTOMER,
            'cms_index_index' => RouteType::HOME,
        ];

        return $mapping[$fullActionName] ?? null;
    }

    private function getAppRoute(string $routeType): string
    {
        switch ($routeType) {
            case RouteType::CART:
                return $this->config->getCartAppRoute();
            case RouteType::CHECKOUT:
                return $this->config->getCheckoutAppRoute();
            case RouteType::CUSTOMER:
                return $this->config->getCustomerAppRoute();
            case RouteType::HOME:
                return $this->config->getHomeAppRoute();
            default:
                return '/';
        }
    }

    private function buildSourceUrl(): string
    {
        try {
            $baseUrl = $this->storeManager->getStore()->getBaseUrl();
            $requestUri = $this->request->getRequestUri();
            return rtrim($baseUrl, '/') . $requestUri;
        } catch (\Exception $e) {
            return '';
        }
    }
}
