<?php
/**
 * Route Payload Builder Interface
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Api;

use NativeMind\Bridge\Model\Route\RoutePayload;

interface RoutePayloadBuilderInterface
{
    /**
     * Build route payload for current page
     *
     * @return RoutePayload|null
     */
    public function build(): ?RoutePayload;

    /**
     * Check if this builder handles current page type
     *
     * @return bool
     */
    public function canBuild(): bool;

    /**
     * Get route type this builder handles
     *
     * @return string
     */
    public function getRouteType(): string;
}
