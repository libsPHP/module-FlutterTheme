import 'dart:convert';

import 'package:flutter_magento_graphql/flutter_magento_graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockAuthStorage extends Mock implements MagentoAuthStorage {}

class FakeUri extends Fake implements Uri {}

void main() {
  late MockHttpClient mockClient;
  late MockAuthStorage mockAuthStorage;
  late GraphQlMagentoTransport transport;

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockClient = MockHttpClient();
    mockAuthStorage = MockAuthStorage();

    transport = GraphQlMagentoTransport(
      baseUrl: 'https://magento.test/graphql',
      storeContext: const MagentoStoreContext(
        storeCode: 'default',
        currency: 'USD',
        locale: 'en_US',
      ),
      authStorage: mockAuthStorage,
      client: mockClient,
    );
  });

  group('GraphQlMagentoTransport', () {
    test('sends GraphQL query with correct headers', () async {
      when(() => mockAuthStorage.getCustomerToken())
          .thenAnswer((_) async => null);

      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({
              'data': {'test': 'value'},
            }),
            200,
          ));

      await transport.graphql(
        'query { test }',
        decoder: (json) => json['test'],
      );

      final captured = verify(() => mockClient.post(
            captureAny(),
            headers: captureAny(named: 'headers'),
            body: any(named: 'body'),
          )).captured;

      final headers = captured[1] as Map<String, String>;
      expect(headers['Content-Type'], 'application/json');
      expect(headers['Store'], 'default');
      expect(headers['Content-Currency'], 'USD');
      expect(headers['Accept-Language'], 'en_US');
    });

    test('includes authorization header when authenticated', () async {
      when(() => mockAuthStorage.getCustomerToken())
          .thenAnswer((_) async => 'test-token');

      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({
              'data': {'test': 'value'},
            }),
            200,
          ));

      await transport.graphql(
        'query { test }',
        decoder: (json) => json['test'],
      );

      final captured = verify(() => mockClient.post(
            any(),
            headers: captureAny(named: 'headers'),
            body: any(named: 'body'),
          )).captured;

      final headers = captured[0] as Map<String, String>;
      expect(headers['Authorization'], 'Bearer test-token');
    });

    test('skips auth when skipAuth is true', () async {
      when(() => mockAuthStorage.getCustomerToken())
          .thenAnswer((_) async => 'test-token');

      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({
              'data': {'test': 'value'},
            }),
            200,
          ));

      await transport.graphql(
        'query { test }',
        options: const MagentoRequestOptions(skipAuth: true),
        decoder: (json) => json['test'],
      );

      final captured = verify(() => mockClient.post(
            any(),
            headers: captureAny(named: 'headers'),
            body: any(named: 'body'),
          )).captured;

      final headers = captured[0] as Map<String, String>;
      expect(headers.containsKey('Authorization'), isFalse);
    });

    test('parses successful response', () async {
      when(() => mockAuthStorage.getCustomerToken())
          .thenAnswer((_) async => null);

      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({
              'data': {
                'products': [
                  {'sku': 'ABC123'}
                ]
              },
            }),
            200,
          ));

      final response = await transport.graphql(
        'query { products { sku } }',
        decoder: (json) => json['products'] as List,
      );

      expect(response.statusCode, 200);
      expect(response.data, hasLength(1));
      expect(response.data[0]['sku'], 'ABC123');
    });

    test('throws MagentoAuthException for auth errors', () async {
      when(() => mockAuthStorage.getCustomerToken())
          .thenAnswer((_) async => null);

      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({
              'errors': [
                {
                  'message': 'Not authorized',
                  'extensions': {'category': 'graphql-authentication'},
                }
              ],
            }),
            200,
          ));

      expect(
        () => transport.graphql(
          'query { test }',
          decoder: (json) => json,
        ),
        throwsA(isA<MagentoAuthException>()),
      );
    });

    test('throws MagentoValidationException for invalid document', () async {
      expect(
        () => transport.graphql(
          'invalid { query',
          decoder: (json) => json,
        ),
        throwsA(isA<MagentoValidationException>()),
      );
    });

    test('REST methods throw UnsupportedError', () {
      expect(
        () => transport.get('path', decoder: (json) => json),
        throwsA(isA<UnsupportedError>()),
      );

      expect(
        () => transport.post('path', decoder: (json) => json),
        throwsA(isA<UnsupportedError>()),
      );

      expect(
        () => transport.put('path', decoder: (json) => json),
        throwsA(isA<UnsupportedError>()),
      );

      expect(
        () => transport.delete('path', decoder: (json) => json),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
