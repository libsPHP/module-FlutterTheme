import 'package:equatable/equatable.dart';

/// Configuration class for Magento Marketplace client
class MarketplaceConfig extends Equatable {
  /// Base URL of the Magento store
  final String baseUrl;

  /// API prefix for marketplace endpoints
  final String apiPrefix;

  /// API key for authentication (optional)
  final String? apiKey;

  /// Connection timeout in seconds
  final int connectTimeout;

  /// Receive timeout in seconds
  final int receiveTimeout;

  /// Send timeout in seconds
  final int sendTimeout;

  /// Enable logging for debugging
  final bool enableLogging;

  /// Enable caching for API responses
  final bool enableCaching;

  /// Cache duration in seconds
  final int cacheDuration;

  /// Enable subdomain support
  final bool enableSubdomains;

  /// Enable subdirectory support
  final bool enableSubdirectories;

  /// Default subdomain for marketplace
  final String? defaultSubdomain;

  /// Enable real-time messaging
  final bool enableMessaging;

  /// Enable push notifications
  final bool enableNotifications;

  /// Enable offline mode
  final bool enableOfflineMode;

  /// Maximum retry attempts for failed requests
  final int maxRetries;

  /// Retry delay in milliseconds
  final int retryDelay;

  const MarketplaceConfig({
    required this.baseUrl,
    this.apiPrefix = '/rest/V1/marketplace',
    this.apiKey,
    this.connectTimeout = 30,
    this.receiveTimeout = 30,
    this.sendTimeout = 30,
    this.enableLogging = false,
    this.enableCaching = true,
    this.cacheDuration = 300, // 5 minutes
    this.enableSubdomains = true,
    this.enableSubdirectories = true,
    this.defaultSubdomain,
    this.enableMessaging = true,
    this.enableNotifications = true,
    this.enableOfflineMode = true,
    this.maxRetries = 3,
    this.retryDelay = 1000,
  });

  /// Create configuration from environment variables
  factory MarketplaceConfig.fromEnvironment() {
    return MarketplaceConfig(
      baseUrl: const String.fromEnvironment(
        'MAGENTO_BASE_URL',
        defaultValue: 'https://yourstore.com',
      ),
      apiKey: const String.fromEnvironment('MAGENTO_API_KEY'),
      enableLogging: const bool.fromEnvironment(
        'MAGENTO_ENABLE_LOGGING',
        defaultValue: false,
      ),
      enableCaching: const bool.fromEnvironment(
        'MAGENTO_ENABLE_CACHING',
        defaultValue: true,
      ),
      enableSubdomains: const bool.fromEnvironment(
        'MAGENTO_ENABLE_SUBDOMAINS',
        defaultValue: true,
      ),
      enableSubdirectories: const bool.fromEnvironment(
        'MAGENTO_ENABLE_SUBDIRECTORIES',
        defaultValue: true,
      ),
      enableMessaging: const bool.fromEnvironment(
        'MAGENTO_ENABLE_MESSAGING',
        defaultValue: true,
      ),
      enableNotifications: const bool.fromEnvironment(
        'MAGENTO_ENABLE_NOTIFICATIONS',
        defaultValue: true,
      ),
      enableOfflineMode: const bool.fromEnvironment(
        'MAGENTO_ENABLE_OFFLINE_MODE',
        defaultValue: true,
      ),
    );
  }

  /// Create configuration for development
  factory MarketplaceConfig.development({
    required String baseUrl,
    String? apiKey,
  }) {
    return MarketplaceConfig(
      baseUrl: baseUrl,
      apiKey: apiKey,
      enableLogging: true,
      enableCaching: false,
      connectTimeout: 60,
      receiveTimeout: 60,
      sendTimeout: 60,
    );
  }

  /// Create configuration for production
  factory MarketplaceConfig.production({
    required String baseUrl,
    String? apiKey,
  }) {
    return MarketplaceConfig(
      baseUrl: baseUrl,
      apiKey: apiKey,
      enableLogging: false,
      enableCaching: true,
      cacheDuration: 600, // 10 minutes
      connectTimeout: 15,
      receiveTimeout: 15,
      sendTimeout: 15,
      maxRetries: 2,
    );
  }

  /// Create configuration for testing
  factory MarketplaceConfig.testing({
    String baseUrl = 'https://teststore.com',
    String? apiKey,
  }) {
    return MarketplaceConfig(
      baseUrl: baseUrl,
      apiKey: apiKey,
      enableLogging: true,
      enableCaching: false,
      connectTimeout: 10,
      receiveTimeout: 10,
      sendTimeout: 10,
      maxRetries: 1,
    );
  }

