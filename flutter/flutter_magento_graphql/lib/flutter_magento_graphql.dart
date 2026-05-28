/// GraphQL transport implementation for flutter_magento SDK.
///
/// This package provides a GraphQL implementation of [MagentoTransport]
/// that handles Magento GraphQL API requests with proper error handling,
/// authentication, and optional caching.
///
/// Example:
/// ```dart
/// import 'package:flutter_magento_graphql/flutter_magento_graphql.dart';
///
/// final transport = GraphQlMagentoTransport(
///   baseUrl: 'https://magento.example.com/graphql',
///   storeContext: MagentoStoreContext.defaults(),
///   authStorage: MemoryMagentoAuthStorage(),
/// );
///
/// // Optional: wrap with decorators
/// final loggingTransport = LoggingMagentoTransport(
///   inner: transport,
///   logger: ConsoleMagentoLogger(),
/// );
/// ```
library;

// Re-export core types for convenience
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show
        MagentoTransport,
        MagentoResponse,
        MagentoRequestOptions,
        CachePolicy,
        MagentoStoreContext,
        MagentoAuthStorage,
        MagentoLogger,
        MagentoException,
        MagentoNetworkException,
        MagentoAuthException,
        MagentoValidationException,
        MagentoNotFoundException,
        MagentoServerException,
        MagentoUnknownException;

// Core transport
export 'src/graphql_magento_transport.dart';
export 'src/graphql_cache_config.dart';
export 'src/graphql_error_mapper.dart';

// Decorators
export 'src/decorators/logging_transport.dart';
export 'src/decorators/retry_transport.dart';
export 'src/decorators/cached_transport.dart';
