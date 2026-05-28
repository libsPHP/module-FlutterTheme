<?php
/**
 * Custom Router for .well-known endpoints
 *
 * Handles /.well-known/assetlinks.json and /.well-known/apple-app-site-association
 *
 * @category    NativeMind
 * @package     NativeMind_Bridge
 */

declare(strict_types=1);

namespace NativeMind\Bridge\Controller;

use Magento\Framework\App\ActionFactory;
use Magento\Framework\App\RequestInterface;
use Magento\Framework\App\RouterInterface;
use NativeMind\Bridge\Helper\Config;

class Router implements RouterInterface
{
    private ActionFactory $actionFactory;
    private Config $config;

    /**
     * Route mapping: path => [module, controller, action]
     */
    private const ROUTES = [
        '.well-known/assetlinks.json' => [
            'module' => 'NativeMind_Bridge',
            'controller' => 'wellknown',
            'action' => 'assetlinks'
        ],
        '.well-known/apple-app-site-association' => [
            'module' => 'NativeMind_Bridge',
            'controller' => 'wellknown',
            'action' => 'appleappsiteassociation'
        ]
    ];

    public function __construct(
        ActionFactory $actionFactory,
        Config $config
    ) {
        $this->actionFactory = $actionFactory;
        $this->config = $config;
    }

    /**
     * Match request to route
     *
     * @param RequestInterface $request
     * @return \Magento\Framework\App\ActionInterface|null
     */
    public function match(RequestInterface $request)
    {
        $pathInfo = trim($request->getPathInfo(), '/');

        if (!isset(self::ROUTES[$pathInfo])) {
            return null;
        }

        // Check if module is enabled
        if (!$this->config->isEnabled()) {
            return null;
        }

        // Check specific feature enablement
        if ($pathInfo === '.well-known/assetlinks.json' && !$this->config->isAndroidAppLinksEnabled()) {
            return null;
        }

        if ($pathInfo === '.well-known/apple-app-site-association' && !$this->config->isIosUniversalLinksEnabled()) {
            return null;
        }

        $route = self::ROUTES[$pathInfo];

        $request->setModuleName($route['module']);
        $request->setControllerName($route['controller']);
        $request->setActionName($route['action']);

        return $this->actionFactory->create(\Magento\Framework\App\Action\Forward::class);
    }
}
