<?php
/**
 * OpenGraph Mode Source Model
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Model\Config\Source;

use Magento\Framework\Data\OptionSourceInterface;

class OpenGraphMode implements OptionSourceInterface
{
    public const DISABLED = 'disabled';
    public const APPEND = 'append';
    public const OVERRIDE = 'override';

    /**
     * @inheritdoc
     */
    public function toOptionArray(): array
    {
        return [
            ['value' => self::DISABLED, 'label' => __('Disabled')],
            ['value' => self::APPEND, 'label' => __('Append (add missing tags only)')],
            ['value' => self::OVERRIDE, 'label' => __('Override (replace all OG tags)')],
        ];
    }
}
