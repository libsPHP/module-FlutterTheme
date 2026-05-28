<?php
/**
 * NativeMind Bridge Module Registration
 *
 * Theme-agnostic Magento 2 module for flutter_magento integration.
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

use Magento\Framework\Component\ComponentRegistrar;

ComponentRegistrar::register(
    ComponentRegistrar::MODULE,
    'NativeMind_Bridge',
    __DIR__
);
