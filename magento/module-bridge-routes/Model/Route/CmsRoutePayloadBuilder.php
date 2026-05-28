<?php
/**
 * CMS Page Route Payload Builder
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Model\Route;

use Magento\Framework\Registry;
use Magento\Framework\App\Request\Http as HttpRequest;
use Magento\Store\Model\StoreManagerInterface;
use NativeMind\BridgeRoutes\Helper\Config;

class CmsRoutePayloadBuilder implements RoutePayloadBuilderInterface
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
        return $routeType === RouteType::CMS;
    }

    public function build(array $storeData): ?RoutePayload
    {
        $page = $this->registry->registry('cms_page');
        if (!$page) {
            return null;
        }

        $canonicalUrl = $this->canonicalResolver->getCmsPageCanonical($page);
        $sourceUrl = $this->buildSourceUrl();
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
