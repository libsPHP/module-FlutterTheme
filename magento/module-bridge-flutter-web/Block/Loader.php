<?php
/**
 * Flutter Web Loader Block
 *
 * Provides configuration for progressive enhancement of Magento with Flutter Web.
 *
 * Key principles:
 * 1. Magento HTML is always rendered first (SEO, no-JS support)
 * 2. Flutter loads as optional enhancement
 * 3. Magento HTML hidden only AFTER Flutter signals ready
 * 4. On failure, Magento HTML remains visible
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeFlutterWeb
 */

declare(strict_types=1);

namespace NativeMind\BridgeFlutterWeb\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use NativeMind\BridgeFlutterWeb\Helper\Config;

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

    /**
     * Get full loader configuration for JavaScript
     */
    public function getLoaderConfig(): array
    {
        return [
            // Base config
            'baseUrl' => $this->getBaseUrl(),
            'timeout' => $this->getLoaderTimeout(),
            'serviceWorkerEnabled' => $this->isServiceWorkerEnabled(),
            'debug' => $this->isDebugMode(),

            // Page control
            'allowedPageTypes' => $this->config->getAllowedPageTypes(),

            // DOM selectors
            'fallbackSelector' => $this->config->getFallbackSelector(),
            'flutterRootSelector' => $this->config->getFlutterRootSelector(),

            // Script paths
            'bootstrapScript' => $this->config->getBootstrapScriptPath(),
            'assetVersion' => $this->config->getAssetVersion(),

            // Behavior
            'renderer' => $this->config->getRendererPreference(),
            'loadMode' => $this->config->getLoadMode(),
            'hideStrategy' => $this->config->getHideStrategy(),
            'failureMode' => $this->config->getFailureMode(),
        ];
    }

    public function getLoaderConfigJson(): string
    {
        return json_encode($this->getLoaderConfig(), JSON_UNESCAPED_SLASHES);
    }

    /**
     * Check if current page type is allowed for Flutter enhancement
     */
    public function isCurrentPageAllowed(string $routeType): bool
    {
        $allowed = $this->config->getAllowedPageTypes();
        return in_array($routeType, $allowed, true);
    }
}
