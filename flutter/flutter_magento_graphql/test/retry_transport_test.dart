import 'package:flutter_magento_graphql/flutter_magento_graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTransport extends Mock implements MagentoTransport {}

void main() {
  late MockTransport mockInner;
  late RetryMagentoTransport transport;

  setUp(() {
    mockInner = MockTransport();
    transport = RetryMagentoTransport(
      inner: mockInner,
      maxRetries: 3,
      retryDelay: const Duration(milliseconds: 10),
      useExponentialBackoff: false,
    );
  });

  group('RetryMagentoTransport', () {
    test('returns response on first success', () async {
      when(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async => MagentoResponse.success('data'));

      final response = await transport.graphql(
        'query { test }',
        decoder: (json) => json.toString(),
      );

      expect(response.data, 'data');
      verify(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).called(1);
    });

    test('retries on network error and succeeds', () async {
      var attempts = 0;
      when(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async {
        attempts++;
        if (attempts < 2) {
          throw const MagentoNetworkException('Connection failed');
        }
        return MagentoResponse.success('data');
      });

      final response = await transport.graphql(
        'query { test }',
        decoder: (json) => json.toString(),
      );

      expect(response.data, 'data');
      expect(attempts, 2);
    });

    test('retries on server error', () async {
      var attempts = 0;
      when(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async {
        attempts++;
        if (attempts < 2) {
          throw const MagentoServerException('Server error', statusCode: 500);
        }
        return MagentoResponse.success('data');
      });

      final response = await transport.graphql(
        'query { test }',
        decoder: (json) => json.toString(),
      );

      expect(response.data, 'data');
      expect(attempts, 2);
    });

    test('does not retry auth errors', () async {
      when(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).thenThrow(const MagentoAuthException('Unauthorized'));

      expect(
        () => transport.graphql(
          'query { test }',
          decoder: (json) => json.toString(),
        ),
        throwsA(isA<MagentoAuthException>()),
      );

      verify(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).called(1);
    });

    test('does not retry validation errors', () async {
      when(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).thenThrow(const MagentoValidationException('Invalid input'));

      expect(
        () => transport.graphql(
          'query { test }',
          decoder: (json) => json.toString(),
        ),
        throwsA(isA<MagentoValidationException>()),
      );

      verify(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).called(1);
    });

    test('throws after max retries exhausted', () async {
      var attempts = 0;
      when(() => mockInner.graphql<String>(
            any(),
            variables: any(named: 'variables'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async {
        attempts++;
        throw const MagentoNetworkException('Connection failed');
      });

      await expectLater(
        () => transport.graphql(
          'query { test }',
          decoder: (json) => json.toString(),
        ),
        throwsA(isA<MagentoNetworkException>()),
      );

      // 1 initial + 3 retries = 4 total
      expect(attempts, 4);
    });

    test('delegates REST methods to inner transport', () async {
      when(() => mockInner.get<String>(
            any(),
            query: any(named: 'query'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).thenAnswer((_) async => MagentoResponse.success('data'));

      await transport.get('path', decoder: (json) => json.toString());

      verify(() => mockInner.get<String>(
            any(),
            query: any(named: 'query'),
            options: any(named: 'options'),
            decoder: any(named: 'decoder'),
          )).called(1);
    });
  });
}
