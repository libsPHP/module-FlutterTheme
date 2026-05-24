# Specifications: flutter_magento_rest

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24
> Requirements: [01-requirements.md](./01-requirements.md)

## Overview

flutter_magento_rest provides a REST implementation of `MagentoTransport` using Dio. It handles Magento's REST conventions: path prefixing, authentication headers, store context, and error response parsing.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| RestMagentoTransport | Create | Main transport implementation |
| REST error mapper | Create | Maps HTTP errors to MagentoException |
| Dio interceptors | Create | Auth, logging, retry, store context |
| Path builder | Create | Constructs proper /rest/{store}/V1/ paths |

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                   flutter_magento_rest                       │
├─────────────────────────────────────────────────────────────┤
│  ┌────────────────────────────────────────────────────┐     │
│  │            RestMagentoTransport                    │     │
│  │         implements MagentoTransport                │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌───────────────────────▼────────────────────────────┐     │
│  │                    Dio Client                       │     │
│  └───────────────────────┬────────────────────────────┘     │
│                          │                                   │
│  ┌──────────┐  ┌─────────▼───────┐  ┌──────────────────┐   │
│  │   Auth   │  │   Store        │  │   Error          │   │
│  │Interceptor│  │ Interceptor    │  │   Interceptor    │   │
│  └──────────┘  └─────────────────┘  └──────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

## Interfaces

### RestMagentoTransport

```dart
class RestMagentoTransport implements MagentoTransport {
  final String baseUrl;
  final MagentoStoreContext storeContext;
  final MagentoAuthStorage authStorage;
  final Duration timeout;
  final Dio _dio;

  RestMagentoTransport({
    required this.baseUrl,
    required this.storeContext,
    required this.authStorage,
    this.timeout = const Duration(seconds: 30),
    List<Interceptor>? customInterceptors,
  });

  @override
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  });

  @override
  Future<MagentoResponse<T>> post<T>(...);

  @override
  Future<MagentoResponse<T>> put<T>(...);

  @override
  Future<MagentoResponse<T>> delete<T>(...);

  // GraphQL method delegates to error for REST-only transport
  @override
  Future<MagentoResponse<T>> graphql<T>(...) => throw UnsupportedError(...);
}
```

### Dio Interceptors

```dart
class MagentoAuthInterceptor extends Interceptor {
  final MagentoAuthStorage authStorage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await authStorage.getCustomerToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

class MagentoStoreInterceptor extends Interceptor {
  final MagentoStoreContext storeContext;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Prepend store code to path
    final path = options.path;
    if (!path.startsWith('/rest/')) {
      options.path = '/rest/${storeContext.storeCode}/V1$path';
    }
    options.headers['Content-Currency'] = storeContext.currency;
    options.headers['Accept-Language'] = storeContext.locale;
    handler.next(options);
  }
}

class MagentoErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final magentoException = RestErrorMapper.map(err);
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      error: magentoException,
    ));
  }
}
```

## Error Mapping

```dart
class RestErrorMapper {
  static MagentoException map(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return MagentoNetworkException('Connection timeout');
    }

    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    final message = _extractMessage(data);

    return switch (statusCode) {
      401 => MagentoAuthException(message ?? 'Unauthorized'),
      403 => MagentoAuthException(message ?? 'Forbidden'),
      404 => MagentoNotFoundException(message ?? 'Not found'),
      400 => MagentoValidationException(message ?? 'Bad request',
          fieldErrors: _extractFieldErrors(data)),
      422 => MagentoValidationException(message ?? 'Validation failed',
          fieldErrors: _extractFieldErrors(data)),
      429 => MagentoRateLimitException(message ?? 'Rate limit exceeded'),
      >= 500 => MagentoServerException(message ?? 'Server error',
          statusCode: statusCode),
      _ => MagentoNetworkException(message ?? 'Unknown error'),
    };
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map) {
      return data['message'] as String?;
    }
    return null;
  }
}
```

## Dependencies

### Requires

- flutter_magento_core
- dio: ^5.0.0

### Blocks

- flutter_magento (uses this transport)

## Package Structure

```
lib/
├── flutter_magento_rest.dart
└── src/
    ├── rest_magento_transport.dart
    ├── rest_error_mapper.dart
    └── interceptors/
        ├── magento_auth_interceptor.dart
        ├── magento_store_interceptor.dart
        └── magento_error_interceptor.dart
```

---

## Approval

- [x] Reviewed by: User
- [x] Approved on: 2026-05-24
