<?php
/**
 * NativeMind FlutterBridgeCore Configuration Helper
 *
 * Central configuration accessor for all FlutterBridge modules.
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridgeCore
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridgeCore\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Store\Model\ScopeInterface;

class Config extends AbstractHelper
{
    /**
     * Module version
     */
    public const VERSION = '2.0.0';

    /**
     * Config paths
     */
    public const XML_PATH_ENABLED = 'nativemind_flutterbridge/general/enabled';
    public const XML_PATH_DEBUG_MODE = 'nativemind_flutterbridge/general/debug_mode';

    /**
     * Check if FlutterBridge is enabled
     *
     * @param int|null $storeId
     * @return bool
     */
    public function isEnabled(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_ENABLED,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    /**
     * Check if debug mode is enabled
     *
     * @param int|null $storeId
     * @return bool
     */
    public function isDebugMode(?int $storeId = null): bool
    {
        return $this->scopeConfig->isSetFlag(
            self::XML_PATH_DEBUG_MODE,
            ScopeInterface::SCOPE_STORE,
            $storeId
        );
    }

    /**
     * Get module version
     *
     * @return string
     */
    public function getVersion(): string
    {
        return self::VERSION;
    }
}
