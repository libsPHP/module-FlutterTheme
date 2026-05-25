<?php
/**
 * Debug Route Controller
 *
 * Debug endpoint to view route metadata at /flutterbridge/debug/route
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterBridge
 */

declare(strict_types=1);

namespace NativeMind\FlutterBridge\Controller\Debug;

use Magento\Framework\App\Action\HttpGetActionInterface;
use Magento\Framework\Controller\Result\JsonFactory;
use Magento\Framework\Controller\ResultInterface;
use Magento\Framework\App\Request\Http as HttpRequest;
use NativeMind\FlutterBridge\Helper\Config;

class Route implements HttpGetActionInterface
{
    private JsonFactory $jsonFactory;
    private Config $config;
    private HttpRequest $request;

    public function __construct(
        JsonFactory $jsonFactory,
        Config $config,
        HttpRequest $request
    ) {
        $this->jsonFactory = $jsonFactory;
        $this->config = $config;
        $this->request = $request;
    }

    /**
     * Execute action
     *
     * @return ResultInterface
     */
    public function execute(): ResultInterface
    {
        $result = $this->jsonFactory->create();

        if (!$this->config->isDebugMode()) {
            $result->setData([
                'error' => 'Debug mode is disabled',
                'message' => 'Enable debug mode in Stores > Configuration > NativeMind > Flutter Bridge'
            ]);
            $result->setHttpResponseCode(403);
            return $result;
        }

        $debugInfo = [
            'module' => 'NativeMind_FlutterBridge',
            'version' => '2.0.0',
            'config' => [
                'enabled' => $this->config->isEnabled(),
                'route_enabled' => $this->config->isRouteEnabled(),
                'canonical_enabled' => $this->config->isCanonicalEnabled(),
                'jsonld_enabled' => $this->config->isJsonLdEnabled(),
                'opengraph_enabled' => $this->config->isOpenGraphEnabled(),
                'app_banner_enabled' => $this->config->isAppBannerEnabled(),
                'android_enabled' => $this->config->isAndroidAppLinksEnabled(),
                'ios_enabled' => $this->config->isIosUniversalLinksEnabled(),
            ],
            'route_patterns' => [
                'product' => $this->config->getProductAppRoute(),
                'category' => $this->config->getCategoryAppRoute(),
                'cms' => $this->config->getCmsAppRoute(),
                'search' => $this->config->getSearchAppRoute(),
                'cart' => $this->config->getCartAppRoute(),
                'checkout' => $this->config->getCheckoutAppRoute(),
                'customer' => $this->config->getCustomerAppRoute(),
                'home' => $this->config->getHomeAppRoute(),
            ],
            'request' => [
                'full_action_name' => $this->request->getFullActionName(),
                'module' => $this->request->getModuleName(),
                'controller' => $this->request->getControllerName(),
                'action' => $this->request->getActionName(),
            ],
        ];

        $result->setData($debugInfo);
        $result->setHttpResponseCode(200);

        return $result;
    }
}
