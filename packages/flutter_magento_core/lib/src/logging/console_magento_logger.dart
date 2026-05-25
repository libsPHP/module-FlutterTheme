import 'magento_logger.dart';
import 'magento_log_level.dart';

/// Console logger implementation for Magento SDK.
class ConsoleMagentoLogger implements MagentoLogger {
  @override
  final MagentoLogLevel minLevel;

  /// Creates a console logger with optional minimum log level.
  const ConsoleMagentoLogger({
    this.minLevel = MagentoLogLevel.info,
  });

  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    log(MagentoLogLevel.debug, message, error, stackTrace);
  }

  @override
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    log(MagentoLogLevel.info, message, error, stackTrace);
  }

  @override
  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    log(MagentoLogLevel.warning, message, error, stackTrace);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    log(MagentoLogLevel.error, message, error, stackTrace);
  }

  @override
  void log(
    MagentoLogLevel level,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    if (!minLevel.includes(level)) return;

    final prefix = _levelPrefix(level);
    final timestamp = DateTime.now().toIso8601String();

    // ignore: avoid_print
    print('$timestamp [$prefix] $message');

    if (error != null) {
      // ignore: avoid_print
      print('Error: $error');
    }

    if (stackTrace != null) {
      // ignore: avoid_print
      print('Stack trace:\n$stackTrace');
    }
  }

  String _levelPrefix(MagentoLogLevel level) {
    return switch (level) {
      MagentoLogLevel.debug => 'DEBUG',
      MagentoLogLevel.info => 'INFO',
      MagentoLogLevel.warning => 'WARN',
      MagentoLogLevel.error => 'ERROR',
      MagentoLogLevel.none => '',
    };
  }
}
