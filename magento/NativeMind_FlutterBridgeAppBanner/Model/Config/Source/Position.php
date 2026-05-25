<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeAppBanner\Model\Config\Source;

use Magento\Framework\Data\OptionSourceInterface;

class Position implements OptionSourceInterface
{
    public function toOptionArray(): array
    {
        return [
            ['value' => 'top', 'label' => __('Top')],
            ['value' => 'bottom', 'label' => __('Bottom')]
        ];
    }
}