  /// Copy with new values
  MarketplaceConfig copyWith({
    String? baseUrl,
    String? apiPrefix,
    String? apiKey,
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    bool? enableLogging,
    bool? enableCaching,
    int? cacheDuration,
    bool? enableSubdomains,
    bool? enableSubdirectories,
    String? defaultSubdomain,
    bool? enableMessaging,
    bool? enableNotifications,
    bool? enableOfflineMode,
    int? maxRetries,
    int? retryDelay,
  }) {
    return MarketplaceConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      apiPrefix: apiPrefix ?? this.apiPrefix,
      apiKey: apiKey ?? this.apiKey,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      enableLogging: enableLogging ?? this.enableLogging,
      enableCaching: enableCaching ?? this.enableCaching,
      cacheDuration: cacheDuration ?? this.cacheDuration,
      enableSubdomains: enableSubdomains ?? this.enableSubdomains,
      enableSubdirectories: enableSubdirectories ?? this.enableSubdirectories,
      defaultSubdomain: defaultSubdomain ?? this.defaultSubdomain,
      enableMessaging: enableMessaging ?? this.enableMessaging,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      enableOfflineMode: enableOfflineMode ?? this.enableOfflineMode,
      maxRetries: maxRetries ?? this.maxRetries,
      retryDelay: retryDelay ?? this.retryDelay,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
      'apiPrefix': apiPrefix,
      'apiKey': apiKey,
      'connectTimeout': connectTimeout,
      'receiveTimeout': receiveTimeout,
      'sendTimeout': sendTimeout,
      'enableLogging': enableLogging,
      'enableCaching': enableCaching,
      'cacheDuration': cacheDuration,
      'enableSubdomains': enableSubdomains,
      'enableSubdirectories': enableSubdirectories,
      'defaultSubdomain': defaultSubdomain,
      'enableMessaging': enableMessaging,
      'enableNotifications': enableNotifications,
      'enableOfflineMode': enableOfflineMode,
      'maxRetries': maxRetries,
      'retryDelay': retryDelay,
    };
  }

  /// Create from JSON
  factory MarketplaceConfig.fromJson(Map<String, dynamic> json) {
    return MarketplaceConfig(
      baseUrl: json['baseUrl'] as String,
      apiPrefix: json['apiPrefix'] as String? ?? '/rest/V1/marketplace',
      apiKey: json['apiKey'] as String?,
      connectTimeout: json['connectTimeout'] as int? ?? 30,
      receiveTimeout: json['receiveTimeout'] as int? ?? 30,
      sendTimeout: json['sendTimeout'] as int? ?? 30,
      enableLogging: json['enableLogging'] as bool? ?? false,
      enableCaching: json['enableCaching'] as bool? ?? true,
      cacheDuration: json['cacheDuration'] as int? ?? 300,
      enableSubdomains: json['enableSubdomains'] as bool? ?? true,
      enableSubdirectories: json['enableSubdirectories'] as bool? ?? true,
      defaultSubdomain: json['defaultSubdomain'] as String?,
      enableMessaging: json['enableMessaging'] as bool? ?? true,
      enableNotifications: json['enableNotifications'] as bool? ?? true,
      enableOfflineMode: json['enableOfflineMode'] as bool? ?? true,
      maxRetries: json['maxRetries'] as int? ?? 3,
      retryDelay: json['retryDelay'] as int? ?? 1000,
    );
  }

  @override
  List<Object?> get props => [
    baseUrl,
    apiPrefix,
    apiKey,
    connectTimeout,
    receiveTimeout,
    sendTimeout,
    enableLogging,
    enableCaching,
    cacheDuration,
    enableSubdomains,
    enableSubdirectories,
    defaultSubdomain,
    enableMessaging,
    enableNotifications,
    enableOfflineMode,
    maxRetries,
    retryDelay,
  ];

  @override
  String toString() {
    return 'MarketplaceConfig('
        'baseUrl: $baseUrl, '
        'apiPrefix: $apiPrefix, '
        'apiKey: ${apiKey != null ? '***' : null}, '
        'connectTimeout: $connectTimeout, '
        'receiveTimeout: $receiveTimeout, '
        'sendTimeout: $sendTimeout, '
        'enableLogging: $enableLogging, '
        'enableCaching: $enableCaching, '
        'cacheDuration: $cacheDuration, '
        'enableSubdomains: $enableSubdomains, '
        'enableSubdirectories: $enableSubdirectories, '
        'defaultSubdomain: $defaultSubdomain, '
        'enableMessaging: $enableMessaging, '
        'enableNotifications: $enableNotifications, '
        'enableOfflineMode: $enableOfflineMode, '
        'maxRetries: $maxRetries, '
        'retryDelay: $retryDelay'
        ')';
  }
}

