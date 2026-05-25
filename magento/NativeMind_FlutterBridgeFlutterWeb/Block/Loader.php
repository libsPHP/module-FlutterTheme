<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeFlutterWeb\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use NativeMind\FlutterBridgeFlutterWeb\Helper\Config;

class Loader extends Template
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
        return $this->config->isEnabled();
    }

    public function getBaseUrl(): string
    {
        return $this->config->getBaseUrl();
    }

    public function getLoaderTimeout(): int
    {
        return $this->config->getLoaderTimeout();
    }

    public function isServiceWorkerEnabled(): bool
    {
        return $this->config->isServiceWorkerEnabled();
    }

    public function isDebugMode(): bool
    {
        return $this->config->isDebugMode();
    }

    public function getLoaderConfig(): array
    {
        return [
            'baseUrl' => $this->getBaseUrl(),
            'timeout' => $this->getLoaderTimeout(),
            'serviceWorkerEnabled' => $this->isServiceWorkerEnabled(),
            'debug' => $this->isDebugMode()
        ];
    }

    public function getLoaderConfigJson(): string
    {
        return json_encode($this->getLoaderConfig(), JSON_UNESCAPED_SLASHES);
    }
}
