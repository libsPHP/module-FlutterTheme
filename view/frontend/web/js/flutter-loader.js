/**
 * NativeMind FlutterTheme Flutter Loader
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 * @author      NativeMind <contact@nativemind.net>
 * @copyright   Copyright (c) 2024 NativeMind (https://nativemind.net)
 * @license     https://opensource.org/licenses/MIT
 *
 * Initializes and loads Flutter Web application
 */

(function() {
    'use strict';

    /**
     * Flutter Loader Class
     */
    class FlutterLoader {
        constructor() {
            this.config = window.flutterConfiguration || {};
            this.loadingElement = document.getElementById('flutter-loading');
            this.appElement = document.getElementById('flutter-app');
            this.isLoaded = false;
            this.isLoading = false;
        }

        /**
         * Initialize Flutter application
         */
        async init() {
            if (this.isLoading || this.isLoaded) {
                console.warn('Flutter is already loading or loaded');
                return;
            }

            this.isLoading = true;
            console.log('Initializing Flutter Web application...');

            try {
                // Check if flutter.js is loaded
                if (typeof _flutter === 'undefined') {
                    throw new Error('Flutter engine not found. Please ensure flutter.js is loaded.');
                }

                // Show loading state
                this.showLoading();

                // Load Flutter entry point
                await this.loadFlutter();

                // Hide loading state
                this.hideLoading();

                this.isLoaded = true;
                console.log('Flutter application loaded successfully');

                // Dispatch custom event
                this.dispatchLoadedEvent();

            } catch (error) {
                console.error('Failed to load Flutter application:', error);
                this.showError(error);
            } finally {
                this.isLoading = false;
            }
        }

        /**
         * Load Flutter application
         */
        async loadFlutter() {
            return new Promise((resolve, reject) => {
                try {
                    // Configure service worker
                    const serviceWorkerConfig = this.config.serviceWorkerEnabled
                        ? {
                            serviceWorkerUrl: this.config.serviceWorkerUrl,
                            serviceWorkerVersion: this.getServiceWorkerVersion()
                        }
                        : null;

                    // Load entry point
                    _flutter.loader.loadEntrypoint({
                        entrypointUrl: this.config.assetBase + 'main.dart.js',
                        onEntrypointLoaded: async (engineInitializer) => {
                            try {
                                console.log('Initializing Flutter engine...');

                                // Initialize engine with configuration
                                const appRunner = await engineInitializer.initializeEngine({
                                    hostElement: this.appElement,
                                    renderer: this.config.useCanvasKit ? 'canvaskit' : 'html',
                                    canvasKitBaseUrl: this.config.canvasKitBaseUrl,
                                });

                                console.log('Running Flutter app...');

                                // Run the app with Magento configuration
                                await appRunner.runApp({
                                    initializationData: this.config.magento
                                });

                                resolve();
                            } catch (error) {
                                reject(error);
                            }
                        },
                        serviceWorker: serviceWorkerConfig
                    });

                } catch (error) {
                    reject(error);
                }
            });
        }

        /**
         * Show loading indicator
         */
        showLoading() {
            if (this.loadingElement) {
                this.loadingElement.style.display = 'block';
            }
        }

        /**
         * Hide loading indicator
         */
        hideLoading() {
            if (this.loadingElement) {
                // Fade out animation
                this.loadingElement.style.opacity = '0';
                this.loadingElement.style.transition = 'opacity 0.3s ease-out';

                setTimeout(() => {
                    this.loadingElement.style.display = 'none';
                }, 300);
            }
        }

        /**
         * Show error message
         */
        showError(error) {
            if (this.appElement) {
                const errorHtml = `
                    <div class="flutter-error">
                        <div class="flutter-error-content">
                            <h2>Failed to Load Application</h2>
                            <p>We encountered an error while loading the store.</p>
                            <p class="flutter-error-message">${this.escapeHtml(error.message)}</p>
                            <button onclick="window.location.reload()" class="flutter-error-reload">
                                Reload Page
                            </button>
                        </div>
                    </div>
                `;

                this.appElement.innerHTML = errorHtml;
            }

            // Also log to console
            console.error('Flutter Loader Error:', error);
        }

        /**
         * Get service worker version
         */
        getServiceWorkerVersion() {
            // Generate version from current timestamp or use configured version
            return this.config.serviceWorkerVersion || new Date().getTime().toString();
        }

        /**
         * Dispatch loaded event
         */
        dispatchLoadedEvent() {
            const event = new CustomEvent('flutterLoaded', {
                detail: {
                    config: this.config,
                    timestamp: new Date().toISOString()
                }
            });

            window.dispatchEvent(event);
        }

        /**
         * Escape HTML to prevent XSS
         */
        escapeHtml(text) {
            const div = document.createElement('div');
            div.textContent = text;
            return div.innerHTML;
        }

        /**
         * Check if browser supports Flutter Web
         */
        static checkBrowserSupport() {
            const requiredFeatures = [
                'Promise',
                'fetch',
                'WebAssembly',
                'requestAnimationFrame'
            ];

            const missingFeatures = requiredFeatures.filter(feature => {
                return !(feature in window);
            });

            if (missingFeatures.length > 0) {
                console.warn('Browser missing required features:', missingFeatures);
                return false;
            }

            return true;
        }
    }

    /**
     * Initialize when DOM is ready
     */
    function initFlutterLoader() {
        // Check browser support
        if (!FlutterLoader.checkBrowserSupport()) {
            console.error('Browser does not support Flutter Web');
            alert('Your browser does not support this application. Please use a modern browser.');
            return;
        }

        // Create and initialize loader
        const loader = new FlutterLoader();
        
        // Store reference globally for debugging
        window.flutterLoader = loader;

        // Initialize Flutter
        loader.init().catch(error => {
            console.error('Fatal error during Flutter initialization:', error);
        });
    }

    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initFlutterLoader);
    } else {
        // DOM is already ready
        initFlutterLoader();
    }

    // Error handling for unhandled promise rejections
    window.addEventListener('unhandledrejection', function(event) {
        console.error('Unhandled promise rejection in Flutter app:', event.reason);
    });

    // Handle page visibility changes (for PWA)
    document.addEventListener('visibilitychange', function() {
        if (document.hidden) {
            console.log('Flutter app hidden');
        } else {
            console.log('Flutter app visible');
        }
    });

    // Additional error styles
    const errorStyles = `
        <style>
            .flutter-error {
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                background: #f5f5f5;
                padding: 20px;
            }
            
            .flutter-error-content {
                max-width: 500px;
                background: #fff;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
                text-align: center;
            }
            
            .flutter-error h2 {
                color: #d32f2f;
                margin-bottom: 15px;
                font-size: 24px;
            }
            
            .flutter-error p {
                color: #666;
                margin: 10px 0;
                line-height: 1.6;
            }
            
            .flutter-error-message {
                background: #ffebee;
                padding: 15px;
                border-radius: 4px;
                font-family: monospace;
                font-size: 14px;
                color: #c62828;
                margin: 20px 0;
                word-break: break-word;
            }
            
            .flutter-error-reload {
                margin-top: 20px;
                padding: 12px 30px;
                background: #1976d2;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background 0.3s;
            }
            
            .flutter-error-reload:hover {
                background: #1565c0;
            }
        </style>
    `;

    // Inject error styles
    document.head.insertAdjacentHTML('beforeend', errorStyles);

})();

