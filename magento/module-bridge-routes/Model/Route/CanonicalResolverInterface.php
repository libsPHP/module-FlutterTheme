<?php
/**
 * Canonical URL Resolver Interface
 *
 * Single source of truth for canonical URLs across Routes and SEO modules.
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Model\Route;

/**
 * Interface for resolving canonical URLs
 *
 * This ensures consistency between:
 * - <link rel="canonical"> in HTML head
 * - flutter-magento-route.canonicalUrl in route metadata
 * - Universal Links / App Links handlers
 */
interface CanonicalResolverInterface
{
    /**
     * Get canonical URL for a product
     *
     * @param \Magento\Catalog\Model\Product $product
     * @return string Canonical URL (shortest, normalized)
     */
    public function getProductCanonical($product): string;

    /**
     * Get canonical URL for a category
     *
     * @param \Magento\Catalog\Model\Category $category
     * @return string Canonical URL
     */
    public function getCategoryCanonical($category): string;

    /**
     * Get canonical URL for a CMS page
     *
     * @param \Magento\Cms\Model\Page $page
     * @return string Canonical URL
     */
    public function getCmsPageCanonical($page): string;

    /**
     * Get canonical URL for search results
     *
     * @param string $query Search query
     * @return string Canonical URL
     */
    public function getSearchCanonical(string $query): string;

    /**
     * Get canonical URL for a simple route type
     *
     * @param string $routeType One of RouteType constants
     * @return string Canonical URL
     */
    public function getSimpleCanonical(string $routeType): string;
}
