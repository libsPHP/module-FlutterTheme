/// Log levels for Magento SDK logging.
enum MagentoLogLevel {
  /// Detailed debugging information.
  debug,

  /// General information messages.
  info,

  /// Warning messages for potentially problematic situations.
  warning,

  /// Error messages for failures.
  error,

  /// No logging.
  none;

  /// Whether this level includes the given level.
  bool includes(MagentoLogLevel level) {
    return index <= level.index;
  }
}
