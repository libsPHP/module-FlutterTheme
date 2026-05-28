<?php
/**
 * App Banner Block
 *
 * Displays "Open in App" / "Install App" banner
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Block\App;

use Magento\Framework\View\Element\Template;
use Magento\Framework\View\Element\Template\Context;
use Magento\Framework\App\Request\Http as HttpRequest;
use NativeMind\Bridge\Helper\Config;

class Banner extends Template
{
    private Config $config;
    private HttpRequest $request;

    public function __construct(
        Context $context,
        Config $config,
        HttpRequest $request,
        array $data = []
    ) {
        parent::__construct($context, $data);
        $this->config = $config;
        $this->request = $request;
    }

    /**
     * Check if banner should be displayed
     *
     * @return bool
     */
    public function isEnabled(): bool
    {
        if (!$this->config->isAppBannerEnabled()) {
            return false;
        }

        // Check page-specific settings
        $fullActionName = $this->request->getFullActionName();

        switch ($fullActionName) {
            case 'catalog_product_view':
                return $this->config->showBannerOnProduct();
            case 'catalog_category_view':
                return $this->config->showBannerOnCategory();
            case 'cms_index_index':
                return $this->config->showBannerOnHome();
            default:
                return false;
        }
    }

    /**
     * Get banner title
     *
     * @return string
     */
    public function getTitle(): string
    {
        return $this->config->getBannerTitle();
    }

    /**
     * Get banner subtitle
     *
     * @return string
     */
    public function getSubtitle(): string
    {
        return $this->config->getBannerSubtitle();
    }

    /**
     * Get open button text
     *
     * @return string
     */
    public function getOpenButtonText(): string
    {
        return $this->config->getBannerOpenButtonText();
    }

    /**
     * Get install button text
     *
     * @return string
     */
    public function getInstallButtonText(): string
    {
        return $this->config->getBannerInstallButtonText();
    }

    /**
     * Get install URL (App Store or Play Store)
     *
     * @return string
     */
    public function getInstallUrl(): string
    {
        return $this->config->getInstallUrl() ?: '#';
    }

    /**
     * Get dismiss cookie duration in days
     *
     * @return int
     */
    public function getDismissDays(): int
    {
        return $this->config->getBannerDismissDays();
    }

    /**
     * Get current URL for "Open" link
     *
     * @return string
     */
    public function getCurrentUrl(): string
    {
        return $this->getUrl('*/*/*', ['_current' => true, '_use_rewrite' => true]);
    }

    /**
     * Check if Android is configured
     *
     * @return bool
     */
    public function hasAndroidApp(): bool
    {
        return $this->config->isAndroidAppLinksEnabled()
            && $this->config->getAndroidPackageName();
    }

    /**
     * Check if iOS is configured
     *
     * @return bool
     */
    public function hasIosApp(): bool
    {
        return $this->config->isIosUniversalLinksEnabled()
            && $this->config->getIosBundleId();
    }

    /**
     * Get Play Store URL
     *
     * @return string|null
     */
    public function getPlayStoreUrl(): ?string
    {
        return $this->config->getAndroidPlayStoreUrl();
    }

    /**
     * Get App Store URL
     *
     * @return string|null
     */
    public function getAppStoreUrl(): ?string
    {
        return $this->config->getIosAppStoreUrl();
    }
}
