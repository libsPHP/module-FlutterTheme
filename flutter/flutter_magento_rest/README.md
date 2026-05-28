# flutter_magento_rest

[![pub package](https://img.shields.io/pub/v/flutter_magento_rest.svg)](https://pub.dev/packages/flutter_magento_rest)

REST transport implementation for Flutter Magento SDK.

## Features

- REST transport for Magento API
- Dio-based HTTP client
- Automatic error mapping
- Authentication header injection
- Request/response interceptors

## Installation

```yaml
dependencies:
  flutter_magento_rest: ^1.0.0
```

## Usage

### Basic Setup

```dart
import 'package:flutter_magento_rest/flutter_magento_rest.dart';

final transport = RestMagentoTransport(
  baseUrl: 'https://magento.example.com/rest',
  storeContext: MagentoStoreContext(
    storeCode: 'default',
    currencyCode: 'USD',
  ),
  authStorage: SecureMagentoAuthStorage(),
);
```

### Execute Requests

```dart
// GET request
final response = await transport.execute(
  '/V1/products',
  options: MagentoRequestOptions(
    method: 'GET',
    queryParameters: {'searchCriteria[pageSize]': '10'},
  ),
);

// POST request
final response = await transport.execute(
  '/V1/carts/mine/items',
  variables: {
    'cartItem': {
      'sku': 'PRODUCT-SKU',
      'qty': 1,
    },
  },
  options: MagentoRequestOptions(method: 'POST'),
);
```

### Custom Dio Instance

```dart
final dio = Dio()
  ..options.connectTimeout = Duration(seconds: 30)
  ..interceptors.add(LogInterceptor());

final transport = RestMagentoTransport(
  baseUrl: 'https://magento.example.com/rest',
  storeContext: context,
  authStorage: storage,
  dio: dio,
);
```

## When to Use REST vs GraphQL

| Use REST | Use GraphQL |
|----------|-------------|
| Simple CRUD operations | Complex queries |
| Legacy Magento APIs | Flexible data fetching |
| Smaller payload for single resources | Reduced round trips |

## API Reference

| Class | Description |
|-------|-------------|
| `RestMagentoTransport` | Main REST transport |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core interfaces
- [flutter_magento_graphql](https://pub.dev/packages/flutter_magento_graphql) - GraphQL alternative
