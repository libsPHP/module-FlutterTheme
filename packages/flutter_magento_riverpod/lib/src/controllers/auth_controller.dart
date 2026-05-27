import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/core_providers.dart';
import '../state/auth_state.dart';
import 'cart_controller.dart';

/// Auth controller provider.
final authControllerProvider =
    AsyncNotifierProvider<AuthController, AuthState>(AuthController.new);

/// Controller for authentication operations.
class AuthController extends AsyncNotifier<AuthState> {
  late AuthRepository _authRepo;
  late MagentoAuthStorage _authStorage;

  @override
  Future<AuthState> build() async {
    _authRepo = ref.watch(authRepositoryProvider);
    _authStorage = ref.watch(authStorageProvider);

    // Check if we have a stored token and try to get customer
    try {
      final hasToken = await _authStorage.hasCustomerToken();
      if (!hasToken) {
        return const AuthState.unauthenticated();
      }

      final customer = await _authRepo.me();
      return AuthState.authenticated(customer);
    } catch (_) {
      return const AuthState.unauthenticated();
    }
  }

  /// Logs in with email and password.
  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final session = await _authRepo.login(email: email, password: password);

      // Merge guest cart after login
      try {
        await ref.read(cartControllerProvider.notifier).mergeGuestCart();
      } catch (_) {
        // Ignore cart merge errors
      }

      return AuthState.authenticated(session.customer);
    });
  }

  /// Logs out the current customer.
  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _authRepo.logout();

      // Refresh cart after logout
      ref.invalidate(cartControllerProvider);

      return const AuthState.unauthenticated();
    });
  }

  /// Registers a new customer and logs them in.
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final session = await _authRepo.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      // Merge guest cart after registration
      try {
        await ref.read(cartControllerProvider.notifier).mergeGuestCart();
      } catch (_) {
        // Ignore cart merge errors
      }

      return AuthState.authenticated(session.customer);
    });
  }

  /// Requests a password reset email.
  Future<void> requestPasswordReset(String email) async {
    await _authRepo.requestPasswordReset(email);
  }

  /// Resets password with token from email.
  Future<void> resetPassword({
    required String email,
    required String resetToken,
    required String newPassword,
  }) async {
    await _authRepo.resetPassword(
      email: email,
      resetToken: resetToken,
      newPassword: newPassword,
    );
  }
}
