<?php
/**
 * Default Canonical URL Resolver
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Model\Route;

use Magento\Store\Model\StoreManagerInterface;
use Magento\Catalog\Helper\Product as ProductHelper;

class DefaultCanonicalResolver implements CanonicalResolverInterface
{
    private StoreManagerInterface $storeManager;
    private ProductHelper $productHelper;

    public function __construct(
        StoreManagerInterface $storeManager,
        ProductHelper $productHelper
    ) {
        $this->storeManager = $storeManager;
        $this->productHelper = $productHelper;
    }

    public function getProductCanonical($product): string
    {
        // Use Magento's canonical URL logic which respects
        // catalog/seo/product_canonical_tag setting
        return $this->productHelper->getProductUrl($product);
    }

    public function getCategoryCanonical($category): string
    {
        return $category->getUrl();
    }

    public function getCmsPageCanonical($page): string
    {
        try {
            $baseUrl = $this->storeManager->getStore()->getBaseUrl();
            $identifier = $page->getIdentifier();

            // Home page special case
            if ($identifier === 'home' || $identifier === '') {
                return rtrim($baseUrl, '/');
            }

            return $baseUrl . $identifier;
        } catch (\Exception $e) {
            return '';
        }
    }

    public function getSearchCanonical(string $query): string
    {
        try {
            $baseUrl = $this->storeManager->getStore()->getBaseUrl();
            return $baseUrl . 'catalogsearch/result/?q=' . urlencode($query);
        } catch (\Exception $e) {
            return '';
        }
    }

    public function getSimpleCanonical(string $routeType): string
    {
        try {
            $baseUrl = $this->storeManager->getStore()->getBaseUrl();
        } catch (\Exception $e) {
            return '';
        }

        $pathMap = [
            RouteType::CART => 'checkout/cart/',
            RouteType::CHECKOUT => 'checkout/',
            RouteType::CUSTOMER => 'customer/account/',
            RouteType::HOME => '',
        ];

        $path = $pathMap[$routeType] ?? '';
        return rtrim($baseUrl, '/') . '/' . ltrim($path, '/');
    }
}
