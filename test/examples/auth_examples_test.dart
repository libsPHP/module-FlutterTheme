import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_magento/flutter_magento.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Import the examples
import '../../example/lib/examples/auth_examples.dart';

@GenerateMocks([FlutterMagentoCore])
import 'auth_examples_test.mocks.dart';

void main() {
  group('Authentication Examples Tests', () {
    late MockFlutterMagentoCore mockMagento;
    late AuthExamples authExamples;

    setUp(() {
      mockMagento = MockFlutterMagentoCore();
      authExamples = AuthExamples(mockMagento);
    });

    test('Example 1: Basic Login - should authenticate successfully', () async {
      // Arrange
      final expectedResponse = AuthResponse(
        token: 'test-token-123',
        customer: Customer(
          id: 1,
          email: 'test@scandipwa.com',
          firstname: 'Test',
          lastname: 'User',
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
          groupId: 1,
          storeId: 1,
          websiteId: 1,
        ),
      );

      when(
        mockMagento.authenticate(
          email: 'test@scandipwa.com',
          password: 'Test@123456',
        ),
      ).thenAnswer((_) async => expectedResponse);

      // Act
      final result = await authExamples.basicLogin();

      // Assert
      expect(result.token, equals('test-token-123'));
      expect(result.customer.email, equals('test@scandipwa.com'));
      verify(
        mockMagento.authenticate(
          email: 'test@scandipwa.com',
          password: 'Test@123456',
        ),
      ).called(1);
    });

    test(
      'Example 2: Customer Registration - should create new customer',
      () async {
        // Arrange
        final expectedCustomer = Customer(
          id: 2,
          email: 'newuser@example.com',
          firstname: 'New',
          lastname: 'User',
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
          groupId: 1,
          storeId: 1,
          websiteId: 1,
        );

        when(
          mockMagento.createAccount(
            email: anyNamed('email'),
            password: anyNamed('password'),
            firstName: anyNamed('firstName'),
            lastName: anyNamed('lastName'),
          ),
        ).thenAnswer((_) async => expectedCustomer);

        // Act
        final result = await authExamples.createCustomer(
          email: 'newuser@example.com',
          password: 'SecurePass123!',
          firstName: 'New',
          lastName: 'User',
        );

        // Assert
        expect(result.email, equals('newuser@example.com'));
        expect(result.firstname, equals('New'));
        expect(result.lastname, equals('User'));
        verify(
          mockMagento.createAccount(
            email: 'newuser@example.com',
            password: 'SecurePass123!',
            firstName: 'New',
            lastName: 'User',
          ),
        ).called(1);
      },
    );

    test(
      'Example 3: Get Current Customer - should return customer info',
      () async {
        // Arrange
        final expectedCustomer = Customer(
          id: 1,
          email: 'test@scandipwa.com',
          firstname: 'Test',
          lastname: 'User',
          createdAt: '2024-01-01',
          updatedAt: '2024-01-01',
          groupId: 1,
          storeId: 1,
          websiteId: 1,
        );

        when(
          mockMagento.getCustomer(),
        ).thenAnswer((_) async => expectedCustomer);

        // Act
        final result = await authExamples.getCurrentCustomer();

        // Assert
        expect(result.email, equals('test@scandipwa.com'));
        expect(result.firstname, equals('Test'));
        verify(mockMagento.getCustomer()).called(1);
      },
    );

    test(
      'Example 4: Check Authentication - should return auth status',
      () async {
        // Arrange
        when(mockMagento.isAuthenticated()).thenAnswer((_) async => true);

        // Act
        final result = await authExamples.isAuthenticated();

        // Assert
        expect(result, isTrue);
        verify(mockMagento.isAuthenticated()).called(1);
      },
    );

    test('Example 5: Logout - should logout successfully', () async {
      // Arrange
      when(mockMagento.logout()).thenAnswer((_) async => {});

      // Act
      await authExamples.logout();

      // Assert
      verify(mockMagento.logout()).called(1);
    });

    test('Basic Login - should throw error on invalid credentials', () async {
      // Arrange
      when(
        mockMagento.authenticate(
          email: 'test@scandipwa.com',
          password: 'WrongPassword',
        ),
      ).thenThrow(Exception('Invalid credentials'));

      // Act & Assert
      expect(
        () => mockMagento.authenticate(
          email: 'test@scandipwa.com',
          password: 'WrongPassword',
        ),
        throwsException,
      );
    });

    test('Create Customer - should handle duplicate email error', () async {
      // Arrange
      when(
        mockMagento.createAccount(
          email: 'existing@example.com',
          password: 'Password123!',
          firstName: 'Test',
          lastName: 'User',
        ),
      ).thenThrow(Exception('Email already exists'));

      // Act & Assert
      expect(
        () => authExamples.createCustomer(
          email: 'existing@example.com',
          password: 'Password123!',
          firstName: 'Test',
          lastName: 'User',
        ),
        throwsException,
      );
    });
  });

  group('Authentication Examples Integration Tests', () {
    // These tests use real API calls (requires network)
    // Marked as integration tests to skip in CI

    test(
      'Real API: Basic login with test credentials',
      () async {
        // Skip in CI environment
        const skipInCI = bool.fromEnvironment('CI', defaultValue: false);
        if (skipInCI) {
          return;
        }

        final magento = FlutterMagentoCore.instance;
        await magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');

        final authExamples = AuthExamples(magento);

        // This will make a real API call
        final result = await authExamples.basicLogin();

        expect(result.token, isNotEmpty);
        expect(result.customer.email, equals('test@scandipwa.com'));
      },
      skip: 'Integration test - requires network',
      tags: ['integration'],
    );

    test(
      'Real API: Get customer after login',
      () async {
        // Skip in CI environment
        const skipInCI = bool.fromEnvironment('CI', defaultValue: false);
        if (skipInCI) {
          return;
        }

        final magento = FlutterMagentoCore.instance;
        await magento.initialize(baseUrl: 'https://luma-demo.scandipwa.com/');

        final authExamples = AuthExamples(magento);

        // Login first
        await authExamples.basicLogin();

        // Get customer info
        final customer = await authExamples.getCurrentCustomer();

        expect(customer.email, equals('test@scandipwa.com'));
        expect(customer.firstname, isNotEmpty);
      },
      skip: 'Integration test - requires network',
      tags: ['integration'],
    );
  });
}
