<?php
/**
 * Product Canonical Mode Source Model
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Model\Config\Source;

use Magento\Framework\Data\OptionSourceInterface;

class ProductCanonicalMode implements OptionSourceInterface
{
    public const MAGENTO_DEFAULT = 'magento_default';
    public const SHORTEST = 'shortest';
    public const CATEGORY_PATH = 'category_path';

    /**
     * @inheritdoc
     */
    public function toOptionArray(): array
    {
        return [
            ['value' => self::MAGENTO_DEFAULT, 'label' => __('Magento Default')],
            ['value' => self::SHORTEST, 'label' => __('Shortest Product URL')],
            ['value' => self::CATEGORY_PATH, 'label' => __('Include Category Path')],
        ];
    }
}
