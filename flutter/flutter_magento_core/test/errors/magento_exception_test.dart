import 'package:test/test.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

void main() {
  group('MagentoException', () {
    group('MagentoNetworkException', () {
      test('creates with message', () {
        const exception = MagentoNetworkException('Network error');
        expect(exception.message, 'Network error');
        expect(exception.isOffline, false);
        expect(exception.isTimeout, false);
      });

      test('creates with offline flag', () {
        const exception = MagentoNetworkException(
          'No connection',
          isOffline: true,
        );
        expect(exception.isOffline, true);
      });

      test('creates with timeout flag', () {
        const exception = MagentoNetworkException(
          'Request timed out',
          isTimeout: true,
        );
        expect(exception.isTimeout, true);
      });

      test('toString returns formatted message', () {
        const exception = MagentoNetworkException('Test error');
        expect(exception.toString(), 'MagentoNetworkException: Test error');
      });
    });

    group('MagentoAuthException', () {
      test('creates with message', () {
        const exception = MagentoAuthException('Auth failed');
        expect(exception.message, 'Auth failed');
        expect(exception.isTokenExpired, false);
        expect(exception.isInvalidCredentials, false);
      });

      test('creates with token expired flag', () {
        const exception = MagentoAuthException(
          'Token expired',
          isTokenExpired: true,
        );
        expect(exception.isTokenExpired, true);
      });

      test('creates with invalid credentials flag', () {
        const exception = MagentoAuthException(
          'Wrong password',
          isInvalidCredentials: true,
        );
        expect(exception.isInvalidCredentials, true);
      });
    });

    group('MagentoValidationException', () {
      test('creates with message', () {
        const exception = MagentoValidationException('Validation failed');
        expect(exception.message, 'Validation failed');
        expect(exception.fieldErrors, isEmpty);
      });

      test('creates with field errors', () {
        const exception = MagentoValidationException(
          'Validation failed',
          fieldErrors: {
            'email': ['Invalid email format'],
            'password': ['Too short', 'Must contain number'],
          },
        );

        expect(exception.fieldErrors.length, 2);
        expect(exception.errorsFor('email'), ['Invalid email format']);
        expect(exception.errorsFor('password'), ['Too short', 'Must contain number']);
      });

      test('errorsFor returns empty list for unknown field', () {
        const exception = MagentoValidationException('Error');
        expect(exception.errorsFor('unknown'), isEmpty);
      });

      test('hasErrorsFor returns correct boolean', () {
        const exception = MagentoValidationException(
          'Error',
          fieldErrors: {'email': ['Invalid']},
        );

        expect(exception.hasErrorsFor('email'), true);
        expect(exception.hasErrorsFor('password'), false);
      });

      test('errorFields returns all field names', () {
        const exception = MagentoValidationException(
          'Error',
          fieldErrors: {
            'email': ['Invalid'],
            'name': ['Required'],
          },
        );

        expect(exception.errorFields, containsAll(['email', 'name']));
      });
    });

    group('MagentoCartException', () {
      test('creates with message', () {
        const exception = MagentoCartException('Cart error');
        expect(exception.message, 'Cart error');
        expect(exception.cartId, isNull);
        expect(exception.isCartNotFound, false);
        expect(exception.isOutOfStock, false);
      });

      test('creates with cart ID', () {
        const exception = MagentoCartException(
          'Cart error',
          cartId: 'cart-123',
        );
        expect(exception.cartId, 'cart-123');
      });

      test('creates with cart not found flag', () {
        const exception = MagentoCartException(
          'Cart not found',
          isCartNotFound: true,
        );
        expect(exception.isCartNotFound, true);
      });

      test('creates with out of stock flag', () {
        const exception = MagentoCartException(
          'Item out of stock',
          isOutOfStock: true,
        );
        expect(exception.isOutOfStock, true);
      });
    });

    group('MagentoPaymentException', () {
      test('creates with message', () {
        const exception = MagentoPaymentException('Payment failed');
        expect(exception.message, 'Payment failed');
        expect(exception.paymentMethod, isNull);
        expect(exception.isDeclined, false);
      });

      test('creates with payment method', () {
        const exception = MagentoPaymentException(
          'Payment failed',
          paymentMethod: 'stripe',
        );
        expect(exception.paymentMethod, 'stripe');
      });

      test('creates with declined flag', () {
        const exception = MagentoPaymentException(
          'Card declined',
          isDeclined: true,
        );
        expect(exception.isDeclined, true);
      });
    });

    group('MagentoServerException', () {
      test('creates with message', () {
        const exception = MagentoServerException('Server error');
        expect(exception.message, 'Server error');
        expect(exception.statusCode, isNull);
      });

      test('creates with status code', () {
        const exception = MagentoServerException(
          'Internal server error',
          statusCode: 500,
        );
        expect(exception.statusCode, 500);
      });
    });

    group('MagentoNotFoundException', () {
      test('creates with message', () {
        const exception = MagentoNotFoundException('Not found');
        expect(exception.message, 'Not found');
        expect(exception.resourceType, isNull);
        expect(exception.resourceId, isNull);
      });

      test('creates with resource info', () {
        const exception = MagentoNotFoundException(
          'Product not found',
          resourceType: 'product',
          resourceId: 'SKU123',
        );
        expect(exception.resourceType, 'product');
        expect(exception.resourceId, 'SKU123');
      });
    });

    group('MagentoRateLimitException', () {
      test('creates with message', () {
        const exception = MagentoRateLimitException('Too many requests');
        expect(exception.message, 'Too many requests');
        expect(exception.retryAfterSeconds, isNull);
      });

      test('creates with retry after', () {
        const exception = MagentoRateLimitException(
          'Rate limited',
          retryAfterSeconds: 60,
        );
        expect(exception.retryAfterSeconds, 60);
      });
    });

    group('MagentoUnknownException', () {
      test('creates with message', () {
        const exception = MagentoUnknownException('Unknown error');
        expect(exception.message, 'Unknown error');
      });

      test('creates with cause', () {
        final cause = Exception('Original error');
        final exception = MagentoUnknownException(
          'Unknown error',
          cause: cause,
        );
        expect(exception.cause, cause);
      });
    });

    group('sealed class exhaustive matching', () {
      test('can pattern match all exception types', () {
        MagentoException exception = const MagentoNetworkException('test');

        final result = switch (exception) {
          MagentoNetworkException() => 'network',
          MagentoAuthException() => 'auth',
          MagentoValidationException() => 'validation',
          MagentoCartException() => 'cart',
          MagentoPaymentException() => 'payment',
          MagentoServerException() => 'server',
          MagentoNotFoundException() => 'notFound',
          MagentoRateLimitException() => 'rateLimit',
          MagentoUnknownException() => 'unknown',
        };

        expect(result, 'network');
      });
    });
  });
}
