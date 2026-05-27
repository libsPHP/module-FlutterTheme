<?php
/**
 * Product Route Payload Builder
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridgeRoutes\Model\Route;

use Magento\Framework\Registry;
use Magento\Framework\App\Request\Http as HttpRequest;
use Magento\Store\Model\StoreManagerInterface;
use NativeMind\FlutterBridgeRoutes\Helper\Config;

class ProductRoutePayloadBuilder implements RoutePayloadBuilderInterface
{
    private Registry $registry;
    private Config $config;
    private CanonicalResolverInterface $canonicalResolver;
    private HttpRequest $request;
    private StoreManagerInterface $storeManager;

    public function __construct(
        Registry $registry,
        Config $config,
        CanonicalResolverInterface $canonicalResolver,
        HttpRequest $request,
        StoreManagerInterface $storeManager
    ) {
        $this->registry = $registry;
        $this->config = $config;
        $this->canonicalResolver = $canonicalResolver;
        $this->request = $request;
        $this->storeManager = $storeManager;
    }

    public function supports(string $routeType): bool
    {
        return $routeType === RouteType::PRODUCT;
    }

    public function build(array $storeData): ?RoutePayload
    {
        $product = $this->registry->registry('current_product');
        if (!$product) {
            return null;
        }

        // Canonical URL from single source of truth
        $canonicalUrl = $this->canonicalResolver->getProductCanonical($product);

        // Source URL is the actual request URL (may include category path, tracking params)
        $sourceUrl = $this->buildSourceUrl();

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
            $storeData,
            $this->config->getRouteStandardVersion(),
            $sourceUrl
        );
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
