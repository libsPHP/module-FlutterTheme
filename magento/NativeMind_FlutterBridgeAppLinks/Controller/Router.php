<?php
declare(strict_types=1);

namespace NativeMind\FlutterBridgeAppLinks\Controller;

use Magento\Framework\App\ActionFactory;
use Magento\Framework\App\RequestInterface;
use Magento\Framework\App\RouterInterface;
use NativeMind\FlutterBridgeAppLinks\Helper\Config;

class Router implements RouterInterface
{
    private ActionFactory $actionFactory;
    private Config $config;

    public function __construct(
        ActionFactory $actionFactory,
        Config $config
    ) {
        $this->actionFactory = $actionFactory;
        $this->config = $config;
    }

    public function match(RequestInterface $request): ?\Magento\Framework\App\ActionInterface
    {
        $identifier = trim($request->getPathInfo(), '/');

        if (!$this->config->isEnabled()) {
            return null;
        }

        if ($identifier === '.well-known/assetlinks.json') {
            $request->setModuleName('wellknown');
            $request->setControllerName('wellknown');
            $request->setActionName('assetLinks');
            return $this->actionFactory->create(\Magento\Framework\App\Action\Forward::class);
        }

        if ($identifier === '.well-known/apple-app-site-association') {
            $request->setModuleName('wellknown');
            $request->setControllerName('wellknown');
            $request->setActionName('appleAppSiteAssociation');
            return $this->actionFactory->create(\Magento\Framework\App\Action\Forward::class);
        }

        return null;
    }
}
