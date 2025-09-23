import 'flutter_magento_core.dart';
import 'services/auth_service.dart';

/// Main Flutter Magento class
class FlutterMagento {
  static FlutterMagento? _instance;
  late final FlutterMagentoCore _core;

  FlutterMagento._();

  /// Get singleton instance
  static FlutterMagento get instance {
    _instance ??= FlutterMagento._();
    return _instance!;
  }

  /// Initialize the Flutter Magento library
  Future<void> initialize({
    required String baseUrl,
    int connectionTimeout = 30000,
    int receiveTimeout = 30000,
    Map<String, String>? headers,
    bool enableCaching = true,
    bool enableRateLimiting = true,
  }) async {
    _core = FlutterMagentoCore.instance;
    await _core.initialize(
      baseUrl: baseUrl,
      connectionTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      enableCaching: enableCaching,
      enableRateLimiting: enableRateLimiting,
    );
  }

  /// Check if initialized
  bool get isInitialized => _core.isInitialized;

  /// Check if online
  bool get isOnline => _core.isOnline;

  /// Get core instance
  FlutterMagentoCore get core => _core;
}

/// Magento authentication service
class MagentoAuthService {
  late final AuthService _authService;

  MagentoAuthService(AuthService authService) : _authService = authService;

  /// Authenticate user
  Future<Map<String, dynamic>> authenticate(
    String username,
    String password,
  ) async {
    try {
      final result = await _authService.authenticate(
        email: username,
        password: password,
      );
      return result as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }

  /// Check if user is authenticated
  bool get isAuthenticated => _authService.isAuthenticated;

  /// Get current customer
  dynamic get currentCustomer => _authService.currentCustomer;

  /// Get customer token
  String? get customerToken => _authService.customerToken;

  /// Logout user
  Future<void> logout() async {
    await _authService.logout();
  }
}

/// Magento provider interface
abstract class MagentoProvider {
  String get id;
  String get name;
  String get version;
  bool get isAvailable;

  Future<void> initialize();
  Future<void> dispose();
}

/// Magento exception class
class MagentoException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const MagentoException(this.message, {this.code, this.details});

  @override
  String toString() {
    if (code != null) {
      return 'MagentoException [$code]: $message';
    }
    return 'MagentoException: $message';
  }
}
