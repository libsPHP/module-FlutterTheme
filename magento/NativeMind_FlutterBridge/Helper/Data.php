<?php
/**
 * NativeMind FlutterTheme Helper
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

namespace NativeMind\FlutterTheme\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use Magento\Store\Model\ScopeInterface;

class Data extends AbstractHelper implements DataInterface
{
    const XML_PATH_ENABLED = 'flutter_theme/general/enabled';
    const XML_PATH_FORCE_FALLBACK = 'flutter_theme/general/force_fallback';
    const XML_PATH_DETECT_CRAWLERS = 'flutter_theme/detection/detect_crawlers';
    const XML_PATH_DETECT_JS = 'flutter_theme/detection/detect_js';
    const XML_PATH_JS_COOKIE_NAME = 'flutter_theme/detection/js_cookie_name';
    const XML_PATH_JS_COOKIE_LIFETIME = 'flutter_theme/detection/js_cookie_lifetime';
    const XML_PATH_CANVAS_KIT = 'flutter_theme/flutter/canvas_kit_renderer';
    const XML_PATH_SERVICE_WORKER = 'flutter_theme/flutter/service_worker_enabled';
    const XML_PATH_STRUCTURED_DATA = 'flutter_theme/seo/structured_data';
    const XML_PATH_MINIMAL_HTML = 'flutter_theme/seo/minimal_html';

    /**
     * Known search engine crawlers user agents
     */
    private const CRAWLER_PATTERNS = [
        'googlebot',
        'bingbot',
        'slurp',              // Yahoo
        'duckduckbot',
        'baiduspider',
        'yandexbot',
        'sogou',
        'exabot',
        'facebot',
        'facebookexternalhit',
        'ia_archiver',        // Alexa
        'applebot',
        'twitterbot',
        'linkedinbot',
        'whatsapp',
        'telegrambot',
        'pingdom',
        'uptimerobot',
        'semrushbot',
        'ahrefsbot',
        'mj12bot',
        'dotbot',
    ];

    /**
     * @param Context $context
     */
    public function __construct(
        Context $context
    ) {
        parent::__construct($context);
    }

    /**
     * @inheritDoc
     */
    public function isEnabled(): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_ENABLED,
            ScopeInterface::SCOPE_STORE
        );
    }

    /**
     * @inheritDoc
     */
    public function isCrawler(): bool
    {
        if (!$this->scopeConfig->isSetFlag(self::XML_PATH_DETECT_CRAWLERS, ScopeInterface::SCOPE_STORE)) {
            return false;
        }

        $userAgent = $_SERVER['HTTP_USER_AGENT'] ?? '';
        if (empty($userAgent)) {
            return false;
        }

        $userAgentLower = strtolower($userAgent);

        foreach (self::CRAWLER_PATTERNS as $pattern) {
            if (strpos($userAgentLower, $pattern) !== false) {
                return true;
            }
        }

        return false;
    }

    /**
     * @inheritDoc
     */
    public function hasJavaScriptSupport(): bool
    {
        if (!$this->scopeConfig->isSetFlag(self::XML_PATH_DETECT_JS, ScopeInterface::SCOPE_STORE)) {
            return true; // Assume JS is supported if detection is disabled
        }

        $cookieName = $this->getJsCookieName();
        return isset($_COOKIE[$cookieName]) && $_COOKIE[$cookieName] === '1';
    }

    /**
     * @inheritDoc
     */
    public function shouldUseFallback(): bool
    {
        // Force fallback if configured
        if ($this->scopeConfig->isSetFlag(self::XML_PATH_FORCE_FALLBACK, ScopeInterface::SCOPE_STORE)) {
            return true;
        }

        // Use fallback for crawlers
        if ($this->isCrawler()) {
            return true;
        }

        // Use fallback if no JS support detected
        if (!$this->hasJavaScriptSupport()) {
            return true;
        }

        return false;
    }

    /**
     * @inheritDoc
     */
    public function getJsCookieName(): string
    {
        return (string)$this->scopeConfig->getValue(
            self::XML_PATH_JS_COOKIE_NAME,
            ScopeInterface::SCOPE_STORE
        ) ?: 'js_enabled';
    }

    /**
     * @inheritDoc
     */
    public function getJsCookieLifetime(): int
    {
        return (int)$this->scopeConfig->getValue(
            self::XML_PATH_JS_COOKIE_LIFETIME,
            ScopeInterface::SCOPE_STORE
        ) ?: 31536000; // 1 year default
    }

    /**
     * @inheritDoc
     */
    public function isCanvasKitEnabled(): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_CANVAS_KIT,
            ScopeInterface::SCOPE_STORE
        );
    }

    /**
     * @inheritDoc
     */
    public function isServiceWorkerEnabled(): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_SERVICE_WORKER,
            ScopeInterface::SCOPE_STORE
        );
    }

    /**
     * @inheritDoc
     */
    public function isStructuredDataEnabled(): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_STRUCTURED_DATA,
            ScopeInterface::SCOPE_STORE
        );
    }

    /**
     * @inheritDoc
     */
    public function isMinimalHtmlEnabled(): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_MINIMAL_HTML,
            ScopeInterface::SCOPE_STORE
        );
    }
}

