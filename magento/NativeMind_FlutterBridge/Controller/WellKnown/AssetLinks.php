<?php
/**
 * Asset Links Controller
 *
 * Serves /.well-known/assetlinks.json for Android App Links
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Controller\WellKnown;

use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Framework\Controller\Result\JsonFactory;
use Magento\Framework\Controller\ResultInterface;
use NativeMind\FlutterBridge\Model\AppLinks\AssetLinksBuilder;

class AssetLinks implements HttpGetActionInterface
{
    private JsonFactory $jsonFactory;
    private AssetLinksBuilder $assetLinksBuilder;

    public function __construct(
        JsonFactory $jsonFactory,
        AssetLinksBuilder $assetLinksBuilder
    ) {
        $this->jsonFactory = $jsonFactory;
        $this->assetLinksBuilder = $assetLinksBuilder;
    }

    /**
     * Execute action
     *
     * @return ResultInterface
     */
    public function execute(): ResultInterface
    {
        $result = $this->jsonFactory->create();
        $result->setData($this->assetLinksBuilder->build());
        $result->setHttpResponseCode(200);

        return $result;
    }
}
