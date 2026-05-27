<?php
/**
 * Flutter Web Configuration Helper
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridgeFlutterWeb
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridgeFlutterWeb\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use Magento\Store\Model\ScopeInterface;
use NativeMind\FlutterBridgeCore\Helper\Config as CoreConfig;

class Config extends AbstractHelper
{
    private CoreConfig $coreConfig;

    // Load modes
    public const LOAD_MODE_AUTO = 'auto';
    public const LOAD_MODE_MANUAL = 'manual';
    public const LOAD_MODE_AFTER_INTERACTION = 'after_interaction';

    // Hide strategies
    public const HIDE_STRATEGY_IMMEDIATE = 'immediate';
    public const HIDE_STRATEGY_ON_READY = 'on_ready';
    public const HIDE_STRATEGY_PROGRESSIVE = 'progressive';

    // Failure modes
    public const FAILURE_MODE_FALLBACK = 'fallback';
    public const FAILURE_MODE_RELOAD = 'reload';
    public const FAILURE_MODE_SILENT = 'silent';

    public function __construct(Context $context, CoreConfig $coreConfig)
    {
        parent::__construct($context);
        $this->coreConfig = $coreConfig;
    }

    public function isEnabled(?int $storeId = null): bool
    {
        return $this->coreConfig->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            'nativemind_flutterbridge/flutterweb/enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getBaseUrl(?int $storeId = null): string
    {
        $url = (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/base_url',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );

        return rtrim($url, '/') . '/';
    }

    public function getLoaderTimeout(?int $storeId = null): int
    {
        return (int) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/loader_timeout',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 5000;
    }

    public function isServiceWorkerEnabled(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            'nativemind_flutterbridge/flutterweb/service_worker_enabled',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isDebugMode(?int $storeId = null): bool
    {
        return $this->coreConfig->isDebugMode($storeId);
    }

    /**
     * Get allowed page types for Flutter Web enhancement
     *
     * @return array List of route types: product, category, cms, search, cart, checkout, customer, home
     */
    public function getAllowedPageTypes(?int $storeId = null): array
    {
        $types = (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/allowed_page_types',
            ScopeInterface::SCOPE_STORE,
            $storeId
        );

        if (empty($types)) {
            // Default: all types allowed
            return ['product', 'category', 'cms', 'search', 'cart', 'checkout', 'customer', 'home'];
        }

        return array_map('trim', explode(',', $types));
    }

    /**
     * Get hide strategy for Magento HTML
     *
     * - immediate: Hide Magento content before Flutter loads (bad for slow networks)
     * - on_ready: Hide only after Flutter signals ready (recommended)
     * - progressive: Fade out Magento while Flutter fades in
     */
    public function getHideStrategy(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/hide_strategy',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: self::HIDE_STRATEGY_ON_READY;
    }

    /**
     * Get CSS selector for Magento fallback content
     */
    public function getFallbackSelector(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/fallback_selector',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '.page-wrapper';
    }

    /**
     * Get CSS selector for Flutter root element
     */
    public function getFlutterRootSelector(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/flutter_root_selector',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '#flutter-view';
    }

    /**
     * Get path to Flutter bootstrap script
     */
    public function getBootstrapScriptPath(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/bootstrap_script',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'flutter.js';
    }

    /**
     * Get asset version for cache busting
     */
    public function getAssetVersion(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/asset_version',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '';
    }

    /**
     * Get renderer preference
     *
     * - auto: Let Flutter decide
     * - html: Force HTML renderer
     * - canvaskit: Force CanvasKit renderer
     */
    public function getRendererPreference(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/renderer',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'auto';
    }

    /**
     * Get load mode
     *
     * - auto: Load Flutter immediately
     * - manual: Wait for explicit trigger
     * - after_interaction: Load after user interaction
     */
    public function getLoadMode(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/load_mode',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: self::LOAD_MODE_AUTO;
    }

    /**
     * Get failure mode
     *
     * - fallback: Show Magento HTML on failure
     * - reload: Reload page
     * - silent: Log error, show nothing
     */
    public function getFailureMode(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            'nativemind_flutterbridge/flutterweb/failure_mode',
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: self::FAILURE_MODE_FALLBACK;
    }
}
