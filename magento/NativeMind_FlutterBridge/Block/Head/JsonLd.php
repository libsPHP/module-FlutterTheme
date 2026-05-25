<?php
/**
 * JSON-LD Block
 *
 * Outputs schema.org structured data
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Block\Head;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use NativeMind\FlutterBridge\Helper\Config;
use NativeMind\FlutterBridge\Model\JsonLd\ProductJsonLdBuilder;

class JsonLd extends Template
{
    private Config $config;
    private ProductJsonLdBuilder $productJsonLdBuilder;

    public function __construct(
        Context $context,
        Config $config,
        ProductJsonLdBuilder $productJsonLdBuilder,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->config = $config;
        $this->productJsonLdBuilder = $productJsonLdBuilder;
    }

    /**
     * Check if JSON-LD output is enabled
     *
     * @return bool
     */
    public function isEnabled(): bool
    {
        return $this->config->isJsonLdEnabled();
    }

    /**
     * Get JSON-LD data for current page
     *
     * @return string
     */
    public function getJsonLd(): string
    {
        $builderType = $this->getData('builder_type') ?: 'product';

        switch ($builderType) {
            case 'product':
                return $this->productJsonLdBuilder->toJson();
            default:
                return '';
        }
    }

    /**
     * Check if there is JSON-LD data to output
     *
     * @return bool
     */
    public function hasData(): bool
    {
        return !empty($this->getJsonLd());
    }
}
