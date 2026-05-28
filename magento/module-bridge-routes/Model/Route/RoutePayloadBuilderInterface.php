<?php
/**
 * Route Payload Builder Interface
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Model\Route;

/**
 * Interface for building route payloads for specific page types
 */
interface RoutePayloadBuilderInterface
{
    /**
     * Check if this builder supports the given route type
     */
    public function supports(string $routeType): bool;

    /**
     * Build route payload for the current page context
     *
     * @param array $storeData Store context data
     * @return RoutePayload|null
     */
    public function build(array $storeData): ?RoutePayload;
}
