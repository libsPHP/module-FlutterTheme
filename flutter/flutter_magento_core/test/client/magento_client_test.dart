import 'package:test/test.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

// Mock transport for testing
class MockMagentoTransport implements MagentoTransport {
  @override
  Future<MagentoResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<MagentoResponse<T>> post<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<MagentoResponse<T>> put<T>(
    String path, {
    Object? body,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<MagentoResponse<T>> delete<T>(
    String path, {
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<MagentoResponse<T>> graphql<T>(
    String document, {
    Map<String, dynamic>? variables,
    MagentoRequestOptions? options,
    required T Function(dynamic json) decoder,
  }) async {
    throw UnimplementedError();
  }
}

void main() {
  group('MagentoClient', () {
    late MockMagentoTransport transport;
    late MemoryMagentoAuthStorage authStorage;

    setUp(() {
      transport = MockMagentoTransport();
      authStorage = MemoryMagentoAuthStorage();
    });

    test('creates with required parameters', () {
      final client = MagentoClient(
        transport: transport,
        authStorage: authStorage,
      );

      expect(client.transport, transport);
      expect(client.authStorage, authStorage);
    });

    test('uses default store context if not provided', () {
      final client = MagentoClient(
        transport: transport,
        authStorage: authStorage,
      );

      expect(client.storeContext.storeCode, 'default');
      expect(client.storeContext.currency, 'USD');
      expect(client.storeContext.locale, 'en_US');
    });

    test('uses provided store context', () {
      final context = const MagentoStoreContext(
        storeCode: 'german',
        currency: 'EUR',
        locale: 'de_DE',
      );

      final client = MagentoClient(
        transport: transport,
        authStorage: authStorage,
        storeContext: context,
      );

      expect(client.storeContext.storeCode, 'german');
      expect(client.storeContext.currency, 'EUR');
    });

    test('creates extension registry if not provided', () {
      final client = MagentoClient(
        transport: transport,
        authStorage: authStorage,
      );

      expect(client.extensions, isNotNull);
    });

    test('uses provided extension registry', () {
      final registry = MagentoExtensionRegistry();

      final client = MagentoClient(
        transport: transport,
        authStorage: authStorage,
        extensions: registry,
      );

      expect(client.extensions, same(registry));
    });

    test('uses NoOpMagentoObserver if not provided', () {
      final client = MagentoClient(
        transport: transport,
        authStorage: authStorage,
      );

      expect(client.observer, isA<NoOpMagentoObserver>());
    });

    group('repository access', () {
      test('throws when accessing uninitialized auth repository', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(() => client.auth, throwsA(isA<StateError>()));
      });

      test('throws when accessing uninitialized catalog repository', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(() => client.catalog, throwsA(isA<StateError>()));
      });

      test('throws when accessing uninitialized cart repository', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(() => client.cart, throwsA(isA<StateError>()));
      });

      test('throws when accessing uninitialized checkout repository', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(() => client.checkout, throwsA(isA<StateError>()));
      });

      test('throws when accessing uninitialized customer repository', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(() => client.customer, throwsA(isA<StateError>()));
      });

      test('throws when accessing uninitialized orders repository', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(() => client.orders, throwsA(isA<StateError>()));
      });

      test('throws when accessing uninitialized wishlist repository', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(() => client.wishlist, throwsA(isA<StateError>()));
      });
    });

    group('hasRepository', () {
      test('returns false for uninitialized repositories', () {
        final client = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        expect(client.hasRepository<AuthRepository>(), false);
        expect(client.hasRepository<CatalogRepository>(), false);
        expect(client.hasRepository<CartRepository>(), false);
      });
    });

    group('copyWith', () {
      test('creates copy with new transport', () {
        final original = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        final newTransport = MockMagentoTransport();
        final copy = original.copyWith(transport: newTransport);

        expect(copy.transport, newTransport);
        expect(copy.authStorage, same(authStorage));
      });

      test('creates copy with new store context', () {
        final original = MagentoClient(
          transport: transport,
          authStorage: authStorage,
        );

        final newContext = const MagentoStoreContext(
          storeCode: 'new',
          currency: 'GBP',
          locale: 'en_GB',
        );
        final copy = original.copyWith(storeContext: newContext);

        expect(copy.storeContext.storeCode, 'new');
        expect(copy.transport, same(transport));
      });

      test('preserves unchanged values', () {
        final logger = ConsoleMagentoLogger();
        final original = MagentoClient(
          transport: transport,
          authStorage: authStorage,
          logger: logger,
        );

        final copy = original.copyWith();

        expect(copy.transport, same(transport));
        expect(copy.authStorage, same(authStorage));
        expect(copy.logger, same(logger));
      });
    });
  });

  group('MagentoObserver', () {
    test('NoOpMagentoObserver does nothing', () {
      const observer = NoOpMagentoObserver();

      // Should not throw
      observer.onRequest('GET', '/test', null);
      observer.onResponse(
        'GET',
        '/test',
        MagentoResponse.success('data'),
      );
      observer.onError(
        'GET',
        '/test',
        const MagentoNetworkException('error'),
      );
    });

    test('CompositeMagentoObserver delegates to all observers', () {
      final calls = <String>[];

      final observer1 = _CallTrackingObserver('1', calls);
      final observer2 = _CallTrackingObserver('2', calls);

      final composite = CompositeMagentoObserver([observer1, observer2]);

      composite.onRequest('GET', '/test', null);
      composite.onResponse('GET', '/test', MagentoResponse.success('data'));
      composite.onError('GET', '/test', const MagentoNetworkException('error'));

      expect(calls, [
        '1:request',
        '2:request',
        '1:response',
        '2:response',
        '1:error',
        '2:error',
      ]);
    });
  });
}

class _CallTrackingObserver implements MagentoObserver {
  final String id;
  final List<String> calls;

  _CallTrackingObserver(this.id, this.calls);

  @override
  void onRequest(String method, String path, Object? body) {
    calls.add('$id:request');
  }

  @override
  void onResponse(String method, String path, MagentoResponse<dynamic> response) {
    calls.add('$id:response');
  }

  @override
  void onError(String method, String path, MagentoException error) {
    calls.add('$id:error');
  }
}
