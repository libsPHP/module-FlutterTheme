<?php
/**
 * Search Route Payload Builder
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Model\Route;

use Magento\Framework\App\Request\Http as HttpRequest;
use Magento\Store\Model\StoreManagerInterface;
use NativeMind\BridgeRoutes\Helper\Config;

class SearchRoutePayloadBuilder implements RoutePayloadBuilderInterface
{
    private Config $config;
    private CanonicalResolverInterface $canonicalResolver;
    private HttpRequest $request;
    private StoreManagerInterface $storeManager;

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
        return $routeType === RouteType::SEARCH;
    }

    public function build(array $storeData): ?RoutePayload
    {
        $query = $this->request->getParam('q', '');

        $canonicalUrl = $this->canonicalResolver->getSearchCanonical($query);
        $sourceUrl = $this->buildSourceUrl();
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
