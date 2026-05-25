<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeSeo\Model\Config\Source;

use Magento\Framework\Data\OptionSourceInterface;

class ProductCanonicalMode implements OptionSourceInterface
{
    public const SHORTEST = 'shortest';
    public const CATEGORY_PATH = 'category_path';
    public const MAGENTO_DEFAULT = 'magento_default';

    public function toOptionArray(): array
    {
        return [
            ['value' => self::SHORTEST, 'label' => __('Shortest URL (no category)')],
            ['value' => self::CATEGORY_PATH, 'label' => __('Include Category Path')],
            ['value' => self::MAGENTO_DEFAULT, 'label' => __('Use Magento Default')],
        ];
    }
}
