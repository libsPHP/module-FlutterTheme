<?php
/**
 * Robots Meta Resolver
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Model\Robots;

use Magento\Framework\App\Request\Http as HttpRequest;
use NativeMind\FlutterBridge\Helper\Config;
use NativeMind\FlutterBridge\Model\Canonical\CanonicalResolver;

class RobotsResolver
{
    private Config $config;
    private HttpRequest $request;
    private CanonicalResolver $canonicalResolver;

    public function __construct(
        Config $config,
        HttpRequest $request,
        CanonicalResolver $canonicalResolver
    ) {
        $this->config = $config;
        $this->request = $request;
        $this->canonicalResolver = $canonicalResolver;
    }

    /**
     * Resolve robots meta for current page
     *
     * @return string|null Returns robots string or null to use Magento default
     */
    public function resolve(): ?string
    {
        if (!$this->config->isEnabled()) {
            return null;
        }

        $fullActionName = $this->request->getFullActionName();

        switch ($fullActionName) {
            case 'catalogsearch_result_index':
            case 'catalogsearch_advanced_result':
                return $this->config->getSearchRobots();

            case 'catalog_category_view':
                if ($this->canonicalResolver->hasActiveFilters()) {
                    return $this->config->getFilteredCategoryRobots();
                }
                return null; // Use Magento default for unfiltered categories

            case 'checkout_cart_index':
                return $this->config->getCartRobots();

            case 'checkout_index_index':
            case 'checkout_onepage_index':
                return $this->config->getCheckoutRobots();

            case 'customer_account_index':
            case 'customer_account_login':
            case 'customer_account_create':
            case 'customer_account_forgotpassword':
            case 'customer_account_edit':
            case 'customer_address_index':
            case 'sales_order_history':
            case 'wishlist_index_index':
                return $this->config->getCustomerRobots();

            default:
                return null; // Use Magento default
        }
    }

    /**
     * Check if current page should be noindex
     *
     * @return bool
     */
    public function shouldNoindex(): bool
    {
        $robots = $this->resolve();
        if ($robots === null) {
            return false;
        }

        return stripos($robots, 'noindex') !== false;
    }

    /**
     * Check if current page should be nofollow
     *
     * @return bool
     */
    public function shouldNofollow(): bool
    {
        $robots = $this->resolve();
        if ($robots === null) {
            return false;
        }

        return stripos($robots, 'nofollow') !== false;
    }
}
