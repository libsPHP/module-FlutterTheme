import '../transport/magento_response.dart';
import '../errors/magento_exception.dart';

/// Observer interface for monitoring transport events.
///
/// Useful for analytics, logging, error tracking, etc.
///
/// Example:
/// ```dart
/// class SentryObserver implements MagentoObserver {
///   @override
///   void onRequest(String method, String path, Object? body) {
///     // Start transaction
///   }
///
///   @override
///   void onResponse(String method, String path, MagentoResponse response) {
///     // End transaction
///   }
///
///   @override
///   void onError(String method, String path, MagentoException error) {
///     Sentry.captureException(error);
///   }
/// }
/// ```
abstract interface class MagentoObserver {
  /// Called before a request is made.
  void onRequest(String method, String path, Object? body);

  /// Called after a successful response.
  void onResponse(
    String method,
    String path,
    MagentoResponse<dynamic> response,
  );

  /// Called when an error occurs.
  void onError(String method, String path, MagentoException error);
}

/// No-op observer for default behavior.
class NoOpMagentoObserver implements MagentoObserver {
  const NoOpMagentoObserver();

  @override
  void onRequest(String method, String path, Object? body) {}

  @override
  void onResponse(
    String method,
    String path,
    MagentoResponse<dynamic> response,
  ) {}

  @override
  void onError(String method, String path, MagentoException error) {}
}

/// Composite observer that delegates to multiple observers.
class CompositeMagentoObserver implements MagentoObserver {
  final List<MagentoObserver> observers;

  const CompositeMagentoObserver(this.observers);

  @override
  void onRequest(String method, String path, Object? body) {
    for (final observer in observers) {
      observer.onRequest(method, path, body);
    }
  }

  @override
  void onResponse(
    String method,
    String path,
    MagentoResponse<dynamic> response,
  ) {
    for (final observer in observers) {
      observer.onResponse(method, path, response);
    }
  }

  @override
  void onError(String method, String path, MagentoException error) {
    for (final observer in observers) {
      observer.onError(method, path, error);
    }
  }
}
