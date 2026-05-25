<?php
/**
 * Route Payload Data Transfer Object
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridgeRoutes
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridgeRoutes\Model\Route;

class RoutePayload
{
    private string $standard;
    private string $type;
    private string $canonicalUrl;
    private string $webPath;
    private string $appRoute;
    private array $entity;
    private array $store;

    public function __construct(
        string $type,
        string $canonicalUrl,
        string $webPath,
        string $appRoute,
        array $entity = [],
        array $store = [],
        string $standard = 'flutter_magento_v1'
    ) {
        $this->standard = $standard;
        $this->type = $type;
        $this->canonicalUrl = $canonicalUrl;
        $this->webPath = $webPath;
        $this->appRoute = $appRoute;
        $this->entity = $entity;
        $this->store = $store;
    }

    public function getStandard(): string
    {
        return $this->standard;
    }

    public function getType(): string
    {
        return $this->type;
    }

    public function getCanonicalUrl(): string
    {
        return $this->canonicalUrl;
    }

    public function getWebPath(): string
    {
        return $this->webPath;
    }

    public function getAppRoute(): string
    {
        return $this->appRoute;
    }

    public function getEntity(): array
    {
        return $this->entity;
    }

    public function getStore(): array
    {
        return $this->store;
    }

    public function toArray(): array
    {
        return [
            'standard' => $this->standard,
            'type' => $this->type,
            'canonicalUrl' => $this->canonicalUrl,
            'webPath' => $this->webPath,
            'appRoute' => $this->appRoute,
            'entity' => $this->entity,
            'store' => $this->store,
        ];
    }

    public function toJson(): string
    {
        return json_encode(
            $this->toArray(),
            JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE
        ) ?: '{}';
    }
}
