<?php
/**
 * NativeMind FlutterTheme Fallback Category Block
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

namespace NativeMind\FlutterTheme\Block\Fallback;

use Magento\Catalog\Block\Product\ListProduct;

class Category extends ListProduct
{
    /**
     * Get category structured data for SEO
     *
     * @return string
     */
    public function getCategoryStructuredData(): string
    {
        $category = $this->getLayer()->getCurrentCategory();
        
        if (!$category) {
            return '';
        }

        $structuredData = [
            '@context' => 'https://schema.org',
            '@type' => 'CollectionPage',
            'name' => $category->getName(),
            'description' => strip_tags($category->getDescription() ?: ''),
            'url' => $category->getUrl(),
        ];

        // Add breadcrumb list
        $breadcrumbs = $this->getBreadcrumbPath();
        if (!empty($breadcrumbs)) {
            $itemListElement = [];
            $position = 1;
            
            foreach ($breadcrumbs as $breadcrumb) {
                $itemListElement[] = [
                    '@type' => 'ListItem',
                    'position' => $position++,
                    'name' => $breadcrumb['label'],
                    'item' => $breadcrumb['link'] ?? null,
                ];
            }
            
            $structuredData['breadcrumb'] = [
                '@type' => 'BreadcrumbList',
                'itemListElement' => $itemListElement,
            ];
        }

        return sprintf(
            '<script type="application/ld+json">%s</script>',
            json_encode($structuredData, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT)
        );
    }

    /**
     * Get breadcrumb path
     *
     * @return array
     */
    protected function getBreadcrumbPath(): array
    {
        $breadcrumbs = [];
        $category = $this->getLayer()->getCurrentCategory();
        
        if (!$category) {
            return $breadcrumbs;
        }

        $pathIds = $category->getPathIds();
        $categories = $category->getParentCategories();

        foreach ($pathIds as $categoryId) {
            if (!isset($categories[$categoryId])) {
                continue;
            }
            
            $cat = $categories[$categoryId];
            $breadcrumbs[] = [
                'label' => $cat->getName(),
                'link' => $cat->getUrl(),
            ];
        }

        return $breadcrumbs;
    }

    /**
     * Check if minimal mode is enabled
     *
     * @return bool
     */
    public function isMinimalMode(): bool
    {
        return $this->_scopeConfig->isSetFlag(
            'flutter_theme/seo/minimal_html',
            \Magento\Store\Model\ScopeInterface::SCOPE_STORE
        );
    }
}

