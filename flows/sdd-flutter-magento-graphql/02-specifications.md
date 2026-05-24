# Specifications: flutter_magento_graphql

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_graphql provides a GraphQL implementation of `MagentoTransport` from flutter_magento_core. It handles Magento-specific GraphQL concerns: authentication headers, store context, error mapping, and optional caching.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| GraphQlMagentoTransport | Create | Main transport implementation |
| GraphQL error mapper | Create | Maps GraphQL errors to MagentoException |
| Header interceptor | Create | Injects auth/store headers |
| Query cache | Create | Optional response caching |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                 flutter_magento_graphql                      │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │           GraphQlMagentoTransport                  │     │
│  │         implements MagentoTransport                │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌───────────────────────▼────────────────────────────┐     │
│  │              GraphQL Client (gql)                   │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌──────────┐  ┌─────────▼───────┐  ┌──────────────────┐   │
│  │  Header  │  │   Error        │  │  Query Cache     │   │
│  │Interceptor│  │   Mapper       │  │  (Optional)      │   │
│  └──────────┘  └─────────────────┘  └──────────────────┘   │
└─────────────────────────────────────────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────────────────────────┐
│                 flutter_magento_core                         │
│  MagentoTransport, MagentoStoreContext, MagentoAuthStorage  │
└─────────────────────────────────────────────────────────────┘
```

### Request Flow

```
Repository.method()
    → Transport.graphql(document, variables)
        → Add headers (store, auth)
        → Check cache (if enabled)
        → Execute GraphQL request
        → Parse response/errors
        → Map to MagentoResponse<T> or throw MagentoException
```

## Interfaces

### GraphQlMagentoTransport

```dart
class GraphQlMagentoTransport implements MagentoTransport {
  final String baseUrl;
  final MagentoStoreContext storeContext;
  final MagentoAuthStorage authStorage;
  final GraphQlCacheConfig? cacheConfig;
  final Duration timeout;

  GraphQlMagentoTransport({
    required this.baseUrl,
    required this.storeContext,
    required this.authStorage,
    this.cacheConfig,
    this.timeout = const Duration(seconds: 30),
  });

  @override
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  // REST methods delegate to error for GraphQL-only transport
  @override
  Future<MagentoResponse<T>> get<T>(...) => throw UnsupportedError(...);
  // ... post, put, delete similarly
}
```

### Decorators

```dart
class LoggingGraphQlTransport implements MagentoTransport {
  final MagentoTransport inner;
  final MagentoLogger logger;

  LoggingGraphQlTransport({required this.inner, required this.logger});
}

class RetryGraphQlTransport implements MagentoTransport {
  final MagentoTransport inner;
  final int maxRetries;
  final Duration retryDelay;

  RetryGraphQlTransport({
    required this.inner,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });
}

class CachedGraphQlTransport implements MagentoTransport {
  final MagentoTransport inner;
  final MagentoCache cache;
  final Duration defaultTtl;

  CachedGraphQlTransport({
    required this.inner,
    required this.cache,
    this.defaultTtl = const Duration(minutes: 5),
  });
}
```

## Error Mapping

```dart
class GraphQlErrorMapper {
  MagentoException mapGraphQlErrors(List<GraphQLError> errors) {
    final firstError = errors.first;
    final category = firstError.extensions?['category'];
    final message = firstError.message;

    return switch (category) {
      'graphql-authentication' => MagentoAuthException(message),
      'graphql-authorization' => MagentoAuthException(message),
      'graphql-input' => MagentoValidationException(message,
          fieldErrors: _extractFieldErrors(errors)),
      'graphql-no-such-entity' => MagentoNotFoundException(message),
      'graphql-already-exists' => MagentoValidationException(message),
      _ => MagentoServerException(message),
    };
  }
}
```

## Header Injection

Headers automatically added:
- `Store: {storeContext.storeCode}`
- `Content-Currency: {storeContext.currency}`
- `Accept-Language: {storeContext.locale}`
- `Authorization: Bearer {customerToken}` (if authenticated)
- `Content-Type: application/json`

## Data Models

### GraphQlCacheConfig

```dart
class GraphQlCacheConfig {
  final Duration defaultTtl;
  final Set<String> excludedOperations;
  final int maxCacheSize;

  const GraphQlCacheConfig({
    this.defaultTtl = const Duration(minutes: 5),
    this.excludedOperations = const {'mutation'},
    this.maxCacheSize = 100,
  });
}
```

## Dependencies

### Requires

- flutter_magento_core (transport interface, context, storage, errors)
- gql (GraphQL client)
- http (HTTP transport)

### Blocks

- flutter_magento (uses this transport)

## Testing Strategy

### Unit Tests

- [ ] GraphQlMagentoTransport.graphql() success path
- [ ] GraphQlErrorMapper with various error categories
- [ ] Header injection with/without auth token
- [ ] Cache hit/miss scenarios

### Integration Tests

- [ ] Real GraphQL query against Magento sandbox

## Package Structure

```
lib/
├── flutter_magento_graphql.dart
└── src/
    ├── graphql_magento_transport.dart
    ├── graphql_error_mapper.dart
    ├── graphql_cache_config.dart
    └── decorators/
        ├── logging_transport.dart
        ├── retry_transport.dart
        └── cached_transport.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
