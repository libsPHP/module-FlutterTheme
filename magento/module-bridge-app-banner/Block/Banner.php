<?php
declare(strict_types=1);

namespace NativeMind\BridgeAppBanner\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use NativeMind\BridgeAppBanner\Helper\Config;

class Banner extends Template
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

    public function getAppName(): string
    {
        return $this->config->getAppName();
    }

    public function getAppIcon(): string
    {
        return $this->config->getAppIcon();
    }

    public function getAndroidStoreUrl(): string
    {
        return $this->config->getAndroidStoreUrl();
    }

    public function getIosStoreUrl(): string
    {
        return $this->config->getIosStoreUrl();
    }

    public function getCtaText(): string
    {
        return $this->config->getCtaText();
    }

    public function getPosition(): string
    {
        return $this->config->getPosition();
    }

    public function getDismissDuration(): int
    {
        return $this->config->getDismissDuration();
    }

    public function getBannerConfig(): array
    {
        return [
            'appName' => $this->getAppName(),
            'appIcon' => $this->getAppIcon(),
            'androidStoreUrl' => $this->getAndroidStoreUrl(),
            'iosStoreUrl' => $this->getIosStoreUrl(),
            'ctaText' => $this->getCtaText(),
            'position' => $this->getPosition(),
            'dismissDuration' => $this->getDismissDuration()
        ];
    }

    public function getBannerConfigJson(): string
    {
        return json_encode($this->getBannerConfig(), JSON_UNESCAPED_SLASHES);
    }
}
