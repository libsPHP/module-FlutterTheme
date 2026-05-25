<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeSeo\Model\JsonLd;

use Magento\Catalog\Model\Product;
use Magento\Framework\Registry;
use Magento\Store\Model\StoreManagerInterface;
use Magento\Catalog\Helper\Image as ImageHelper;
use NativeMind\FlutterBridgeSeo\Helper\Config;

class ProductBuilder
{
    private Config $config;
    private Registry $registry;
    private StoreManagerInterface $storeManager;
    private ImageHelper $imageHelper;

    public function __construct(
        Config $config,
        Registry $registry,
        StoreManagerInterface $storeManager,
        ImageHelper $imageHelper
    ) {
        $this->config = $config;
        $this->registry = $registry;
        $this->storeManager = $storeManager;
        $this->imageHelper = $imageHelper;
    }

    public function build(): ?array
    {
        if (!$this->config->isProductJsonLdEnabled()) {
            return null;
        }

        $product = $this->registry->registry('current_product');
        if (!$product) {
            return null;
        }

        try {
            $store = $this->storeManager->getStore();
            $currency = $store->getCurrentCurrencyCode();

            $jsonLd = [
                '@context' => 'https://schema.org',
                '@type' => 'Product',
                'name' => $product->getName(),
                'description' => strip_tags((string) $product->getShortDescription()),
                'sku' => $product->getSku(),
                'url' => $product->getProductUrl(),
            ];

            $image = $this->getProductImage($product);
            if ($image) {
                $jsonLd['image'] = $image;
            }

            $brand = $product->getAttributeText('manufacturer');
            if ($brand) {
                $jsonLd['brand'] = [
                    '@type' => 'Brand',
                    'name' => $brand
                ];
            }

            $jsonLd['offers'] = [
                '@type' => 'Offer',
                'url' => $product->getProductUrl(),
                'priceCurrency' => $currency,
                'price' => number_format((float) $product->getFinalPrice(), 2, '.', ''),
                'availability' => $product->isAvailable()
                    ? 'https://schema.org/InStock'
                    : 'https://schema.org/OutOfStock',
                'itemCondition' => 'https://schema.org/NewCondition',
            ];

            return $jsonLd;
        } catch (\Exception $e) {
            return null;
        }
    }

    private function getProductImage(Product $product): ?string
    {
        try {
            return $this->imageHelper->init($product, 'product_base_image')->getUrl();
        } catch (\Exception $e) {
            return null;
        }
    }

    public function toJson(): string
    {
        $data = $this->build();
        return $data ? json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT) : '';
    }
}
