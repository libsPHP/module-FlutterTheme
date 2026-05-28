<?php
/**
 * NativeMind BridgeCore Configuration Helper
 *
 * Central configuration accessor for all Bridge modules.
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeCore
 */

declare(strict_types=1);

namespace NativeMind\BridgeCore\Helper;

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
    public const XML_PATH_ENABLED = 'nativemind_Bridge/general/enabled';
    public const XML_PATH_DEBUG_MODE = 'nativemind_Bridge/general/debug_mode';

    /**
     * Check if Bridge is enabled
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
