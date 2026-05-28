<?php
declare(strict_types=1);

namespace NativeMind\BridgeAppLinks\Model;

use NativeMind\BridgeAppLinks\Helper\Config;

class AssetLinksBuilder
{
    private Config $config;

    public function __construct(Config $config)
    {
        $this->config = $config;
    }

    public function build(): array
    {
        if (!$this->config->isEnabled()) {
            return [];
        }

        $packageName = $this->config->getAndroidPackageName();
        $fingerprints = $this->config->getAndroidSha256Fingerprints();

        if (empty($packageName) || empty($fingerprints)) {
            return [];
        }

        return [
            [
                'relation' => ['delegate_permission/common.handle_all_urls'],
                'target' => [
                    'namespace' => 'android_app',
                    'package_name' => $packageName,
                    'sha256_cert_fingerprints' => $fingerprints
                ]
            ]
        ];
    }

    public function toJson(): string
    {
        $data = $this->build();
        return json_encode($data, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT);
    }
}
