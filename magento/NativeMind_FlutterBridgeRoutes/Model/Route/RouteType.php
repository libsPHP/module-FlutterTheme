<?php
/**
 * Route Type Constants
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridgeRoutes\Model\Route;

class RouteType
{
    public const PRODUCT = 'product';
    public const CATEGORY = 'category';
    public const CMS = 'cms';
    public const HOME = 'home';
    public const SEARCH = 'search';
    public const CART = 'cart';
    public const CHECKOUT = 'checkout';
    public const CUSTOMER = 'customer';
    public const UNKNOWN = 'unknown';
}
