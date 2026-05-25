import 'package:flutter_magento_graphql/flutter_magento_graphql.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GraphQlErrorMapper mapper;

  setUp(() {
    mapper = const GraphQlErrorMapper();
  });

  group('GraphQlErrorMapper', () {
    test('maps authentication errors', () {
      final errors = [
        {
          'message': 'The current customer is not authorized.',
          'extensions': {'category': 'graphql-authentication'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoAuthException>());
      expect(exception.message, contains('not authorized'));
    });

    test('maps authorization errors', () {
      final errors = [
        {
          'message': 'Access denied',
          'extensions': {'category': 'graphql-authorization'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoAuthException>());
    });

    test('maps input validation errors', () {
      final errors = [
        {
          'message': 'Invalid email format',
          'extensions': {
            'category': 'graphql-input',
            'field': 'email',
          },
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoValidationException>());
      final validationException = exception as MagentoValidationException;
      expect(validationException.hasErrorsFor('email'), isTrue);
    });

    test('maps not found errors', () {
      final errors = [
        {
          'message': 'Product not found',
          'extensions': {'category': 'graphql-no-such-entity'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoNotFoundException>());
    });

    test('maps already exists errors to validation', () {
      final errors = [
        {
          'message': 'Customer already exists',
          'extensions': {'category': 'graphql-already-exists'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoValidationException>());
    });

    test('maps internal server errors', () {
      final errors = [
        {
          'message': 'Internal server error',
          'extensions': {'category': 'internal'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoServerException>());
    });

    test('maps unknown categories to server exception', () {
      final errors = [
        {
          'message': 'Something went wrong',
          'extensions': {'category': 'unknown-category'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoServerException>());
    });

    test('combines multiple error messages', () {
      final errors = [
        {'message': 'First error'},
        {'message': 'Second error'},
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception.message, contains('First error'));
      expect(exception.message, contains('Second error'));
    });

    test('handles empty errors list', () {
      final exception = mapper.mapErrors([]);

      expect(exception, isA<MagentoUnknownException>());
    });

    test('detects expired token in message', () {
      final errors = [
        {
          'message': 'The token has expired',
          'extensions': {'category': 'graphql-authentication'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoAuthException>());
      final authException = exception as MagentoAuthException;
      expect(authException.isTokenExpired, isTrue);
    });

    test('extracts multiple field errors', () {
      final errors = [
        {
          'message': 'Email is required',
          'extensions': {'category': 'graphql-input', 'field': 'email'},
        },
        {
          'message': 'Password too short',
          'extensions': {'category': 'graphql-input', 'field': 'password'},
        },
      ];

      final exception = mapper.mapErrors(errors);

      expect(exception, isA<MagentoValidationException>());
      final validationException = exception as MagentoValidationException;
      expect(validationException.errorsFor('email'), contains('Email is required'));
      expect(validationException.errorsFor('password'), contains('Password too short'));
    });
  });
}
