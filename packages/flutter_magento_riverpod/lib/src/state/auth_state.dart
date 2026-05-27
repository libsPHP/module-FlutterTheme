import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Authentication state.
sealed class AuthState {
  const AuthState();

  /// Creates an unauthenticated state.
  const factory AuthState.unauthenticated() = UnauthenticatedState;

  /// Creates an authenticated state with customer data.
  const factory AuthState.authenticated(Customer customer) = AuthenticatedState;

  /// Whether the user is authenticated.
  bool get isAuthenticated => this is AuthenticatedState;

  /// The customer if authenticated, null otherwise.
  Customer? get customer {
    final state = this;
    return state is AuthenticatedState ? state.customer : null;
  }
}

/// Unauthenticated state.
class UnauthenticatedState extends AuthState {
  const UnauthenticatedState();
}

/// Authenticated state with customer data.
class AuthenticatedState extends AuthState {
  /// The authenticated customer.
  @override
  final Customer customer;

  const AuthenticatedState(this.customer);
}
