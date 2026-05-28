<?php
declare(strict_types=1);

namespace NativeMind\BridgeAppLinks\Controller\Wellknown;

use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Framework\Controller\Result\JsonFactory;
use Magento\Framework\Controller\ResultInterface;
use NativeMind\BridgeAppLinks\Model\AssetLinksBuilder;
use NativeMind\BridgeAppLinks\Helper\Config;

class AssetLinks implements HttpGetActionInterface
{
    private JsonFactory $jsonFactory;
    private AssetLinksBuilder $assetLinksBuilder;
    private Config $config;

    public function __construct(
        JsonFactory $jsonFactory,
        AssetLinksBuilder $assetLinksBuilder,
        Config $config
    ) {
        $this->jsonFactory = $jsonFactory;
        $this->assetLinksBuilder = $assetLinksBuilder;
        $this->config = $config;
    }

    public function execute(): ResultInterface
    {
        $result = $this->jsonFactory->create();

        if (!$this->config->isEnabled()) {
            $result->setHttpResponseCode(404);
            return $result->setData([]);
        }

        $data = $this->assetLinksBuilder->build();

        if (empty($data)) {
            $result->setHttpResponseCode(404);
            return $result->setData([]);
        }

        return $result->setData($data);
    }
}
