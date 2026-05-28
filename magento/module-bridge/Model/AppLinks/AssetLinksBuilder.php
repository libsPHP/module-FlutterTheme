<?php
/**
 * Android Asset Links Builder
 *
 * Builds the content for /.well-known/assetlinks.json
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Model\AppLinks;

use NativeMind\Bridge\Helper\Config;

class AssetLinksBuilder
{
    private Config $config;

    public function __construct(Config $config)
    {
        $this->config = $config;
    }

    /**
     * Build asset links array for Android App Links
     *
     * @return array
     */
    public function build(): array
    {
        if (!$this->config->isAndroidAppLinksEnabled()) {
            return [];
        }

        $packageName = $this->config->getAndroidPackageName();
        $fingerprints = $this->config->getAndroidSha256Fingerprints();

        if (empty($packageName) || empty($fingerprints)) {
            return [];
        }

        return [
            [
                'relation' => [
                    'delegate_permission/common.handle_all_urls'
                ],
                'target' => [
                    'namespace' => 'android_app',
                    'package_name' => $packageName,
                    'sha256_cert_fingerprints' => $fingerprints
                ]
            ]
        ];
    }

    /**
     * Build asset links JSON string
     *
     * @return string
     */
    public function toJson(): string
    {
        return json_encode(
            $this->build(),
            JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT
        ) ?: '[]';
    }
}
