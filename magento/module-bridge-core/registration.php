<?php
/**
 * NativeMind BridgeCore Module Registration
 *
 * @category    NativeMind
 * @package     NativeMind_BridgeCore
 */

use Magento\Framework\Component\ComponentRegistrar;

ComponentRegistrar::register(
    ComponentRegistrar::MODULE,
    'NativeMind_BridgeCore',
    __DIR__
);
