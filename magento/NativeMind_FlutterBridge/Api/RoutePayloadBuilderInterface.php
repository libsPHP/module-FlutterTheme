<?php
/**
 * Route Payload Builder Interface
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Api;

use NativeMind\FlutterBridge\Model\Route\RoutePayload;

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
