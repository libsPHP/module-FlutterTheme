<?php
/**
 * NativeMind FlutterTheme Helper Interface
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

namespace NativeMind\FlutterTheme\Helper;

interface DataInterface
{
    /**
     * Check if module is enabled
     *
     * @return bool
     */
    public function isEnabled(): bool;

    /**
     * Check if client is a search engine crawler/bot
     *
     * @return bool
     */
    public function isCrawler(): bool;

    /**
     * Check if browser has JavaScript support
     *
     * @return bool
     */
    public function hasJavaScriptSupport(): bool;

    /**
     * Check if fallback mode should be used
     *
     * @return bool
     */
    public function shouldUseFallback(): bool;

    /**
     * Get JavaScript cookie name
     *
     * @return string
     */
    public function getJsCookieName(): string;

    /**
     * Get JavaScript cookie lifetime
     *
     * @return int
     */
    public function getJsCookieLifetime(): int;

    /**
     * Check if CanvasKit renderer is enabled
     *
     * @return bool
     */
    public function isCanvasKitEnabled(): bool;

    /**
     * Check if Service Worker is enabled
     *
     * @return bool
     */
    public function isServiceWorkerEnabled(): bool;

    /**
     * Check if structured data is enabled
     *
     * @return bool
     */
    public function isStructuredDataEnabled(): bool;

    /**
     * Check if minimal HTML mode is enabled
     *
     * @return bool
     */
    public function isMinimalHtmlEnabled(): bool;
}

