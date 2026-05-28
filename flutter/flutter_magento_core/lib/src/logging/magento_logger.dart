import 'magento_log_level.dart';

/// Interface for logging within the Magento SDK.
abstract interface class MagentoLogger {
  /// Logs a debug message.
  void debug(String message, [Object? error, StackTrace? stackTrace]);

  /// Logs an info message.
  void info(String message, [Object? error, StackTrace? stackTrace]);

  /// Logs a warning message.
  void warning(String message, [Object? error, StackTrace? stackTrace]);

  /// Logs an error message.
  void error(String message, [Object? error, StackTrace? stackTrace]);

  /// Logs a message at the specified level.
  void log(
    MagentoLogLevel level,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]);

  /// The minimum log level to output.
  MagentoLogLevel get minLevel;
}
