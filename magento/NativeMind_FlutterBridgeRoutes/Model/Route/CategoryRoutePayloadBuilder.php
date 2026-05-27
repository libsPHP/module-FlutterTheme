<?php
/**
 * Category Route Payload Builder
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

class CategoryRoutePayloadBuilder implements RoutePayloadBuilderInterface
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
        return $routeType === RouteType::CATEGORY;
    }

    public function build(array $storeData): ?RoutePayload
    {
        $category = $this->registry->registry('current_category');
        if (!$category) {
            return null;
        }

        $canonicalUrl = $this->canonicalResolver->getCategoryCanonical($category);
        $sourceUrl = $this->buildSourceUrl();
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
