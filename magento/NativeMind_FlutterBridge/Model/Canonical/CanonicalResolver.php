<?php
/**
 * Canonical URL Resolver
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Model\Canonical;

use Magento\Framework\App\Request\Http as HttpRequest;
use Magento\Framework\Registry;
use Magento\Store\Model\StoreManagerInterface;
use Magento\Catalog\Model\Product;
use Magento\Catalog\Model\Category;
use Magento\Cms\Model\Page;
use NativeMind\FlutterBridge\Helper\Config;
use NativeMind\FlutterBridge\Model\Config\Source\ProductCanonicalMode;

class CanonicalResolver
{
    private Config $config;
    private HttpRequest $request;
    private Registry $registry;
    private StoreManagerInterface $storeManager;

    /**
     * Tracking parameters to strip
     */
    private const TRACKING_PARAMS = [
        'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content',
        'gclid', 'fbclid', 'msclkid', 'dclid', 'mc_cid', 'mc_eid',
        'ref', 'affiliate', 'partner'
    ];

    public function __construct(
        Config $config,
        HttpRequest $request,
        Registry $registry,
        StoreManagerInterface $storeManager
    ) {
        $this->config = $config;
        $this->request = $request;
        $this->registry = $registry;
        $this->storeManager = $storeManager;
    }

    /**
     * Resolve canonical URL for current page
     *
     * @return string|null
     */
    public function resolve(): ?string
    {
        if (!$this->config->isCanonicalEnabled()) {
            return null;
        }

        $fullActionName = $this->request->getFullActionName();

        switch ($fullActionName) {
            case 'catalog_product_view':
                return $this->resolveProductCanonical();
            case 'catalog_category_view':
                return $this->resolveCategoryCanonical();
            case 'cms_page_view':
                return $this->resolveCmsCanonical();
            case 'cms_index_index':
                return $this->resolveHomeCanonical();
            default:
                return null;
        }
    }

    /**
     * Resolve product canonical URL
     *
     * @return string|null
     */
    private function resolveProductCanonical(): ?string
    {
        /** @var Product|null $product */
        $product = $this->registry->registry('current_product');
        if (!$product) {
            return null;
        }

        $mode = $this->config->getProductCanonicalMode();

        switch ($mode) {
            case ProductCanonicalMode::SHORTEST:
                return $this->getShortestProductUrl($product);
            case ProductCanonicalMode::CATEGORY_PATH:
                return $product->getProductUrl();
            case ProductCanonicalMode::MAGENTO_DEFAULT:
            default:
                return null; // Let Magento handle it
        }
    }

    /**
     * Get shortest product URL (without category path)
     *
     * @param Product $product
     * @return string
     */
    private function getShortestProductUrl(Product $product): string
    {
        try {
            $baseUrl = $this->storeManager->getStore()->getBaseUrl();
            $urlKey = $product->getUrlKey();
            $suffix = $this->config->scopeConfig->getValue(
                'catalog/seo/product_url_suffix',
                \Magento\Store\Model\ScopeInterface::SCOPE_STORE
            );

            return $baseUrl . $urlKey . ($suffix ?: '');
        } catch (\Exception $e) {
            return $product->getProductUrl();
        }
    }

    /**
     * Resolve category canonical URL
     *
     * @return string|null
     */
    private function resolveCategoryCanonical(): ?string
    {
        /** @var Category|null $category */
        $category = $this->registry->registry('current_category');
        if (!$category) {
            return null;
        }

        // Strip filter parameters from canonical
        $url = $category->getUrl();
        return $this->stripTrackingParams($url);
    }

    /**
     * Resolve CMS page canonical URL
     *
     * @return string|null
     */
    private function resolveCmsCanonical(): ?string
    {
        /** @var Page|null $page */
        $page = $this->registry->registry('cms_page');
        if (!$page) {
            return null;
        }

        try {
            $baseUrl = $this->storeManager->getStore()->getBaseUrl();
            return $baseUrl . $page->getIdentifier();
        } catch (\Exception $e) {
            return null;
        }
    }

    /**
     * Resolve home page canonical URL
     *
     * @return string|null
     */
    private function resolveHomeCanonical(): ?string
    {
        try {
            return $this->storeManager->getStore()->getBaseUrl();
        } catch (\Exception $e) {
            return null;
        }
    }

    /**
     * Strip UTM and tracking parameters from URL
     *
     * @param string $url
     * @return string
     */
    public function stripTrackingParams(string $url): string
    {
        $parsed = parse_url($url);
        if (!isset($parsed['query'])) {
            return $url;
        }

        parse_str($parsed['query'], $params);

        // Strip UTM params
        if ($this->config->shouldStripUtm()) {
            foreach ($params as $key => $value) {
                if (strpos($key, 'utm_') === 0) {
                    unset($params[$key]);
                }
            }
        }

        // Strip tracking params
        if ($this->config->shouldStripTracking()) {
            foreach (self::TRACKING_PARAMS as $param) {
                unset($params[$param]);
            }
        }

        // Rebuild URL
        $baseUrl = $parsed['scheme'] . '://' . $parsed['host'];
        if (isset($parsed['port'])) {
            $baseUrl .= ':' . $parsed['port'];
        }
        $baseUrl .= $parsed['path'] ?? '';

        if (!empty($params)) {
            $baseUrl .= '?' . http_build_query($params);
        }

        return $baseUrl;
    }

    /**
     * Check if current page has filters applied
     *
     * @return bool
     */
    public function hasActiveFilters(): bool
    {
        $params = $this->request->getParams();

        // Common filter parameter patterns
        $filterPatterns = ['price', 'color', 'size', 'brand', 'cat', 'p', 'limit', 'order', 'dir'];

        foreach ($params as $key => $value) {
            if (in_array($key, $filterPatterns, true)) {
                return true;
            }
            // Layered navigation attributes
            if (is_numeric($value) && strlen($key) > 2 && !in_array($key, ['id', 'cat'])) {
                return true;
            }
        }

        return false;
    }
}
