<?php
declare(strict_types=1);

namespace NativeMind\BridgeDebug\Controller\Index;

use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Framework\Controller\Result\JsonFactory;
use Magento\Framework\Controller\ResultInterface;
use NativeMind\BridgeDebug\Model\DebugInfoBuilder;
use NativeMind\BridgeDebug\Helper\Config;

class Index implements HttpGetActionInterface
{
    private JsonFactory $jsonFactory;
    private DebugInfoBuilder $debugInfoBuilder;
    private Config $config;

    public function __construct(
        JsonFactory $jsonFactory,
        DebugInfoBuilder $debugInfoBuilder,
        Config $config
    ) {
        $this->jsonFactory = $jsonFactory;
        $this->debugInfoBuilder = $debugInfoBuilder;
        $this->config = $config;
    }

    public function execute(): ResultInterface
    {
        $result = $this->jsonFactory->create();

        if (!$this->config->isDebugMode()) {
            $result->setHttpResponseCode(403);
            return $result->setData(['error' => 'Debug mode is disabled']);
        }

        return $result->setData($this->debugInfoBuilder->build());
    }
}
