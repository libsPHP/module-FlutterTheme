<?php
/**
 * Apple App Site Association Controller
 *
 * Serves /.well-known/apple-app-site-association for iOS Universal Links
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Controller\WellKnown;

use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Framework\Controller\Result\JsonFactory;
use Magento\Framework\Controller\ResultInterface;
use NativeMind\FlutterBridge\Model\AppLinks\AppleAppSiteAssociationBuilder;

class AppleAppSiteAssociation implements HttpGetActionInterface
{
    private JsonFactory $jsonFactory;
    private AppleAppSiteAssociationBuilder $aasaBuilder;

    public function __construct(
        JsonFactory $jsonFactory,
        AppleAppSiteAssociationBuilder $aasaBuilder
    ) {
        $this->jsonFactory = $jsonFactory;
        $this->aasaBuilder = $aasaBuilder;
    }

    /**
     * Execute action
     *
     * @return ResultInterface
     */
    public function execute(): ResultInterface
    {
        $result = $this->jsonFactory->create();
        $result->setData($this->aasaBuilder->build());
        $result->setHttpResponseCode(200);

        return $result;
    }
}
