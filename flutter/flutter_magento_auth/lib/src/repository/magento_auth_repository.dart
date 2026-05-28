import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../mappers/customer_mapper.dart';
import '../queries/auth_queries.dart';

class MagentoAuthRepository implements AuthRepository {
  final MagentoTransport transport;
  final MagentoAuthStorage authStorage;
  final CustomerMapper _mapper;

  MagentoAuthRepository({
    required this.transport,
    required this.authStorage,
  }) : _mapper = CustomerMapper();

  @override
  Future<CustomerSession> login({
    required String email,
    required String password,
  }) async {
    // Generate token
    final tokenResponse = await transport.graphql(
      AuthQueries.generateToken,
      variables: {
        'email': email,
        'password': password,
      },
      decoder: (json) {
        final data = json['generateCustomerToken'] as Map<String, dynamic>?;
        final token = data?['token'] as String?;
        if (token == null || token.isEmpty) {
          throw MagentoAuthException('Invalid credentials');
        }
        return token;
      },
    );

    final token = tokenResponse.data;

    // Save token
    await authStorage.saveCustomerToken(token);

    // Get customer profile
    final customer = await me();

    // Clear guest cart (will be merged by cart repository)
    await authStorage.clearGuestCartId();

    return _mapper.mapSession(token, customer);
  }

  @override
  Future<void> logout() async {
    try {
      // Try to revoke token on server
      await transport.graphql(
        AuthQueries.revokeToken,
        decoder: (json) => json,
      );
    } catch (_) {
      // Ignore errors - still clear local storage
    }

    await authStorage.clearAll();
  }

  @override
  Future<Customer> me() async {
    final response = await transport.graphql(
      AuthQueries.getCustomer,
      decoder: (json) {
        final customerData = json['customer'] as Map<String, dynamic>?;
        if (customerData == null) {
          throw MagentoAuthException('Not authenticated');
        }
        return _mapper.mapCustomer(customerData);
      },
    );

    return response.data;
  }

  @override
  Future<CustomerSession> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    // Create customer
    await transport.graphql(
      AuthQueries.createCustomer,
      variables: {
        'input': {
          'email': email,
          'password': password,
          'firstname': firstName,
          'lastname': lastName,
        },
      },
      decoder: (json) {
        final data = json['createCustomer'] as Map<String, dynamic>?;
        if (data?['customer'] == null) {
          throw MagentoValidationException('Registration failed');
        }
        return data!['customer'];
      },
    );

    // Auto-login after registration
    return login(email: email, password: password);
  }

  @override
  Future<void> requestPasswordReset(String email) async {
    await transport.graphql(
      AuthQueries.requestPasswordReset,
      variables: {'email': email},
      decoder: (json) => json['requestPasswordResetEmail'] as bool? ?? false,
    );
  }

  @override
  Future<void> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword,
  }) async {
    await transport.graphql(
      AuthQueries.resetPassword,
      variables: {
        'email': email,
        'resetPasswordToken': resetToken,
        'newPassword': newPassword,
      },
      decoder: (json) => json['resetPassword'] as bool? ?? false,
    );
  }
}
