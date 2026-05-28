<?php
/**
 * Apple App Site Association Builder
 *
 * Builds the content for /.well-known/apple-app-site-association
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Model\AppLinks;

use NativeMind\Bridge\Helper\Config;

class AppleAppSiteAssociationBuilder
{
    private Config $config;

    public function __construct(Config $config)
    {
        $this->config = $config;
    }

    /**
     * Build AASA array for iOS Universal Links
     *
     * @return array
     */
    public function build(): array
    {
        if (!$this->config->isIosUniversalLinksEnabled()) {
            return [
                'applinks' => [
                    'apps' => [],
                    'details' => []
                ]
            ];
        }

        $teamId = $this->config->getIosTeamId();
        $bundleId = $this->config->getIosBundleId();

        if (empty($teamId) || empty($bundleId)) {
            return [
                'applinks' => [
                    'apps' => [],
                    'details' => []
                ]
            ];
        }

        $appId = $teamId . '.' . $bundleId;

        return [
            'applinks' => [
                'apps' => [],
                'details' => [
                    [
                        'appIDs' => [$appId],
                        'components' => [
                            [
                                '/' => '/*',
                                'comment' => 'Open all Magento storefront URLs in Flutter app'
                            ]
                        ]
                    ]
                ]
            ]
        ];
    }

    /**
     * Build AASA JSON string
     *
     * @return string
     */
    public function toJson(): string
    {
        return json_encode(
            $this->build(),
            JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT
        ) ?: '{}';
    }
}
