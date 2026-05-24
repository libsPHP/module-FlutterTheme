<?php
/**
 * Route Payload Data Model
 *
 * Represents the standardized route metadata for flutter_magento.
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Model\Route;

class RoutePayload
{
    public const STANDARD_VERSION = 'flutter_magento_v1';

    private string $type;
    private string $canonicalUrl;
    private string $webPath;
    private string $appRoute;
    private array $entity;
    private array $store;
    private string $standardVersion;

    /**
     * @param string $type Route type (product, category, cms, etc.)
     * @param string $canonicalUrl Full canonical URL
     * @param string $webPath URL path without domain
     * @param string $appRoute Flutter app route
     * @param array $entity Entity-specific data (id, sku, urlKey, etc.)
     * @param array $store Store context (websiteCode, storeCode, currency, locale)
     * @param string|null $standardVersion Override standard version
     */
    public function __construct(
        string $type,
        string $canonicalUrl,
        string $webPath,
        string $appRoute,
        array $entity = [],
        array $store = [],
        ?string $standardVersion = null
    ) {
        $this->type = $type;
        $this->canonicalUrl = $canonicalUrl;
        $this->webPath = $webPath;
        $this->appRoute = $appRoute;
        $this->entity = $entity;
        $this->store = $store;
        $this->standardVersion = $standardVersion ?? self::STANDARD_VERSION;
    }

    /**
     * Get route type
     *
     * @return string
     */
    public function getType(): string
    {
        return $this->type;
    }

    /**
     * Get canonical URL
     *
     * @return string
     */
    public function getCanonicalUrl(): string
    {
        return $this->canonicalUrl;
    }

    /**
     * Get web path
     *
     * @return string
     */
    public function getWebPath(): string
    {
        return $this->webPath;
    }

    /**
     * Get app route
     *
     * @return string
     */
    public function getAppRoute(): string
    {
        return $this->appRoute;
    }

    /**
     * Get entity data
     *
     * @return array
     */
    public function getEntity(): array
    {
        return $this->entity;
    }

    /**
     * Get store data
     *
     * @return array
     */
    public function getStore(): array
    {
        return $this->store;
    }

    /**
     * Get standard version
     *
     * @return string
     */
    public function getStandardVersion(): string
    {
        return $this->standardVersion;
    }

    /**
     * Convert to array
     *
     * @return array
     */
    public function toArray(): array
    {
        $data = [
            'standard' => $this->standardVersion,
            'type' => $this->type,
            'canonicalUrl' => $this->canonicalUrl,
            'webPath' => $this->webPath,
            'appRoute' => $this->appRoute,
        ];

        if (!empty($this->entity)) {
            $data['entity'] = $this->entity;
        }

        if (!empty($this->store)) {
            $data['store'] = $this->store;
        }

        return $data;
    }

    /**
     * Convert to JSON string
     *
     * @return string
     */
    public function toJson(): string
    {
        return json_encode(
            $this->toArray(),
            JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT
        ) ?: '{}';
    }

    /**
     * Create from array
     *
     * @param array $data
     * @return self
     */
    public static function fromArray(array $data): self
    {
        return new self(
            $data['type'] ?? RouteType::UNKNOWN,
            $data['canonicalUrl'] ?? '',
            $data['webPath'] ?? '',
            $data['appRoute'] ?? '',
            $data['entity'] ?? [],
            $data['store'] ?? [],
            $data['standard'] ?? null
        );
    }
}
