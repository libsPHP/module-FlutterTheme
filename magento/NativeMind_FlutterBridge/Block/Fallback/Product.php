<?php
/**
 * NativeMind FlutterTheme Fallback Product Block
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

namespace NativeMind\FlutterTheme\Block\Fallback;

use Magento\Catalog\Block\Product\View as ProductView;
use Magento\Catalog\Block\Product\Context;
use Magento\Framework\Url\EncoderInterface;
use Magento\Framework\Json\EncoderInterface as JsonEncoderInterface;
use Magento\Framework\Stdlib\StringUtils;
use Magento\Catalog\Helper\Product as ProductHelper;
use Magento\Catalog\Model\ProductTypes\ConfigInterface;
use Magento\Framework\Locale\FormatInterface;
use Magento\Customer\Model\Session;
use Magento\Catalog\Api\ProductRepositoryInterface;
use Magento\Framework\Pricing\PriceCurrencyInterface;

class Product extends ProductView
{
    /**
     * Get product structured data for SEO
     *
     * @return string
     */
    public function getProductStructuredData(): string
    {
        $product = $this->getProduct();
        
        if (!$product) {
            return '';
        }

        $structuredData = [
            '@context' => 'https://schema.org',
            '@type' => 'Product',
            'name' => $product->getName(),
            'description' => strip_tags($product->getShortDescription() ?: $product->getDescription()),
            'image' => $this->getImage($product, 'product_base_image')->getImageUrl(),
            'sku' => $product->getSku(),
        ];

        // Add offers data
        if ($product->isAvailable()) {
            $structuredData['offers'] = [
                '@type' => 'Offer',
                'url' => $product->getProductUrl(),
                'priceCurrency' => $this->_storeManager->getStore()->getCurrentCurrencyCode(),
                'price' => number_format($product->getFinalPrice(), 2, '.', ''),
                'availability' => 'https://schema.org/InStock',
            ];
        }

        // Add brand if available
        if ($brand = $product->getAttributeText('manufacturer')) {
            $structuredData['brand'] = [
                '@type' => 'Brand',
                'name' => $brand,
            ];
        }

        // Add aggregate rating if available
        if ($product->getRatingSummary() && $product->getRatingSummary()->getReviewsCount() > 0) {
            $structuredData['aggregateRating'] = [
                '@type' => 'AggregateRating',
                'ratingValue' => round($product->getRatingSummary()->getRatingSummary() / 20, 1),
                'reviewCount' => $product->getRatingSummary()->getReviewsCount(),
            ];
        }

        return sprintf(
            '<script type="application/ld+json">%s</script>',
            json_encode($structuredData, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT)
        );
    }

    /**
     * Get minimal product info for crawlers
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

