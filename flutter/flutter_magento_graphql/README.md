# flutter_magento_graphql

[![pub package](https://img.shields.io/pub/v/flutter_magento_graphql.svg)](https://pub.dev/packages/flutter_magento_graphql)

GraphQL transport implementation for Flutter Magento SDK.

## Features

- GraphQL transport for Magento API
- Automatic error mapping to typed exceptions
- Authentication header injection
- Request logging decorator
- Retry with exponential backoff
- Response caching

## Installation

```yaml
dependencies:
  flutter_magento_graphql: ^1.0.0
```

## Usage

### Basic Setup

```dart
import 'package:flutter_magento_graphql/flutter_magento_graphql.dart';

final transport = GraphQlMagentoTransport(
  baseUrl: 'https://magento.example.com/graphql',
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currencyCode: 'USD',
  ),
  authStorage: SecureMagentoAuthStorage(),
);
```

### With Logging

```dart
final transport = LoggingMagentoTransport(
  inner: GraphQlMagentoTransport(...),
  logger: ConsoleMagentoLogger(level: MagentoLogLevel.debug),
);
```

### With Retry

```dart
final transport = RetryMagentoTransport(
  inner: GraphQlMagentoTransport(...),
  maxRetries: 3,
  retryDelay: Duration(seconds: 1),
  retryOn: (exception) => exception is MagentoNetworkException,
);
```

### With Caching

```dart
final transport = CachedMagentoTransport(
  inner: GraphQlMagentoTransport(...),
  config: GraphQlCacheConfig(
    defaultTtl: Duration(minutes: 5),
    maxEntries: 100,
  ),
);
```

### Combined Decorators

```dart
// Build transport with all features
var transport = GraphQlMagentoTransport(
  baseUrl: 'https://magento.example.com/graphql',
  storeContext: context,
  authStorage: storage,
);

// Add caching
transport = CachedMagentoTransport(
  inner: transport,
  config: GraphQlCacheConfig(defaultTtl: Duration(minutes: 5)),
);

// Add retry
transport = RetryMagentoTransport(
  inner: transport,
  maxRetries: 3,
);

// Add logging (outermost)
transport = LoggingMagentoTransport(
  inner: transport,
  logger: ConsoleMagentoLogger(),
);
```

### Execute Queries

```dart
final response = await transport.execute(
  '''
  query GetProducts(\$pageSize: Int!) {
    products(pageSize: \$pageSize) {
      items { sku name }
    }
  }
  ''',
  variables: {'pageSize': 10},
);

final products = response.data['products']['items'];
```

## Error Handling

GraphQL errors are automatically mapped to typed exceptions:

```dart
try {
  await transport.execute(query);
} on MagentoAuthException catch (e) {
  // Token expired, invalid credentials
} on MagentoNotFoundException catch (e) {
  // Resource not found
} on MagentoValidationException catch (e) {
  // Invalid input
} on MagentoNetworkException catch (e) {
  // Network error
} on MagentoServerException catch (e) {
  // Server error (5xx)
}
```

## API Reference

| Class | Description |
|-------|-------------|
| `GraphQlMagentoTransport` | Main GraphQL transport |
| `LoggingMagentoTransport` | Logging decorator |
| `RetryMagentoTransport` | Retry decorator |
| `CachedMagentoTransport` | Caching decorator |
| `GraphQlCacheConfig` | Cache configuration |
| `GraphQlErrorMapper` | Error mapping |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core interfaces
- [flutter_magento_rest](https://pub.dev/packages/flutter_magento_rest) - REST alternative
