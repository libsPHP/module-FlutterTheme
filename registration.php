<?php
/**
 * NativeMind FlutterTheme Module Registration
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 */

use Magento\Framework\Component\ComponentRegistrar;

ComponentRegistrar::register(
    ComponentRegistrar::MODULE,
    'NativeMind_FlutterTheme',
    __DIR__
);

