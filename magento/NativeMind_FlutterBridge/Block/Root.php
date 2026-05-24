<?php
/**
 * NativeMind FlutterTheme Root Block
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

namespace NativeMind\FlutterTheme\Block;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use NativeMind\FlutterTheme\Helper\DataInterface;
use Magento\Store\Model\StoreManagerInterface;
use Magento\Framework\Locale\Resolver as LocaleResolver;
use Magento\Directory\Model\Currency;

class Root extends Template
{
    /**
     * @var DataInterface
     */
    protected $helper;

    /**
     * @var StoreManagerInterface
     */
    protected $storeManager;

    /**
     * @var LocaleResolver
     */
    protected $localeResolver;

    /**
     * @var Currency
     */
    protected $currency;

    /**
     * @param Context $context
     * @param DataInterface $helper
     * @param StoreManagerInterface $storeManager
     * @param LocaleResolver $localeResolver
     * @param Currency $currency
     * @param array $data
     */
    public function __construct(
        Context $context,
        DataInterface $helper,
        StoreManagerInterface $storeManager,
        LocaleResolver $localeResolver,
        Currency $currency,
        array $data = []
    ) {
        $this->helper = $helper;
        $this->storeManager = $storeManager;
        $this->localeResolver = $localeResolver;
        $this->currency = $currency;
        parent::__construct($context, $data);
    }

    /**
     * Get helper instance
     *
     * @return DataInterface
     */
    public function getHelper(): DataInterface
    {
        return $this->helper;
    }

    /**
     * Get page title
     *
     * @return string
     */
    public function getTitle(): string
    {
        return $this->pageConfig->getTitle()->get() ?: 'Store';
    }

    /**
     * Get page description
     *
     * @return string
     */
    public function getDescription(): string
    {
        return $this->pageConfig->getDescription() ?: '';
    }

    /**
     * Get HTML lang attribute
     *
     * @return string
     */
    public function getHtmlLang(): string
    {
        $locale = $this->localeResolver->getLocale();
        return str_replace('_', '-', $locale);
    }

    /**
     * Get base URL
     *
     * @return string
     */
    public function getBaseUrl(): string
    {
        return $this->storeManager->getStore()->getBaseUrl();
    }

    /**
     * Get store code
     *
     * @return string
     */
    public function getStoreCode(): string
    {
        return $this->storeManager->getStore()->getCode();
    }

    /**
     * Get current currency code
     *
     * @return string
     */
    public function getCurrentCurrency(): string
    {
        return $this->storeManager->getStore()->getCurrentCurrencyCode();
    }

    /**
     * Get locale
     *
     * @return string
     */
    public function getLocale(): string
    {
        return $this->localeResolver->getLocale();
    }

    /**
     * Get structured data for SEO
     *
     * @return string
     */
    public function getStructuredData(): string
    {
        if (!$this->helper->isStructuredDataEnabled()) {
            return '';
        }

        $store = $this->storeManager->getStore();
        $structuredData = [
            '@context' => 'https://schema.org',
            '@type' => 'WebSite',
            'name' => $store->getName(),
            'url' => $store->getBaseUrl(),
        ];

        return sprintf(
            '<script type="application/ld+json">%s</script>',
            json_encode($structuredData, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT)
        );
    }

    /**
     * Get fallback content
     *
     * @return string
     */
    public function getFallbackContent(): string
    {
        // Get fallback block from layout
        $fallbackBlock = $this->getLayout()->getBlock('flutter.fallback');
        
        if ($fallbackBlock) {
            return $fallbackBlock->toHtml();
        }

        // Default fallback content
        return $this->getDefaultFallbackContent();
    }

    /**
     * Get default fallback content
     *
     * @return string
     */
    protected function getDefaultFallbackContent(): string
    {
        $store = $this->storeManager->getStore();
        
        return sprintf(
            '<div class="fallback-container">
                <header class="fallback-header">
                    <h1>%s</h1>
                </header>
                <main class="fallback-main">
                    <p>%s</p>
                </main>
            </div>',
            $this->escapeHtml($store->getName()),
            __('Welcome to our store. Please enable JavaScript for the full experience.')
        );
    }

    /**
     * Check if should use fallback
     *
     * @return bool
     */
    public function shouldUseFallback(): bool
    {
        return $this->helper->shouldUseFallback();
    }

    /**
     * Get JS cookie configuration
     *
     * @return array
     */
    public function getJsCookieConfig(): array
    {
        return [
            'name' => $this->helper->getJsCookieName(),
            'lifetime' => $this->helper->getJsCookieLifetime(),
        ];
    }

    /**
     * Get Flutter configuration
     *
     * @return array
     */
    public function getFlutterConfig(): array
    {
        return [
            'canvasKit' => $this->helper->isCanvasKitEnabled(),
            'serviceWorker' => $this->helper->isServiceWorkerEnabled(),
            'baseUrl' => $this->getBaseUrl(),
            'storeCode' => $this->getStoreCode(),
            'currency' => $this->getCurrentCurrency(),
            'locale' => $this->getLocale(),
        ];
    }
}

