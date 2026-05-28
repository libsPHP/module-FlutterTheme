import 'package:dio/dio.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_magento_rest/src/rest_error_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RestErrorMapper', () {
    RequestOptions createRequestOptions() => RequestOptions(path: '/test');

    DioException createDioException({
      int? statusCode,
      dynamic data,
      DioExceptionType type = DioExceptionType.badResponse,
    }) {
      return DioException(
        requestOptions: createRequestOptions(),
        response: statusCode != null
            ? Response(
                requestOptions: createRequestOptions(),
                statusCode: statusCode,
                data: data,
              )
            : null,
        type: type,
      );
    }

    group('timeout errors', () {
      test('maps connection timeout to MagentoNetworkException', () {
        final error = createDioException(
          type: DioExceptionType.connectionTimeout,
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoNetworkException>());
        expect((result as MagentoNetworkException).isTimeout, isTrue);
      });

      test('maps receive timeout to MagentoNetworkException', () {
        final error = createDioException(
          type: DioExceptionType.receiveTimeout,
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoNetworkException>());
        expect((result as MagentoNetworkException).isTimeout, isTrue);
      });

      test('maps send timeout to MagentoNetworkException', () {
        final error = createDioException(
          type: DioExceptionType.sendTimeout,
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoNetworkException>());
        expect((result as MagentoNetworkException).isTimeout, isTrue);
      });
    });

    group('connection errors', () {
      test('maps connection error to MagentoNetworkException with isOffline',
          () {
        final error = createDioException(
          type: DioExceptionType.connectionError,
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoNetworkException>());
        expect((result as MagentoNetworkException).isOffline, isTrue);
      });
    });

    group('HTTP status code mapping', () {
      test('maps 401 to MagentoAuthException', () {
        final error = createDioException(
          statusCode: 401,
          data: {'message': 'Invalid token'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoAuthException>());
        expect(result.message, 'Invalid token');
      });

      test('maps 403 to MagentoAuthException', () {
        final error = createDioException(
          statusCode: 403,
          data: {'message': 'Access denied'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoAuthException>());
        expect(result.message, 'Access denied');
      });

      test('maps 404 to MagentoNotFoundException', () {
        final error = createDioException(
          statusCode: 404,
          data: {'message': 'Product not found'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoNotFoundException>());
        expect(result.message, 'Product not found');
      });

      test('maps 400 to MagentoValidationException', () {
        final error = createDioException(
          statusCode: 400,
          data: {'message': 'Invalid email format'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoValidationException>());
        expect(result.message, 'Invalid email format');
      });

      test('maps 422 to MagentoValidationException', () {
        final error = createDioException(
          statusCode: 422,
          data: {'message': 'Validation failed'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoValidationException>());
      });

      test('maps 429 to MagentoRateLimitException', () {
        final error = createDioException(
          statusCode: 429,
          data: {'message': 'Too many requests'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoRateLimitException>());
      });

      test('maps 500 to MagentoServerException', () {
        final error = createDioException(
          statusCode: 500,
          data: {'message': 'Internal server error'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoServerException>());
        expect((result as MagentoServerException).statusCode, 500);
      });

      test('maps 503 to MagentoServerException', () {
        final error = createDioException(
          statusCode: 503,
          data: {'message': 'Service unavailable'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoServerException>());
      });
    });

    group('message extraction', () {
      test('extracts message from standard Magento format', () {
        final error = createDioException(
          statusCode: 400,
          data: {'message': 'Test error message'},
        );

        final result = RestErrorMapper.map(error);

        expect(result.message, 'Test error message');
      });

      test('replaces numbered parameters in message', () {
        final error = createDioException(
          statusCode: 400,
          data: {
            'message': 'The product %1 does not exist in category %2',
            'parameters': ['SKU123', 'Shoes'],
          },
        );

        final result = RestErrorMapper.map(error);

        expect(result.message, 'The product SKU123 does not exist in category Shoes');
      });

      test('replaces named parameters in message', () {
        final error = createDioException(
          statusCode: 400,
          data: {
            'message': 'The %fieldName is required',
            'parameters': {'fieldName': 'email'},
          },
        );

        final result = RestErrorMapper.map(error);

        expect(result.message, 'The email is required');
      });

      test('handles string data as message', () {
        final error = createDioException(
          statusCode: 400,
          data: 'Plain string error',
        );

        final result = RestErrorMapper.map(error);

        expect(result.message, 'Plain string error');
      });

      test('uses default message when no data', () {
        final error = createDioException(statusCode: 401);

        final result = RestErrorMapper.map(error);

        expect(result.message, 'Unauthorized');
      });
    });

    group('token expiration detection', () {
      test('detects expired token', () {
        final error = createDioException(
          statusCode: 401,
          data: {'message': 'The consumer isn\'t authorized. Token expired.'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoAuthException>());
        expect((result as MagentoAuthException).isTokenExpired, isTrue);
      });

      test('detects invalid token', () {
        final error = createDioException(
          statusCode: 401,
          data: {'message': 'Invalid token provided'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoAuthException>());
        expect((result as MagentoAuthException).isTokenExpired, isTrue);
      });
    });

    group('invalid credentials detection', () {
      test('detects invalid password', () {
        final error = createDioException(
          statusCode: 401,
          data: {'message': 'Invalid password provided'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoAuthException>());
        expect((result as MagentoAuthException).isInvalidCredentials, isTrue);
      });

      test('detects invalid email', () {
        final error = createDioException(
          statusCode: 401,
          data: {'message': 'Invalid email or password'},
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoAuthException>());
        expect((result as MagentoAuthException).isInvalidCredentials, isTrue);
      });
    });

    group('field errors extraction', () {
      test('extracts field errors from parameters', () {
        final error = createDioException(
          statusCode: 422,
          data: {
            'message': 'Validation failed',
            'parameters': {
              'email': 'Invalid email format',
              'password': 'Password too short',
            },
          },
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoValidationException>());
        final validationError = result as MagentoValidationException;
        expect(validationError.fieldErrors['email'], ['Invalid email format']);
        expect(validationError.fieldErrors['password'], ['Password too short']);
      });

      test('extracts field errors from errors array', () {
        final error = createDioException(
          statusCode: 422,
          data: {
            'message': 'Validation failed',
            'errors': [
              {'field': 'email', 'message': 'Invalid format'},
              {'field': 'email', 'message': 'Already exists'},
            ],
          },
        );

        final result = RestErrorMapper.map(error);

        expect(result, isA<MagentoValidationException>());
        final validationError = result as MagentoValidationException;
        expect(validationError.fieldErrors['email'],
            ['Invalid format', 'Already exists']);
      });
    });
  });
}
