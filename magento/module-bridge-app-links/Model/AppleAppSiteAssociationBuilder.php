<?php
declare(strict_types=1);

namespace NativeMind\BridgeAppLinks\Model;

use NativeMind\BridgeAppLinks\Helper\Config;

class AppleAppSiteAssociationBuilder
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

        $appId = $this->config->getIosAppId();

        if (empty($appId)) {
            return [];
        }

        return [
            'applinks' => [
                'apps' => [],
                'details' => [
                    [
                        'appID' => $appId,
                        'paths' => ['*']
                    ]
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
