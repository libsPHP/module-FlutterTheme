<?php
/**
 * Category Filtered Mode Source Model
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Model\Config\Source;

use Magento\Framework\Data\OptionSourceInterface;

class CategoryFilteredMode implements OptionSourceInterface
{
    public const BASE_NOINDEX = 'base_noindex';
    public const FILTERED_INDEX = 'filtered_index';
    public const MAGENTO_DEFAULT = 'magento_default';

    /**
     * @inheritdoc
     */
    public function toOptionArray(): array
    {
        return [
            ['value' => self::BASE_NOINDEX, 'label' => __('Canonical to base + noindex,follow')],
            ['value' => self::FILTERED_INDEX, 'label' => __('Canonical to filtered + index,follow')],
            ['value' => self::MAGENTO_DEFAULT, 'label' => __('Magento Default')],
        ];
    }
}
