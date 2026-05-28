<?php
declare(strict_types=1);

namespace NativeMind\BridgeDebug\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use NativeMind\BridgeDebug\Helper\Config;

class Console extends Template
{
    private Config $config;

    public function __construct(
        Context $context,
        Config $config,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->config = $config;
    }

    public function isEnabled(): bool
    {
        return $this->config->isDebugMode();
    }

    public function getVersion(): string
    {
        return $this->config->getVersion();
    }
}
