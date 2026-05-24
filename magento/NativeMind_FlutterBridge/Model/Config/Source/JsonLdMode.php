<?php
/**
 * JSON-LD Mode Source Model
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Model\Config\Source;

use Magento\Framework\Data\OptionSourceInterface;

class JsonLdMode implements OptionSourceInterface
{
    public const DISABLED = 'disabled';
    public const APPEND = 'append';
    public const REPLACE = 'replace';

    /**
     * @inheritdoc
     */
    public function toOptionArray(): array
    {
        return [
            ['value' => self::DISABLED, 'label' => __('Disabled')],
            ['value' => self::APPEND, 'label' => __('Append (add alongside theme JSON-LD)')],
            ['value' => self::REPLACE, 'label' => __('Replace (remove theme JSON-LD)')],
        ];
    }
}
