<?php
/**
 * NativeMind Bridge Configuration Helper
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use Magento\Store\Model\ScopeInterface;

class Config extends AbstractHelper
{
    // General
    public const XML_PATH_ENABLED = 'nativemind_Bridge/general/enabled';
    public const XML_PATH_DEBUG_MODE = 'nativemind_Bridge/general/debug_mode';

    // Route
    public const XML_PATH_ROUTE_ENABLED = 'nativemind_Bridge/route/enabled';
    public const XML_PATH_ROUTE_STANDARD_VERSION = 'nativemind_Bridge/route/standard_version';
    public const XML_PATH_ROUTE_PRODUCT = 'nativemind_Bridge/route/product_app_route';
    public const XML_PATH_ROUTE_CATEGORY = 'nativemind_Bridge/route/category_app_route';
    public const XML_PATH_ROUTE_CMS = 'nativemind_Bridge/route/cms_app_route';
    public const XML_PATH_ROUTE_SEARCH = 'nativemind_Bridge/route/search_app_route';
    public const XML_PATH_ROUTE_CART = 'nativemind_Bridge/route/cart_app_route';
    public const XML_PATH_ROUTE_CHECKOUT = 'nativemind_Bridge/route/checkout_app_route';
    public const XML_PATH_ROUTE_CUSTOMER = 'nativemind_Bridge/route/customer_app_route';
    public const XML_PATH_ROUTE_HOME = 'nativemind_Bridge/route/home_app_route';

    // Canonical
    public const XML_PATH_CANONICAL_ENABLED = 'nativemind_Bridge/canonical/enabled';
    public const XML_PATH_CANONICAL_PRODUCT_MODE = 'nativemind_Bridge/canonical/product_mode';
    public const XML_PATH_CANONICAL_CATEGORY_FILTERED = 'nativemind_Bridge/canonical/category_filtered_mode';
    public const XML_PATH_CANONICAL_STRIP_UTM = 'nativemind_Bridge/canonical/strip_utm';
    public const XML_PATH_CANONICAL_STRIP_TRACKING = 'nativemind_Bridge/canonical/strip_tracking';

    // Robots
    public const XML_PATH_ROBOTS_SEARCH = 'nativemind_Bridge/robots/search_robots';
    public const XML_PATH_ROBOTS_FILTERED_CATEGORY = 'nativemind_Bridge/robots/filtered_category_robots';
    public const XML_PATH_ROBOTS_CART = 'nativemind_Bridge/robots/cart_robots';
    public const XML_PATH_ROBOTS_CHECKOUT = 'nativemind_Bridge/robots/checkout_robots';
    public const XML_PATH_ROBOTS_CUSTOMER = 'nativemind_Bridge/robots/customer_robots';

    // JSON-LD
    public const XML_PATH_JSONLD_ENABLED = 'nativemind_Bridge/jsonld/enabled';
    public const XML_PATH_JSONLD_MODE = 'nativemind_Bridge/jsonld/mode';
    public const XML_PATH_JSONLD_PRODUCT = 'nativemind_Bridge/jsonld/product_enabled';
    public const XML_PATH_JSONLD_BREADCRUMB = 'nativemind_Bridge/jsonld/breadcrumb_enabled';
    public const XML_PATH_JSONLD_ORGANIZATION = 'nativemind_Bridge/jsonld/organization_enabled';
    public const XML_PATH_JSONLD_CATEGORY_ITEMLIST = 'nativemind_Bridge/jsonld/category_itemlist_enabled';

    // OpenGraph
    public const XML_PATH_OPENGRAPH_ENABLED = 'nativemind_Bridge/opengraph/enabled';
    public const XML_PATH_OPENGRAPH_MODE = 'nativemind_Bridge/opengraph/mode';
    public const XML_PATH_OPENGRAPH_DEFAULT_IMAGE = 'nativemind_Bridge/opengraph/default_image';
    public const XML_PATH_OPENGRAPH_TWITTER_CARD = 'nativemind_Bridge/opengraph/twitter_card_type';

    // App Links
    public const XML_PATH_ANDROID_ENABLED = 'nativemind_Bridge/app_links/android_enabled';
    public const XML_PATH_ANDROID_PACKAGE = 'nativemind_Bridge/app_links/android_package_name';
    public const XML_PATH_ANDROID_FINGERPRINTS = 'nativemind_Bridge/app_links/android_sha256_fingerprints';
    public const XML_PATH_ANDROID_PLAYSTORE = 'nativemind_Bridge/app_links/android_playstore_url';
    public const XML_PATH_IOS_ENABLED = 'nativemind_Bridge/app_links/ios_enabled';
    public const XML_PATH_IOS_TEAM_ID = 'nativemind_Bridge/app_links/ios_team_id';
    public const XML_PATH_IOS_BUNDLE_ID = 'nativemind_Bridge/app_links/ios_bundle_id';
    public const XML_PATH_IOS_APPSTORE = 'nativemind_Bridge/app_links/ios_appstore_url';

    // App Banner
    public const XML_PATH_BANNER_ENABLED = 'nativemind_Bridge/app_banner/enabled';
    public const XML_PATH_BANNER_TITLE = 'nativemind_Bridge/app_banner/title';
    public const XML_PATH_BANNER_SUBTITLE = 'nativemind_Bridge/app_banner/subtitle';
    public const XML_PATH_BANNER_OPEN_TEXT = 'nativemind_Bridge/app_banner/open_button_text';
    public const XML_PATH_BANNER_INSTALL_TEXT = 'nativemind_Bridge/app_banner/install_button_text';
    public const XML_PATH_BANNER_SHOW_PRODUCT = 'nativemind_Bridge/app_banner/show_on_product';
    public const XML_PATH_BANNER_SHOW_CATEGORY = 'nativemind_Bridge/app_banner/show_on_category';
    public const XML_PATH_BANNER_SHOW_HOME = 'nativemind_Bridge/app_banner/show_on_home';
    public const XML_PATH_BANNER_DISMISS_DAYS = 'nativemind_Bridge/app_banner/dismiss_cookie_days';

    // -------------------------------------------------------------------------
    // General
    // -------------------------------------------------------------------------

    public function isEnabled(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isDebugMode(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_DEBUG_MODE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    // -------------------------------------------------------------------------
    // Route
    // -------------------------------------------------------------------------

    public function isRouteEnabled(?int $storeId = null): bool
    {
        return $this->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_ROUTE_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getRouteStandardVersion(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_STANDARD_VERSION,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'flutter_magento_v1';
    }

    public function getProductAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_PRODUCT,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/product/{sku}';
    }

    public function getCategoryAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_CATEGORY,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/category/{id}';
    }

    public function getCmsAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_CMS,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/page/{identifier}';
    }

    public function getSearchAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_SEARCH,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/search?q={query}';
    }

    public function getCartAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_CART,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/cart';
    }

    public function getCheckoutAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_CHECKOUT,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/checkout';
    }

    public function getCustomerAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_CUSTOMER,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/account';
    }

    public function getHomeAppRoute(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROUTE_HOME,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: '/';
    }

    // -------------------------------------------------------------------------
    // Canonical
    // -------------------------------------------------------------------------

    public function isCanonicalEnabled(?int $storeId = null): bool
    {
        return $this->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_CANONICAL_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getProductCanonicalMode(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_CANONICAL_PRODUCT_MODE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'shortest';
    }

    public function getCategoryFilteredMode(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_CANONICAL_CATEGORY_FILTERED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'base_noindex';
    }

    public function shouldStripUtm(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_CANONICAL_STRIP_UTM,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function shouldStripTracking(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_CANONICAL_STRIP_TRACKING,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    // -------------------------------------------------------------------------
    // Robots
    // -------------------------------------------------------------------------

    public function getSearchRobots(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROBOTS_SEARCH,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'noindex,follow';
    }

    public function getFilteredCategoryRobots(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROBOTS_FILTERED_CATEGORY,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'noindex,follow';
    }

    public function getCartRobots(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROBOTS_CART,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'noindex,nofollow';
    }

    public function getCheckoutRobots(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROBOTS_CHECKOUT,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'noindex,nofollow';
    }

    public function getCustomerRobots(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_ROBOTS_CUSTOMER,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'noindex,nofollow';
    }

    // -------------------------------------------------------------------------
    // JSON-LD
    // -------------------------------------------------------------------------

    public function isJsonLdEnabled(?int $storeId = null): bool
    {
        return $this->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_JSONLD_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getJsonLdMode(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_JSONLD_MODE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'append';
    }

    public function isProductJsonLdEnabled(?int $storeId = null): bool
    {
        return $this->isJsonLdEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_JSONLD_PRODUCT,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isBreadcrumbJsonLdEnabled(?int $storeId = null): bool
    {
        return $this->isJsonLdEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_JSONLD_BREADCRUMB,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isOrganizationJsonLdEnabled(?int $storeId = null): bool
    {
        return $this->isJsonLdEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_JSONLD_ORGANIZATION,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function isCategoryItemListJsonLdEnabled(?int $storeId = null): bool
    {
        return $this->isJsonLdEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_JSONLD_CATEGORY_ITEMLIST,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    // -------------------------------------------------------------------------
    // OpenGraph
    // -------------------------------------------------------------------------

    public function isOpenGraphEnabled(?int $storeId = null): bool
    {
        return $this->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_OPENGRAPH_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getOpenGraphMode(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_OPENGRAPH_MODE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'append';
    }

    public function getDefaultOpenGraphImage(?int $storeId = null): ?string
    {
        $value = $this->scopeConfig->getValue(
            self::XML_PATH_OPENGRAPH_DEFAULT_IMAGE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
        return $value ? (string) $value : null;
    }

    public function getTwitterCardType(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_OPENGRAPH_TWITTER_CARD,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'summary_large_image';
    }

    // -------------------------------------------------------------------------
    // App Links
    // -------------------------------------------------------------------------

    public function isAndroidAppLinksEnabled(?int $storeId = null): bool
    {
        return $this->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_ANDROID_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getAndroidPackageName(?int $storeId = null): ?string
    {
        $value = $this->scopeConfig->getValue(
            self::XML_PATH_ANDROID_PACKAGE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
        return $value ? (string) $value : null;
    }

    public function getAndroidSha256Fingerprints(?int $storeId = null): array
    {
        $value = $this->scopeConfig->getValue(
            self::XML_PATH_ANDROID_FINGERPRINTS,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
        if (!$value) {
            return [];
        }
        return array_filter(array_map('trim', explode("\n", (string) $value)));
    }

    public function getAndroidPlayStoreUrl(?int $storeId = null): ?string
    {
        $value = $this->scopeConfig->getValue(
            self::XML_PATH_ANDROID_PLAYSTORE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
        return $value ? (string) $value : null;
    }

    public function isIosUniversalLinksEnabled(?int $storeId = null): bool
    {
        return $this->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_IOS_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getIosTeamId(?int $storeId = null): ?string
    {
        $value = $this->scopeConfig->getValue(
            self::XML_PATH_IOS_TEAM_ID,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
        return $value ? (string) $value : null;
    }

    public function getIosBundleId(?int $storeId = null): ?string
    {
        $value = $this->scopeConfig->getValue(
            self::XML_PATH_IOS_BUNDLE_ID,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
        return $value ? (string) $value : null;
    }

    public function getIosAppStoreUrl(?int $storeId = null): ?string
    {
        $value = $this->scopeConfig->getValue(
            self::XML_PATH_IOS_APPSTORE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
        return $value ? (string) $value : null;
    }

    // -------------------------------------------------------------------------
    // App Banner
    // -------------------------------------------------------------------------

    public function isAppBannerEnabled(?int $storeId = null): bool
    {
        return $this->isEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_BANNER_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getBannerTitle(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_BANNER_TITLE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'Open in App';
    }

    public function getBannerSubtitle(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_BANNER_SUBTITLE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'Better shopping experience';
    }

    public function getBannerOpenButtonText(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_BANNER_OPEN_TEXT,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'Open';
    }

    public function getBannerInstallButtonText(?int $storeId = null): string
    {
        return (string) $this->scopeConfig->getValue(
            self::XML_PATH_BANNER_INSTALL_TEXT,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 'Install';
    }

    public function showBannerOnProduct(?int $storeId = null): bool
    {
        return $this->isAppBannerEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_BANNER_SHOW_PRODUCT,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function showBannerOnCategory(?int $storeId = null): bool
    {
        return $this->isAppBannerEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_BANNER_SHOW_CATEGORY,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function showBannerOnHome(?int $storeId = null): bool
    {
        return $this->isAppBannerEnabled($storeId) && $this->scopeConfig->isSetFlag(
            self::XML_PATH_BANNER_SHOW_HOME,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    public function getBannerDismissDays(?int $storeId = null): int
    {
        return (int) $this->scopeConfig->getValue(
            self::XML_PATH_BANNER_DISMISS_DAYS,
            ScopeInterface::SCOPE_STORE,
            $storeId
        ) ?: 7;
    }

    /**
     * Get install URL based on platform detection (for banner)
     */
    public function getInstallUrl(?int $storeId = null): ?string
    {
        // Return Play Store URL for Android, App Store URL for iOS
        // Default to Play Store if both available
        $playStore = $this->getAndroidPlayStoreUrl($storeId);
        $appStore = $this->getIosAppStoreUrl($storeId);

        return $playStore ?: $appStore;
    }
}
