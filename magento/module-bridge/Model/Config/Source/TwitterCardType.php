<?php
/**
 * Twitter Card Type Source Model
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Model\Config\Source;

use Magento\Framework\Data\OptionSourceInterface;

class TwitterCardType implements OptionSourceInterface
{
    public const SUMMARY = 'summary';
    public const SUMMARY_LARGE_IMAGE = 'summary_large_image';

    /**
     * @inheritdoc
     */
    public function toOptionArray(): array
    {
        return [
            ['value' => self::SUMMARY, 'label' => __('Summary')],
            ['value' => self::SUMMARY_LARGE_IMAGE, 'label' => __('Summary with Large Image')],
        ];
    }
}
