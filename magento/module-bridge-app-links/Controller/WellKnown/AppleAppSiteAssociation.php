<?php
declare(strict_types=1);

namespace NativeMind\BridgeAppLinks\Controller\Wellknown;

use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Framework\Controller\Result\JsonFactory;
use Magento\Framework\Controller\ResultInterface;
use NativeMind\BridgeAppLinks\Model\AppleAppSiteAssociationBuilder;
use NativeMind\BridgeAppLinks\Helper\Config;

class AppleAppSiteAssociation implements HttpGetActionInterface
{
    private JsonFactory $jsonFactory;
    private AppleAppSiteAssociationBuilder $aasaBuilder;
    private Config $config;

    public function __construct(
        JsonFactory $jsonFactory,
        AppleAppSiteAssociationBuilder $aasaBuilder,
        Config $config
    ) {
        $this->jsonFactory = $jsonFactory;
        $this->aasaBuilder = $aasaBuilder;
        $this->config = $config;
    }

    public function execute(): ResultInterface
    {
        $result = $this->jsonFactory->create();

        if (!$this->config->isEnabled()) {
            $result->setHttpResponseCode(404);
            return $result->setData([]);
        }

        $data = $this->aasaBuilder->build();

        if (empty($data)) {
            $result->setHttpResponseCode(404);
            return $result->setData([]);
        }

        return $result->setData($data);
    }
}
