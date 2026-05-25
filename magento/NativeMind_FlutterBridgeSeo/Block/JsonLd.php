<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeSeo\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use NativeMind\FlutterBridgeSeo\Helper\Config;
use NativeMind\FlutterBridgeSeo\Model\JsonLd\ProductBuilder;

class JsonLd extends Template
{
    private Config $config;
    private ProductBuilder $productBuilder;

    public function __construct(
        Context $context,
        Config $config,
        ProductBuilder $productBuilder,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->config = $config;
        $this->productBuilder = $productBuilder;
    }

    public function isEnabled(): bool
    {
        return $this->config->isJsonLdEnabled();
    }

    public function getJsonLd(): string
    {
        $builderType = $this->getData('builder_type') ?: 'product';

        switch ($builderType) {
            case 'product':
                return $this->productBuilder->toJson();
            default:
                return '';
        }
    }

    public function hasData(): bool
    {
        return !empty($this->getJsonLd());
    }
}
