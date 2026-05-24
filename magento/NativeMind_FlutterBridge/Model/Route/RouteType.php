<?php
/**
 * Route Type Constants
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Model\Route;

class RouteType
{
    public const PRODUCT = 'product';
    public const CATEGORY = 'category';
    public const CMS = 'cms';
    public const SEARCH = 'search';
    public const CART = 'cart';
    public const CHECKOUT = 'checkout';
    public const CUSTOMER = 'customer';
    public const HOME = 'home';
    public const UNKNOWN = 'unknown';

    /**
     * Get all valid route types
     *
     * @return array
     */
    public static function getAll(): array
    {
        return [
            self::PRODUCT,
            self::CATEGORY,
            self::CMS,
            self::SEARCH,
            self::CART,
            self::CHECKOUT,
            self::CUSTOMER,
            self::HOME,
            self::UNKNOWN,
        ];
    }

    /**
     * Check if a route type is valid
     *
     * @param string $type
     * @return bool
     */
    public static function isValid(string $type): bool
    {
        return in_array($type, self::getAll(), true);
    }
}
