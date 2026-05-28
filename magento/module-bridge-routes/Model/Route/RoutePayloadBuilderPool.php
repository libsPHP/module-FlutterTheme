<?php
/**
 * Route Payload Builder Pool
 *
 * Composite that delegates to specific builders based on route type.
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\BridgeRoutes\Model\Route;

class RoutePayloadBuilderPool
{
    /**
     * @var RoutePayloadBuilderInterface[]
     */
    private array $builders;

    /**
     * @param RoutePayloadBuilderInterface[] $builders
     */
    public function __construct(array $builders = [])
    {
        $this->builders = $builders;
    }

    /**
     * Build route payload for the given route type
     *
     * @param string $routeType
     * @param array $storeData
     * @return RoutePayload|null
     */
    public function build(string $routeType, array $storeData): ?RoutePayload
    {
        foreach ($this->builders as $builder) {
            if ($builder->supports($routeType)) {
                return $builder->build($storeData);
            }
        }

        return null;
    }

    /**
     * Check if any builder supports the given route type
     */
    public function hasBuilder(string $routeType): bool
    {
        foreach ($this->builders as $builder) {
            if ($builder->supports($routeType)) {
                return true;
            }
        }

        return false;
    }
}
