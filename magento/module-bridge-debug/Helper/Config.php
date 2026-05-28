<?php
declare(strict_types=1);

namespace NativeMind\BridgeDebug\Helper;

use Magento\Framework\App\Helper\AbstractHelper;
use Magento\Framework\App\Helper\Context;
use NativeMind\BridgeCore\Helper\Config as CoreConfig;

class Config extends AbstractHelper
{
    private CoreConfig $coreConfig;

    public function __construct(Context $context, CoreConfig $coreConfig)
    {
        parent::__construct($context);
        $this->coreConfig = $coreConfig;
    }

    public function isEnabled(?int $storeId = null): bool
    {
        return $this->coreConfig->isEnabled($storeId);
    }

    public function isDebugMode(?int $storeId = null): bool
    {
        return $this->coreConfig->isDebugMode($storeId);
    }

    public function getVersion(): string
    {
        return $this->coreConfig->getVersion();
    }
}
